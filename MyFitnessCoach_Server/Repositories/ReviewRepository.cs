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
            // 1. 確認預約紀錄存在且屬於該會員
            var reservation = await _context.ReserveOrders
                .Include(ro => ro.Shift)
                .FirstOrDefaultAsync(ro => ro.Id == dto.ReservationId && ro.MemberId == memberId);

            if (reservation == null) return false;

            // 2. 建立評論
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
    }
}
