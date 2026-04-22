using Microsoft.EntityFrameworkCore;

namespace MyFitnessCoach_Server.Models.EfModels;

public partial class MyFitnessCoachDbContext
{
    public virtual DbSet<RateLimitLog> RateLimitLogs { get; set; }

    public virtual DbSet<UserPasswordHistory> UserPasswordHistories { get; set; }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<RateLimitLog>(entity =>
        {
            entity.ToTable("RateLimitLogs");

            entity.Property(e => e.EndPoint)
                .IsRequired()
                .HasMaxLength(100);

            entity.Property(e => e.Identity)
                .HasMaxLength(256);

            entity.Property(e => e.IpAddress)
                .HasMaxLength(45);
        });

        modelBuilder.Entity<UserPasswordHistory>(entity =>
        {
            entity.ToTable("UserPasswordHistories");

            entity.Property(e => e.HashedPassword)
                .IsRequired()
                .HasMaxLength(500);

            entity.Property(e => e.CreatedAt).HasPrecision(0);

            entity.HasOne(d => d.User)
                .WithMany()
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_UserPasswordHistories_Users");
        });
    }
}
