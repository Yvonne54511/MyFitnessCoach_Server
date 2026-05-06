using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Repositories
{
    public class ReviewRepository
    {
        private readonly MyFitnessCoachDbContext _context;

        public ReviewRepository(MyFitnessCoachDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Review>> GetLandingPageReviewsAsync()
        {
            return await _context.Reviews
                .Include(r => r.Member)
                .ThenInclude(m => m.User)
                .Include(r => r.Instructor)
                .ThenInclude(i => i.User)
                .Where(r => !r.IsBanned)
                .OrderByDescending(r => r.CreatedAt)
                .Take(6)
                .ToListAsync();
        }

        public async Task<IEnumerable<Review>> GetAllReviewsAsync()
        {
            return await _context.Reviews
                .Include(r => r.Member)
                .ThenInclude(m => m.User)
                .Include(r => r.Instructor)
                .ThenInclude(i => i.User)
                .Where(r => !r.IsBanned)
                .OrderByDescending(r => r.CreatedAt)
                .ToListAsync();
        }

        public async Task<(IEnumerable<Review> Reviews, int TotalCount)> GetPagedReviewsAsync(int page, int pageSize)
        {
            var query = _context.Reviews
                .Include(r => r.Member)
                .ThenInclude(m => m.User)
                .Include(r => r.Instructor)
                .ThenInclude(i => i.User)
                .Where(r => !r.IsBanned);

            int totalCount = await query.CountAsync();

            var reviews = await query
                .OrderByDescending(r => r.CreatedAt)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            return (reviews, totalCount);
        }

        public async Task<IEnumerable<string>> GetKeywordsAsync()
        {
            // 獲取負向關鍵字 (Category = -1)
            return await _context.KeyWords
                .Where(k => k.Category == -1 && !string.IsNullOrEmpty(k.Word))
                .Select(k => k.Word)
                .ToListAsync();
        }

        public async Task<bool> CreateReviewAsync(int memberId, CreateReviewDto dto)
        {
            // 1. 檢查字數限制
            if (dto.Comment.Length > 100) return false;

            // 2. 確認預約紀錄存在且屬於該會員
            var reservation = await _context.ReserveOrders
                .Include(ro => ro.Shift)
                .FirstOrDefaultAsync(ro => ro.Id == dto.ReservationId && ro.MemberId == memberId);

            if (reservation == null) return false;

            // 3. 檢查評價期限制 (5天內)
            if (!IsWithinReviewPeriod(reservation.Shift)) return false;

            // 4. 建立評論
            var review = new Review
            {
                ReserveOrderId = reservation.Id,
                InstructorId = reservation.Shift.InstructorId,
                MemberId = memberId,
                Rating = dto.Rating,
                Comment = dto.Comment,
                CreatedAt = DateTime.Now,
                IsBanned = false
            };

            _context.Reviews.Add(review);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<Review?> GetReviewByReservationIdAsync(int reservationId, int memberId)
        {
            return await _context.Reviews
                .Include(r => r.Member).ThenInclude(m => m.User)
                .Include(r => r.Instructor).ThenInclude(i => i.User)
                .FirstOrDefaultAsync(r => r.ReserveOrderId == reservationId && r.MemberId == memberId);
        }

        public async Task<bool> UpdateReviewAsync(int memberId, CreateReviewDto dto)
        {
            // 1. 檢查字數限制
            if (dto.Comment.Length > 100) return false;

            var review = await _context.Reviews
                .Include(r => r.ReserveOrder)
                .ThenInclude(ro => ro.Shift)
                .FirstOrDefaultAsync(r => r.ReserveOrderId == dto.ReservationId && r.MemberId == memberId);

            if (review == null) return false;

            // 2. 檢查評價期限制 (5天內)
            if (!IsWithinReviewPeriod(review.ReserveOrder.Shift)) return false;

            review.Rating = dto.Rating;
            review.Comment = dto.Comment;
            
            await _context.SaveChangesAsync();
            return true;
        }

        private bool IsWithinReviewPeriod(Shift shift)
        {
            if (shift == null) return false;

            // 預設為該課程日期的 23:59:59
            DateTime shiftEndTime = shift.ScheduleDate.ToDateTime(new TimeOnly(23, 59, 59));

            if (!string.IsNullOrEmpty(shift.TimeSlot))
            {
                try
                {
                    // 預期格式: "09:00 - 10:00"
                    var times = shift.TimeSlot.Split('-');
                    if (times.Length == 2)
                    {
                        var endTimePart = times[1].Trim();
                        // 嘗試多種解析方式
                        if (TimeOnly.TryParse(endTimePart, out var endTime))
                        {
                            shiftEndTime = shift.ScheduleDate.ToDateTime(endTime);
                        }
                    }
                }
                catch 
                { 
                    // 解析失敗則沿用預設(當天深夜)
                }
            }

            // 目前時間需在課程結束後的 5 天內 (TotalDays <= 5)
            // 且必須已經結束 (DateTime.Now >= shiftEndTime) 才能評價
            var now = DateTime.Now;
            return now >= shiftEndTime && (now - shiftEndTime).TotalDays <= 5;
        }
    }
}
