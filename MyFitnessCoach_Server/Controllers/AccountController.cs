using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.Services;
using MyFitnessCoach_Server.Utilities;

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
            Token    = result.Token!,//JWT Token 不應為 null，因為登入成功才會回傳
			UserId   = result.UserId,
            UserName = result.UserName!,
            ImageUrl = result.ImageUrl
        });
    }

    /// <summary>
    /// POST /api/auth/ChangePassword
    /// 已登入用戶修改自己的密碼
    /// </summary>
    [HttpPost("ChangePassword")]
    [Authorize]
    public async Task<IActionResult> ChangePassword([FromBody] ChangePasswordDto dto)
    {
        if (!ModelState.IsValid)
            return BadRequest(ModelState);

        var userId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
        var result = await _accountService.ChangePasswordAsync(dto, userId);

        if (!result.IsSuccess)
        {
            if (result.Message == "OLD_PASSWORD_WRONG")
                return Unauthorized(new { message = "舊密碼不正確" });

            return BadRequest(new { message = result.Message });
        }

        return Ok(new { message = result.Message });
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

    /// <summary>
    /// POST /api/auth/register
    /// 註冊新帳號，成功後寄出啟用信
    /// </summary>
    [HttpPost("register")]
    [AllowAnonymous]
    public async Task<IActionResult> Register([FromBody] RegisterDto dto)
    {
        if (!ModelState.IsValid)
            return BadRequest(ModelState);

        var ip = HttpContext.Connection.RemoteIpAddress?.ToString() ?? "unknown";

        try
        {
            await _accountService.RegisterAsync(dto, ip);
            return StatusCode(201, new { message = "註冊成功，請至信箱收取啟用信" });
        }
        catch (RateLimitException ex)
        {
            return StatusCode(429, new { retryAfterSeconds = ex.RetryAfterSeconds });
        }
        catch (InvalidOperationException ex) when (ex.Message == "ACCOUNT_OR_EMAIL_EXISTS")
        {
            return Conflict(new { message = "帳號或信箱已被使用" });
        }
        catch (InvalidOperationException ex) when (ex.Message == "MOBILE_EXISTS")
        {
            return Conflict(new { message = "手機號碼已被使用" });
        }
    }

    /// <summary>
    /// GET /api/auth/activate?token=xxx
    /// 啟用帳號
    /// </summary>
    [HttpGet("activate")]
    [AllowAnonymous]
    public async Task<IActionResult> ActivateAccount([FromQuery] string token)
    {
        if (string.IsNullOrWhiteSpace(token))
            return NotFound(new { message = "連結無效" });

        var result = await _accountService.ActivateAccountAsync(token);

        if (!result.IsSuccess)
        {
            if (result.ErrorCode == "TOKEN_EXPIRED")
                return BadRequest(new { error_code = "TOKEN_EXPIRED" });

            return NotFound(new { message = "連結無效或該帳號已完成驗證" });
        }

        return Ok(new { message = "帳號已成功啟用" });
    }

    /// <summary>
    /// POST /api/auth/resend-activation
    /// 重新寄出啟用信（有限流保護）
    /// </summary>
    [HttpPost("resend-activation")]
    [AllowAnonymous]
    public async Task<IActionResult> ResendActivation([FromBody] ResendActivationDto dto)
    {
        if (!ModelState.IsValid)
            return BadRequest(ModelState);

        var ip = HttpContext.Connection.RemoteIpAddress?.ToString() ?? "unknown";

        try
        {
            await _accountService.ResendActivationEmailAsync(dto, ip);
            return Ok(new { message = "若此信箱尚未完成驗證，系統已將啟用信重新寄出" });
        }
        catch (RateLimitException ex)
        {
            return StatusCode(429, new { retryAfterSeconds = ex.RetryAfterSeconds });
        }
    }
}
