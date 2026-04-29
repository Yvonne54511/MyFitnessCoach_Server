using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.Services;

namespace MyFitnessCoach_Server.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize]
public class FoodLibraryController : ControllerBase
{
    private readonly FoodLibraryService _service;

    public FoodLibraryController(FoodLibraryService service) => _service = service;

    private async Task<int?> GetCurrentMemberIdAsync()
    {
        var userIdStr = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        if (!int.TryParse(userIdStr, out var userId)) return null;
        return await _service.GetMemberIdByUserIdAsync(userId);
    }

    /// <summary>GET /api/FoodLibrary/version — 公開，供前端 stale-while-revalidate 比對</summary>
    [HttpGet("version")]
    [AllowAnonymous]
    public IActionResult GetVersion() => Ok(new { version = _service.GetCurrentVersion() });

    /// <summary>GET /api/FoodLibrary/all — 回傳 systemFoods + customFoods + favoriteFoodIds + categories</summary>
    [HttpGet("all")]
    public async Task<IActionResult> GetAll()
    {
        var memberId = await GetCurrentMemberIdAsync();
        if (memberId == null) return Unauthorized(new { message = "找不到會員資料" });

        var bundle = await _service.GetBundleAsync(memberId.Value);
        return Ok(bundle);
    }

    /// <summary>POST /api/FoodLibrary/foods — 建立自訂食物</summary>
    [HttpPost("foods")]
    public async Task<IActionResult> CreateFood([FromBody] CreateFoodDto dto)
    {
        if (!ModelState.IsValid) return BadRequest(ModelState);

        var memberId = await GetCurrentMemberIdAsync();
        if (memberId == null) return Unauthorized(new { message = "找不到會員資料" });

        var food = await _service.CreateCustomFoodAsync(memberId.Value, dto);
        return CreatedAtAction(nameof(GetAll), new { }, food);
    }

    /// <summary>PUT /api/FoodLibrary/foods/{id} — 更新自訂食物（整批覆寫份量）</summary>
    [HttpPut("foods/{id:int}")]
    public async Task<IActionResult> UpdateFood(int id, [FromBody] UpdateFoodDto dto)
    {
        if (!ModelState.IsValid) return BadRequest(ModelState);

        var memberId = await GetCurrentMemberIdAsync();
        if (memberId == null) return Unauthorized(new { message = "找不到會員資料" });

        var ok = await _service.UpdateCustomFoodAsync(memberId.Value, id, dto);
        return ok ? NoContent() : NotFound();
    }

    /// <summary>DELETE /api/FoodLibrary/foods/{id} — 軟刪除自訂食物（僅限本人）</summary>
    [HttpDelete("foods/{id:int}")]
    public async Task<IActionResult> DeleteFood(int id)
    {
        var memberId = await GetCurrentMemberIdAsync();
        if (memberId == null) return Unauthorized(new { message = "找不到會員資料" });

        var ok = await _service.DeleteCustomFoodAsync(memberId.Value, id);
        return ok ? NoContent() : NotFound();
    }

    /// <summary>POST /api/FoodLibrary/favorites — 加入最愛</summary>
    [HttpPost("favorites")]
    public async Task<IActionResult> AddFavorite([FromBody] AddFavoriteFoodDto dto)
    {
        if (!ModelState.IsValid) return BadRequest(ModelState);

        var memberId = await GetCurrentMemberIdAsync();
        if (memberId == null) return Unauthorized(new { message = "找不到會員資料" });

        await _service.AddFavoriteAsync(memberId.Value, dto.FoodId);
        return NoContent();
    }

    /// <summary>DELETE /api/FoodLibrary/favorites/{foodId} — 移除最愛</summary>
    [HttpDelete("favorites/{foodId:int}")]
    public async Task<IActionResult> RemoveFavorite(int foodId)
    {
        var memberId = await GetCurrentMemberIdAsync();
        if (memberId == null) return Unauthorized(new { message = "找不到會員資料" });

        var ok = await _service.RemoveFavoriteAsync(memberId.Value, foodId);
        return ok ? NoContent() : NotFound();
    }
}
