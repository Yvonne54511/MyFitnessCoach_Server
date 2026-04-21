#nullable disable
namespace MyFitnessCoach_Server.Models.EfModels;

public class UserPasswordHistory
{
    public int Id { get; set; }
    public int UserId { get; set; }
    public string HashedPassword { get; set; }
    public DateTime CreatedAt { get; set; }
    public virtual User User { get; set; }
}
