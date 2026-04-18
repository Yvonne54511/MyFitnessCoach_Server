namespace MyFitnessCoach_Server.Models.DTOs;

// 登入請求（對應前端 LoginRequest.account）
public class LoginDto
{
    public string Account { get; set; } = string.Empty;
    public string Password { get; set; } = string.Empty;
}

// Service 內部使用，不對外暴露
public class LoginResultDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public string? Token { get; set; }
    public int UserId { get; set; }
    public string? UserName { get; set; }
    public string? ImageUrl { get; set; }
}

// Controller 回傳給前端的結構
public class LoginResponseDto
{
    public string Token { get; set; } = string.Empty;
    public int UserId { get; set; }
    public string UserName { get; set; } = string.Empty;
    public string? ImageUrl { get; set; }
}
