using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.DTOs;

namespace MyFitnessCoach_Server.Repositories
{
    public interface IReservationRepository
    {
        Task<IEnumerable<ReservationDto>> GetByMemberIdAsync(int memberId);
        Task<(bool Success, ReserveOrder? Order)> CreateAsync(int memberId, CreateReservationDto dto);
        Task<(bool Success, string Message)> CancelAsync(int memberId, int reservationId);
        Task<(bool Success, string Message)> UpdateTargetAsync(int memberId, int reservationId, string newTarget);
    }

    public class ReservationRepository : IReservationRepository
    {
        private readonly MyFitnessCoachDbContext _db;

        public ReservationRepository(MyFitnessCoachDbContext db)
        {
            _db = db;
        }

        public async Task<(bool Success, string Message)> UpdateTargetAsync(int memberId, int reservationId, string newTarget)
        {
            var order = await _db.ReserveOrders
                .Include(ro => ro.Shift)
                .FirstOrDefaultAsync(ro => ro.Id == reservationId && ro.MemberId == memberId);

            if (order == null) return (false, "找不到該預約紀錄");

            if (order.Status == "已完成")
            {
                return (false, "諮詢已完成，無法修改預約目標");
            }

            // 檢查是否已開始
            if (order.Shift != null)
            {
                try
                {
                    var timeParts = order.Shift.TimeSlot.Split('-');
                    if (timeParts.Length >= 1)
                    {
                        var rawStartTime = timeParts[0].Trim();
                        if (rawStartTime.Contains("("))
                        {
                            rawStartTime = rawStartTime.Split('(')[0].Trim();
                        }
                        string finalStartTimePart = rawStartTime.Contains(":") ? rawStartTime : $"{rawStartTime}:00";

                        var scheduleDateStr = order.Shift.ScheduleDate.ToString("yyyy-MM-dd");
                        var startDateTimeStr = $"{scheduleDateStr} {finalStartTimePart}";

                        if (DateTime.TryParse(startDateTimeStr, out DateTime startDateTime))
                        {
                            if (DateTime.Now >= startDateTime)
                            {
                                return (false, "諮詢已開始，無法修改預約目標");
                            }
                        }
                    }
                }
                catch
                {
                    // 若解析失敗，保守起見允許更新或報錯
                }
            }

            order.Target = newTarget;
            await _db.SaveChangesAsync();
            return (true, "備註更新成功");
        }

        public async Task<(bool Success, string Message)> CancelAsync(int memberId, int reservationId)
        {
            var order = await _db.ReserveOrders
                .Include(ro => ro.Shift)
                .FirstOrDefaultAsync(ro => ro.Id == reservationId && ro.MemberId == memberId);

            if (order == null) return (false, "找不到該預約紀錄或您無權限取消");

            // 檢查會員取消次數 (如果是「待付款」，則不檢查次數，允許手動取消)
            var member = await _db.Members.FirstOrDefaultAsync(m => m.Id == memberId);
            if (member != null && member.CancelCount >= 3 && order.Status != "待付款")
            {
                return (false, "您的取消預約次數已達 3 次上限，無法再進行取消。請聯繫客服處理。");
            }

            // 檢查是否在 40 分鐘內
            if (order.Shift != null)
            {
                try
                {
                    var timeParts = order.Shift.TimeSlot.Split('-');
                    if (timeParts.Length >= 1)
                    {
                        var rawStartTime = timeParts[0].Trim();
                        if (rawStartTime.Contains("("))
                        {
                            rawStartTime = rawStartTime.Split('(')[0].Trim();
                        }
                        string finalStartTimePart = rawStartTime.Contains(":") ? rawStartTime : $"{rawStartTime}:00";

                        var scheduleDateStr = order.Shift.ScheduleDate.ToString("yyyy-MM-dd");
                        var startDateTimeStr = $"{scheduleDateStr} {finalStartTimePart}";

                        if (DateTime.TryParse(startDateTimeStr, out DateTime startDateTime))
                        {
                            if (DateTime.Now >= startDateTime.AddMinutes(-40))
                            {
                                return (false, "距離諮商開始不到 40 分鐘，無法取消預約");
                            }
                        }
                    }
                }
                catch
                {
                    // 若解析失敗，保守起見允許取消
                }
            }

            // 點數退還邏輯
            var wallet = await _db.UserWallets.FirstOrDefaultAsync(w => w.MemberId == memberId);
            if (wallet == null && memberId != 0) // 確保會員有錢包，若無則建立
            {
                wallet = new UserWallet
                {
                    MemberId = memberId,
                    CurrentBalance = 0,
                    LastUpdated = DateTime.Now
                };
                _db.UserWallets.Add(wallet);
                await _db.SaveChangesAsync();
            }

            if (wallet != null)
            {
                int refundAmount = order.PointCost ?? 0;
                if (refundAmount > 0)
                {
                    wallet.CurrentBalance += refundAmount;
                    wallet.LastUpdated = DateTime.Now;
                }

                // 無論點數多少，皆記錄一筆取消紀錄
                _db.PointsRecordDetails.Add(new PointsRecordDetail
                {
                    UserWalletId = wallet.Id,
                    CreateAt = DateTime.Now,
                    PointAmount = refundAmount,
                    MerchandiseCategory = "Cancel",
                    ReserveOrderId = null // 斷開關聯，避免刪除 Order 時報錯
                });
            }

            // 重要：斷開所有現有點數紀錄與此預約的關聯，否則資料庫不准刪除 Order
            var relatedRecords = await _db.PointsRecordDetails
                .Where(r => r.ReserveOrderId == reservationId)
                .ToListAsync();
            foreach (var r in relatedRecords)
            {
                r.ReserveOrderId = null;
            }

            if (order.Shift != null)
            {
                order.Shift.IsBooked = false;
            }

            // 增加會員的取消次數 (只有正式預約才算入取消次數，待付款不算)
            if (member != null && order.Status == "已預約")
            {
                member.CancelCount += 1;
            }

            // 徹底刪除紀錄
            _db.ReserveOrders.Remove(order);
            
            await _db.SaveChangesAsync();
            return (true, "預約已成功取消");
        }

        public async Task<(bool Success, ReserveOrder? Order)> CreateAsync(int memberId, CreateReservationDto dto)
        {
            if (!DateOnly.TryParse(dto.Date, out DateOnly scheduleDate))
            {
                return (false, null);
            }

            var shift = await _db.Shifts
                .FirstOrDefaultAsync(s => s.InstructorId == dto.InstructorId && 
                                          s.ScheduleDate == scheduleDate && 
                                          s.TimeSlot == dto.Time);

            if (shift == null || shift.IsBooked) return (false, null);

            // 時間過期檢查
            var now = DateTime.Now;
            var today = DateOnly.FromDateTime(now);
            if (scheduleDate < today)
            {
                return (false, null);
            }
            if (scheduleDate == today)
            {
                // 解析 TimeSlot，例如 "09-10 (早)" -> 取 10
                var match = System.Text.RegularExpressions.Regex.Match(dto.Time, @"-(\d+)");
                if (match.Success)
                {
                    int endHour = int.Parse(match.Groups[1].Value);
                    if (now.Hour >= endHour) return (false, null);
                }
                else
                {
                    // 若無結束時間，嘗試取開始時間
                    match = System.Text.RegularExpressions.Regex.Match(dto.Time, @"(\d+)");
                    if (match.Success)
                    {
                        int startHour = int.Parse(match.Groups[1].Value);
                        if (now.Hour >= startHour) return (false, null);
                    }
                }
            }

            var order = new ReserveOrder
            {
                MemberId = memberId,
                ShiftId = shift.Id,
                CreateAt = DateTime.Now,
                // 信用卡付款需等綠界回調確認後才改為「已預約」
                Status = dto.PaymentMethod == "CreditCard" ? "待付款" : "已預約",
                PaymentMethod = dto.PaymentMethod,
                Target = dto.Target ?? dto.Note,
                Price = dto.PaymentMethod == "Points" ? 0 : 1200, 
                Memorandum = "",
                GuestEmail = memberId == 6 ? dto.Email : null
            };

            // 點數扣款邏輯
            if (dto.PaymentMethod == "Points")
            {
                var wallet = await _db.UserWallets.FirstOrDefaultAsync(w => w.MemberId == memberId);
                
                // 檢查餘額 (預約扣 1 點)
                if (wallet == null || wallet.CurrentBalance < 1)
                {
                    // 餘額不足，預約失敗
                    return (false, null);
                }

                // 執行扣款
                wallet.CurrentBalance -= 1;
                wallet.LastUpdated = DateTime.Now;
                order.PointCost = 1; // 記錄這筆預約花了 1 點
            }

            shift.IsBooked = true;
            _db.ReserveOrders.Add(order);
            await _db.SaveChangesAsync(); // 先儲存取得 order.Id

            // 記錄點數明細 (已預約狀態即記錄，即便 0 點也記錄以便顯示)
            if (order.Status == "已預約")
            {
                var wallet = await _db.UserWallets.FirstOrDefaultAsync(w => w.MemberId == memberId);
                if (wallet == null && memberId != 0)
                {
                    wallet = new UserWallet { MemberId = memberId, CurrentBalance = 0, LastUpdated = DateTime.Now };
                    _db.UserWallets.Add(wallet);
                    await _db.SaveChangesAsync();
                }

                if (wallet != null)
                {
                    _db.PointsRecordDetails.Add(new PointsRecordDetail
                    {
                        UserWalletId = wallet.Id,
                        CreateAt = DateTime.Now,
                        PointAmount = -(order.PointCost ?? 0),
                        MerchandiseCategory = "Reserve", // 標記為預約扣點
                        ReserveOrderId = order.Id
                    });
                    await _db.SaveChangesAsync();
                }
            }

            return (true, order);
        }

        public async Task<IEnumerable<ReservationDto>> GetByMemberIdAsync(int memberId)
        {
            var now = DateTime.Now;

            // 1. 處理「已預約」轉「已完成」 (諮詢時間已過)
            var pendingOrders = await _db.ReserveOrders
                .Include(ro => ro.Shift)
                .Where(ro => ro.MemberId == memberId && ro.Status == "已預約")
                .ToListAsync();

            bool hasChanges = false;
            foreach (var order in pendingOrders)
            {
                try 
                {
                    if (order.Shift?.TimeSlot == null) continue;

                    // 1. 處理 TimeSlot，例如 "14-15(下午)" -> 先取橫線後 "15(下午)" -> 再取括號前 "15"
                    var timeParts = order.Shift.TimeSlot.Split('-');
                    if (timeParts.Length < 2) continue;

                    var rawEndTime = timeParts[1].Trim();
                    // 移除所有括號及其內容
                    if (rawEndTime.Contains("("))
                    {
                        rawEndTime = rawEndTime.Split('(')[0].Trim();
                    }

                    // 2. 補足分鐘格式
                    string finalTimePart = rawEndTime.Contains(":") ? rawEndTime : $"{rawEndTime}:00";

                    // 3. 組合日期與時間
                    var scheduleDateStr = order.Shift.ScheduleDate.ToString("yyyy-MM-dd");
                    var fullDateTimeStr = $"{scheduleDateStr} {finalTimePart}";

                    if (DateTime.TryParse(fullDateTimeStr, out DateTime endDateTime))
                    {
                        // 4. 比對時間：現在時間 >= 結束時間 + 1分鐘
                        if (now >= endDateTime.AddMinutes(1))
                        {
                            order.Status = "已完成";
                            hasChanges = true;
                        }
                    }
                }
                catch
                {
                    // 若單筆解析失敗，跳過繼續處理下一筆
                    continue;
                }
            }

            if (hasChanges)
            {
                await _db.SaveChangesAsync();
            }

            return await _db.ReserveOrders
                .Include(ro => ro.Shift)
                .ThenInclude(s => s.Instructor)
                .ThenInclude(i => i.User)
                .Where(ro => ro.MemberId == memberId)
                .OrderByDescending(ro => ro.Shift.ScheduleDate)
                .ThenByDescending(ro => ro.Shift.TimeSlot)
                .Select(ro => new ReservationDto
                {
                    Id = ro.Id,
                    MemberId = ro.MemberId,
                    InstructorId = ro.Shift.InstructorId,
                    InstructorName = ro.Shift.Instructor.User.UserName,
                    ScheduleDate = ro.Shift.ScheduleDate,
                    TimeSlot = ro.Shift.TimeSlot,
                    Status = ro.Status,
                    Target = ro.Target,
                    Memorandum = ro.Memorandum,
                    GoogleEventId = ro.GoogleEventId,
                    Price = ro.Price,
                    PointCost = ro.PointCost,
                    PaymentMethod = ro.PaymentMethod,
                    CreateAt = ro.CreateAt,
                    HasReview = ro.Reviews.Any()
                })
                .ToListAsync();
        }
    }
}
