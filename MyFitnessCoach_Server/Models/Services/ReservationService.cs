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

            if (result.Success && result.Order != null && dto.PaymentMethod != "信用卡")
            {
                try
                {
                    // 1. 取得發信及同步所需的會員與使用者資料
                    var member = await _db.Members
                        .Include(m => m.User)
                        .FirstOrDefaultAsync(m => m.Id == memberId);
                    
                    var memberUser = member?.User;
                    var instructor = await _db.Instructors
                        .Include(i => i.User)
                        .FirstOrDefaultAsync(i => i.Id == dto.InstructorId);

                    if (memberUser != null && !string.IsNullOrEmpty(memberUser.Email))
                    {
                        // 2. 解析時間
                        DateTime startTime;
                        var rawDate = DateTime.Parse(dto.Date);
                        var rawTime = dto.Time.Split('-')[0].Trim();
                        if (rawTime.Contains("(")) rawTime = rawTime.Split('(')[0].Trim();
                        
                        if (int.TryParse(rawTime, out int hour))
                        {
                            startTime = new DateTime(rawDate.Year, rawDate.Month, rawDate.Day, hour, 0, 0);
                        }
                        else
                        {
                            startTime = DateTime.Parse($"{dto.Date} {rawTime}");
                        }

                        // 3. 非同步發送郵件
                        try 
                        {
                            await _emailService.SendReservationConfirmationEmailAsync(
                                memberUser.Email,
                                memberUser.UserName,
                                instructor?.User?.UserName ?? "教練",
                                startTime,
                                dto.Target ?? "一般健身諮詢"
                            );
                        }
                        catch (Exception ex) 
                        {
                            System.Diagnostics.Debug.WriteLine($"郵件發送失敗: {ex.Message}");
                        }

                        // 4. 嘗試同步到 Google 日曆 (如果使用者已授權)
                        try 
                        {
                            var googleEventId = await _googleService.AddEventAsync(
                                memberUser.Id,
                                $"MyFitnessCoach 課程 - 教練: {instructor?.User?.UserName}",
                                $"您的預約目標: {dto.Target ?? "一般健身諮詢"}",
                                startTime,
                                startTime.AddHours(1)
                            );

                            if (!string.IsNullOrEmpty(googleEventId))
                            {
                                // 關鍵：直接操作剛剛建立的 Order 物件，確保 100% 寫入
                                result.Order.GoogleEventId = googleEventId;
                                await _db.SaveChangesAsync();
                            }
                        }
                        catch (Exception ex)
                        {
                            System.Diagnostics.Debug.WriteLine($"日曆同步失敗: {ex.Message}");
                        }
                    }
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"主流程異常: {ex.Message}");
                }
            }

            return (result.Success, result.Order?.Id ?? 0);
        }

        public async Task<(bool Success, string Message)> CancelReservationAsync(int memberId, int reservationId)
        {
            // 1. 在取消前，先抓出資訊 (使用 AsNoTracking 避免後續刪除衝突)
            var order = await _db.ReserveOrders
                .AsNoTracking()
                .Include(ro => ro.Member)
                .FirstOrDefaultAsync(ro => ro.Id == reservationId && ro.MemberId == memberId);
            
            if (order == null) return (false, "找不到該預約紀錄");

            string googleEventId = order.GoogleEventId;
            if (string.IsNullOrEmpty(googleEventId) && !string.IsNullOrEmpty(order.Memorandum) && order.Memorandum.StartsWith("GoogleEventId:"))
            {
                googleEventId = order.Memorandum.Replace("GoogleEventId:", "");
            }

            int? userId = order.Member?.UserId;

            // 2. 執行資料庫取消
            var result = await _repo.CancelAsync(memberId, reservationId);

            // 3. 刪除 Google 日曆事件
            if (result.Success && !string.IsNullOrEmpty(googleEventId) && userId.HasValue)
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

            return result;
        }
    }
}
