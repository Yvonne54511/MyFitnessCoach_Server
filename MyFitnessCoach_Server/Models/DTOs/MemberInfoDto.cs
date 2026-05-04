namespace MyFitnessCoach_Server.Models.DTOs
{
    public class MemberInfoDto
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string? Email { get; set; }
        public string? Avatar { get; set; }
        public decimal Points { get; set; }
        public string? Phone { get; set; }
        public int CancelCount { get; set; }
    }
}
