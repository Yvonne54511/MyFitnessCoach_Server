namespace MyFitnessCoach_Server.Models.DTOs;

public sealed class HealthReportResponse
{
    public HealthReportRange Range { get; set; } = new();
    public HealthReportSummary Summary { get; set; } = new();
    public HealthReportTrends Trends { get; set; } = new();
    public HealthReportSeries Series { get; set; } = new();
    public List<AdvicePreviewItem> AdvicePreview { get; set; } = [];
}

public sealed class HealthReportRange
{
    public DateOnly FromDate { get; set; }
    public DateOnly ToDate { get; set; }
    public int RangeDays { get; set; }
    public bool IsPreset { get; set; }
}

public sealed class HealthReportSummary
{
    public double? LatestWeight { get; set; }
    public double? WeightChange { get; set; }
    public decimal? LatestBodyFat { get; set; }
    public decimal? BodyFatChange { get; set; }
    public decimal? LatestSkeletalMuscle { get; set; }
    public decimal? SkeletalMuscleChange { get; set; }
    public double? LatestBmi { get; set; }
    public double? TargetWeight { get; set; }
    public decimal? AvgCalories { get; set; }
    public decimal? AvgProtein { get; set; }
    public decimal? AvgCarbs { get; set; }
    public decimal? AvgFat { get; set; }
    public double? AvgWater { get; set; }
    public int RecordedBodyDays { get; set; }
    public int RecordedDietDays { get; set; }
}

public sealed class HealthReportTrends
{
    public double? WeightSlope { get; set; }
    public double? BodyFatSlope { get; set; }
    public double? SkeletalMuscleSlope { get; set; }
    public double? CalorieSlope { get; set; }
    public double? ProteinSlope { get; set; }
    public string WeightDirection { get; set; } = "unknown";
    public string BodyFatDirection { get; set; } = "unknown";
    public string SkeletalMuscleDirection { get; set; } = "unknown";
    public string CalorieDirection { get; set; } = "unknown";
    public string ProteinDirection { get; set; } = "unknown";
}

public sealed class HealthReportSeries
{
    public List<BodyMetricPoint> Body { get; set; } = [];
    public List<NutritionPoint> Nutrition { get; set; } = [];
}

public sealed class BodyMetricPoint
{
    public DateOnly Date { get; set; }
    public double? Weight { get; set; }
    public decimal? BodyFat { get; set; }
    public decimal? SkeletalMuscle { get; set; }
    public decimal? WaistCircumference { get; set; }
    public decimal? HipCircumference { get; set; }
    public double? Bmi { get; set; }
}

public sealed class NutritionPoint
{
    public DateOnly Date { get; set; }
    public decimal? Calories { get; set; }
    public decimal? Protein { get; set; }
    public decimal? Carbs { get; set; }
    public decimal? Fat { get; set; }
    public int? Water { get; set; }
    public int TargetCalories { get; set; }
    public int TargetProtein { get; set; }
    public int TargetCarbs { get; set; }
    public int TargetFat { get; set; }
    public int TargetWater { get; set; }
}

public sealed record AdvicePreviewItem(string Category, string Severity, string Message);
