using Microsoft.EntityFrameworkCore;
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
                .Where(r => !r.IsBanned)
                .OrderByDescending(r => r.CreatedAt)
                .ToListAsync();
        }
    }
}
