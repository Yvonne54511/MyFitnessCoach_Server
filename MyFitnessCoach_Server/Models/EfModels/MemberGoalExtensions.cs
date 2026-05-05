// Extends auto-generated Member to add TargetWeight and MemberGoal navigation.
namespace MyFitnessCoach_Server.Models.EfModels;

public partial class Member
{
    public double? TargetWeight { get; set; }

    public virtual MemberGoal? MemberGoal { get; set; }
}
