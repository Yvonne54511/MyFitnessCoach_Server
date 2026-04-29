using Microsoft.EntityFrameworkCore;

namespace MyFitnessCoach_Server.Models.EfModels;

public partial class MyFitnessCoachDbContext
{
    public virtual DbSet<MemberGoal> MemberGoals { get; set; }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<MemberGoal>(entity =>
        {
            entity.HasIndex(e => e.MemberId, "UX_MemberGoals_MemberId").IsUnique();

            entity.Property(e => e.UpdatedAt)
                .HasPrecision(0)
                .HasDefaultValueSql("(getdate())")
                .HasAnnotation("Relational:DefaultConstraintName", "DF_MemberGoals_UpdatedAt");

            entity.HasOne(e => e.Member)
                .WithOne(m => m.MemberGoal)
                .HasForeignKey<MemberGoal>(e => e.MemberId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MemberGoals_Members");
        });
    }
}
