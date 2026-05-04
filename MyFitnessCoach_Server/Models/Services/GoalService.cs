using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.Repositories;
using MyFitnessCoach_Server.Repositories;
using MyFitnessCoach_Server.Utilities;

namespace MyFitnessCoach_Server.Models.Services;

public class GoalService : IGoalService
{
    private readonly IGoalRepository _repo;

    public GoalService(IGoalRepository repo) => _repo = repo;

    public async Task<GoalPageResponseDto> LoadGoalPageAsync(int memberId)
    {
        var member = await _repo.GetMemberAsync(memberId);
        var goal   = await _repo.GetMemberGoalAsync(memberId);

        return new GoalPageResponseDto
        {
            Info  = member is not null ? MemberToDto(member) : null,
            Goals = goal   is not null ? GoalToDto(goal)     : null,
        };
    }

    public async Task<GoalPageResponseDto> SaveBasicInfoAsync(int memberId, BasicInfoDto dto)
    {
        var member = await _repo.GetMemberAsync(memberId)
            ?? throw new InvalidOperationException("Member not found");

        await _repo.UpdateMemberInfoAsync(member, dto);

        var goal = await _repo.GetMemberGoalAsync(memberId);

        if (goal is null)
        {
            // 首次設定目標：用 Member 現有的 Gender/DateOfBirth 計算初始 MemberGoals
            var currentWeight = await _repo.GetLatestWeightAsync(memberId) ?? dto.TargetWeight ?? 60;
            var dob    = member.DateOfBirth.HasValue
                ? DateOnly.FromDateTime(member.DateOfBirth.Value)
                : throw new InvalidOperationException("Member DateOfBirth is required");
            var gender = GoalRepository.GenderToString(member.Gender)
                ?? throw new InvalidOperationException("Member Gender is required");
            var age    = GoalCalculator.CalculateAge(dob);
            var bmr    = GoalCalculator.CalculateBMR(currentWeight, dto.Height, age, gender);
            var tdee   = GoalCalculator.CalculateTDEE(bmr, dto.ActivityLevel);
            var macros = GoalCalculator.CalculateMacros(tdee, currentWeight, dto.HealthGoal);

            await _repo.CreateMemberGoalAsync(memberId, macros);
            return new GoalPageResponseDto { Info = dto, Goals = macros };
        }

        return new GoalPageResponseDto
        {
            Info  = dto,
            Goals = GoalToDto(goal),
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
    private static BasicInfoDto MemberToDto(Member m) => new()
    {
        Height        = m.Height ?? 0,
        TargetWeight  = m.TargetWeight,
        ActivityLevel = m.ActivityLevel ?? "1.55",
        HealthGoal    = m.HealthPlan ?? "健康飲食",
    };

    private static TargetCaloriesDto GoalToDto(MemberGoal g) => new()
    {
        TotalCalories = g.TotalCalories,
        Protein       = g.Protein,
        Carbs         = g.Carbs,
        Fat           = g.Fat,
        Water         = g.Water,
    };
}
