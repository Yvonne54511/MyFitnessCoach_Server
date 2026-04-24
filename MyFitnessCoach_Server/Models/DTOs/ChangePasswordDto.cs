using System.ComponentModel.DataAnnotations;

namespace MyFitnessCoach_Server.Models.DTOs;

public class ChangePasswordDto
{
    [Required]
    public string OldPassword { get; set; } = string.Empty;

    [Required]
    [StringLength(12, MinimumLength = 8, ErrorMessage = "密碼長度須為 8-12 碼")]
    public string NewPassword { get; set; } = string.Empty;
}
