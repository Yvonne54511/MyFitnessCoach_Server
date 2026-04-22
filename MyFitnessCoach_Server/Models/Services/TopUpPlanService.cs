using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Repositories;

namespace MyFitnessCoach_Server.Models.Services
{
	public class TopUpPlanService
	{
		private readonly ITopUpPlanRepository _repository;

		public TopUpPlanService(ITopUpPlanRepository repository)
		{
			_repository = repository;
		}

		/// <summary>
		/// 回傳 IQueryable，上層可再疊加 Where/OrderBy 後才 materialize。
		/// </summary>
		public IQueryable<TopUpPlanDto> GetAllPlans()
		{
			return _repository.GetAllQueryable();
		}

		public Task<TopUpPlanDto?> GetPlanAsync(int id)
		{
			return _repository.GetByIdAsync(id);
		}

		public Task CreatePlanAsync(TopUpPlanDto dto)
		{
			return _repository.CreateAsync(dto);
		}

		public Task UpdatePlanAsync(TopUpPlanDto dto)
		{
			return _repository.UpdateAsync(dto);
		}

		public Task DeactivatePlanAsync(int id)
		{
			return _repository.DeactivateAsync(id);
		}
	}
}
