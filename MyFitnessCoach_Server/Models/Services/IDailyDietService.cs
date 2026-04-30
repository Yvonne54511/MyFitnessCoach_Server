using MyFitnessCoach_Server.Models.DTOs;

namespace MyFitnessCoach_Server.Models.Services;

public interface IDailyDietService
{
    Task<DailyDietPageDto> GetDailyDietPageAsync(int memberId, DateOnly eatDate);
    Task<FoodRecordDto> CreateFoodRecordAsync(int memberId, CreateFoodRecordRequest request);
    Task<FoodRecordDto?> UpdateFoodRecordAsync(int memberId, int id, UpdateFoodRecordRequest request);
    Task<bool> DeleteFoodRecordAsync(int memberId, int id);
    Task<DailyDietPageDto> CopyDailyDietAsync(int memberId, CopyDailyDietRequest request);
}
