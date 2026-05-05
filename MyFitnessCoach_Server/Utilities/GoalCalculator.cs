using MyFitnessCoach_Server.Models.DTOs;

namespace MyFitnessCoach_Server.Utilities;

// Mifflin-St Jeor formula — keep in sync with frontend useGoals.ts
// BMR (M): 10w + 6.25h - 5a + 5
// BMR (F): 10w + 6.25h - 5a - 161
// TDEE: BMR × activityLevel
// Macros: see CalculateMacros
public static class GoalCalculator
{
    public static int CalculateBMR(double weight, double height, int age, string gender)
    {
        var baseVal = 10 * weight + 6.25 * height - 5 * age;
        return (int)Math.Round(gender == "M" ? baseVal + 5 : baseVal - 161);
    }

    public static int CalculateTDEE(int bmr, string activityLevel)
    {
        if (!double.TryParse(activityLevel, System.Globalization.NumberStyles.Float,
                System.Globalization.CultureInfo.InvariantCulture, out var factor))
            return bmr;
        return (int)Math.Round(bmr * factor);
    }

    public static TargetCaloriesDto CalculateMacros(int tdee, double weight, string healthGoal)
    {
        var w = weight > 0 ? weight : 60;
        int calories, protein, carbs, fat;

        switch (healthGoal)
        {
            case "增肌":
                calories = (int)Math.Round((double)tdee + 300);
                protein  = (int)Math.Round(w * 2);
                fat      = (int)Math.Round(calories * 0.25 / 9);
                carbs    = Math.Max(0, (int)Math.Round((calories - protein * 4.0 - fat * 9.0) / 4));
                break;

            case "減脂":
                calories = Math.Max(1200, (int)Math.Round((double)tdee - 500));
                protein  = (int)Math.Round(w * 2);
                fat      = (int)Math.Round(calories * 0.25 / 9);
                carbs    = Math.Max(0, (int)Math.Round((calories - protein * 4.0 - fat * 9.0) / 4));
                break;

            case "生酮飲食":
                calories = tdee;
                fat      = (int)Math.Round(calories * 0.70 / 9);
                protein  = (int)Math.Round(calories * 0.25 / 4);
                carbs    = (int)Math.Round(calories * 0.05 / 4);
                break;

            case "糖尿病控糖":
                calories = tdee;
                carbs    = (int)Math.Round(calories * 0.40 / 4);
                protein  = (int)Math.Round(calories * 0.30 / 4);
                fat      = (int)Math.Round(calories * 0.30 / 9);
                break;

            default: // 健康飲食
                calories = tdee;
                carbs    = (int)Math.Round(calories * 0.50 / 4);
                protein  = (int)Math.Round(calories * 0.20 / 4);
                fat      = (int)Math.Round(calories * 0.30 / 9);
                break;
        }

        return new TargetCaloriesDto
        {
            TotalCalories = calories,
            Protein       = protein,
            Carbs         = carbs,
            Fat           = fat,
            Water         = 2000,
        };
    }

    public static int CalculateAge(DateOnly dateOfBirth)
    {
        var today = DateOnly.FromDateTime(DateTime.Today);
        var age   = today.Year - dateOfBirth.Year;
        if (dateOfBirth.AddYears(age) > today) age--;
        return age;
    }
}
