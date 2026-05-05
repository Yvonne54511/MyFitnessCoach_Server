using System.ComponentModel.DataAnnotations;

namespace MyFitnessCoach_Server.Models.DTOs;

public class RegisterDto
{
    [Required(ErrorMessage = "帳號為必填")]
    [StringLength(20, MinimumLength = 4, ErrorMessage = "帳號長度須為 4-20 碼")]
    [RegularExpression(@"^[A-Za-z0-9]+$", ErrorMessage = "帳號只能包含英文字母與數字")]
    public string Account { get; set; } = string.Empty;

    [Required(ErrorMessage = "密碼為必填")]
    [StringLength(12, MinimumLength = 8, ErrorMessage = "密碼長度須為 8-12 碼")]
    public string Password { get; set; } = string.Empty;

    [Required(ErrorMessage = "Email 為必填")]
    [StringLength(100, ErrorMessage = "Email 長度不可超過 100 碼")]
    [EmailAddress(ErrorMessage = "Email 格式不正確")]
    public string Email { get; set; } = string.Empty;

    [Required(ErrorMessage = "姓名為必填")]
    [StringLength(50, MinimumLength = 1, ErrorMessage = "姓名長度須為 1-50 碼")]
    [RegularExpression(@"^[^<>""'&/\\`]+$", ErrorMessage = "姓名不可包含特殊符號")]
    public string UserName { get; set; } = string.Empty;

    [Required(ErrorMessage = "手機號碼為必填")]
    [RegularExpression(@"^09\d{8}$", ErrorMessage = "手機號碼格式不正確")]
    public string Mobile { get; set; } = string.Empty;

    [Required(ErrorMessage = "性別為必填")]
    [RegularExpression("^[MF]$", ErrorMessage = "性別格式不正確")]
    public string Gender { get; set; } = string.Empty;

    [Required(ErrorMessage = "生日為必填")]
    public DateOnly DateOfBirth { get; set; }
}

public class ActivateAccountResultDto
{
    public bool   IsSuccess { get; set; }
    public string ErrorCode { get; set; } = string.Empty;
}

public class ResendActivationDto
{
    [Required(ErrorMessage = "Email 為必填")]
    [StringLength(100, ErrorMessage = "Email 長度不可超過 100 碼")]
    [EmailAddress(ErrorMessage = "Email 格式不正確")]
    public string Email { get; set; } = string.Empty;
}
