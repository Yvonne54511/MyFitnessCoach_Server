using MyFitnessCoach_Server.Models.DTOs;

namespace MyFitnessCoach_Server.Models.Services;

public interface IGoalService
{
    Task<GoalPageResponseDto> LoadGoalPageAsync(int memberId);
    Task<GoalPageResponseDto> SaveBasicInfoAsync(int memberId, BasicInfoDto dto);
    Task SaveTargetCaloriesAsync(int memberId, TargetCaloriesDto dto);
}
