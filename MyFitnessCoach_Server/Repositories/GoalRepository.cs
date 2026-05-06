using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.Repositories;
using MyFitnessCoach_Server.Utilities;

namespace MyFitnessCoach_Server.Repositories;

public class GoalRepository : IGoalRepository
{
    private readonly MyFitnessCoachDbContext _db;

    public GoalRepository(MyFitnessCoachDbContext db) => _db = db;

    public async Task<Member?> GetMemberAsync(int memberId)
        => await _db.Members.FirstOrDefaultAsync(m => m.Id == memberId);

    public async Task<double?> GetLatestWeightAsync(int memberId)
        => await _db.BodyRecords
            .Where(b => b.MemberId == memberId)
            .OrderByDescending(b => b.CreateAt)
            .Select(b => (double?)b.Weight)
            .FirstOrDefaultAsync();

    public async Task CreateMemberInfoAsync(int memberId, BasicInfoDto dto)
    {
        var member = await _db.Members.FirstOrDefaultAsync(m => m.Id == memberId)
            ?? throw new InvalidOperationException("Member not found");

        ApplyInfoToMember(member, dto);
        await _db.SaveChangesAsync();
    }

    public async Task UpdateMemberInfoAsync(Member member, BasicInfoDto dto)
    {
        ApplyInfoToMember(member, dto);
        await _db.SaveChangesAsync();
    }

    public async Task<MemberGoal?> GetMemberGoalAsync(int memberId)
        => await _db.MemberGoals.FirstOrDefaultAsync(g => g.MemberId == memberId);

    public async Task CreateMemberGoalAsync(int memberId, TargetCaloriesDto dto)
    {
        _db.MemberGoals.Add(new MemberGoal
        {
            MemberId      = memberId,
            TotalCalories = dto.TotalCalories,
            Protein       = dto.Protein,
            Carbs         = dto.Carbs,
            Fat           = dto.Fat,
            Water         = dto.Water,
            UpdatedAt     = DateTime.UtcNow,
        });
        await _db.SaveChangesAsync();
    }

    public async Task UpdateMemberGoalAsync(MemberGoal goal, TargetCaloriesDto dto)
    {
        goal.TotalCalories = dto.TotalCalories;
        goal.Protein       = dto.Protein;
        goal.Carbs         = dto.Carbs;
        goal.Fat           = dto.Fat;
        goal.Water         = dto.Water;
        goal.UpdatedAt     = DateTime.UtcNow;
        await _db.SaveChangesAsync();
    }

    // ── helpers ──────────────────────────────────────────────────
    private static void ApplyInfoToMember(Member member, BasicInfoDto dto)
    {
        member.Height        = dto.Height;
        // member.TargetWeight  = dto.TargetWeight; // Column does not exist
        member.ActivityLevel = dto.ActivityLevel;
        member.HealthPlan    = dto.HealthGoal;
    }

    // DB convention: 1 = Male, 2 = Female; null for unknown
    public static string? GenderToString(byte? gender) => gender switch { 1 => "M", 2 => "F", _ => null };
}
