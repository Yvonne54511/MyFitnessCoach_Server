using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Repositories;

namespace MyFitnessCoach_Server.Models.Services
{
	public class InstructorService
	{
		private readonly IInstructorRepository _repository;
		private readonly ReservationService _reservationService;

		public InstructorService(IInstructorRepository repository, ReservationService reservationService)
		{
			_repository = repository;
			_reservationService = reservationService;
		}

		public async Task<IEnumerable<InstructorDto>> GetInstructorsAsync(string? name = null, int? year = null, int? month = null)
		{
			var instructorsQuery = await _repository.GetAllQueryableAsync(year, month);

			if (!string.IsNullOrEmpty(name))
			{
				// 同時搜尋名稱 (UserName) 與 專業領域 (Title)
				instructorsQuery = instructorsQuery.Where(i => 
					i.UserName.Contains(name) || 
					i.Title.Contains(name));
			}

			return instructorsQuery.ToList();
		}

		public async Task<InstructorDto?> GetInstructorByIdAsync(int id)
		{
			return await _repository.GetByIdAsync(id);
		}

		public async Task<IEnumerable<AvailabilityDto>> GetAvailabilityAsync(int instructorId)
		{
			// 1. 在查詢可用性之前，先執行過期預約的清理
			// 這樣可以確保「待付款」超時的時段會立刻被標記為可預約 (IsBooked = false)
			await _reservationService.CleanupAllExpiredReservationsAsync();

			// 2. 呼叫 Repository 取得特定營養師的排班與預約狀態
			return await _repository.GetAvailabilityByInstructorIdAsync(instructorId);
		}
	}
}
