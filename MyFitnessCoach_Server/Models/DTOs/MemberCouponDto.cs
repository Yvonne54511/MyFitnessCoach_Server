namespace MyFitnessCoach_Server.Models.DTOs
{
    public class MemberCouponDto
    {
        public int Id { get; set; }                 // MemberCoupon.Id（試算時用這個）
        public DateTime ClaimedAt { get; set; }
        public DateTime? ExpiresAt { get; set; }    // 個人到期日(由 Coupon.ValidDaysAfterClaim 推算)
        public DateTime? UsedAt { get; set; }
        public bool IsUsed => UsedAt.HasValue;
        public CouponDto Coupon { get; set; } = null!;
    }
}
