namespace MyFitnessCoach_Server.Models.DTOs
{
    public class ReviewDto
    {
        public string Name { get; set; }
        public string Title { get; set; }
        public string Avatar { get; set; }
        public string Stars { get; set; }
        public int Rating { get; set; }
        public string Text { get; set; }
        public int InstructorId { get; set; }
        public string InstructorName { get; set; }
        public string InstructorAvatar { get; set; }
        public string InstructorTitle { get; set; }
        public DateTime CreatedAt { get; set; }
        public int LikeCount { get; set; }
        public int ReservationId { get; set; }
        public bool IsLiked { get; set; }
    }
}
