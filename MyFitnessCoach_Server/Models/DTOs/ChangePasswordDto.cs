using System.ComponentModel.DataAnnotations;

namespace MyFitnessCoach_Server.Models.DTOs;

public class ChangePasswordDto
{
    [Required] public string OldPassword { get; set; } = string.Empty;
    [Required] public string NewPassword { get; set; } = string.Empty;
}
