using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.Repositories;

namespace MyFitnessCoach_Server.Models.Services;

public class ConflictException : Exception
{
    public ConflictException(string message) : base(message) { }
}

public class DailyDietService : IDailyDietService
{
    private readonly IDailyDietRepository _repo;
    private readonly IGoalRepository _goalRepo;

    public DailyDietService(IDailyDietRepository repo, IGoalRepository goalRepo)
    {
        _repo     = repo;
        _goalRepo = goalRepo;
    }

    public async Task<DailyDietPageDto> GetDailyDietPageAsync(int memberId, DateOnly eatDate)
    {
        var records = await _repo.GetDailyFoodRecordsAsync(memberId, eatDate);
        var summary = await BuildSummaryAsync(memberId, records);
        var waterAmount = await _repo.GetWaterAmountAsync(memberId, eatDate);

        return new DailyDietPageDto
        {
            EatDate = eatDate,
            WaterAmount = waterAmount,
            Records = records.ToList(),
            Summary = summary,
        };
    }

    public async Task<FoodRecordDto> CreateFoodRecordAsync(int memberId, CreateFoodRecordRequest request)
    {
        var newId = await _repo.CreateFoodRecordAsync(memberId, request);
        var dto   = await _repo.GetFoodRecordByIdAsync(memberId, newId)
                    ?? throw new InvalidOperationException("建立後無法載入記錄");
        return dto;
    }

    public async Task<FoodRecordDto?> UpdateFoodRecordAsync(int memberId, int id, UpdateFoodRecordRequest request)
    {
        var updated = await _repo.UpdateFoodRecordAsync(memberId, id, request);
        if (!updated) return null;
        return await _repo.GetFoodRecordByIdAsync(memberId, id);
    }

    public async Task<bool> DeleteFoodRecordAsync(int memberId, int id)
        => await _repo.DeleteFoodRecordAsync(memberId, id);

    public async Task<DailyDietPageDto> CopyDailyDietAsync(int memberId, CopyDailyDietRequest request)
    {
        var hasSource = await _repo.HasFoodRecordsAsync(memberId, request.SourceDate);
        if (!hasSource)
            throw new ArgumentException("來源日期沒有飲食紀錄");

        var hasTarget = await _repo.HasFoodRecordsAsync(memberId, request.TargetDate);
        if (hasTarget && !request.OverwriteTargetDate)
            throw new ConflictException("目標日期已有飲食紀錄");

        await _repo.CopyFoodRecordsAsync(memberId, request.SourceDate, request.TargetDate, request.OverwriteTargetDate);

        return await GetDailyDietPageAsync(memberId, request.TargetDate);
    }

    public async Task<int> UpdateWaterLogAsync(int memberId, UpdateWaterLogRequest request)
    {
        await _repo.UpsertWaterLogAsync(memberId, request);
        return await _repo.GetWaterAmountAsync(memberId, request.LogDate);
    }

    // ── helpers ────────────────────────────────────────────────────
    private async Task<DailyNutritionSummaryDto> BuildSummaryAsync(
        int memberId, IReadOnlyList<FoodRecordDto> records)
    {
        var goal = await _goalRepo.GetMemberGoalAsync(memberId);

        decimal targetCal     = goal?.TotalCalories ?? 0;
        decimal targetProtein = goal?.Protein ?? 0;
        decimal targetCarbs   = goal?.Carbs ?? 0;
        decimal targetFat     = goal?.Fat ?? 0;
        int targetWater       = goal?.Water ?? 0;

        decimal consumedCal     = records.Sum(r => r.Calories);
        decimal consumedProtein = records.Sum(r => r.Protein);
        decimal consumedCarbs   = records.Sum(r => r.Carbs);
        decimal consumedFat     = records.Sum(r => r.Fat);

        return new DailyNutritionSummaryDto
        {
            TargetCalories    = targetCal,
            ConsumedCalories  = consumedCal,
            RemainingCalories = targetCal - consumedCal,

            TargetProtein    = targetProtein,
            ConsumedProtein  = consumedProtein,
            RemainingProtein = targetProtein - consumedProtein,

            TargetCarbs    = targetCarbs,
            ConsumedCarbs  = consumedCarbs,
            RemainingCarbs = targetCarbs - consumedCarbs,

            TargetFat    = targetFat,
            ConsumedFat  = consumedFat,
            RemainingFat = targetFat - consumedFat,

            TargetWater = targetWater,
        };
    }
}
