using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Repositories;

namespace MyFitnessCoach_Server.Models.Services
{
	public class CouponService
	{
		private readonly ICouponRepository _repo;
		private readonly MyFitnessCoachDbContext _db;

		public CouponService(ICouponRepository repo, MyFitnessCoachDbContext db)
		{
			_repo = repo;
			_db   = db;
		}

		/// <summary>取得「可領取」清單(已過濾掉該會員已領過的)。</summary>
		public async Task<List<CouponDto>> GetAvailableCouponsAsync(int memberId)
		{
			var actives = await _repo.GetActiveCouponsAsync();
			var claimedIds = await _db.MemberCoupons
				.AsNoTracking()
				.Where(mc => mc.MemberId == memberId)
				.Select(mc => mc.CouponId)
				.ToListAsync();

			return actives.Where(c => !claimedIds.Contains(c.Id)).ToList();
		}

		/// <summary>取得會員所有已領取的券。</summary>
		public Task<List<MemberCouponDto>> GetMyCouponsAsync(int memberId)
			=> _repo.GetMyCouponsAsync(memberId);

		/// <summary>用 Code 領取一張券。</summary>
		public async Task<MemberCouponDto> ClaimByCodeAsync(int memberId, string code)
		{
			if (string.IsNullOrWhiteSpace(code))
				throw new InvalidOperationException("優惠碼不可為空");

			var coupon = await _repo.GetByCodeAsync(code.Trim())
				?? throw new InvalidOperationException("優惠碼不存在");

			var now = DateTime.Now;
			if (!coupon.IsActive)            throw new InvalidOperationException("優惠券已停用");
			if (now < coupon.StartAt)        throw new InvalidOperationException("優惠券尚未生效");
			if (now > coupon.EndAt)          throw new InvalidOperationException("優惠券已過期");
			if (coupon.RemainingQuota == 0)  throw new InvalidOperationException("優惠券已發完");

			if (await _repo.HasClaimedAsync(memberId, coupon.Id))
				throw new InvalidOperationException("您已領取過此優惠券");

			// 個人到期日:資料驅動 — 由 Coupon.ValidDaysAfterClaim 決定
			DateTime? expiresAt = coupon.ValidDaysAfterClaim.HasValue
				? DateTime.Now.AddDays(coupon.ValidDaysAfterClaim.Value)
				: null;

			var mc = await _repo.ClaimAsync(memberId, coupon.Id, expiresAt);

			return new MemberCouponDto
			{
				Id        = mc.Id,
				ClaimedAt = mc.ClaimedAt,
				ExpiresAt = mc.ExpiresAt,
				UsedAt    = mc.UsedAt,
				Coupon    = new CouponDto
				{
					Id             = coupon.Id,
					Code           = coupon.Code,
					Name           = coupon.Name,
					Description    = coupon.Description,
					DiscountType   = coupon.DiscountType,
					DiscountValue  = coupon.DiscountValue,
					MinSpend       = coupon.MinSpend,
					MaxDiscount    = coupon.MaxDiscount,
					StartAt        = coupon.StartAt,
					EndAt          = coupon.EndAt,
					RemainingQuota = coupon.RemainingQuota - 1,   // 已扣
					BannerImageUrl = coupon.BannerImageUrl,
					VisibleOnlyOnDayOfMonth = coupon.VisibleOnlyOnDayOfMonth
				}
			};
		}

		/// <summary>試算優惠券折扣(純讀,不寫 DB)。同時做完整驗證。</summary>
		public async Task<DiscountPreviewResultDto> PreviewDiscountAsync(int memberId, int memberCouponId, decimal subtotal)
		{
			var mc = await _repo.GetMemberCouponAsync(memberCouponId, memberId);
			if (mc == null)            return Invalid("優惠券不存在或不屬於您");
			if (mc.UsedAt != null)     return Invalid("優惠券已使用");

			var c   = mc.Coupon;
			var now = DateTime.Now;

			if (!c.IsActive)                      return Invalid("優惠券已停用");
			if (now < c.StartAt)                  return Invalid("優惠券尚未生效");
			if (now > c.EndAt)                    return Invalid("優惠券已過期");
			if (mc.ExpiresAt.HasValue && now > mc.ExpiresAt.Value)
				return Invalid("優惠券已過個人有效期");
			if (subtotal < c.MinSpend)            return Invalid($"需滿 NT${c.MinSpend:N0} 才能使用");

			// ---------- 特殊規則 ----------
			if (c.Code == "WELCOME100")
			{
				// 首購限定:檢查該會員是否有過已付款訂單(Status >= 1)
				var hasPaid = await _db.ProductOrders
					.AsNoTracking()
					.AnyAsync(po => po.MemberId == memberId && po.Status >= 1);
				if (hasPaid) return Invalid("此券限首次消費使用");
			}
			// 日期限定券(資料驅動):後端清單已過濾掉非當日的券,這裡是 deep-defense
			if (c.VisibleOnlyOnDayOfMonth.HasValue && c.VisibleOnlyOnDayOfMonth.Value != now.Day)
			{
				return Invalid($"僅限每月 {c.VisibleOnlyOnDayOfMonth.Value} 日當日使用");
			}

			// ---------- 折扣計算 ----------
			decimal discount = c.DiscountType switch
			{
				1 => c.DiscountValue,
				2 => Math.Round(subtotal * (c.DiscountValue / 100m), 0, MidpointRounding.AwayFromZero),
				_ => 0
			};
			if (c.DiscountType == 2 && c.MaxDiscount.HasValue)
				discount = Math.Min(discount, c.MaxDiscount.Value);
			discount = Math.Min(discount, subtotal);   // 不超過小計

			return new DiscountPreviewResultDto
			{
				IsValid        = true,
				DiscountAmount = discount,
				FinalTotal     = subtotal - discount
			};
		}

		/// <summary>結帳成功時呼叫(給隊友的結帳/付款流程用),標記 UsedAt + OrderId。</summary>
		public async Task ConsumeAsync(int memberCouponId, int orderId)
		{
			var mc = await _db.MemberCoupons.FirstOrDefaultAsync(x => x.Id == memberCouponId)
				?? throw new InvalidOperationException("MemberCoupon 不存在");
			if (mc.UsedAt != null)
				throw new InvalidOperationException("優惠券已被使用");

			mc.UsedAt  = DateTime.Now;
			mc.OrderId = orderId;
			await _db.SaveChangesAsync();
		}

		// ---------- helpers ----------
		private static DiscountPreviewResultDto Invalid(string msg) => new()
		{
			IsValid        = false,
			DiscountAmount = 0,
			FinalTotal     = 0,
			Message        = msg
		};
	}
}
