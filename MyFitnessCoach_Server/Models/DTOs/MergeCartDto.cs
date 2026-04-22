namespace MyFitnessCoach_Server.Models.DTOs
{
	public class MergeCartDto
	{
		public List<AddCartItemDto> Items { get; set; } = new();
	}
}
