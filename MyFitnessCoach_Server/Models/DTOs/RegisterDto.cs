using System.ComponentModel.DataAnnotations;

namespace MyFitnessCoach_Server.Models.DTOs;

public class RegisterDto
{
    [Required(ErrorMessage = "帳號為必填")]
    [RegularExpression(@"^[A-Za-z0-9]+$", ErrorMessage = "帳號只能包含英文字母與數字")]
    public string Account { get; set; } = string.Empty;

    [Required(ErrorMessage = "密碼為必填")]
    [MinLength(8, ErrorMessage = "密碼至少需要 8 個字元")]
    public string Password { get; set; } = string.Empty;

    [Required(ErrorMessage = "Email 為必填")]
    [EmailAddress(ErrorMessage = "Email 格式不正確")]
    public string Email { get; set; } = string.Empty;

    [Required(ErrorMessage = "姓名為必填")]
    public string UserName { get; set; } = string.Empty;

    [Required(ErrorMessage = "手機號碼為必填")]
    [RegularExpression(@"^09\d{8}$", ErrorMessage = "手機號碼格式不正確")]
    public string Mobile { get; set; } = string.Empty;
}

public class ActivateAccountResultDto
{
    public bool   IsSuccess { get; set; }
    public string ErrorCode { get; set; } = string.Empty;
}

public class ResendActivationDto
{
    [Required(ErrorMessage = "Email 為必填")]
    [EmailAddress(ErrorMessage = "Email 格式不正確")]
    public string Email { get; set; } = string.Empty;
}
