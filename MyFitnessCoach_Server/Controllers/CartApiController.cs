using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.Services;
using System.Text.RegularExpressions;

namespace MyFitnessCoach_Server.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	[Authorize] // 整個 controller 都必須登入
	public class CartApiController : ControllerBase
	{
		private readonly CartService _cartService;
		private readonly MyFitnessCoachDbContext _db;
		private readonly CouponService _couponService;

		public CartApiController(CartService cartService, MyFitnessCoachDbContext db, CouponService couponService)
		{
			_cartService = cartService;
			_db = db;
			_couponService = couponService;
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

		// POST /api/CartApi/checkout  body: { receiver, address, mobile, taxNumber?, memo? }
		// 將購物車轉為 ProductOrder，回傳 productOrderId 供前端呼叫 ProductSendToEcPay
		[HttpPost("checkout")]
		public async Task<ActionResult<CheckoutResultDto>> Checkout([FromBody] CheckoutRequestDto dto)
		{
			// ── 基本欄位驗證 ──────────────────────────────────────────
			if (string.IsNullOrWhiteSpace(dto?.Receiver))
				return BadRequest(new { message = "收件人姓名為必填" });
			if (string.IsNullOrWhiteSpace(dto.Address))
				return BadRequest(new { message = "收件地址為必填" });
			if (string.IsNullOrWhiteSpace(dto.Mobile) || !Regex.IsMatch(dto.Mobile, @"^09\d{8}$"))
				return BadRequest(new { message = "手機號碼格式錯誤（需為 09 開頭共 10 碼）" });

			// ── 發票類型驗證 ──────────────────────────────────────────
			if (dto.InvoiceType < 1 || dto.InvoiceType > 4)
				return BadRequest(new { message = "發票類型錯誤" });
			if (dto.InvoiceType == 2 && (dto.TaxNumber == null || !Regex.IsMatch(dto.TaxNumber.Value.ToString(), @"^\d{8}$")))
				return BadRequest(new { message = "三聯式發票需填寫 8 碼統一編號" });
			if (dto.InvoiceType == 3 && (string.IsNullOrWhiteSpace(dto.DonationCode) || !Regex.IsMatch(dto.DonationCode, @"^\d{3,7}$")))
				return BadRequest(new { message = "捐贈發票需填寫 3–7 碼愛心碼" });
			if (dto.InvoiceType == 4 && (string.IsNullOrWhiteSpace(dto.CarrierCode) || !Regex.IsMatch(dto.CarrierCode, @"^/[0-9A-Z+\-.]{7}$")))
				return BadRequest(new { message = "手機載具格式錯誤（需為 / 開頭共 8 碼，例如 /ABC1234）" });

			// 只在對應類型才保留資料，避免髒資料
			if (dto.InvoiceType != 2) dto.TaxNumber    = null;
			if (dto.InvoiceType != 3) dto.DonationCode = null;
			if (dto.InvoiceType != 4) dto.CarrierCode  = null;

			var memberId = await GetCurrentMemberIdAsync();
			if (memberId == null) return Unauthorized(new { message = "找不到對應的會員資料" });

			// ── 讀取購物車（含商品資料）──────────────────────────────
			var cart = await _db.Carts
				.Include(c => c.CartItems)
				.ThenInclude(ci => ci.Product)
				.FirstOrDefaultAsync(c => c.MemberId == memberId.Value);

			if (cart == null || !cart.CartItems.Any())
				return BadRequest(new { message = "購物車是空的" });

			// ── 確認所有商品仍上架 ────────────────────────────────────
			var inactiveItems = cart.CartItems
				.Where(ci => ci.Product == null || !ci.Product.IsActive)
				.ToList();
			if (inactiveItems.Any())
			{
				var names = string.Join("、", inactiveItems.Select(ci => ci.Product?.Name ?? $"商品#{ci.ProductId}"));
				return BadRequest(new { message = $"以下商品已下架，請移除後再結帳：{names}" });
			}

			// ── 計算金額 ──────────────────────────────────────────────
			decimal originalAmount  = cart.CartItems.Sum(ci => ci.Product.OriginalPrice * ci.Qty);
			decimal subtotal        = cart.CartItems.Sum(ci => ci.Product.UnitPrice * ci.Qty);
			decimal productDiscount = originalAmount - subtotal;
			var itemSummary = string.Join("、", cart.CartItems.Select(ci => $"{ci.Product.Name} x{ci.Qty}"));

			// ── 優惠券試算（先驗證，不寫 DB）──────────────────────────
			decimal couponDiscount = 0;
			int? actualCouponId = null;
			if (dto.MemberCouponId.HasValue)
			{
				var preview = await _couponService.PreviewDiscountAsync(memberId.Value, dto.MemberCouponId.Value, subtotal);
				if (!preview.IsValid)
					return BadRequest(new { message = preview.Message ?? "優惠券驗證失敗" });
				couponDiscount = preview.DiscountAmount;

				// CouponId FK 指向 Coupons 表，需取得 MemberCoupon 對應的真實 Coupon.Id
				actualCouponId = await _db.MemberCoupons
					.Where(mc => mc.Id == dto.MemberCouponId.Value)
					.Select(mc => mc.CouponId)
					.FirstOrDefaultAsync();
			}

			decimal totalDiscount = productDiscount + couponDiscount;
			decimal payableAmount = subtotal - couponDiscount;

			using var tx = await _db.Database.BeginTransactionAsync();
			try
			{
				// ── 建立 ProductOrder ──────────────────────────────────
				var order = new ProductOrder
				{
					MemberId       = memberId.Value,
					CreateAt       = DateTime.Now,
					OriginalAmount = originalAmount,
					DiscountAmount = totalDiscount,
					CouponId       = actualCouponId,
					Receiver       = dto.Receiver,
					Address        = dto.Address,
					Mobile         = dto.Mobile,
					TaxNumber      = dto.TaxNumber,
					InvoiceType    = dto.InvoiceType,
					DonationCode   = dto.DonationCode,
					CarrierCode    = dto.CarrierCode,
					Memo           = dto.Memo,
					Status         = 0  // 0 = 待付款
				};
				_db.ProductOrders.Add(order);
				await _db.SaveChangesAsync(); // 先儲存取得 order.Id

				// ── 建立 ProductOrderDetail ────────────────────────────
				foreach (var item in cart.CartItems)
				{
					_db.ProductOrderDetails.Add(new ProductOrderDetail
					{
						ProductOrderId  = order.Id,
						ProductId       = item.ProductId,
						ProductName     = item.Product.Name,
						ImageURL        = item.Product.ImageUrl,
						UnitPrice       = item.Product.UnitPrice,
						Qty             = item.Qty,
						SubTotal        = item.Product.UnitPrice * item.Qty,
						DiscountedPrice = item.Product.UnitPrice * item.Qty,
						Memo            = null
					});
				}

				// ── 清空購物車 ────────────────────────────────────────
				_db.CartItems.RemoveRange(cart.CartItems);

				await _db.SaveChangesAsync();
				await tx.CommitAsync();

				// ── 標記優惠券已使用（commit 後執行）──────────────────
				if (dto.MemberCouponId.HasValue)
					await _couponService.ConsumeAsync(dto.MemberCouponId.Value, order.Id);

				return Ok(new CheckoutResultDto
				{
					ProductOrderId = order.Id,
					FinalAmount    = payableAmount,
					ItemSummary    = itemSummary
				});
			}
			catch (Exception ex)
			{
				await tx.RollbackAsync();
				var inner = ex.InnerException?.Message ?? "(no inner)";
				var deepest = ex;
				while (deepest.InnerException != null) deepest = deepest.InnerException;
				return StatusCode(500, new { message = $"建立訂單失敗：{ex.Message} | inner: {inner} | deepest: {deepest.Message}" });
			}
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
