using Microsoft.EntityFrameworkCore;

namespace MyFitnessCoach_Server.Models.EfModels;

public partial class MyFitnessCoachDbContext
{
    public virtual DbSet<MemberGoal> MemberGoals { get; set; }
    public virtual DbSet<DailyDiet> DailyDiets { get; set; }
    public virtual DbSet<WaterLog> WaterLogs { get; set; }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<MemberGoal>(entity =>
        {
            entity.HasKey(e => e.MemberId).HasName("PK_MemberGoals");

            entity.Ignore(e => e.Id);

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

        modelBuilder.Entity<DailyDiet>(entity =>
        {
            entity.HasKey(e => e.Id);

            entity.Property(e => e.Amount).HasColumnType("decimal(10,2)");
            entity.Property(e => e.Measure).HasMaxLength(20);
            entity.Property(e => e.MealType).HasMaxLength(20);
            entity.Property(e => e.Note).HasMaxLength(200);
            entity.Property(e => e.ImageUrl).HasMaxLength(300);

            entity.Property(e => e.CreatedAt)
                .HasPrecision(0)
                .HasDefaultValueSql("(getdate())")
                .HasAnnotation("Relational:DefaultConstraintName", "DF_DailyDiets_CreatedAt");

            entity.HasIndex(e => new { e.MemberId, e.EatDT }, "IX_DailyDiets_MemberId_EatDT");

            entity.HasOne(e => e.Member)
                .WithMany()
                .HasForeignKey(e => e.MemberId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK_DailyDiets_Members");

            entity.HasOne(e => e.Food)
                .WithMany()
                .HasForeignKey(e => e.FoodId)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_DailyDiets_Foods");
        });

        modelBuilder.Entity<WaterLog>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_WaterLogs");

            entity.HasIndex(e => new { e.MemberId, e.LogDate }, "UX_WaterLogs_Member_Date").IsUnique();

            entity.Property(e => e.LogDate).HasColumnType("date");

            entity.HasOne(e => e.Member)
                .WithMany()
                .HasForeignKey(e => e.MemberId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK_WaterLogs_Members");
        });
    }
}
