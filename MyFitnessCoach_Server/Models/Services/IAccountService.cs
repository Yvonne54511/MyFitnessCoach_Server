using MyFitnessCoach_Server.Models.DTOs;

namespace MyFitnessCoach_Server.Models.Services;

public interface IAccountService
{
    Task<LoginResultDto> LoginAsync(LoginDto dto);
}
