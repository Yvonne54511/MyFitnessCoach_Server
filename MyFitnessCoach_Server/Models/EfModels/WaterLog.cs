namespace MyFitnessCoach_Server.Models.EfModels;

public partial class WaterLog
{
    public int Id { get; set; }
    public int MemberId { get; set; }
    public DateOnly LogDate { get; set; }
    public int Amount { get; set; }

    public virtual Member Member { get; set; } = null!;
}
