namespace MyFitnessCoach_Server.Models.DTOs;

// Controller 回傳給前端的結構
public class LoginResponseDto
{
    public string Token { get; set; } = string.Empty;
    public int UserId { get; set; }
    public int? MemberId { get; set; }
    public string UserName { get; set; } = string.Empty;
    public string? ImageUrl { get; set; }
}
