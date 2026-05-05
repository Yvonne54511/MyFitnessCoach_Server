using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Models.Repositories;

public interface IHealthReportRepository
{
    Task<IReadOnlyList<BodyMetricRaw>> GetBodySeriesAsync(int memberId, DateOnly fromDate, DateOnly toDate);
    Task<IReadOnlyList<NutritionDayRaw>> GetNutritionSeriesAsync(int memberId, DateOnly fromDate, DateOnly toDate);
    Task<IReadOnlyList<WaterDayRaw>> GetWaterSeriesAsync(int memberId, DateOnly fromDate, DateOnly toDate);
    Task<Member?> GetMemberAsync(int memberId);
    Task<MemberGoal?> GetMemberGoalAsync(int memberId);
}

public sealed class BodyMetricRaw
{
    public DateOnly Date { get; set; }
    public double Weight { get; set; }
    public decimal? BodyFat { get; set; }
    public decimal? SkeletalMuscle { get; set; }
    public decimal? WaistCircumference { get; set; }
    public decimal? HipCircumference { get; set; }
}

public sealed class NutritionDayRaw
{
    public DateOnly Date { get; set; }
    public decimal Calories { get; set; }
    public decimal Protein { get; set; }
    public decimal Carbs { get; set; }
    public decimal Fat { get; set; }
}

public sealed class WaterDayRaw
{
    public DateOnly Date { get; set; }
    public int Amount { get; set; }
}
