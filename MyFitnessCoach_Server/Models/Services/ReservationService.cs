using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Repositories;

namespace MyFitnessCoach_Server.Models.Services
{
    public class ReservationService
    {
        private readonly IReservationRepository _repo;
        private readonly IReservationEmailService _emailService;
        private readonly GoogleCalendarService _googleService;
        private readonly MyFitnessCoachDbContext _db;

        public ReservationService(IReservationRepository repo, IReservationEmailService emailService, GoogleCalendarService googleService, MyFitnessCoachDbContext db)
        {
            _repo = repo;
            _emailService = emailService;
            _googleService = googleService;
            _db = db;
        }

        public async Task<IEnumerable<ReservationDto>> GetMemberReservationsAsync(int memberId)
        {
            return await _repo.GetByMemberIdAsync(memberId);
        }

        public async Task<(bool Success, int ReservationId)> CreateReservationAsync(int memberId, CreateReservationDto dto)
        {
            var result = await _repo.CreateAsync(memberId, dto);

            // 修正：只有當狀態為「已預約」時（例如點數支付），才立即執行後續動作。
            // 如果是信用卡，狀態會是「待付款」，後續動作將在 PaymentController 呼叫 CompleteReservationAsync 時執行。
            if (result.Success && result.Order != null && result.Order.Status == "已預約")
            {
                await CompleteReservationAsync(result.Order.Id);
            }

            return (result.Success, result.Order?.Id ?? 0);
        }

        public async Task<bool> CompleteReservationAsync(int reservationId)
        {
            try
            {
                // 1. 取得預約紀錄與相關導覽屬性
                var order = await _db.ReserveOrders
                    .Include(ro => ro.Member).ThenInclude(m => m.User)
                    .Include(ro => ro.Shift).ThenInclude(s => s.Instructor).ThenInclude(i => i.User)
                    .FirstOrDefaultAsync(ro => ro.Id == reservationId);

                if (order == null) return false;

                // 2. 更新狀態為「已預約」（如果原本是「待付款」）
                if (order.Status == "待付款")
                {
                    order.Status = "已預約";
                    await _db.SaveChangesAsync();
                }
                // 避免重複執行（例如 Callback 與 Result 同時觸發）
                else if (order.Status == "已預約" && !string.IsNullOrEmpty(order.GoogleEventId))
                {
                    return true;
                }

                if (order.Status != "已預約") return false;

                // 3. 取得發信及同步所需的會員與使用者資料
                var memberUser = order.Member?.User;
                var instructorUser = order.Shift?.Instructor?.User;

                if (memberUser != null && !string.IsNullOrEmpty(memberUser.Email))
                {
                    // 4. 解析時間
                    DateTime startTime;
                    var scheduleDate = order.Shift.ScheduleDate;
                    var rawTime = order.Shift.TimeSlot.Split('-')[0].Trim();
                    if (rawTime.Contains("(")) rawTime = rawTime.Split('(')[0].Trim();

                    if (int.TryParse(rawTime, out int hour))
                    {
                        startTime = new DateTime(scheduleDate.Year, scheduleDate.Month, scheduleDate.Day, hour, 0, 0);
                    }
                    else
                    {
                        startTime = DateTime.Parse($"{scheduleDate.ToString("yyyy-MM-dd")} {rawTime}");
                    }

                    // 5. 非同步發送郵件
                    try
                    {
                        await _emailService.SendReservationConfirmationEmailAsync(
                            memberUser.Email,
                            memberUser.UserName,
                            instructorUser?.UserName ?? "教練",
                            startTime,
                            order.Target ?? "一般健身諮詢"
                        );
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine($"郵件發送失敗: {ex.Message}");
                    }

                    // 6. 嘗試同步到 Google 日曆 (如果使用者已授權)
                    try
                    {
                        var googleEventId = await _googleService.AddEventAsync(
                            memberUser.Id,
                            $"MyFitnessCoach 課程 - 教練: {instructorUser?.UserName}",
                            $"您的預約目標: {order.Target ?? "一般健身諮詢"}",
                            startTime,
                            startTime.AddHours(1)
                        );

                        if (!string.IsNullOrEmpty(googleEventId))
                        {
                            order.GoogleEventId = googleEventId;
                            await _db.SaveChangesAsync();
                        }
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine($"日曆同步失敗: {ex.Message}");
                    }
                }
                return true;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"主流程異常: {ex.Message}");
                return false;
            }
        }

        public async Task<(bool Success, string Message)> CancelReservationAsync(int memberId, int reservationId)
        {
            // 1. 在取消前，先抓出資訊 (包含 Email 與教練姓名)
            var order = await _db.ReserveOrders
                .AsNoTracking()
                .Include(ro => ro.Member).ThenInclude(m => m.User)
                .Include(ro => ro.Shift).ThenInclude(s => s.Instructor).ThenInclude(i => i.User)
                .FirstOrDefaultAsync(ro => ro.Id == reservationId && ro.MemberId == memberId);
            
            if (order == null) return (false, "找不到該預約紀錄");

            // 備份發信用資訊
            var toEmail = order.Member?.User?.Email;
            var memberName = order.Member?.User?.UserName ?? "會員";
            var instructorName = order.Shift?.Instructor?.User?.UserName ?? "教練";
            
            // 安全解析時間
            DateTime startTime = DateTime.Now; 
            if (order.Shift != null)
            {
                try
                {
                    var rawDateStr = order.Shift.ScheduleDate.ToString("yyyy-MM-dd");
                    var rawTime = order.Shift.TimeSlot.Split('-')[0].Trim();
                    if (rawTime.Contains("(")) rawTime = rawTime.Split('(')[0].Trim();
                    
                    if (int.TryParse(rawTime, out int hour))
                    {
                        startTime = new DateTime(order.Shift.ScheduleDate.Year, order.Shift.ScheduleDate.Month, order.Shift.ScheduleDate.Day, hour, 0, 0);
                    }
                    else
                    {
                        if (!DateTime.TryParse($"{rawDateStr} {rawTime}", out startTime))
                        {
                            startTime = order.Shift.ScheduleDate.ToDateTime(TimeOnly.MinValue);
                        }
                    }
                }
                catch
                {
                    startTime = order.Shift?.ScheduleDate.ToDateTime(TimeOnly.MinValue) ?? DateTime.Now;
                }
            }

            string googleEventId = order.GoogleEventId;
            if (string.IsNullOrEmpty(googleEventId) && !string.IsNullOrEmpty(order.Memorandum) && order.Memorandum.StartsWith("GoogleEventId:"))
            {
                googleEventId = order.Memorandum.Replace("GoogleEventId:", "");
            }

            int? userId = order.Member?.UserId;

            // 2. 執行資料庫取消邏輯 (包含退點)
            var result = await _repo.CancelAsync(memberId, reservationId);

            if (result.Success)
            {
                // 3. 發送取消通知 Email
                if (!string.IsNullOrEmpty(toEmail))
                {
                    try
                    {
                        await _emailService.SendCancellationEmailAsync(toEmail, memberName, instructorName, startTime);
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine($"取消通知郵件發送失敗: {ex.Message}");
                    }
                }

                // 4. 刪除 Google 日曆事件
                if (!string.IsNullOrEmpty(googleEventId) && userId.HasValue)
                {
                    try
                    {
                        await _googleService.DeleteEventAsync(userId.Value, googleEventId);
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine($"Google 日曆刪除失敗 (UserId: {userId}, EventId: {googleEventId}): {ex.Message}");
                    }
                }
            }

            return result;
        }
    }
}
