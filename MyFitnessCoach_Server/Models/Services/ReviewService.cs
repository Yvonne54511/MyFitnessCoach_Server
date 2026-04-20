using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Repositories;

namespace MyFitnessCoach_Server.Models.Services
{
    public class ReviewService
    {
        private readonly ReviewRepository _repo;

        public ReviewService(ReviewRepository repo)
        {
            _repo = repo;
        }

        public async Task<IEnumerable<ReviewDto>> GetLandingPageReviewsAsync()
        {
            var reviews = await _repo.GetLandingPageReviewsAsync();
            return reviews.Select(MapToDto);
        }

        public async Task<IEnumerable<ReviewDto>> GetAllReviewsAsync()
        {
            var reviews = await _repo.GetAllReviewsAsync();
            return reviews.Select(MapToDto);
        }

        public async Task<IEnumerable<string>> GetKeywordsAsync()
        {
            return await _repo.GetKeywordsAsync();
        }

        public async Task<bool> CreateReviewAsync(int memberId, CreateReviewDto dto)
        {
            return await _repo.CreateReviewAsync(memberId, dto);
        }

        private ReviewDto MapToDto(EfModels.Review r)
        {
            return new ReviewDto
            {
                Name = r.Member?.User?.UserName ?? "匿名學員",
                Title = GetMemberTitle(r.Member),
                Avatar = string.IsNullOrEmpty(r.Member?.ImageUrl) 
                    ? "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=100&h=100&fit=crop&crop=face" 
                    : r.Member.ImageUrl,
                Stars = new string('★', r.Rating).PadRight(5, '☆'),
                Text = r.Comment,
                InstructorId = r.InstructorId,
                InstructorName = r.Instructor?.User?.UserName ?? "未知營養師",
                // 統一使用 API 路徑獲取圖片
                InstructorAvatar = $"/api/Instructor/Image/{r.InstructorId}",
                InstructorTitle = r.Instructor?.Title ?? "專業營養師",
                CreatedAt = r.CreatedAt
            };
        }

        private string GetMemberTitle(EfModels.Member member)
        {
            if (member.DateOfBirth.HasValue)
            {
                var age = DateTime.Today.Year - member.DateOfBirth.Value.Year;
                if (member.DateOfBirth.Value.Date > DateTime.Today.AddYears(-age)) age--;
                return $"學員・{age} 歲";
            }
            return "學員";
        }
    }
}
