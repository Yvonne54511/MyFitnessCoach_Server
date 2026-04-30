using System.ComponentModel.DataAnnotations;

namespace MyFitnessCoach_Server.Models.DTOs;

public sealed class FoodRecordDto
{
    public int Id { get; set; }
    public int FoodId { get; set; }
    public string FoodName { get; set; } = string.Empty;
    public decimal Amount { get; set; }
    public string Measure { get; set; } = string.Empty;
    public string MealType { get; set; } = string.Empty;
    public decimal Calories { get; set; }
    public decimal Protein { get; set; }
    public decimal Carbs { get; set; }
    public decimal Fat { get; set; }
    public DateOnly EatDT { get; set; }
    public string? Note { get; set; }
}

public sealed class DailyNutritionSummaryDto
{
    public decimal TargetCalories { get; set; }
    public decimal ConsumedCalories { get; set; }
    public decimal RemainingCalories { get; set; }

    public decimal TargetProtein { get; set; }
    public decimal ConsumedProtein { get; set; }
    public decimal RemainingProtein { get; set; }

    public decimal TargetCarbs { get; set; }
    public decimal ConsumedCarbs { get; set; }
    public decimal RemainingCarbs { get; set; }

    public decimal TargetFat { get; set; }
    public decimal ConsumedFat { get; set; }
    public decimal RemainingFat { get; set; }
}

public sealed class DailyDietPageDto
{
    public DateOnly EatDate { get; set; }
    public List<FoodRecordDto> Records { get; set; } = [];
    public DailyNutritionSummaryDto Summary { get; set; } = new();
}

public sealed class CreateFoodRecordRequest
{
    [Required]
    public int FoodId { get; set; }

    [Range(0.01, 999.99)]
    public decimal Amount { get; set; }

    [Required]
    public string Measure { get; set; } = string.Empty;

    [Required]
    public string MealType { get; set; } = string.Empty;

    [Required]
    public DateOnly EatDT { get; set; }

    public string? Note { get; set; }
}

public sealed class UpdateFoodRecordRequest
{
    [Range(0.01, 999.99)]
    public decimal Amount { get; set; }

    [Required]
    public string Measure { get; set; } = string.Empty;

    [Required]
    public string MealType { get; set; } = string.Empty;

    [Required]
    public DateOnly EatDT { get; set; }

    public string? Note { get; set; }
}

public sealed class CopyDailyDietRequest
{
    [Required]
    public DateOnly SourceDate { get; set; }

    [Required]
    public DateOnly TargetDate { get; set; }

    public bool OverwriteTargetDate { get; set; }
}
