using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Models.DTOs
{
	public static class CategoryDtoExtensions
	{
		public static CategoryDto ToDto(this ProductCategory category)
		{
			return new CategoryDto
			{
				Id = category.Id,
				CategoryName = category.CategoryName,
				SortOrder = category.SortOrder,
				IsActive = category.IsActive
			};
		}

		public static ProductCategory ToEntity(this CategoryDto dto)
		{
			return new ProductCategory
			{
				Id = dto.Id,
				CategoryName = dto.CategoryName,
				SortOrder = dto.SortOrder,
				IsActive = dto.IsActive
			};
		}
	}
}
