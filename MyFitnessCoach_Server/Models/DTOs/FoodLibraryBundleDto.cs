namespace MyFitnessCoach_Server.Models.DTOs;

public class FoodLibraryBundleDto
{
    public List<FoodDto> SystemFoods { get; set; } = new();
    public List<FoodDto> CustomFoods { get; set; } = new();
    public List<int> FavoriteFoodIds { get; set; } = new();
    public List<FoodCategoryDto> Categories { get; set; } = new();
    public long Version { get; set; }
}
