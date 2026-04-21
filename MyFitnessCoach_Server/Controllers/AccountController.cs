using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.Services;

namespace MyFitnessCoach_Server.Controllers;

[ApiController]
[Route("api/auth")]
public class AccountController : ControllerBase
{
    private readonly IAccountService _accountService;

    public AccountController(IAccountService accountService)
    {
        _accountService = accountService;
    }

    /// <summary>
    /// POST /api/auth/login
    /// 驗證帳號密碼，成功後回傳 JWT Token
    /// </summary>
    [HttpPost("login")]
    [AllowAnonymous]
    public async Task<ActionResult<LoginResponseDto>> Login([FromBody] LoginDto dto)
    {
        if (!ModelState.IsValid)
            return BadRequest(ModelState);

        var result = await _accountService.LoginAsync(dto);

        if (!result.IsSuccess)
            return Unauthorized(new { message = result.Message });

        return Ok(new LoginResponseDto
        {
            Token    = result.Token!,
            UserId   = result.UserId,
            UserName = result.UserName!,
            ImageUrl = result.ImageUrl
        });
    }

    /// <summary>
    /// POST /api/auth/forgotpassword
    /// 發送密碼重設信（防 enumeration：不論帳號是否存在均回傳相同訊息）
    /// </summary>
    [HttpPost("forgotpassword")]
    [AllowAnonymous]
    public async Task<IActionResult> ForgotPassword([FromBody] ForgotPasswordDto dto)
    {
        if (!ModelState.IsValid)
            return BadRequest(ModelState);

        var ip = HttpContext.Connection.RemoteIpAddress?.ToString() ?? "unknown";

        try
        {
            await _accountService.ForgotPasswordAsync(dto, ip);
            return Ok(new { message = "若此帳號存在，系統已將重設郵件寄出" });
        }
        catch (RateLimitException ex)
        {
            return StatusCode(429, new { retryAfterSeconds = ex.RetryAfterSeconds });
        }
    }

    /// <summary>
    /// POST /api/auth/resetpassword
    /// 使用 token 重設密碼
    /// </summary>
    [HttpPost("resetpassword")]
    [AllowAnonymous]
    public async Task<IActionResult> ResetPassword([FromBody] ResetPasswordDto dto)
    {
        if (!ModelState.IsValid)
            return BadRequest(ModelState);

        var result = await _accountService.ResetPasswordAsync(dto);

        if (!result.IsSuccess)
            return BadRequest(new { message = result.Message });

        return Ok(new { message = result.Message });
    }
}
