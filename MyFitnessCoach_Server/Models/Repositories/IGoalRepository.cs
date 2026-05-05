using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Models.Repositories;

public interface IGoalRepository
{
    Task<Member?> GetMemberAsync(int memberId);
    Task<double?> GetLatestWeightAsync(int memberId);
    Task CreateMemberInfoAsync(int memberId, BasicInfoDto dto);
    Task UpdateMemberInfoAsync(Member member, BasicInfoDto dto);
    Task<MemberGoal?> GetMemberGoalAsync(int memberId);
    Task CreateMemberGoalAsync(int memberId, TargetCaloriesDto dto);
    Task UpdateMemberGoalAsync(MemberGoal goal, TargetCaloriesDto dto);
}
