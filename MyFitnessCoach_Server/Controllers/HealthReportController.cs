using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.Services;

namespace MyFitnessCoach_Server.Controllers;

[ApiController]
[Route("api/HealthReport")]
[Authorize]
public class HealthReportController : ControllerBase
{
    private static readonly int[] ValidPresetDays = [7, 14, 30, 90, 180, 365];
    private const int MaxRangeDays = 365;

    private readonly IHealthReportService _service;

    public HealthReportController(IHealthReportService service) => _service = service;

    // GET /api/HealthReport?rangeDays=30
    // GET /api/HealthReport?fromDate=2026-04-01&toDate=2026-04-30
    [HttpGet]
    public async Task<ActionResult<HealthReportResponse>> GetReport(
        [FromQuery] int?    rangeDays,
        [FromQuery] string? fromDate,
        [FromQuery] string? toDate)
    {
        var memberId = GetMemberId();
        if (memberId is null) return Unauthorized();

        var resolvedTo = toDate is not null && DateOnly.TryParse(toDate, out var td)
            ? td
            : DateOnly.FromDateTime(DateTime.Today);

        DateOnly resolvedFrom;

        if (fromDate is not null && DateOnly.TryParse(fromDate, out var fd))
        {
            resolvedFrom = fd;
            var span = resolvedTo.DayNumber - resolvedFrom.DayNumber + 1;
            if (span < 1 || span > MaxRangeDays)
                return BadRequest($"日期範圍需介於 1 到 {MaxRangeDays} 天。");
        }
        else if (rangeDays.HasValue)
        {
            if (!ValidPresetDays.Contains(rangeDays.Value))
                return BadRequest($"rangeDays 只允許以下值：{string.Join(", ", ValidPresetDays)}。");
            resolvedFrom = resolvedTo.AddDays(-(rangeDays.Value - 1));
        }
        else
        {
            return BadRequest("請提供 rangeDays 或 fromDate/toDate 參數。");
        }

        var result = await _service.GetReportAsync(memberId.Value, resolvedFrom, resolvedTo);
        return Ok(result);
    }

    private int? GetMemberId()
    {
        var claim = User.FindFirst("MemberId")?.Value;
        return int.TryParse(claim, out var id) ? id : null;
    }
}
