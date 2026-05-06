using System.ComponentModel.DataAnnotations;

namespace MyFitnessCoach_Server.Models.DTOs;

public class AddFavoriteFoodDto
{
    [Range(1, int.MaxValue)]
    public int FoodId { get; set; }
}
