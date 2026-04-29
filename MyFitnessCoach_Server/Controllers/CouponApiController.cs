using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.Services;

namespace MyFitnessCoach_Server.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	[Authorize]
	public class CouponApiController : ControllerBase
	{
		private readonly CouponService _couponService;
		private readonly MyFitnessCoachDbContext _db;

		public CouponApiController(CouponService couponService, MyFitnessCoachDbContext db)
		{
			_couponService = couponService;
			_db            = db;
		}

		/// <summary>從 JWT 反查 Member.Id(同 CartApiController 模式)。</summary>
		private async Task<int?> GetCurrentMemberIdAsync()
		{
			var userIdStr = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
			if (!int.TryParse(userIdStr, out var userId)) return null;

			return await _db.Members
				.AsNoTracking()
				.Where(m => m.UserId == userId)
				.Select(m => (int?)m.Id)
				.FirstOrDefaultAsync();
		}

		// GET /api/CouponApi/available
		[HttpGet("available")]
		public async Task<ActionResult<List<CouponDto>>> GetAvailable()
		{
			var memberId = await GetCurrentMemberIdAsync();
			if (memberId == null) return Unauthorized(new { message = "找不到對應的會員資料" });

			var list = await _couponService.GetAvailableCouponsAsync(memberId.Value);
			return Ok(list);
		}

		// GET /api/CouponApi/my
		[HttpGet("my")]
		public async Task<ActionResult<List<MemberCouponDto>>> GetMy()
		{
			var memberId = await GetCurrentMemberIdAsync();
			if (memberId == null) return Unauthorized(new { message = "找不到對應的會員資料" });

			var list = await _couponService.GetMyCouponsAsync(memberId.Value);
			return Ok(list);
		}

		// POST /api/CouponApi/claim   body: { code }
		[HttpPost("claim")]
		public async Task<ActionResult<MemberCouponDto>> Claim([FromBody] ClaimCouponDto dto)
		{
			if (dto == null || string.IsNullOrWhiteSpace(dto.Code))
				return BadRequest(new { message = "請提供優惠碼" });

			var memberId = await GetCurrentMemberIdAsync();
			if (memberId == null) return Unauthorized(new { message = "找不到對應的會員資料" });

			try
			{
				var result = await _couponService.ClaimByCodeAsync(memberId.Value, dto.Code);
				return Ok(result);
			}
			catch (InvalidOperationException ex)
			{
				return BadRequest(new { message = ex.Message });
			}
		}

		// POST /api/CouponApi/preview   body: { memberCouponId, subtotal }
		[HttpPost("preview")]
		public async Task<ActionResult<DiscountPreviewResultDto>> Preview([FromBody] PreviewDiscountDto dto)
		{
			if (dto == null || dto.MemberCouponId <= 0 || dto.Subtotal < 0)
				return BadRequest(new { message = "參數無效" });

			var memberId = await GetCurrentMemberIdAsync();
			if (memberId == null) return Unauthorized(new { message = "找不到對應的會員資料" });

			var result = await _couponService.PreviewDiscountAsync(memberId.Value, dto.MemberCouponId, dto.Subtotal);
			return Ok(result);
		}
	}
}
