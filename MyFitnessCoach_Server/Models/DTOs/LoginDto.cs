using System.ComponentModel.DataAnnotations;

namespace MyFitnessCoach_Server.Models.DTOs;

public class LoginDto
{
    [Required]
    [StringLength(20)]
    public string Account { get; set; } = string.Empty;

    [Required]
    [StringLength(12)]
    public string Password { get; set; } = string.Empty;
}
