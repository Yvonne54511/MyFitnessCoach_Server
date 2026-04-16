namespace MyFitnessCoach_Server.Models.DTOs
{
	public class TopUpPlanDto
	{
		public int Id { get; set; }

		public string PlanName { get; set; } = string.Empty;

		public string? ImageUrl { get; set; }

		public decimal Price { get; set; }

		public int Points { get; set; }

		public string? Description { get; set; }

		public bool IsActive { get; set; }

		public int SortOrder { get; set; }
	}
}
