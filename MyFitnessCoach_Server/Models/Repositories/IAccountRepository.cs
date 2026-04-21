using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Models.Repositories;

public interface IAccountRepository
{
    // Login
    Task<User?> GetByAccountAsync(string account);
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

    // Rate limit
    Task<int> CountRateLimitAsync(string identifier, string endPoint, bool byIp, DateTime since);
    Task<DateTime?> GetLatestRateLimitTimeAsync(string identity, string endPoint, DateTime since);
    Task<DateTime?> GetOldestRateLimitTimeAsync(string ipAddress, string endPoint, DateTime since);
    Task LogRateLimitAsync(RateLimitLog log);
}
