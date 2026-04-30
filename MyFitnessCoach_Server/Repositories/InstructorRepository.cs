using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Repositories
{
	public interface IInstructorRepository
	{
		Task<IQueryable<InstructorDto>> GetAllQueryableAsync(int? year = null, int? month = null);
		Task<InstructorDto?> GetByIdAsync(int id);
		Task<IEnumerable<AvailabilityDto>> GetAvailabilityByInstructorIdAsync(int instructorId);
	}
	public class InstructorRepository: IInstructorRepository
	{
		private readonly MyFitnessCoachDbContext _context;

		public InstructorRepository(MyFitnessCoachDbContext context)
		{
			_context = context;
		}
		public async Task<IQueryable<InstructorDto>> GetAllQueryableAsync(int? year = null, int? month = null)
		{
			// 1. 取得所有營養師、評論與關鍵字
			// 參考 Dashboard 邏輯：過濾特定年月份的評論
			var instructorsRaw = await _context.Instructors
				.Include(i => i.User)
				.Include(i => i.Reviews.Where(r => !r.IsBanned 
					&& (!year.HasValue || r.CreatedAt.Year == year)
					&& (!month.HasValue || month == 0 || r.CreatedAt.Month == month)))
				.AsNoTracking()
				.ToListAsync();

			var keyWords = await _context.KeyWords.ToListAsync();
			var sortedKeywords = keyWords.OrderByDescending(k => k.Word.Length).ToList();

			// 2. 計算評分
			var rankedInstructors = instructorsRaw.Select(i =>
			{
				int totalScore = 0;
				foreach (var review in i.Reviews)
				{
					// Step 1: 基礎分 (4-5星 +2, 1-2星 -2)
					if (review.Rating >= 4) totalScore += 2;
					else if (review.Rating <= 2) totalScore -= 2;

					// Step 2: 關鍵字權重
					if (!string.IsNullOrEmpty(review.Comment))
					{
						string tempComment = review.Comment;
						foreach (var kw in sortedKeywords)
						{
							if (tempComment.Contains(kw.Word))
							{
								int count = (tempComment.Length - tempComment.Replace(kw.Word, "").Length) / kw.Word.Length;
								if (kw.Category == 1) totalScore += count * kw.Weight;
								else if (kw.Category == -1) totalScore -= count * kw.Weight;
								tempComment = tempComment.Replace(kw.Word, new string(' ', kw.Word.Length));
							}
						}
					}
				}

				return new InstructorDto
				{
					Id = i.Id,
					UserId = i.UserId,
					UserName = i.User?.UserName ?? "未設定名稱",
					ImageUrl = i.ImageUrl,
					Title = i.Title,
					Description = i.Description,
					HourWage = i.HourWage,
					IsActive = i.IsActive,
					TotalScore = totalScore,
					AverageRating = (i.Reviews != null && i.Reviews.Any()) ? i.Reviews.Average(r => (double)r.Rating) : 0
				};
			}).OrderByDescending(i => i.TotalScore);

			return rankedInstructors.AsQueryable();
		}

		public async Task<InstructorDto?> GetByIdAsync(int id)
		{
			// 單一查詢也包含分數計算，確保 DTO 完整
			var instructors = await GetAllQueryableAsync();
			return instructors.FirstOrDefault(i => i.Id == id);
		}

		public async Task<IEnumerable<AvailabilityDto>> GetAvailabilityByInstructorIdAsync(int instructorId)
		{
			var shifts = await _context.Shifts
				.Where(s => s.InstructorId == instructorId)
				.AsNoTracking()
				.ToListAsync();

			return shifts.Select(s => new AvailabilityDto
			{
				ShiftId = s.Id,
				Date = s.ScheduleDate.ToString("yyyy-MM-dd"),
				TimeSlot = s.TimeSlot,
				IsReserved = s.IsBooked
			});
		}
	}
}
