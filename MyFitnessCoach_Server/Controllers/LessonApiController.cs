using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.Services;

namespace MyFitnessCoach_Server.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class LessonApiController : ControllerBase
	{
		private readonly TopUpPlanService _topUpPlanService;

		public LessonApiController(TopUpPlanService topUpPlanService)
		{
			_topUpPlanService = topUpPlanService;
		}

		// GET /api/LessonApi/plans
		[HttpGet("plans")]
		public async Task<ActionResult<IEnumerable<TopUpPlanDto>>> GetPlans()
		{
			var plans = await _topUpPlanService.GetAllPlans()
				.Where(p => p.IsActive)
				.OrderBy(p => p.SortOrder)
				.ToListAsync();

			return Ok(plans);
		}

		// GET /api/LessonApi/plans/5
		[HttpGet("plans/{id}")]
		public async Task<ActionResult<TopUpPlanDto>> GetPlan(int id)
		{
			var plan = await _topUpPlanService.GetPlanAsync(id);

			if (plan == null) return NotFound();

			return Ok(plan);
		}
	}
}
