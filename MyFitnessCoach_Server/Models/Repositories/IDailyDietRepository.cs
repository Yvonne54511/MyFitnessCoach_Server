using MyFitnessCoach_Server.Models.DTOs;

namespace MyFitnessCoach_Server.Models.Repositories;

public interface IDailyDietRepository
{
    Task<IReadOnlyList<FoodRecordDto>> GetDailyFoodRecordsAsync(int memberId, DateOnly eatDate);
    Task<FoodRecordDto?> GetFoodRecordByIdAsync(int memberId, int id);
    Task<int> CreateFoodRecordAsync(int memberId, CreateFoodRecordRequest request);
    Task<bool> UpdateFoodRecordAsync(int memberId, int id, UpdateFoodRecordRequest request);
    Task<bool> DeleteFoodRecordAsync(int memberId, int id);
    Task<bool> HasFoodRecordsAsync(int memberId, DateOnly date);
    Task CopyFoodRecordsAsync(int memberId, DateOnly sourceDate, DateOnly targetDate, bool overwrite);
}
