using System.ComponentModel.DataAnnotations;

namespace MyFitnessCoach_Server.Models.DTOs;

public class BasicInfoDto
{
    [Required]
    [Range(100, 250)]
    public double Height { get; set; }

    [Range(20, 300)]
    public double? TargetWeight { get; set; }

    [Required]
    public DateOnly DateOfBirth { get; set; }

    [Required]
    [RegularExpression("^[MF]$")]
    public string Gender { get; set; } = string.Empty;

    [Required]
    [RegularExpression(@"^(1\.2|1\.375|1\.55|1\.725|1\.9)$")]
    public string ActivityLevel { get; set; } = string.Empty;

    [Required]
    [StringLength(20)]
    public string HealthGoal { get; set; } = string.Empty;
}

public class TargetCaloriesDto
{
    [Range(0, 10000)]
    public int TotalCalories { get; set; }

    [Range(0, 1000)]
    public int Protein { get; set; }

    [Range(0, 1000)]
    public int Carbs { get; set; }

    [Range(0, 1000)]
    public int Fat { get; set; }

    [Range(0, 10000)]
    public int Water { get; set; }
}

public class GoalPageResponseDto
{
    public BasicInfoDto? Info { get; set; }
    public TargetCaloriesDto? Goals { get; set; }
}
