using MyFitnessCoach_Server.Models.DTOs;

namespace MyFitnessCoach_Server.Models.Services;

public interface IBodyRecordService
{
    Task<IReadOnlyList<BodyRecordDto>> GetRecordsAsync(int memberId, DateOnly? fromDate, DateOnly? toDate, int take);
    Task<BodyRecordDto?> GetByIdAsync(int memberId, int id);
    Task<BodyRecordDto> CreateAsync(int memberId, CreateBodyRecordRequest request);
    Task<BodyRecordDto?> UpdateAsync(int memberId, int id, UpdateBodyRecordRequest request);
    Task<bool> DeleteAsync(int memberId, int id);
}
