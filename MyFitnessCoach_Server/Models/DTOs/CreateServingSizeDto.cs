using System.ComponentModel.DataAnnotations;

namespace MyFitnessCoach_Server.Models.DTOs;

public class CreateServingSizeDto
{
    [Required]
    [MaxLength(20)]
    public string Measure { get; set; } = "";

    [Range(0.01, double.MaxValue)]
    public decimal BaseAmount { get; set; }

    [Range(1, int.MaxValue)]
    public int WeightInGrams { get; set; }

    [Range(0, double.MaxValue)]
    public decimal Kcal { get; set; }

    [Range(0, double.MaxValue)]
    public decimal ProteinGram { get; set; }

    [Range(0, double.MaxValue)]
    public decimal CarbGram { get; set; }

    [Range(0, double.MaxValue)]
    public decimal FatGram { get; set; }
}
