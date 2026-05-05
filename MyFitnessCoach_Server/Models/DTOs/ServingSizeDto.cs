namespace MyFitnessCoach_Server.Models.DTOs;

public class ServingSizeDto
{
    public int Id { get; set; }
    public string Measure { get; set; } = "";
    public decimal BaseAmount { get; set; }
    public int WeightInGrams { get; set; }
    public decimal Kcal { get; set; }
    public decimal ProteinGram { get; set; }
    public decimal CarbGram { get; set; }
    public decimal FatGram { get; set; }
}
