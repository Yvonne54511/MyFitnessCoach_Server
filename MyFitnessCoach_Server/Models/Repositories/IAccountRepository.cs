using Microsoft.EntityFrameworkCore.Storage;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Models.Repositories;

public interface IAccountRepository
{
    // Transaction
    Task<IDbContextTransaction> BeginTransactionAsync();


    // Login
    Task<User?> GetByAccountAsync(string account);
    Task<User?> GetByIdAsync(int userId);
    Task<Instructor?> GetInstructorByUserIdAsync(int userId);
    Task<Employee?> GetEmployeeByUserIdAsync(int userId);
    Task<Member?> GetMemberByUserIdAsync(int userId);

    // Forgot / Reset password
    Task<User?> GetByEmailAsync(string email);
    Task<User?> GetByResetCodeHashAsync(string hash);
    Task UpdateResetTokenAsync(int userId, string hash, DateTime expiry);
    Task<int> MarkResetTokenUsedAsync(string hash, DateTime now);
    Task UpdatePasswordAsync(int userId, string newHashedPassword);

    // Password history
    Task<List<UserPasswordHistory>> GetPasswordHistoryAsync(int userId, int count);
    Task AddPasswordHistoryAsync(UserPasswordHistory history);
    Task<int> CountPasswordChangesInPeriodAsync(int userId, DateTime since);

    // Register / Activate
    Task CreateMemberAsync(Member member);
    Task<bool> AccountOrEmailExistsAsync(string account, string email);
    Task<bool> MobileExistsAsync(string mobile);
    Task CreateUserAsync(User user);

    // PersonalInfo
    Task<User?> GetUserWithMemberAsync(int userId);
    Task<bool> EmailExistsExceptUserAsync(string email, int userId);
    Task<bool> MobileExistsExceptUserAsync(string mobile, int userId);
    Task UpdatePersonalInfoAsync(int userId, int memberId, UpdatePersonalInfoRequest request);
    Task UpdateMemberImageAsync(int memberId, string imageUrl);
    Task<User?> GetByActivationCodeHashAsync(string hash);
    Task ActivateUserAsync(int userId);
    Task ActivateAndEnsureMemberAsync(int userId);
    Task EnsureMemberAsync(int userId);
    Task UpdateActivationTokenAsync(int userId, string hash, DateTime expiry);
    Task<User?> GetPendingUserByEmailAsync(string email);

    // Rate limit
    Task<int> CountRateLimitAsync(string identifier, string endPoint, bool byIp, DateTime since);
    Task<DateTime?> GetLatestRateLimitTimeAsync(string identity, string endPoint, DateTime since);
    Task<DateTime?> GetOldestRateLimitTimeAsync(string ipAddress, string endPoint, DateTime since);
    Task LogRateLimitAsync(RateLimitLog log);
}
