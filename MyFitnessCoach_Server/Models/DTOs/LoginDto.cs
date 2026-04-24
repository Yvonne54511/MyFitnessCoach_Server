namespace MyFitnessCoach_Server.Models.DTOs;

// 登入請求（對應前端 LoginRequest.account）
public class LoginDto
{
    public string Account { get; set; } = string.Empty;
    public string Password { get; set; } = string.Empty;
}
