using Microsoft.EntityFrameworkCore;

namespace MyFitnessCoach_Server.Models.EfModels;

public partial class MyFitnessCoachDbContext
{
    public virtual DbSet<UserPasswordHistory> UserPasswordHistories { get; set; }
    public virtual DbSet<RateLimitLog> RateLimitLogs { get; set; }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<User>(entity =>
        {
            entity.Property(e => e.IsResetPasswordConfirmCodeUsed);
        });

        modelBuilder.Entity<UserPasswordHistory>(entity =>
        {
            entity.ToTable("UserPasswordHistories");
            entity.Property(e => e.HashedPassword).IsRequired().HasMaxLength(256);
            entity.Property(e => e.CreatedAt).HasPrecision(0);
            entity.HasOne(d => d.User)
                .WithMany(p => p.UserPasswordHistories)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_UserPasswordHistories_Users");
        });

        modelBuilder.Entity<RateLimitLog>(entity =>
        {
            entity.ToTable("RateLimitLogs");
            entity.Property(e => e.IpAddress).IsRequired().HasMaxLength(45).IsUnicode(false);
            entity.Property(e => e.EndPoint).IsRequired().HasMaxLength(200);
            entity.Property(e => e.Identity).HasMaxLength(100);
            entity.Property(e => e.RequestedAt)
                .HasPrecision(0)
                .HasDefaultValueSql("(getdate())")
                .HasAnnotation("Relational:DefaultConstraintName", "DF_RateLimitLogs_RequestedAt");
        });
    }
}
