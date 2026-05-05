using MyFitnessCoach_Server.Models.DTOs;

namespace MyFitnessCoach_Server.Models.Repositories;

public interface IBodyRecordRepository
{
    Task<IReadOnlyList<BodyRecordDto>> GetRecordsAsync(int memberId, DateOnly? fromDate, DateOnly? toDate, int take);
    Task<BodyRecordDto?> GetByIdAsync(int memberId, int id);
    Task<BodyRecordDto?> GetByDateAsync(int memberId, DateOnly date);
    Task<int> CreateAsync(int memberId, CreateBodyRecordRequest request, string? imageUrl);
    Task<bool> UpdateAsync(int memberId, int id, UpdateBodyRecordRequest request, string? imageUrl);
    Task<bool> DeleteAsync(int memberId, int id);
    Task<string?> GetImageUrlAsync(int memberId, int id);
}
