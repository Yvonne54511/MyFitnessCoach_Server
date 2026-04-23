using MyFitnessCoach_Server.Models.DTOs;

namespace MyFitnessCoach_Server.Models.Services;

public interface IAccountService
{
    Task<LoginResultDto> LoginAsync(LoginDto dto);
    Task ForgotPasswordAsync(ForgotPasswordDto dto, string ipAddress);
    Task<ResetPasswordResultDto> ResetPasswordAsync(ResetPasswordDto dto);

    Task RegisterAsync(RegisterDto dto, string ipAddress);
    Task<ActivateAccountResultDto> ActivateAccountAsync(string rawToken);
    Task ResendActivationEmailAsync(ResendActivationDto dto, string ipAddress);
}
