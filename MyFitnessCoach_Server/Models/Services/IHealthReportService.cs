using MyFitnessCoach_Server.Models.DTOs;

namespace MyFitnessCoach_Server.Models.Services;

public interface IHealthReportService
{
    Task<HealthReportResponse> GetReportAsync(int memberId, DateOnly fromDate, DateOnly toDate);
}
