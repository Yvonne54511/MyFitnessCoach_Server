namespace MyFitnessCoach_Server.Models.DTOs
{
	public class CartDto
	{
		public int Id { get; set; }

		public int MemberId { get; set; }

		public List<CartItemDto> Items { get; set; } = new();

		public int ItemCount => Items.Sum(i => i.Qty);

		public decimal Subtotal => Items.Sum(i => i.UnitPrice * i.Qty);
	}
}
