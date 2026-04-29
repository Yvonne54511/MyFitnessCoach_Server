using System;

namespace MyFitnessCoach_Server.Models.EfModels;

public partial class MemberGoal
{
    public int Id { get; set; }

    public int MemberId { get; set; }

    public int TotalCalories { get; set; }

    public int Protein { get; set; }

    public int Carbs { get; set; }

    public int Fat { get; set; }

    public int Water { get; set; }

    public DateTime UpdatedAt { get; set; }

    public virtual Member Member { get; set; }
}
