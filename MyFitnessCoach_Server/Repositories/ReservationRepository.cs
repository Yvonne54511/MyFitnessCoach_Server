using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.DTOs;

namespace MyFitnessCoach_Server.Repositories
{
    public interface IReservationRepository
    {
        Task<IEnumerable<ReservationDto>> GetByMemberIdAsync(int memberId);
        Task<(bool Success, ReserveOrder Order)> CreateAsync(int memberId, CreateReservationDto dto);
        Task<(bool Success, string Message)> CancelAsync(int memberId, int reservationId);
    }

    public class ReservationRepository : IReservationRepository
    {
        private readonly MyFitnessCoachDbContext _db;

        public ReservationRepository(MyFitnessCoachDbContext db)
        {
            _db = db;
        }

        public async Task<(bool Success, string Message)> CancelAsync(int memberId, int reservationId)
        {
            var order = await _db.ReserveOrders
                .Include(ro => ro.Shift)
                .FirstOrDefaultAsync(ro => ro.Id == reservationId && ro.MemberId == memberId);

            if (order == null) return (false, "找不到該預約紀錄或您無權限取消");

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
                    // 若解析失敗，保守起見允許取消或記錄錯誤，這裡選擇繼續原本邏輯
                }
            }

            if (order.Shift != null)
            {
                order.Shift.IsBooked = false;
            }

            _db.ReserveOrders.Remove(order);
            await _db.SaveChangesAsync();
            return (true, "預約已成功取消");
        }

        public async Task<(bool Success, ReserveOrder Order)> CreateAsync(int memberId, CreateReservationDto dto)
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

            var order = new ReserveOrder
            {
                MemberId = memberId,
                ShiftId = shift.Id,
                CreateAt = DateTime.Now,
                Status = "已預約", // 修正為您的狀態：已預約
                PaymentMethod = dto.PaymentMethod,
                Target = dto.Target ?? dto.Note,
                Price = 1200, 
                Memorandum = "" 
            };

            shift.IsBooked = true;

            _db.ReserveOrders.Add(order);
            await _db.SaveChangesAsync();
            return (true, order);
        }

        public async Task<IEnumerable<ReservationDto>> GetByMemberIdAsync(int memberId)
        {
            var now = DateTime.Now;

            // 1. 抓取該會員所有「已預約」的紀錄
            var pendingOrders = await _db.ReserveOrders
                .Include(ro => ro.Shift)
                .Where(ro => ro.MemberId == memberId && ro.Status == "已預約")
                .ToListAsync();

            bool hasChanges = false;
            foreach (var order in pendingOrders)
            {
                try 
                {
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
