using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Repositories;

namespace MyFitnessCoach_Server.Models.Services
{
	public class InstructorService
	{
		private readonly IInstructorRepository _repository;

		public InstructorService(IInstructorRepository repository)
		{
			_repository = repository;
		}

		public async Task<IEnumerable<InstructorDto>> GetInstructorsAsync(string? name = null, int? year = null, int? month = null)
		{
			var instructorsQuery = await _repository.GetAllQueryableAsync(year, month);

			if (!string.IsNullOrEmpty(name))
			{
				instructorsQuery = instructorsQuery.Where(i => i.UserName.Contains(name));
			}

			return instructorsQuery.ToList();
		}

		public async Task<InstructorDto?> GetInstructorByIdAsync(int id)
		{
			return await _repository.GetByIdAsync(id);
		}

		public async Task<IEnumerable<AvailabilityDto>> GetAvailabilityAsync(int instructorId)
		{
			// 呼叫 Repository 取得特定營養師的排班與預約狀態
			return await _repository.GetAvailabilityByInstructorIdAsync(instructorId);
		}
	}
}
