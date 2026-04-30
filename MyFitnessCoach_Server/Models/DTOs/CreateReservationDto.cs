namespace MyFitnessCoach_Server.Models.DTOs
{
    public class CreateReservationDto
    {
        public int InstructorId { get; set; }
        public string Date { get; set; } = string.Empty;
        public string Time { get; set; } = string.Empty;
        public string? Target { get; set; }
        public string? Note { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Phone { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string PaymentMethod { get; set; } = string.Empty;
    }
}
