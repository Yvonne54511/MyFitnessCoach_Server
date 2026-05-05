namespace MyFitnessCoach_Server.Models.DTOs;

public class FoodDto
{
    public int Id { get; set; }
    public int? MemberId { get; set; }
    public int? CategoryId { get; set; }
    public string? CategoryName { get; set; }
    public string FoodName { get; set; } = "";
    public bool IsCustom { get; set; }
    public List<ServingSizeDto> ServingSizes { get; set; } = new();
}
