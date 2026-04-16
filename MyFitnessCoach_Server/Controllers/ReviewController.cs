using Microsoft.AspNetCore.Mvc;
using MyFitnessCoach_Server.Models.Services;
using MyFitnessCoach_Server.Models.DTOs;

namespace MyFitnessCoach_Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReviewController : ControllerBase
    {
        private readonly ReviewService _service;

        public ReviewController(ReviewService service)
        {
            _service = service;
        }

        [HttpGet("LandingPage")]
        public async Task<ActionResult<IEnumerable<ReviewDto>>> GetLandingPageReviews()
        {
            var reviews = await _service.GetLandingPageReviewsAsync();
            return Ok(reviews);
        }

        [HttpGet("All")]
        public async Task<ActionResult<IEnumerable<ReviewDto>>> GetAllReviews()
        {
            var reviews = await _service.GetAllReviewsAsync();
            return Ok(reviews);
        }

        [HttpGet("Keywords")]
        public async Task<ActionResult<IEnumerable<string>>> GetKeywords()
        {
            var keywords = await _service.GetKeywordsAsync();
            return Ok(keywords);
        }
    }
}
