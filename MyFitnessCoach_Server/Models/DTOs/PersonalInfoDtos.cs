using System.ComponentModel.DataAnnotations;

namespace MyFitnessCoach_Server.Models.DTOs;

public sealed class PersonalInfoDto
{
    public int UserId { get; set; }
    public int MemberId { get; set; }
    public string UserName { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public string Mobile { get; set; } = string.Empty;
    public string? Gender { get; set; }
    public DateOnly? DateOfBirth { get; set; }
    public string? ImageUrl { get; set; }
}

public sealed class UpdatePersonalInfoRequest
{
    [Required]
    [StringLength(50, MinimumLength = 1)]
    [RegularExpression(@"^[^<>""'&/\\`]+$")]
    public string UserName { get; set; } = string.Empty;

    [Required]
    [RegularExpression("^[MF]$")]
    public string Gender { get; set; } = string.Empty;

    [Required]
    public DateOnly DateOfBirth { get; set; }
}

public sealed class AvatarUploadResponse
{
    public string ImageUrl { get; set; } = string.Empty;
}
