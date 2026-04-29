using Microsoft.AspNetCore.Mvc;
using MyFitnessCoach_Server.Models.Services;
using MyFitnessCoach_Server.Models.EfModels;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

namespace MyFitnessCoach_Server.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class GoogleAuthController : ControllerBase
    {
        private readonly GoogleCalendarService _googleService;
        private readonly ReservationService _reservationService;
        private readonly MyFitnessCoachDbContext _db;

        public GoogleAuthController(GoogleCalendarService googleService, ReservationService reservationService, MyFitnessCoachDbContext db)
        {
            _googleService = googleService;
            _reservationService = reservationService;
            _db = db;
        }

        [HttpGet("CheckStatus")]
        public async Task<IActionResult> CheckStatus()
        {
            var userIdClaim = User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userIdClaim) || !int.TryParse(userIdClaim, out int userId))
            {
                return Ok(new { isConnected = false });
            }

            var loginInfo = await _db.UserExternalLogins
                .FirstOrDefaultAsync(l => l.UserId == userId && l.LoginProvider == "GoogleCalendar");

            return Ok(new { isConnected = (loginInfo != null) });
        }

        [HttpPost("Disconnect")]
        public async Task<IActionResult> Disconnect()
        {
            var userIdClaim = User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userIdClaim) || !int.TryParse(userIdClaim, out int userId))
            {
                return Unauthorized();
            }

            var loginInfo = await _db.UserExternalLogins
                .FirstOrDefaultAsync(l => l.UserId == userId && l.LoginProvider == "GoogleCalendar");

            if (loginInfo != null)
            {
                _db.UserExternalLogins.Remove(loginInfo);
                await _db.SaveChangesAsync();
            }

            return Ok(new { message = "已解除 Google 連結" });
        }

        [HttpPost("SaveToken")]
        public async Task<IActionResult> SaveToken([FromBody] GoogleAuthRequest request)
        {
            try 
            {
                var userIdClaim = User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value;
                if (string.IsNullOrEmpty(userIdClaim) || !int.TryParse(userIdClaim, out int userId))
                {
                    return Unauthorized();
                }

                var success = await _googleService.SaveTokenFromCodeAsync(userId, request.Code, request.RedirectUri);
                
                if (success) 
                {
                    // 授權成功後，主動補做最新一筆預約的「郵件發送」與「日曆同步」
                    try
                    {
                        var latestReservation = await _db.ReserveOrders
                            .Include(ro => ro.Member)
                            .Where(ro => ro.Member.UserId == userId)
                            .OrderByDescending(ro => ro.CreateAt)
                            .FirstOrDefaultAsync();

                        if (latestReservation != null)
                        {
                            // 呼叫 ReservationService 的完整補完邏輯 (包含發信 + 同步)
                            await _reservationService.CompleteReservationAsync(latestReservation.Id);
                        }
                    }
                    catch (Exception syncEx)
                    {
                        // 補做失敗不應影響授權結果，僅記錄日誌
                        System.Diagnostics.Debug.WriteLine($"授權後補做通知失敗: {syncEx.Message}");
                    }

                    return Ok(new { message = "Google 授權成功！以後您的預約將自動同步並發送郵件通知。" });
                }
                return BadRequest(new { message = "授權失敗：Google 拒絕了換票請求，請檢查 ClientSecret 或 RedirectUri" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { 
                    message = "後端發生異常", 
                    error = ex.Message,
                    details = ex.InnerException?.Message 
                });
            }
        }
    }

    public class GoogleAuthRequest
    {
        public string Code { get; set; } = string.Empty;
        public string RedirectUri { get; set; } = string.Empty;
    }
}
