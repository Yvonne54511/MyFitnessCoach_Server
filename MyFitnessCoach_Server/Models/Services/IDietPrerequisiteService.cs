using MyFitnessCoach_Server.Models.DTOs;

namespace MyFitnessCoach_Server.Models.Services;

public interface IDietPrerequisiteService
{
    Task<DietPrerequisiteStatusDto> CheckAsync(int memberId);
}
