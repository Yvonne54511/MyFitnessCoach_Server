namespace MyFitnessCoach_Server.Models.DTOs;

// Service 內部使用，不對外暴露
public class LoginResultDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public string? Token { get; set; }
    public int UserId { get; set; }
    public int? MemberId { get; set; }
    public string? UserName { get; set; }
    public string? ImageUrl { get; set; }
}
