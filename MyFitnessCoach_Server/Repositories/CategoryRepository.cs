using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Repositories
{
	public interface ICategoryRepository
	{
		IQueryable<CategoryDto> GetAllQueryable();
		Task<CategoryDto?> GetByIdAsync(int id);
		Task CreateAsync(CategoryDto dto);
		Task UpdateAsync(CategoryDto dto);
		Task DeactivateAsync(int id);
	}

	public class CategoryRepository : ICategoryRepository
	{
		private readonly MyFitnessCoachDbContext _context;

		public CategoryRepository(MyFitnessCoachDbContext context)
		{
			_context = context;
		}

		/// <summary>
		/// 回傳 IQueryable，保留延遲執行，讓上層可繼續組合 Where/OrderBy 後才 materialize。
		/// </summary>
		public IQueryable<CategoryDto> GetAllQueryable()
		{
			return _context.ProductCategories
				.AsNoTracking()
				.Select(c => new CategoryDto
				{
					Id = c.Id,
					CategoryName = c.CategoryName,
					SortOrder = c.SortOrder,
					IsActive = c.IsActive
				});
		}

		public async Task<CategoryDto?> GetByIdAsync(int id)
		{
			return await _context.ProductCategories
				.AsNoTracking()
				.Where(c => c.Id == id)
				.Select(c => new CategoryDto
				{
					Id = c.Id,
					CategoryName = c.CategoryName,
					SortOrder = c.SortOrder,
					IsActive = c.IsActive
				})
				.FirstOrDefaultAsync();
		}

		public async Task CreateAsync(CategoryDto dto)
		{
			var entity = dto.ToEntity();
			_context.ProductCategories.Add(entity);
			await _context.SaveChangesAsync();
		}

		public async Task UpdateAsync(CategoryDto dto)
		{
			var entity = await _context.ProductCategories.FindAsync(dto.Id);
			if (entity == null) return;

			entity.CategoryName = dto.CategoryName;
			entity.SortOrder = dto.SortOrder;
			entity.IsActive = dto.IsActive;

			await _context.SaveChangesAsync();
		}

		public async Task DeactivateAsync(int id)
		{
			var entity = await _context.ProductCategories.FindAsync(id);
			if (entity == null) return;

			entity.IsActive = false;
			await _context.SaveChangesAsync();
		}
	}
}
