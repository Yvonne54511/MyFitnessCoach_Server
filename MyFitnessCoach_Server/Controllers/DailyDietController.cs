using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.Services;
using System.Security.Claims;

namespace MyFitnessCoach_Server.Controllers;

[ApiController]
[Route("api/DailyDiet")]
[Authorize]
public class DailyDietController : ControllerBase
{
    private readonly IDailyDietService _service;
    private readonly IDietPrerequisiteService _prerequisite;

    public DailyDietController(IDailyDietService service, IDietPrerequisiteService prerequisite)
    {
        _service      = service;
        _prerequisite = prerequisite;
    }

    // GET /api/DailyDiet/prerequisites
    [HttpGet("prerequisites")]
    public async Task<ActionResult<DietPrerequisiteStatusDto>> GetPrerequisites()
    {
        var memberId = GetMemberId();
        if (memberId is null) return Unauthorized();

        var status = await _prerequisite.CheckAsync(memberId.Value);
        return Ok(status);
    }

    // GET /api/DailyDiet?eatDate=yyyy-MM-dd
    [HttpGet]
    public async Task<ActionResult<DailyDietPageDto>> GetDailyDiet([FromQuery] DateOnly eatDate)
    {
        var memberId = GetMemberId();
        if (memberId is null) return Unauthorized();

        var status = await _prerequisite.CheckAsync(memberId.Value);
        if (!status.CanUseDailyDiet)
            return StatusCode(412, status);

        var result = await _service.GetDailyDietPageAsync(memberId.Value, eatDate);
        return Ok(result);
    }

    // POST /api/DailyDiet/food-records
    [HttpPost("food-records")]
    public async Task<ActionResult<FoodRecordDto>> CreateFoodRecord([FromBody] CreateFoodRecordRequest request)
    {
        var memberId = GetMemberId();
        if (memberId is null) return Unauthorized();

        var status = await _prerequisite.CheckAsync(memberId.Value);
        if (!status.CanUseDailyDiet)
            return StatusCode(412, status);

        var result = await _service.CreateFoodRecordAsync(memberId.Value, request);
        return CreatedAtAction(nameof(GetDailyDiet),
            new { eatDate = result.EatDT.ToString("yyyy-MM-dd") }, result);
    }

    // PUT /api/DailyDiet/food-records/{id}
    [HttpPut("food-records/{id:int}")]
    public async Task<ActionResult<FoodRecordDto>> UpdateFoodRecord(int id, [FromBody] UpdateFoodRecordRequest request)
    {
        var memberId = GetMemberId();
        if (memberId is null) return Unauthorized();

        var status = await _prerequisite.CheckAsync(memberId.Value);
        if (!status.CanUseDailyDiet)
            return StatusCode(412, status);

        var result = await _service.UpdateFoodRecordAsync(memberId.Value, id, request);
        if (result is null) return NotFound();
        return Ok(result);
    }

    // DELETE /api/DailyDiet/food-records/{id}
    [HttpDelete("food-records/{id:int}")]
    public async Task<IActionResult> DeleteFoodRecord(int id)
    {
        var memberId = GetMemberId();
        if (memberId is null) return Unauthorized();

        var status = await _prerequisite.CheckAsync(memberId.Value);
        if (!status.CanUseDailyDiet)
            return StatusCode(412, status);

        var deleted = await _service.DeleteFoodRecordAsync(memberId.Value, id);
        if (!deleted) return NotFound();
        return NoContent();
    }

    // PUT /api/DailyDiet/water-log
    [HttpPut("water-log")]
    public async Task<IActionResult> UpdateWaterLog([FromBody] UpdateWaterLogRequest request)
    {
        var memberId = GetMemberId();
        if (memberId is null) return Unauthorized();

        var status = await _prerequisite.CheckAsync(memberId.Value);
        if (!status.CanUseDailyDiet)
            return StatusCode(412, status);

        var amount = await _service.UpdateWaterLogAsync(memberId.Value, request);
        return Ok(new { logDate = request.LogDate, amount });
    }

    // POST /api/DailyDiet/copy-from-date
    [HttpPost("copy-from-date")]
    public async Task<ActionResult<DailyDietPageDto>> CopyFromDate([FromBody] CopyDailyDietRequest request)
    {
        var memberId = GetMemberId();
        if (memberId is null) return Unauthorized();

        var status = await _prerequisite.CheckAsync(memberId.Value);
        if (!status.CanUseDailyDiet)
            return StatusCode(412, status);

        try
        {
            var result = await _service.CopyDailyDietAsync(memberId.Value, request);
            return Ok(result);
        }
        catch (ArgumentException ex)
        {
            return BadRequest(new { message = ex.Message });
        }
        catch (ConflictException ex)
        {
            return Conflict(new { message = ex.Message });
        }
    }

    private int? GetMemberId()
    {
        var claim = User.FindFirst("MemberId")?.Value;
        return int.TryParse(claim, out var id) ? id : null;
    }
}
