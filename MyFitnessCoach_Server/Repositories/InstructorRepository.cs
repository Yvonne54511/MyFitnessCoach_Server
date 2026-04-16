using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Repositories
{
	public interface IInstructorRepository
	{
		Task<IQueryable<InstructorDto>> GetAllQueryableAsync();
		Task<InstructorDto?> GetByIdAsync(int id);
	}
	public class InstructorRepository: IInstructorRepository
	{
		private readonly MyFitnessCoachDbContext _context;

		public InstructorRepository(MyFitnessCoachDbContext context)
		{
			_context = context;
		}
		public async Task<IQueryable<InstructorDto>> GetAllQueryableAsync()
		{
			return _context.Instructors
				.AsNoTracking()
				.Select(i => new InstructorDto
				{
					Id = i.Id,
					UserId = i.UserId,
					UserName = i.User.UserName,
					ImageUrl = i.ImageUrl,
					Title = i.Title,
					Description = i.Description,
					HourWage = i.HourWage,
					IsActive = i.IsActive
				});
		}

		public async Task<InstructorDto?> GetByIdAsync(int id)
		{
			return await _context.Instructors
				.Where(i => i.Id == id)
				.AsNoTracking()
				.Select(i => new InstructorDto
				{
					Id = i.Id,
					UserId = i.UserId,
					UserName = i.User.UserName,
					ImageUrl = i.ImageUrl,
					Title = i.Title,
					Description = i.Description,
					HourWage = i.HourWage,
					IsActive = i.IsActive
				}).FirstOrDefaultAsync();
		}
	}
}
