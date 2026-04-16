using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Repositories;
using Microsoft.EntityFrameworkCore;

namespace MyFitnessCoach_Server.Models.Services
{
	public class InstructorService
	{
		private readonly IInstructorRepository _repository;

		public InstructorService(IInstructorRepository repository)
		{
			_repository = repository;
		}

		public async Task<IEnumerable<InstructorDto>> GetInstructorsAsync(string? name = null)
		{
			var query = await _repository.GetAllQueryableAsync();

			if (!string.IsNullOrEmpty(name))
			{
				query = query.Where(i => i.UserName.Contains(name));
			}

			return await query.ToListAsync();
		}

		public async Task<InstructorDto?> GetInstructorByIdAsync(int id)
		{
			return await _repository.GetByIdAsync(id);
		}
	}
}
