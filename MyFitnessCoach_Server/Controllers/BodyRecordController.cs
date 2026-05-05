using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.Services;

namespace MyFitnessCoach_Server.Controllers;

[ApiController]
[Route("api/BodyRecord")]
[Authorize]
public class BodyRecordController : ControllerBase
{





    private readonly IBodyRecordService _service;

    public BodyRecordController(IBodyRecordService service) => _service = service;

    // GET /api/BodyRecord?fromDate=yyyy-MM-dd&toDate=yyyy-MM-dd&take=40
    [HttpGet]
    public async Task<ActionResult<IReadOnlyList<BodyRecordDto>>> GetRecords(
        [FromQuery] DateOnly? fromDate,
        [FromQuery] DateOnly? toDate,
        [FromQuery] int take = 40)
    {
        var memberId = GetMemberId();
        if (memberId is null) return Unauthorized();

        var result = await _service.GetRecordsAsync(memberId.Value, fromDate, toDate, take);
        return Ok(result);
    }

    // GET /api/BodyRecord/{id}
    [HttpGet("{id:int}")]
    public async Task<ActionResult<BodyRecordDto>> GetById(int id)
    {
        var memberId = GetMemberId();
        if (memberId is null) return Unauthorized();

        var result = await _service.GetByIdAsync(memberId.Value, id);
        if (result is null) return NotFound();
        return Ok(result);
    }

    // POST /api/BodyRecord
    [HttpPost]
    public async Task<ActionResult<BodyRecordDto>> Create([FromForm] CreateBodyRecordRequest request)
    {
        var memberId = GetMemberId();
        if (memberId is null) return Unauthorized();

        try
        {
            var result = await _service.CreateAsync(memberId.Value, request);
            return CreatedAtAction(nameof(GetById), new { id = result.Id }, result);
        }
        catch (ArgumentException ex)
        {
            return BadRequest(new { message = ex.Message });
        }
        catch (BodyRecordConflictException ex)
        {
            return Conflict(new { message = ex.Message, existingId = ex.ExistingId });
        }
    }

    // PUT /api/BodyRecord/{id}
    [HttpPut("{id:int}")]
    public async Task<ActionResult<BodyRecordDto>> Update(int id, [FromForm] UpdateBodyRecordRequest request)
    {
        var memberId = GetMemberId();
        if (memberId is null) return Unauthorized();

        try
        {
            var result = await _service.UpdateAsync(memberId.Value, id, request);
            if (result is null) return NotFound();
            return Ok(result);
        }
        catch (ArgumentException ex)
        {
            return BadRequest(new { message = ex.Message });
        }
    }

    // DELETE /api/BodyRecord/{id}
    [HttpDelete("{id:int}")]
    public async Task<IActionResult> Delete(int id)
    {
        var memberId = GetMemberId();
        if (memberId is null) return Unauthorized();

        var deleted = await _service.DeleteAsync(memberId.Value, id);
        if (!deleted) return NotFound();
        return NoContent();
    }

    private int? GetMemberId()
    {
        var claim = User.FindFirst("MemberId")?.Value;
        return int.TryParse(claim, out var id) ? id : null;
    }
}
