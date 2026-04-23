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
	[Authorize] // 整個 controller 都必須登入
	public class CartApiController : ControllerBase
	{
		private readonly CartService _cartService;
		private readonly MyFitnessCoachDbContext _db;

		public CartApiController(CartService cartService, MyFitnessCoachDbContext db)
		{
			_cartService = cartService;
			_db = db;
		}

		/// <summary>
		/// 從 JWT 的 ClaimTypes.NameIdentifier(=User.Id)反查出對應的 Member.Id。
		/// 找不到 Member 回 null(通常表示 User 尚未對應 Member 資料)。
		/// </summary>
		private async Task<int?> GetCurrentMemberIdAsync()
		{
			var userIdStr = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
			if (!int.TryParse(userIdStr, out var userId)) return null;

			var memberId = await _db.Members
				.AsNoTracking()
				.Where(m => m.UserId == userId)
				.Select(m => (int?)m.Id)
				.FirstOrDefaultAsync();

			return memberId;
		}

		// GET /api/CartApi
		[HttpGet]
		public async Task<ActionResult<CartDto>> GetMyCart()
		{
			var memberId = await GetCurrentMemberIdAsync();
			if (memberId == null) return Unauthorized(new { message = "找不到對應的會員資料" });

			var cart = await _cartService.GetCartAsync(memberId.Value);
			return Ok(cart);
		}

		// POST /api/CartApi/items  body: { productId, qty }
		[HttpPost("items")]
		public async Task<ActionResult<CartItemDto>> AddItem([FromBody] AddCartItemDto dto)
		{
			if (dto == null || dto.ProductId <= 0)
				return BadRequest(new { message = "ProductId 無效" });

			var memberId = await GetCurrentMemberIdAsync();
			if (memberId == null) return Unauthorized(new { message = "找不到對應的會員資料" });

			// 確認商品存在且上架中
			var productOk = await _db.Products
				.AsNoTracking()
				.AnyAsync(p => p.Id == dto.ProductId && p.IsActive);
			if (!productOk) return NotFound(new { message = "商品不存在或已下架" });

			var item = await _cartService.AddItemAsync(memberId.Value, dto.ProductId, dto.Qty);
			return Ok(item);
		}

		// PUT /api/CartApi/items/{itemId}  body: { qty }
		[HttpPut("items/{itemId:int}")]
		public async Task<ActionResult<CartItemDto>> UpdateQty(int itemId, [FromBody] UpdateQtyDto dto)
		{
			if (dto == null || dto.Qty < 1)
				return BadRequest(new { message = "Qty 至少為 1" });

			var memberId = await GetCurrentMemberIdAsync();
			if (memberId == null) return Unauthorized(new { message = "找不到對應的會員資料" });

			var result = await _cartService.UpdateQtyAsync(memberId.Value, itemId, dto.Qty);
			if (result == null) return NotFound(new { message = "購物車項目不存在或非本會員所有" });
			return Ok(result);
		}

		// DELETE /api/CartApi/items/{itemId}
		[HttpDelete("items/{itemId:int}")]
		public async Task<IActionResult> RemoveItem(int itemId)
		{
			var memberId = await GetCurrentMemberIdAsync();
			if (memberId == null) return Unauthorized(new { message = "找不到對應的會員資料" });

			await _cartService.RemoveItemAsync(memberId.Value, itemId);
			return NoContent();
		}

		// DELETE /api/CartApi(清空購物車)
		[HttpDelete]
		public async Task<IActionResult> Clear()
		{
			var memberId = await GetCurrentMemberIdAsync();
			if (memberId == null) return Unauthorized(new { message = "找不到對應的會員資料" });

			await _cartService.ClearAsync(memberId.Value);
			return NoContent();
		}

		// POST /api/CartApi/merge  body: { items: [{ productId, qty }, ...] }
		// 登入時呼叫,把 localStorage 的 guest 購物車合併到 DB(qty 相加)。
		[HttpPost("merge")]
		public async Task<ActionResult<CartDto>> Merge([FromBody] MergeCartDto dto)
		{
			var memberId = await GetCurrentMemberIdAsync();
			if (memberId == null) return Unauthorized(new { message = "找不到對應的會員資料" });

			var items = dto?.Items ?? new List<AddCartItemDto>();

			// 過濾出目前仍上架的商品(避免 FK 失敗)
			if (items.Count > 0)
			{
				var productIds = items.Select(i => i.ProductId).Distinct().ToList();
				var activeIds = await _db.Products
					.AsNoTracking()
					.Where(p => productIds.Contains(p.Id) && p.IsActive)
					.Select(p => p.Id)
					.ToListAsync();
				items = items.Where(i => activeIds.Contains(i.ProductId)).ToList();
			}

			var cart = await _cartService.MergeAsync(memberId.Value, items);
			return Ok(cart);
		}
	}
}
