using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.Repositories;

namespace MyFitnessCoach_Server.Models.Services;

public class GoalService : IGoalService
{
    private readonly IGoalRepository _repo;

    public GoalService(IGoalRepository repo) => _repo = repo;

    public async Task<GoalPageResponseDto> LoadGoalPageAsync(int memberId)
    {
        var member = await _repo.GetMemberAsync(memberId);
        var goal   = await _repo.GetMemberGoalAsync(memberId);
        var latestWeight = await _repo.GetLatestWeightAsync(memberId);

        return new GoalPageResponseDto
        {
            Info  = member is not null ? MemberToDto(member, latestWeight) : null,
            Goals = goal   is not null ? GoalToDto(goal)     : null,
        };
    }

    public async Task<GoalPageResponseDto> SaveBasicInfoAsync(int memberId, BasicInfoDto dto)
    {
        var member = await _repo.GetMemberAsync(memberId)
            ?? throw new InvalidOperationException("Member not found");

        await _repo.UpdateMemberInfoAsync(member, dto);

        var goal = await _repo.GetMemberGoalAsync(memberId);
        var latestWeight = await _repo.GetLatestWeightAsync(memberId);
        var responseInfo = DtoWithCurrentWeight(dto, latestWeight);

        return new GoalPageResponseDto
        {
            Info  = responseInfo,
            Goals = goal is not null ? GoalToDto(goal) : null,
        };
    }

    public async Task SaveTargetCaloriesAsync(int memberId, TargetCaloriesDto dto)
    {
        var goal = await _repo.GetMemberGoalAsync(memberId);

        if (goal is null)
            await _repo.CreateMemberGoalAsync(memberId, dto);
        else
            await _repo.UpdateMemberGoalAsync(goal, dto);
    }

    // ── mapping ───────────────────────────────────────────────────
    private static BasicInfoDto MemberToDto(Member m, double? currentWeight) => new()
    {
        Height        = m.Height ?? 0,
        TargetWeight  = null, // TargetWeight column does not exist in Member table
        CurrentWeight = currentWeight,
        ActivityLevel = m.ActivityLevel ?? "1.55",
        HealthGoal    = m.HealthPlan ?? "健康飲食",
    };

    private static BasicInfoDto DtoWithCurrentWeight(BasicInfoDto dto, double? currentWeight) => new()
    {
        Height        = dto.Height,
        TargetWeight  = dto.TargetWeight,
        CurrentWeight = currentWeight,
        ActivityLevel = dto.ActivityLevel,
        HealthGoal    = dto.HealthGoal,
    };

    private static TargetCaloriesDto GoalToDto(MemberGoal g) => new()
    {
        TotalCalories = g.TotalCalories ?? 0,
        Protein       = g.Protein ?? 0,
        Carbs         = g.Carbs ?? 0,
        Fat           = g.Fat ?? 0,
        Water         = g.Water ?? 0,
    };
}
