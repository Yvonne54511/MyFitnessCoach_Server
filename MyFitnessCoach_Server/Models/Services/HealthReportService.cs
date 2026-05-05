 






using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.Repositories;

namespace MyFitnessCoach_Server.Models.Services;

public sealed class HealthReportService : IHealthReportService
{
    private static readonly int[] PresetRangeDays = [7, 14, 30, 90, 180, 365];

    private readonly IHealthReportRepository _repo;
    private readonly HealthReportTrendCalculator _calc;

    public HealthReportService(IHealthReportRepository repo, HealthReportTrendCalculator calc)
    {
        _repo = repo;
        _calc = calc;
    }

    public async Task<HealthReportResponse> GetReportAsync(
        int memberId, DateOnly fromDate, DateOnly toDate)
    {
        // Sequential queries — DbContext is not thread-safe
        var member    = await _repo.GetMemberAsync(memberId);
        var goal      = await _repo.GetMemberGoalAsync(memberId);
        var bodyRaw   = await _repo.GetBodySeriesAsync(memberId, fromDate, toDate);
        var nutRaw    = await _repo.GetNutritionSeriesAsync(memberId, fromDate, toDate);
        var waterRaw  = await _repo.GetWaterSeriesAsync(memberId, fromDate, toDate);

        // BMI helper: height is in cm, convert to metres
        double? heightM = member?.Height is > 0 ? member.Height!.Value / 100.0 : null;
        double? CalcBmi(double weight) => heightM.HasValue
            ? Math.Round(weight / (heightM.Value * heightM.Value), 1)
            : null;

        // ── Body series (sparse: only days with records, ascending) ────────
        var bodySeries = bodyRaw.Select(b => new BodyMetricPoint
        {
            Date               = b.Date,
            Weight             = b.Weight,
            BodyFat            = b.BodyFat,
            SkeletalMuscle     = b.SkeletalMuscle,
            WaistCircumference = b.WaistCircumference,
            HipCircumference   = b.HipCircumference,
            Bmi                = CalcBmi(b.Weight),
        }).ToList();

        // ── Nutrition series (sparse: union of food + water dates, ascending) ─
        var nutByDate   = nutRaw.ToDictionary(n => n.Date);
        var waterByDate = waterRaw.ToDictionary(w => w.Date, w => w.Amount);

        var allNutDates = nutRaw.Select(n => n.Date)
            .Union(waterRaw.Select(w => w.Date))
            .OrderBy(d => d)
            .ToList();

        var targetCal     = goal?.TotalCalories ?? 0;
        var targetProtein = goal?.Protein       ?? 0;
        var targetCarbs   = goal?.Carbs         ?? 0;
        var targetFat     = goal?.Fat           ?? 0;
        var targetWater   = goal?.Water         ?? 0;

        var nutritionSeries = allNutDates.Select(date =>
        {
            nutByDate.TryGetValue(date, out var n);
            var hasWater = waterByDate.TryGetValue(date, out var water);
            return new NutritionPoint
            {
                Date           = date,
                Calories       = n?.Calories,
                Protein        = n?.Protein,
                Carbs          = n?.Carbs,
                Fat            = n?.Fat,
                Water          = hasWater ? water : null,
                TargetCalories = targetCal,
                TargetProtein  = targetProtein,
                TargetCarbs    = targetCarbs,
                TargetFat      = targetFat,
                TargetWater    = targetWater,
            };
        }).ToList();

        // ── Summary ─────────────────────────────────────────────────────────
        var latest   = bodySeries.Count > 0 ? bodySeries[^1] : null;
        var earliest = bodySeries.Count > 1 ? bodySeries[0]  : null;

        var calRows = nutritionSeries.Where(n => n.Calories.HasValue).ToList();

        var summary = new HealthReportSummary
        {
            LatestWeight         = latest?.Weight,
            WeightChange         = earliest != null && latest != null
                                     ? Math.Round(latest.Weight!.Value - earliest.Weight!.Value, 2)
                                     : null,
            LatestBodyFat        = latest?.BodyFat,
            BodyFatChange        = earliest?.BodyFat != null && latest?.BodyFat != null
                                     ? latest.BodyFat - earliest.BodyFat : null,
            LatestSkeletalMuscle = latest?.SkeletalMuscle,
            SkeletalMuscleChange = earliest?.SkeletalMuscle != null && latest?.SkeletalMuscle != null
                                     ? latest.SkeletalMuscle - earliest.SkeletalMuscle : null,
            LatestBmi            = latest?.Bmi,
            TargetWeight         = member?.TargetWeight,
            AvgCalories          = calRows.Count > 0 ? calRows.Average(n => n.Calories!.Value) : null,
            AvgProtein           = calRows.Count > 0 ? calRows.Average(n => n.Protein  ?? 0m) : null,
            AvgCarbs             = calRows.Count > 0 ? calRows.Average(n => n.Carbs    ?? 0m) : null,
            AvgFat               = calRows.Count > 0 ? calRows.Average(n => n.Fat      ?? 0m) : null,
            AvgWater             = waterRaw.Count > 0
                                     ? Math.Round(waterRaw.Average(w => (double)w.Amount), 1)
                                     : null,
            RecordedBodyDays     = bodySeries.Count,
            RecordedDietDays     = allNutDates.Count,
        };

        // ── Trends (linear regression per indicator) ─────────────────────────
        int DayOffset(DateOnly d) => d.DayNumber - fromDate.DayNumber;

        var wPoints  = bodySeries
            .Select(b => (DayOffset(b.Date), b.Weight!.Value)).ToList();
        var bfPoints = bodySeries
            .Where(b => b.BodyFat.HasValue)
            .Select(b => (DayOffset(b.Date), (double)b.BodyFat!.Value)).ToList();
        var smPoints = bodySeries
            .Where(b => b.SkeletalMuscle.HasValue)
            .Select(b => (DayOffset(b.Date), (double)b.SkeletalMuscle!.Value)).ToList();
        var calPoints = calRows
            .Select(n => (DayOffset(n.Date), (double)n.Calories!.Value)).ToList();
        var proPoints = calRows
            .Where(n => n.Protein.HasValue)
            .Select(n => (DayOffset(n.Date), (double)n.Protein!.Value)).ToList();

        var wTrend   = _calc.Calculate(wPoints,   epsilon: 0.01);
        var bfTrend  = _calc.Calculate(bfPoints,  epsilon: 0.005);
        var smTrend  = _calc.Calculate(smPoints,  epsilon: 0.005);
        var calTrend = _calc.Calculate(calPoints, epsilon: 5.0);
        var proTrend = _calc.Calculate(proPoints, epsilon: 0.5);

        var trends = new HealthReportTrends
        {
            WeightSlope             = wTrend.Slope,
            BodyFatSlope            = bfTrend.Slope,
            SkeletalMuscleSlope     = smTrend.Slope,
            CalorieSlope            = calTrend.Slope,
            ProteinSlope            = proTrend.Slope,
            WeightDirection         = wTrend.Direction,
            BodyFatDirection        = bfTrend.Direction,
            SkeletalMuscleDirection = smTrend.Direction,
            CalorieDirection        = calTrend.Direction,
            ProteinDirection        = proTrend.Direction,
        };

        var rangeDays = toDate.DayNumber - fromDate.DayNumber + 1;

        return new HealthReportResponse
        {
            Range = new HealthReportRange
            {
                FromDate  = fromDate,
                ToDate    = toDate,
                RangeDays = rangeDays,
                IsPreset  = PresetRangeDays.Contains(rangeDays),
            },
            Summary       = summary,
            Trends        = trends,
            Series        = new HealthReportSeries { Body = bodySeries, Nutrition = nutritionSeries },
            AdvicePreview = [],
        };
    }
}
