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

        public async Task CleanupAllExpiredReservationsAsync()
        {
            var now = DateTime.Now;
            // 全域清理所有「待付款」且超時的預約 (演示設定改為 10 秒)
            var expiredOrders = await _db.ReserveOrders
                .Include(ro => ro.Shift)
                .Where(ro => ro.Status == "待付款" && ro.CreateAt.AddSeconds(10) < now)
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
                System.Diagnostics.Debug.WriteLine($"[自動清理] 已清理 {expiredOrders.Count} 筆超時預約紀錄。");
            }
        }

        public async Task<IEnumerable<ReservationDto>> GetMemberReservationsAsync(int memberId)
        {
            // 執行全域清理，確保數據準確
            await CleanupAllExpiredReservationsAsync();

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
                // 1. 取得預約紀錄
                var order = await _db.ReserveOrders
                    .Include(ro => ro.Member).ThenInclude(m => m.User)
                    .Include(ro => ro.Shift).ThenInclude(s => s.Instructor).ThenInclude(i => i.User)
                    .FirstOrDefaultAsync(ro => ro.Id == reservationId);

                if (order == null) return false;

                bool isFirstTimeProcessing = false;

                // 2. 狀態轉換與重複檢查
                if (order.Status == "待付款")
                {
                    // 更新狀態為已預約
                    order.Status = "已預約";
                    if (!string.IsNullOrEmpty(paymentMethod))
                    {
                        order.PaymentMethod = paymentMethod;
                    }
                    await _db.SaveChangesAsync();
                    isFirstTimeProcessing = true; // 標記：這次請求完成了狀態轉換

                    // 記錄點數明細 (即便為 0 點也記錄，以便顯示於紀錄中)
                    // 檢查是否已有紀錄，避免重複
                    var existingRecord = await _db.PointsRecordDetails
                        .AnyAsync(r => r.ReserveOrderId == order.Id && r.MerchandiseCategory == "Reserve");
                    
                    if (!existingRecord)
                    {
                        var wallet = await _db.UserWallets.FirstOrDefaultAsync(w => w.MemberId == order.MemberId);
                        if (wallet == null)
                        {
                            wallet = new UserWallet { MemberId = order.MemberId, CurrentBalance = 0, LastUpdated = DateTime.Now };
                            _db.UserWallets.Add(wallet);
                            await _db.SaveChangesAsync();
                        }

                        _db.PointsRecordDetails.Add(new PointsRecordDetail
                        {
                            UserWalletId = wallet.Id,
                            CreateAt = DateTime.Now,
                            PointAmount = -(order.PointCost ?? 0),
                            MerchandiseCategory = "Reserve",
                            ReserveOrderId = order.Id
                        });
                        await _db.SaveChangesAsync();
                    }
                }
                else if (order.Status == "已預約")
                {
                    // 如果已經是「已預約」，且已經有 GoogleEventId，則代表完全處理過了
                    if (!string.IsNullOrEmpty(order.GoogleEventId))
                    {
                        return true;
                    }
                    
                    // 如果沒有 GoogleEventId，代表是點數支付剛建立或是尚未完成後續動作
                    // 我們將其視為第一次處理，以觸發 Email 發送與日曆同步
                    isFirstTimeProcessing = true; 
                }
                else
                {
                    // 如果已經是「已完成」或「已取消」，不應繼續
                    return false;
                }

                // 3. 執行發送與同步
                // 注意：這裡不再檢查 !string.IsNullOrEmpty(order.GoogleEventId)，因為上方已經檢查過了

                // 4. 解析課程時間 (供 Email 與 Google 日曆使用)
                DateTime startTime;
                try
                {
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
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"[Reservation] 時間解析失敗: {ex.Message}");
                    startTime = order.Shift?.ScheduleDate.ToDateTime(TimeOnly.MinValue) ?? DateTime.Now;
                }

                // 5. 發送 Email (僅當 toEmail 有值時)
                var instructorUser = order.Shift?.Instructor?.User;
                string toEmail = "";
                string memberName = "會員";

                // 優先檢查是否有訪客 Email (GuestEmail 欄位)
                if (order.MemberId == 6 && !string.IsNullOrEmpty(order.GuestEmail))
                {
                    toEmail = order.GuestEmail;
                    memberName = "訪客"; 
                }
                else
                {
                    var memberUser = order.Member?.User;
                    toEmail = memberUser?.Email ?? "";
                    memberName = memberUser?.UserName ?? "會員";
                }

                if (!string.IsNullOrEmpty(toEmail))
                {
                    // A. 發送 Email (如果是第一次處理，或是狀態轉換時發送)
                    if (isFirstTimeProcessing)
                    {
                        try
                        {
                            await _emailService.SendReservationConfirmationEmailAsync(
                                toEmail,
                                memberName,
                                instructorUser?.UserName ?? "教練",
                                startTime,
                                order.Target ?? "一般健身諮詢"
                            );
                        }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine($"郵件發送失敗: {ex.Message}"); }
                    }
                }

                // 6. 同步到 Google 日曆 (僅當使用者有授權且非訪客時才嘗試自動同步)
                // 只要 isAuthorized 為真且 GoogleEventId 為空，不論 toEmail 是否有值都應同步
                var isAuthorized = order.MemberId != 6 && await _db.UserExternalLogins.AnyAsync(l => l.UserId == order.Member.UserId && l.LoginProvider == "GoogleCalendar");
                if (isAuthorized)
                {
                    try
                    {
                        System.Diagnostics.Debug.WriteLine($"[Google Sync] 偵測到授權，準備同步預約 ID {reservationId}...");
                        var googleEventId = await _googleService.AddEventAsync(
                            order.Member.UserId,
                            $"MyFitnessCoach 課程 - 教練: {instructorUser?.UserName}",
                            $"您的預約目標: {order.Target ?? "一般健身諮詢"}",
                            startTime,
                            startTime.AddHours(1)
                        );

                        if (!string.IsNullOrEmpty(googleEventId))
                        {
                            // 直接使用追蹤中的 order 物件更新，確保一致性
                            if (string.IsNullOrEmpty(order.GoogleEventId))
                            {
                                order.GoogleEventId = googleEventId;
                                await _db.SaveChangesAsync();
                                System.Diagnostics.Debug.WriteLine($"[Google Sync] 已成功將 EventId {googleEventId} 寫入預約紀錄 ID {reservationId}");
                            }
                            else if (order.GoogleEventId != googleEventId)
                            {
                                // 如果不幸發生重複建立且 ID 不同，刪除多餘的那個
                                await _googleService.DeleteEventAsync(order.Member.UserId, googleEventId);
                            }
                        }
                        else
                        {
                            System.Diagnostics.Debug.WriteLine($"[Google Sync] AddEventAsync 回傳空值，同步未完成。");
                        }
                    }
                    catch (Exception ex) { System.Diagnostics.Debug.WriteLine($"日曆同步失敗: {ex.Message}"); }
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
