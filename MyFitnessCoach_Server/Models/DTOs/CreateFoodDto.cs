using System.ComponentModel.DataAnnotations;

namespace MyFitnessCoach_Server.Models.DTOs;

public class CreateFoodDto
{
    [Range(1, int.MaxValue)]
    public int CategoryId { get; set; }

    [Required]
    [MaxLength(100)]
    public string FoodName { get; set; } = "";

    [Required]
    [MinLength(1, ErrorMessage = "至少需要一筆份量資料")]
    public List<CreateServingSizeDto> ServingSizes { get; set; } = new();
}
