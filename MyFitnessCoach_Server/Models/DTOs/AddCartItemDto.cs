namespace MyFitnessCoach_Server.Models.DTOs
{
	public class AddCartItemDto
	{
		public int ProductId { get; set; }

		public int Qty { get; set; } = 1;
	}
}
