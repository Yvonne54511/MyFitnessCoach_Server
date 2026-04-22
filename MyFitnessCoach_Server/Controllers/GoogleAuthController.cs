using Microsoft.AspNetCore.Mvc;
using MyFitnessCoach_Server.Models.Services;
using MyFitnessCoach_Server.Models.EfModels;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

namespace MyFitnessCoach_Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GoogleAuthController : ControllerBase
    {
        private readonly GoogleCalendarService _googleService;
        private readonly MyFitnessCoachDbContext _db;

        public GoogleAuthController(GoogleCalendarService googleService, MyFitnessCoachDbContext db)
        {
            _googleService = googleService;
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

            return Ok(new { message = "已解除 Google 日曆連結" });
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
                    // 授權成功後，主動補做最新一筆預約的同步
                    try
                    {
                        var latestReservation = await _db.ReserveOrders
                            .Include(ro => ro.Member)
                            .Include(ro => ro.Shift)
                            .ThenInclude(s => s.Instructor)
                            .ThenInclude(i => i.User)
                            .Where(ro => ro.Member.UserId == userId)
                            .OrderByDescending(ro => ro.CreateAt)
                            .FirstOrDefaultAsync();

                        if (latestReservation != null)
                        {
                            // 解析時間 (ScheduleDate 是 DateOnly)
                            var rawDate = latestReservation.Shift.ScheduleDate;
                            var rawTime = latestReservation.Shift.TimeSlot.Split('-')[0].Trim();
                            if (rawTime.Contains("(")) rawTime = rawTime.Split('(')[0].Trim();
                            
                            DateTime startTime;
                            if (int.TryParse(rawTime, out int hour))
                            {
                                startTime = new DateTime(rawDate.Year, rawDate.Month, rawDate.Day, hour, 0, 0);
                            }
                            else
                            {
                                // DateOnly 轉 DateTime
                                startTime = rawDate.ToDateTime(TimeOnly.Parse(rawTime));
                            }

                            var googleEventId = await _googleService.AddEventAsync(
                                userId,
                                $"MyFitnessCoach 課程 - 教練: {latestReservation.Shift.Instructor.User.UserName}",
                                $"您的預約目標: {latestReservation.Target ?? "一般健身諮詢"}",
                                startTime,
                                startTime.AddHours(1)
                            );

                            if (!string.IsNullOrEmpty(googleEventId))
                            {
                                latestReservation.GoogleEventId = googleEventId;
                                await _db.SaveChangesAsync();
                            }
                        }
                    }
                    catch (Exception syncEx)
                    {
                        // 補做同步失敗不應影響授權結果，僅記錄日誌
                        System.Diagnostics.Debug.WriteLine($"補做同步失敗: {syncEx.Message}");
                    }

                    return Ok(new { message = "Google 日曆授權成功！以後您的預約將自動同步。" });
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
