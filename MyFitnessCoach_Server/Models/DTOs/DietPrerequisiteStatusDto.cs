namespace MyFitnessCoach_Server.Models.DTOs;

public sealed class DietPrerequisiteStatusDto
{
    public bool CanUseDailyDiet   { get; set; }
    public bool HasPersonalInfo   { get; set; }
    public bool HasGoalBasicInfo  { get; set; }
    public bool HasNutritionGoals { get; set; }
    public string[] MissingCodes  { get; set; } = [];
    public string[] Messages      { get; set; } = [];
}
