using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.Services;
using System.Security.Claims;

namespace MyFitnessCoach_Server.Controllers;

[ApiController]
[Route("api/Goals")]
[Authorize]
public class GoalController : ControllerBase
{
    private readonly IGoalService _service;

    public GoalController(IGoalService service) => _service = service;

    // GET /api/Goal — 載入頁面資料（info + goals，兩者皆可為 null）
    [HttpGet]
    public async Task<ActionResult<GoalPageResponseDto>> LoadGoalPage()
    {
        var memberId = GetMemberId();
        if (memberId is null) return Unauthorized();

        var result = await _service.LoadGoalPageAsync(memberId.Value);
        return Ok(result);
    }

    // POST /api/Goal/Info — 儲存基本資料，首次儲存時自動建立 MemberGoals
    [HttpPost("Info")]
    public async Task<ActionResult<GoalPageResponseDto>> SaveBasicInfo([FromBody] BasicInfoDto dto)
    {
        var memberId = GetMemberId();
        if (memberId is null) return Unauthorized();

        var result = await _service.SaveBasicInfoAsync(memberId.Value, dto);
        return Ok(result);
    }

    // POST /api/Goal/TargetCalories — 儲存使用者自訂的每日營養目標
    [HttpPost("TargetCalories")]
    public async Task<IActionResult> SaveTargetCalories([FromBody] TargetCaloriesDto dto)
    {
        var memberId = GetMemberId();
        if (memberId is null) return Unauthorized();

        await _service.SaveTargetCaloriesAsync(memberId.Value, dto);
        return NoContent();
    }

    private int? GetMemberId()
    {
        var claim = User.FindFirst("MemberId")?.Value;
        return int.TryParse(claim, out var id) ? id : null;
    }
}
