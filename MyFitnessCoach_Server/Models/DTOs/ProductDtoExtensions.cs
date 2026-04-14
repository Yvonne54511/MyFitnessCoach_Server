using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Models.DTOs
{
	public static class ProductDtoExtensions
	{
		public static ProductDto ToDto(this Product p)
		{
			return new ProductDto
			{
				Id = p.Id,
				CategoryId = p.CategoryId,
				Name = p.Name,
				ImageUrl = p.ImageUrl,
				OriginalPrice = p.OriginalPrice,
				UnitPrice = p.UnitPrice,
				Description = p.Description,
				SortOrder = p.SortOrder,
				IsActive = p.IsActive,
				CategoryName = p.Category?.CategoryName
			};
		}

		public static Product ToEntity(this ProductDto dto)
		{
			return new Product
			{
				Id = dto.Id,
				CategoryId = dto.CategoryId,
				Name = dto.Name,
				ImageUrl = dto.ImageUrl ?? string.Empty,
				OriginalPrice = dto.OriginalPrice,
				UnitPrice = dto.UnitPrice,
				Description = dto.Description ?? string.Empty,
				SortOrder = dto.SortOrder,
				IsActive = dto.IsActive
			};
		}
	}
}
