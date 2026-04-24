namespace MyFitnessCoach_Server.Models.DTOs;

public class CurrentUserDto
{
    public int UserId { get; set; }
    public string UserName { get; set; } = string.Empty;
    public string? ImageUrl { get; set; }
}
