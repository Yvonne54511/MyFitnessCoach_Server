namespace MyFitnessCoach_Server.Models.DTOs
{
    public class DiscountPreviewResultDto
    {
        public bool IsValid { get; set; }
        public decimal DiscountAmount { get; set; }
        public decimal FinalTotal { get; set; }
        public string? Message { get; set; }
    }
}
