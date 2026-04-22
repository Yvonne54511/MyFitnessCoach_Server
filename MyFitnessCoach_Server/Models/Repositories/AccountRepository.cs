using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Models.Repositories;

public class AccountRepository : IAccountRepository
{
    private readonly MyFitnessCoachDbContext _db;

    public AccountRepository(MyFitnessCoachDbContext db) => _db = db;

    // ── Login ──────────────────────────────────────────────────────────────

    public async Task<User?> GetByAccountAsync(string account)
    {
        return await _db.Users
            .Include(u => u.UserRoles)
                .ThenInclude(ur => ur.Role)
                    .ThenInclude(r => r.RoleFunctions)
                        .ThenInclude(rf => rf.Function)
            .AsNoTracking()
            .FirstOrDefaultAsync(u => u.Account == account);
    }

    public async Task<Instructor?> GetInstructorByUserIdAsync(int userId)
    {
        return await _db.Instructors
            .AsNoTracking()
            .FirstOrDefaultAsync(i => i.UserId == userId);
    }

    public async Task<Employee?> GetEmployeeByUserIdAsync(int userId)
    {
        return await _db.Employees
            .AsNoTracking()
            .FirstOrDefaultAsync(e => e.UserId == userId);
    }

    public async Task<Member?> GetMemberByUserIdAsync(int userId)
    {
        return await _db.Members
            .AsNoTracking()
            .FirstOrDefaultAsync(m => m.UserId == userId);
    }

    // ── Forgot / Reset password ────────────────────────────────────────────

    public async Task<User?> GetByEmailAsync(string email)
    {
        return await _db.Users
            .AsNoTracking()
            .FirstOrDefaultAsync(u => u.Email == email);
    }

    public async Task<User?> GetByResetCodeHashAsync(string hash)
    {
        return await _db.Users
            .AsNoTracking()
            .FirstOrDefaultAsync(u => u.ResetPasswordConfirmCode == hash);
    }

    public async Task UpdateResetTokenAsync(int userId, string hash, DateTime expiry)
    {
        await _db.Users
            .Where(u => u.Id == userId)
            .ExecuteUpdateAsync(s => s
                .SetProperty(u => u.ResetPasswordConfirmCode, hash)
                .SetProperty(u => u.ResetPasswordConfirmCodeExpiry, expiry)
                .SetProperty(u => u.IsResetPasswordConfirmCodeUsed, false));
    }

    // 原子 UPDATE：只有在 token 未使用且未過期時才標記為已使用，回傳影響筆數
    public async Task<int> MarkResetTokenUsedAsync(string hash, DateTime now)
    {
        return await _db.Users
            .Where(u => u.ResetPasswordConfirmCode == hash
                     && u.IsResetPasswordConfirmCodeUsed != true
                     && u.ResetPasswordConfirmCodeExpiry > now)
            .ExecuteUpdateAsync(s => s
                .SetProperty(u => u.IsResetPasswordConfirmCodeUsed, true));
    }

    public async Task UpdatePasswordAsync(int userId, string newHashedPassword)
    {
        await _db.Users
            .Where(u => u.Id == userId)
            .ExecuteUpdateAsync(s => s
                .SetProperty(u => u.HashedPassword, newHashedPassword));
    }

    // ── Password history ───────────────────────────────────────────────────


    public async Task<List<UserPasswordHistory>> GetPasswordHistoryAsync(int userId, int count)
    {
        return await _db.UserPasswordHistories
            .Where(h => h.UserId == userId)
            .OrderByDescending(h => h.CreatedAt)
            .Take(count)
            .AsNoTracking()
            .ToListAsync();
    }

    public async Task AddPasswordHistoryAsync(UserPasswordHistory history)
    {
        _db.UserPasswordHistories.Add(history);
        await _db.SaveChangesAsync();
    }

    // ── Rate limit ─────────────────────────────────────────────────────────

    public async Task<int> CountRateLimitAsync(string identifier, string endPoint, bool byIp, DateTime since)
    {
        var query = _db.RateLimitLogs
            .Where(r => r.EndPoint == endPoint && r.RequestedAt >= since);

        query = byIp
            ? query.Where(r => r.IpAddress == identifier)
            : query.Where(r => r.Identity   == identifier);

        return await query.CountAsync();
    }

    public async Task<DateTime?> GetLatestRateLimitTimeAsync(string identity, string endPoint, DateTime since)
    {
        return await _db.RateLimitLogs
            .Where(r => r.Identity == identity && r.EndPoint == endPoint && r.RequestedAt >= since)
            .OrderByDescending(r => r.RequestedAt)
            .Select(r => (DateTime?)r.RequestedAt)
            .FirstOrDefaultAsync();
    }

    public async Task<DateTime?> GetOldestRateLimitTimeAsync(string ipAddress, string endPoint, DateTime since)
    {
        return await _db.RateLimitLogs
            .Where(r => r.IpAddress == ipAddress && r.EndPoint == endPoint && r.RequestedAt >= since)
            .OrderBy(r => r.RequestedAt)
            .Select(r => (DateTime?)r.RequestedAt)
            .FirstOrDefaultAsync();
    }

    public async Task LogRateLimitAsync(RateLimitLog log)
    {
        _db.RateLimitLogs.Add(log);
        await _db.SaveChangesAsync();
    }
}
