using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Repositories;

namespace MyFitnessCoach_Server.Models.Services
{
    public class ReservationService
    {
        private readonly IReservationRepository _repo;

        public ReservationService(IReservationRepository repo)
        {
            _repo = repo;
        }

        public async Task<IEnumerable<ReservationDto>> GetMemberReservationsAsync(int memberId)
        {
            return await _repo.GetByMemberIdAsync(memberId);
        }

        public async Task<bool> CreateReservationAsync(int memberId, CreateReservationDto dto)
        {
            return await _repo.CreateAsync(memberId, dto);
        }

        public async Task<bool> CancelReservationAsync(int memberId, int reservationId)
        {
            return await _repo.CancelAsync(memberId, reservationId);
        }
    }
}
