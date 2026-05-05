namespace MyFitnessCoach_Server.Models.DTOs
{
    // 前端送出的結帳請求（收件資訊）
    public class CheckoutRequestDto
    {
        public string Receiver { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public string Mobile { get; set; } = string.Empty;
        public int? TaxNumber { get; set; }
        public string? Memo { get; set; }
        public int? MemberCouponId { get; set; }
    }

    // 結帳成功後回傳給前端的資料（前端用 productOrderId 呼叫 ProductSendToEcPay）
    public class CheckoutResultDto
    {
        public int ProductOrderId { get; set; }
        public decimal FinalAmount { get; set; }
        public string ItemSummary { get; set; } = string.Empty;
    }
}
