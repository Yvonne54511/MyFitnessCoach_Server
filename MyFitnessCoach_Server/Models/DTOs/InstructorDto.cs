namespace MyFitnessCoach_Server.Models.DTOs
{
	public class InstructorDto
	{
		public int Id { get; set; }
		public int UserId { get; set; }
		public string UserName { get; set; }
		public string ImageUrl { get; set; }
		public string Title { get; set; }
		public string Description { get; set; }
		public int HourWage { get; set; }
		public bool IsActive { get; set; }
	}
}
