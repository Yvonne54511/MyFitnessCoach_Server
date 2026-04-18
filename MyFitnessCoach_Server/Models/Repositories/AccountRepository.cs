using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Models.Repositories;

public class AccountRepository : IAccountRepository
{
    private readonly MyFitnessCoachDbContext _db;

    public AccountRepository(MyFitnessCoachDbContext db) => _db = db;

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
}
