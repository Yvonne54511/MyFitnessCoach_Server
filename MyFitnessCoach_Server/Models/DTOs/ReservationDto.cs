namespace MyFitnessCoach_Server.Models.DTOs
{
    public class ReservationDto
    {
        public int Id { get; set; }
        public int MemberId { get; set; }
        public int InstructorId { get; set; }
        public string InstructorName { get; set; } = string.Empty;
        public DateOnly ScheduleDate { get; set; }
        public string TimeSlot { get; set; } = string.Empty;
        public string Status { get; set; } = string.Empty;
        public string? Target { get; set; }
        public string? Memorandum { get; set; }
        public string? GoogleEventId { get; set; }
        public decimal? Price { get; set; }
        public int? PointCost { get; set; }
        public string? PaymentMethod { get; set; }
        public DateTime CreateAt { get; set; }
        public bool HasReview { get; set; }
    }
}
