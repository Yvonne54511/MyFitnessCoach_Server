namespace MyFitnessCoach_Server.Models.DTOs
{
    public class CouponDto
    {
        public int Id { get; set; }
        public string Code { get; set; } = "";
        public string Name { get; set; } = "";
        public string? Description { get; set; }
        public byte DiscountType { get; set; }      // 1=固定金額, 2=百分比
        public decimal DiscountValue { get; set; }
        public decimal MinSpend { get; set; }
        public decimal? MaxDiscount { get; set; }
        public DateTime StartAt { get; set; }
        public DateTime EndAt { get; set; }
        public int? RemainingQuota { get; set; }
        public string? BannerImageUrl { get; set; }
        public byte? VisibleOnlyOnDayOfMonth { get; set; }   // 給前端推「今日 23:59 到期」用
    }
}
