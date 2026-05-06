using System.ComponentModel.DataAnnotations;

namespace MyFitnessCoach_Server.Models.DTOs;

public class ForgotPasswordDto
{
    [Required(ErrorMessage = "Email 為必填")]
    [StringLength(100, ErrorMessage = "Email 長度不可超過 100 碼")]
    [EmailAddress(ErrorMessage = "Email 格式不正確")]
    public string Email { get; set; } = string.Empty;
}

public class ResetPasswordDto
{
    [Required(ErrorMessage = "Token 為必填")]
    public string Token { get; set; } = string.Empty;

    [Required(ErrorMessage = "密碼為必填")]
    [StringLength(12, MinimumLength = 8, ErrorMessage = "密碼長度須為 8-12 碼")]
    public string NewPassword { get; set; } = string.Empty;
}

public class ResetPasswordResultDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
}
