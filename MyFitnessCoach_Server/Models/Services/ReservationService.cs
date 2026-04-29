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
            // 1. 處理「待付款」超時自動清理 (測試設定 30 秒)
            // 放在 Service 層清理，確保未來如果「待付款」有外部關聯時也能一併處理。
            var now = DateTime.Now;
            var expiredOrders = await _db.ReserveOrders
                .Include(ro => ro.Shift)
                .Where(ro => ro.MemberId == memberId && ro.Status == "待付款" && ro.CreateAt.AddSeconds(30) < now)
                .ToListAsync();

            if (expiredOrders.Any())
            {
                var expiredIds = expiredOrders.Select(o => o.Id).ToList();

                // 斷開點數紀錄關聯
                var relatedRecords = await _db.PointsRecordDetails
                    .Where(r => r.ReserveOrderId.HasValue && expiredIds.Contains(r.ReserveOrderId.Value))
                    .ToListAsync();
                foreach (var r in relatedRecords)
                {
                    r.ReserveOrderId = null;
                }

                foreach (var order in expiredOrders)
                {
                    if (order.Shift != null)
                    {
                        order.Shift.IsBooked = false;
                    }
                    _db.ReserveOrders.Remove(order);
                }
                await _db.SaveChangesAsync();
            }

            return await _repo.GetByMemberIdAsync(memberId);
        }

        public async Task<(bool Success, int ReservationId)> CreateReservationAsync(int memberId, CreateReservationDto dto)
        {
            var result = await _repo.CreateAsync(memberId, dto);

            // 修正：只有當狀態為「已預約」時（例如點數支付），才立即執行後續動作。
            if (result.Success && result.Order != null && result.Order.Status == "已預約")
            {
                await CompleteReservationAsync(result.Order.Id);
            }

            return (result.Success, result.Order?.Id ?? 0);
        }

        public async Task<bool> CompleteReservationAsync(int reservationId, string paymentMethod = null)
        {
            try
            {
                // 1. 取得預約紀錄 (不追蹤，稍後用更新的方式確保狀態正確)
                var order = await _db.ReserveOrders
                    .Include(ro => ro.Member).ThenInclude(m => m.User)
                    .Include(ro => ro.Shift).ThenInclude(s => s.Instructor).ThenInclude(i => i.User)
                    .FirstOrDefaultAsync(ro => ro.Id == reservationId);

                if (order == null) return false;

                // 2. 嚴格時效檢查 (針對「待付款」狀態)
                if (order.Status == "待付款")
                {
                    if (order.CreateAt.AddSeconds(30) < DateTime.Now)
                    {
                        System.Diagnostics.Debug.WriteLine($"[逾時攔截] 預約 ID {reservationId} 已過期，拒絕轉為已預約。");
                        return false;
                    }

                    // 更新狀態為已預約
                    order.Status = "已預約";
                    if (!string.IsNullOrEmpty(paymentMethod))
                    {
                        order.PaymentMethod = paymentMethod;
                    }
                    await _db.SaveChangesAsync();
                }
                else if (order.Status != "已預約")
                {
                    // 如果已經是「已完成」或「已取消」，不應繼續
                    return false;
                }

                // 3. 避免重複執行 Google Sync
                if (!string.IsNullOrEmpty(order.GoogleEventId))
                {
                    return true;
                }

                // 4. 發送 Email 與 Google 同步
                var memberUser = order.Member?.User;
                var instructorUser = order.Shift?.Instructor?.User;

                if (memberUser != null && !string.IsNullOrEmpty(memberUser.Email))
                {
                    // 解析時間
                    DateTime startTime;
                    var scheduleDate = order.Shift.ScheduleDate;
                    var timeSlot = order.Shift.TimeSlot;
                    var rawTime = timeSlot.Split('-')[0].Trim();
                    if (rawTime.Contains("(")) rawTime = rawTime.Split('(')[0].Trim();

                    // 支援 "9", "09", "09:00" 等多種格式
                    if (!rawTime.Contains(":")) rawTime = $"{rawTime}:00";
                    
                    if (!DateTime.TryParse($"{scheduleDate:yyyy-MM-dd} {rawTime}", out startTime))
                    {
                        startTime = scheduleDate.ToDateTime(TimeOnly.MinValue);
                    }

                    // 發送 Email (已授權才發)
                    var isAuthorized = await _db.UserExternalLogins.AnyAsync(l => l.UserId == memberUser.Id && l.LoginProvider == "GoogleCalendar");
                    if (isAuthorized)
                    {
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
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine($"郵件發送失敗: {ex.Message}"); }

                        // 同步到 Google 日曆
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
                                // 再次從 DB 讀取最新狀態，確保沒有被其他人更新過
                                var latestOrder = await _db.ReserveOrders.FindAsync(reservationId);
                                if (latestOrder != null && string.IsNullOrEmpty(latestOrder.GoogleEventId))
                                {
                                    latestOrder.GoogleEventId = googleEventId;
                                    await _db.SaveChangesAsync();
                                }
                                else if (latestOrder != null && !string.IsNullOrEmpty(latestOrder.GoogleEventId))
                                {
                                    // 如果不幸發生重複建立，刪除多餘的那個
                                    await _googleService.DeleteEventAsync(memberUser.Id, googleEventId);
                                }
                            }
                        }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine($"日曆同步失敗: {ex.Message}"); }
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
