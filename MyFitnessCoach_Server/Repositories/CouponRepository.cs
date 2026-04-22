using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Repositories
{
	public interface ICouponRepository
	{
		/// <summary>取得所有「可領取」的優惠券：IsActive + 在效期內 + 仍有額度。</summary>
		Task<List<CouponDto>> GetActiveCouponsAsync();

		/// <summary>用 Code 找優惠券主檔(回 Entity 不是 DTO,給領取流程用)。</summary>
		Task<Coupon?> GetByCodeAsync(string code);

		/// <summary>取得會員所有已領取的券(含已使用)。</summary>
		Task<List<MemberCouponDto>> GetMyCouponsAsync(int memberId);

		/// <summary>檢查會員是否領過該券。</summary>
		Task<bool> HasClaimedAsync(int memberId, int couponId);

		/// <summary>領取一張券:用 transaction + ExecuteUpdateAsync 原子扣 RemainingQuota,避免超發。expiresAt 為個人到期日(由 Service 依 Coupon.ValidDaysAfterClaim 計算)。</summary>
		Task<MemberCoupon> ClaimAsync(int memberId, int couponId, DateTime? expiresAt);

		/// <summary>取得會員的單一已領取券(含 Coupon 主檔),做 ownership 驗證。</summary>
		Task<MemberCoupon?> GetMemberCouponAsync(int memberCouponId, int memberId);
	}

	public class CouponRepository : ICouponRepository
	{
		private readonly MyFitnessCoachDbContext _context;

		public CouponRepository(MyFitnessCoachDbContext context)
		{
			_context = context;
		}

		public async Task<List<CouponDto>> GetActiveCouponsAsync()
		{
			var now = DateTime.Now;
			var todayDay = (byte)now.Day;
			return await _context.Coupons
				.AsNoTracking()
				.Where(c => c.IsActive
				         && c.StartAt <= now
				         && c.EndAt > now
				         && (c.RemainingQuota == null || c.RemainingQuota > 0)
				         && (c.VisibleOnlyOnDayOfMonth == null || c.VisibleOnlyOnDayOfMonth == todayDay))
				.OrderBy(c => c.EndAt)
				.Select(c => new CouponDto
				{
					Id             = c.Id,
					Code           = c.Code,
					Name           = c.Name,
					Description    = c.Description,
					DiscountType   = c.DiscountType,
					DiscountValue  = c.DiscountValue,
					MinSpend       = c.MinSpend,
					MaxDiscount    = c.MaxDiscount,
					StartAt        = c.StartAt,
					EndAt          = c.EndAt,
					RemainingQuota = c.RemainingQuota,
					BannerImageUrl = c.BannerImageUrl,
					VisibleOnlyOnDayOfMonth = c.VisibleOnlyOnDayOfMonth
				})
				.ToListAsync();
		}

		public async Task<Coupon?> GetByCodeAsync(string code)
		{
			return await _context.Coupons
				.FirstOrDefaultAsync(c => c.Code == code);
		}

		public async Task<List<MemberCouponDto>> GetMyCouponsAsync(int memberId)
		{
			var todayDay = (byte)DateTime.Now.Day;
			return await _context.MemberCoupons
				.AsNoTracking()
				.Where(mc => mc.MemberId == memberId
				          && (mc.Coupon.VisibleOnlyOnDayOfMonth == null
				              || mc.Coupon.VisibleOnlyOnDayOfMonth == todayDay))
				.OrderBy(mc => mc.UsedAt.HasValue)        // 未使用排前
				.ThenByDescending(mc => mc.ClaimedAt)
				.Select(mc => new MemberCouponDto
				{
					Id        = mc.Id,
					ClaimedAt = mc.ClaimedAt,
					ExpiresAt = mc.ExpiresAt,
					UsedAt    = mc.UsedAt,
					Coupon    = new CouponDto
					{
						Id             = mc.Coupon.Id,
						Code           = mc.Coupon.Code,
						Name           = mc.Coupon.Name,
						Description    = mc.Coupon.Description,
						DiscountType   = mc.Coupon.DiscountType,
						DiscountValue  = mc.Coupon.DiscountValue,
						MinSpend       = mc.Coupon.MinSpend,
						MaxDiscount    = mc.Coupon.MaxDiscount,
						StartAt        = mc.Coupon.StartAt,
						EndAt          = mc.Coupon.EndAt,
						RemainingQuota = mc.Coupon.RemainingQuota,
						BannerImageUrl = mc.Coupon.BannerImageUrl,
						VisibleOnlyOnDayOfMonth = mc.Coupon.VisibleOnlyOnDayOfMonth
					}
				})
				.ToListAsync();
		}

		public async Task<bool> HasClaimedAsync(int memberId, int couponId)
		{
			return await _context.MemberCoupons
				.AsNoTracking()
				.AnyAsync(mc => mc.MemberId == memberId && mc.CouponId == couponId);
		}

		public async Task<MemberCoupon> ClaimAsync(int memberId, int couponId, DateTime? expiresAt)
		{
			using var tx = await _context.Database.BeginTransactionAsync();

			// 原子扣 RemainingQuota:只在 RemainingQuota IS NULL(無限發) 或 > 0 時才扣
			var affected = await _context.Coupons
				.Where(c => c.Id == couponId
				         && (c.RemainingQuota == null || c.RemainingQuota > 0))
				.ExecuteUpdateAsync(s => s.SetProperty(
					c => c.RemainingQuota,
					c => c.RemainingQuota == null ? null : c.RemainingQuota - 1));

			if (affected == 0)
			{
				await tx.RollbackAsync();
				throw new InvalidOperationException("優惠券已發完");
			}

			var mc = new MemberCoupon
			{
				MemberId  = memberId,
				CouponId  = couponId,
				ClaimedAt = DateTime.Now,
				ExpiresAt = expiresAt
			};
			_context.MemberCoupons.Add(mc);
			await _context.SaveChangesAsync();

			await tx.CommitAsync();
			return mc;
		}

		public async Task<MemberCoupon?> GetMemberCouponAsync(int memberCouponId, int memberId)
		{
			return await _context.MemberCoupons
				.Include(mc => mc.Coupon)
				.FirstOrDefaultAsync(mc => mc.Id == memberCouponId && mc.MemberId == memberId);
		}
	}
}
