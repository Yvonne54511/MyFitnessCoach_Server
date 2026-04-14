using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Repositories;

namespace MyFitnessCoach_Server.Models.Services
{
	public class CategoryService
	{
		private readonly ICategoryRepository _repository;

		public CategoryService(ICategoryRepository repository)
		{
			_repository = repository;
		}

		/// <summary>
		/// 回傳 IQueryable，上層可再疊加 Where/OrderBy 後才 materialize。
		/// </summary>
		public IQueryable<CategoryDto> GetAllCategories()
		{
			return _repository.GetAllQueryable();
		}

		public Task<CategoryDto?> GetCategoryAsync(int id)
		{
			return _repository.GetByIdAsync(id);
		}

		public Task CreateCategoryAsync(CategoryDto dto)
		{
			return _repository.CreateAsync(dto);
		}

		public Task UpdateCategoryAsync(CategoryDto dto)
		{
			return _repository.UpdateAsync(dto);
		}

		public Task DeactivateCategoryAsync(int id)
		{
			return _repository.DeactivateAsync(id);
		}
	}
}
