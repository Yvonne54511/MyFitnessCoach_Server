using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.Repositories;

namespace MyFitnessCoach_Server.Models.Services;

public class DietPrerequisiteService : IDietPrerequisiteService
{
    private readonly IGoalRepository _goalRepo;

    public DietPrerequisiteService(IGoalRepository goalRepo) => _goalRepo = goalRepo;

    public async Task<DietPrerequisiteStatusDto> CheckAsync(int memberId)
    {
        var member = await _goalRepo.GetMemberAsync(memberId);
        var goal   = await _goalRepo.GetMemberGoalAsync(memberId);

        var hasPersonalInfo   = member is not null && member.Gender.HasValue && member.DateOfBirth.HasValue;
        var hasGoalBasicInfo  = member is not null && member.Height.HasValue && !string.IsNullOrEmpty(member.ActivityLevel);
        var hasNutritionGoals = goal is not null;

        var missingCodes = new List<string>();
        var messages     = new List<string>();

        if (!hasPersonalInfo)
        {
            missingCodes.Add("MISSING_PERSONAL_INFO");
            messages.Add("請先至「個人資料」頁完成性別與生日設定");
        }

        if (!hasGoalBasicInfo)
        {
            missingCodes.Add("MISSING_GOAL_BASIC_INFO");
            messages.Add("請先至「目標設定」頁填寫身高與活動量");
        }

        if (!hasNutritionGoals)
        {
            missingCodes.Add("MISSING_NUTRITION_GOALS");
            messages.Add("請先至「目標設定」頁設定每日營養目標");
        }

        return new DietPrerequisiteStatusDto
        {
            CanUseDailyDiet   = hasPersonalInfo && hasGoalBasicInfo && hasNutritionGoals,
            HasPersonalInfo   = hasPersonalInfo,
            HasGoalBasicInfo  = hasGoalBasicInfo,
            HasNutritionGoals = hasNutritionGoals,
            MissingCodes      = [.. missingCodes],
            Messages          = [.. messages],
        };
    }
}
