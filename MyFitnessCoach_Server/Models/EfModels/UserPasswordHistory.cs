#nullable disable
using System;

namespace MyFitnessCoach_Server.Models.EfModels;

public partial class UserPasswordHistory
{
    public int Id { get; set; }

    public int UserId { get; set; }

    public string HashedPassword { get; set; }

    public DateTime CreatedAt { get; set; }

    public virtual User User { get; set; }
}
