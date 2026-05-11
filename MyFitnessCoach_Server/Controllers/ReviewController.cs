using Microsoft.AspNetCore.Mvc;
using MyFitnessCoach_Server.Models.Services;
using MyFitnessCoach_Server.Models.DTOs;
using Microsoft.AspNetCore.Authorization;

namespace MyFitnessCoach_Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReviewController : ControllerBase
    {
        private readonly ReviewService _service;
        private readonly ReviewLikeService _likeService;

        public ReviewController(ReviewService service, ReviewLikeService likeService)
        {
            _service = service;
            _likeService = likeService;
        }

        [HttpPost("Like/{reservationId}")]
        [Authorize]
        public IActionResult ToggleLike(int reservationId)
        {
            var memberIdClaim = User.FindFirst("MemberId")?.Value;
            if (string.IsNullOrEmpty(memberIdClaim) || !int.TryParse(memberIdClaim, out int memberId))
            {
                return Unauthorized();
            }

            var result = _likeService.ToggleLike(reservationId, memberId);
            return Ok(new { likeCount = result.count, isLiked = result.isLiked });
        }

        [HttpGet("LandingPage")]
        public async Task<ActionResult<IEnumerable<ReviewDto>>> GetLandingPageReviews()
        {
            // 嘗試取得 MemberId，但不強制
            var memberIdClaim = User.FindFirst("MemberId")?.Value;
            int memberId = (!string.IsNullOrEmpty(memberIdClaim) && int.TryParse(memberIdClaim, out int mid)) ? mid : 0;

            var reviews = await _service.GetLandingPageReviewsAsync(memberId);
            return Ok(reviews);
        }

        [HttpGet("All")]
        public async Task<ActionResult<IEnumerable<ReviewDto>>> GetAllReviews()
        {
            var memberIdClaim = User.FindFirst("MemberId")?.Value;
            int memberId = (!string.IsNullOrEmpty(memberIdClaim) && int.TryParse(memberIdClaim, out int mid)) ? mid : 0;

            var reviews = await _service.GetAllReviewsAsync(memberId);
            return Ok(reviews);
        }

        [HttpGet("Paged")]
        public async Task<ActionResult<PagedReviewDto>> GetPagedReviews(int page = 1, int pageSize = 9)
        {
            var memberIdClaim = User.FindFirst("MemberId")?.Value;
            int memberId = (!string.IsNullOrEmpty(memberIdClaim) && int.TryParse(memberIdClaim, out int mid)) ? mid : 0;

            var result = await _service.GetPagedReviewsAsync(page, pageSize, memberId);
            return Ok(result);
        }

        [HttpGet("Keywords")]
        public async Task<ActionResult<IEnumerable<string>>> GetKeywords()
        {
            var keywords = await _service.GetKeywordsAsync();
            return Ok(keywords);
        }

        [HttpPost]
        [Authorize]
        public async Task<ActionResult> CreateReview(CreateReviewDto dto)
        {
            var memberIdClaim = User.FindFirst("MemberId")?.Value;
            if (string.IsNullOrEmpty(memberIdClaim) || !int.TryParse(memberIdClaim, out int memberId))
            {
                return Unauthorized();
            }

            var success = await _service.CreateReviewAsync(memberId, dto);
            if (success)
            {
                return Ok(new { message = "評論提交成功" });
            }
            return BadRequest(new { message = "評論提交失敗，可能預約紀錄不存在、評價期已過或字數超限" });
        }

        [HttpGet("Reservation/{reservationId}")]
        [Authorize]
        public async Task<ActionResult<ReviewDto>> GetReviewByReservationId(int reservationId)
        {
            var memberIdClaim = User.FindFirst("MemberId")?.Value;
            if (string.IsNullOrEmpty(memberIdClaim) || !int.TryParse(memberIdClaim, out int memberId))
            {
                return Unauthorized();
            }

            var review = await _service.GetReviewByReservationIdAsync(memberId, reservationId);
            if (review == null) return NotFound(new { message = "找不到該筆預約的評論" });

            return Ok(review);
        }

        [HttpPut]
        [Authorize]
        public async Task<ActionResult> UpdateReview(CreateReviewDto dto)
        {
            var memberIdClaim = User.FindFirst("MemberId")?.Value;
            if (string.IsNullOrEmpty(memberIdClaim) || !int.TryParse(memberIdClaim, out int memberId))
            {
                return Unauthorized();
            }

            var success = await _service.UpdateReviewAsync(memberId, dto);
            if (success)
            {
                return Ok(new { message = "評論修改成功" });
            }
            return BadRequest(new { message = "評論修改失敗，可能評論不存在、不屬於該會員或評價期已過" });
        }
    }
}
