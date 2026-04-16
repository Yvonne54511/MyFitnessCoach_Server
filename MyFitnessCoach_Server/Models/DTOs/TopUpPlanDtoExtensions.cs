using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Models.DTOs
{
	public static class TopUpPlanDtoExtensions
	{
		public static TopUpPlanDto ToDto(this TopUpPlan p)
		{
			return new TopUpPlanDto
			{
				Id          = p.Id,
				PlanName    = p.PlanName,
				ImageUrl    = p.ImageUrl,
				Price       = p.Price,
				Points      = p.Points,
				Description = p.Description,
				IsActive    = p.IsActive,
				SortOrder   = p.SortOrder
			};
		}

		public static TopUpPlan ToEntity(this TopUpPlanDto dto)
		{
			return new TopUpPlan
			{
				Id          = dto.Id,
				PlanName    = dto.PlanName,
				ImageUrl    = dto.ImageUrl ?? string.Empty,
				Price       = dto.Price,
				Points      = dto.Points,
				Description = dto.Description ?? string.Empty,
				IsActive    = dto.IsActive,
				SortOrder   = dto.SortOrder
			};
		}
	}
}
