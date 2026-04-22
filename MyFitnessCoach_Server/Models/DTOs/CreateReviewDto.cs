namespace MyFitnessCoach_Server.Models.DTOs
{
    public class CreateReviewDto
    {
        public int ReservationId { get; set; }
        public int Rating { get; set; }
        public string Comment { get; set; } = string.Empty;
    }
}
