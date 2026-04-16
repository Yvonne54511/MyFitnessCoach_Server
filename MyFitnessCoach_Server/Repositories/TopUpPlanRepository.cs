using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Repositories
{
	public interface ITopUpPlanRepository
	{
		IQueryable<TopUpPlanDto> GetAllQueryable();
		Task<TopUpPlanDto?> GetByIdAsync(int id);
		Task CreateAsync(TopUpPlanDto dto);
		Task UpdateAsync(TopUpPlanDto dto);
		Task DeactivateAsync(int id);
	}

	public class TopUpPlanRepository : ITopUpPlanRepository
	{
		private readonly MyFitnessCoachDbContext _context;

		public TopUpPlanRepository(MyFitnessCoachDbContext context)
		{
			_context = context;
		}

		/// <summary>
		/// 回傳 IQueryable，保留延遲執行，讓上層可繼續組合 Where/OrderBy 後才 materialize。
		/// </summary>
		public IQueryable<TopUpPlanDto> GetAllQueryable()
		{
			return _context.TopUpPlans
				.AsNoTracking()
				.Select(p => new TopUpPlanDto
				{
					Id          = p.Id,
					PlanName    = p.PlanName,
					ImageUrl    = p.ImageUrl,
					Price       = p.Price,
					Points      = p.Points,
					Description = p.Description,
					IsActive    = p.IsActive,
					SortOrder   = p.SortOrder
				});
		}

		public async Task<TopUpPlanDto?> GetByIdAsync(int id)
		{
			return await _context.TopUpPlans
				.AsNoTracking()
				.Where(p => p.Id == id)
				.Select(p => new TopUpPlanDto
				{
					Id          = p.Id,
					PlanName    = p.PlanName,
					ImageUrl    = p.ImageUrl,
					Price       = p.Price,
					Points      = p.Points,
					Description = p.Description,
					IsActive    = p.IsActive,
					SortOrder   = p.SortOrder
				})
				.FirstOrDefaultAsync();
		}

		public async Task CreateAsync(TopUpPlanDto dto)
		{
			var entity = dto.ToEntity();
			_context.TopUpPlans.Add(entity);
			await _context.SaveChangesAsync();
		}

		public async Task UpdateAsync(TopUpPlanDto dto)
		{
			var entity = await _context.TopUpPlans.FindAsync(dto.Id);
			if (entity == null) return;

			entity.PlanName    = dto.PlanName;
			entity.ImageUrl    = dto.ImageUrl ?? string.Empty;
			entity.Price       = dto.Price;
			entity.Points      = dto.Points;
			entity.Description = dto.Description ?? string.Empty;
			entity.IsActive    = dto.IsActive;
			entity.SortOrder   = dto.SortOrder;

			await _context.SaveChangesAsync();
		}

		public async Task DeactivateAsync(int id)
		{
			var entity = await _context.TopUpPlans.FindAsync(id);
			if (entity == null) return;

			entity.IsActive = false;
			await _context.SaveChangesAsync();
		}
	}
}
