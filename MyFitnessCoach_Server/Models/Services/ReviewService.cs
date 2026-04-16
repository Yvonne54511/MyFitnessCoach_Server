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
            return reviews.Select(r => new ReviewDto
            {
                Name = r.Member.User.UserName,
                Title = GetMemberTitle(r.Member),
                Avatar = string.IsNullOrEmpty(r.Member.ImageUrl) 
                    ? "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=100&h=100&fit=crop&crop=face" 
                    : r.Member.ImageUrl,
                Stars = new string('★', r.Rating).PadRight(5, '☆'),
                Text = r.Comment
            });
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
