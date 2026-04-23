namespace MyFitnessCoach_Server.Models.DTOs
{
	public class CartItemDto
	{
		public int Id { get; set; }           // CartItem.Id(DB PK)

		public int ProductId { get; set; }

		public int Qty { get; set; }

		// 商品快取資訊(denormalized),前端不用再查一次 Product
		public string Name { get; set; } = string.Empty;

		public decimal UnitPrice { get; set; }

		public decimal OriginalPrice { get; set; }

		public string? ImageUrl { get; set; }

		public string? CategoryName { get; set; }
	}
}
