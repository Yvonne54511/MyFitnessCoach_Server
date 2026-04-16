using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Models.Repositories;

public interface IAccountRepository
{
    Task<User?> GetByAccountAsync(string account);
    Task<Instructor?> GetInstructorByUserIdAsync(int userId);
    Task<Employee?> GetEmployeeByUserIdAsync(int userId);
}
