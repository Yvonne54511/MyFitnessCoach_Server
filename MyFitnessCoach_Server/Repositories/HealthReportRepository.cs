using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.Repositories;

namespace MyFitnessCoach_Server.Repositories;

public class HealthReportRepository : IHealthReportRepository
{
    private readonly MyFitnessCoachDbContext _db;

    public HealthReportRepository(MyFitnessCoachDbContext db) => _db = db;

    public async Task<IReadOnlyList<BodyMetricRaw>> GetBodySeriesAsync(
        int memberId, DateOnly fromDate, DateOnly toDate)
    {
        var start = fromDate.ToDateTime(TimeOnly.MinValue);
        var end   = toDate.ToDateTime(TimeOnly.MinValue).AddDays(1);

        return await _db.BodyRecords
            .Where(b => b.MemberId == memberId && b.CreateAt >= start && b.CreateAt < end)
            .OrderBy(b => b.CreateAt)
            .Select(b => new BodyMetricRaw
            {
                Date               = DateOnly.FromDateTime(b.CreateAt),
                Weight             = b.Weight,
                BodyFat            = b.BodyFat,
                SkeletalMuscle     = b.SkeletalMuscle,
                WaistCircumference = b.WaistCircumference,
                HipCircumference   = b.HipCircumference,
            })
            .ToListAsync();
    }

    public async Task<IReadOnlyList<NutritionDayRaw>> GetNutritionSeriesAsync(
        int memberId, DateOnly fromDate, DateOnly toDate)
    {
        var projected = from d in _db.DailyDiets
                        join f in _db.Foods on d.FoodId equals f.Id
                        join n in _db.NutrientReferenceValues
                            on new { FoodId = d.FoodId!.Value, Measure = d.Measure! }
                            equals new { n.FoodId, n.Measure }
                        where d.MemberId == memberId
                           && d.FoodId  != null
                           && d.Measure != null
                           && d.EatDT   != null
                           && d.EatDT   >= fromDate
                           && d.EatDT   <= toDate
                        select new
                        {
                            Date    = d.EatDT!.Value,
                            Cal     = (d.Amount!.Value / n.BaseAmount) * (n.Kcal         ?? 0m),
                            Protein = (d.Amount!.Value / n.BaseAmount) * (n.ProteinGram  ?? 0m),
                            Carbs   = (d.Amount!.Value / n.BaseAmount) * (n.CarbGram     ?? 0m),
                            Fat     = (d.Amount!.Value / n.BaseAmount) * (n.FatGram      ?? 0m),
                        };

        return await projected
            .GroupBy(x => x.Date)
            .Select(g => new NutritionDayRaw
            {
                Date     = g.Key,
                Calories = g.Sum(x => x.Cal),
                Protein  = g.Sum(x => x.Protein),
                Carbs    = g.Sum(x => x.Carbs),
                Fat      = g.Sum(x => x.Fat),
            })
            .OrderBy(x => x.Date)
            .ToListAsync();
    }

    public async Task<IReadOnlyList<WaterDayRaw>> GetWaterSeriesAsync(
        int memberId, DateOnly fromDate, DateOnly toDate)
    {
        return await _db.WaterLogs
            .Where(w => w.MemberId == memberId && w.LogDate >= fromDate && w.LogDate <= toDate)
            .GroupBy(w => w.LogDate)
            .Select(g => new WaterDayRaw { Date = g.Key, Amount = g.Sum(w => w.Amount) })
            .OrderBy(x => x.Date)
            .ToListAsync();
    }

    public async Task<Member?> GetMemberAsync(int memberId)
        => await _db.Members.FirstOrDefaultAsync(m => m.Id == memberId);

    public async Task<MemberGoal?> GetMemberGoalAsync(int memberId)
        => await _db.MemberGoals.FirstOrDefaultAsync(g => g.MemberId == memberId);
}
