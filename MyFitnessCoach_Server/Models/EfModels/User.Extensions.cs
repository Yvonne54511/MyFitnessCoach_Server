namespace MyFitnessCoach_Server.Models.EfModels;

public partial class User
{
    public bool? IsResetPasswordConfirmCodeUsed { get; set; }
    public virtual ICollection<UserPasswordHistory> UserPasswordHistories { get; set; } = new List<UserPasswordHistory>();
}
