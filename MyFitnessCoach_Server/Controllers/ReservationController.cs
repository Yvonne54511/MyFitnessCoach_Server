using Microsoft.AspNetCore.Mvc;
using MyFitnessCoach_Server.Models.Services;
using MyFitnessCoach_Server.Models.DTOs;

namespace MyFitnessCoach_Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReservationController : ControllerBase
    {
        private readonly ReservationService _service;

        public ReservationController(ReservationService service)
        {
            _service = service;
        }

        [HttpGet("My")]
        public async Task<ActionResult<IEnumerable<ReservationDto>>> GetMyReservations()
        {
            // 1. 正規做法：從 Claims 中取得 MemberId
            var memberIdClaim = User.FindFirst("MemberId")?.Value;
            
            int memberId;
            if (!string.IsNullOrEmpty(memberIdClaim) && int.TryParse(memberIdClaim, out int id))
            {
                memberId = id;
            }
            else
            {
                // 2. 模擬邏輯：在開發階段若未登入，預設為 MemberId = 1
                memberId = 1; 
            }

            var reservations = await _service.GetMemberReservationsAsync(memberId);
            return Ok(reservations);
        }

        [HttpPost]
        public async Task<ActionResult> CreateReservation(CreateReservationDto dto)
        {
            var memberIdClaim = User.FindFirst("MemberId")?.Value;
            int memberId = (!string.IsNullOrEmpty(memberIdClaim) && int.TryParse(memberIdClaim, out int id)) ? id : 1;

            var success = await _service.CreateReservationAsync(memberId, dto);
            if (success)
            {
                return Ok(new { message = "預約成功" });
            }
            return BadRequest(new { message = "預約失敗，該時段可能已被預約或不存在" });
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> CancelReservation(int id)
        {
            var memberIdClaim = User.FindFirst("MemberId")?.Value;
            int memberId = (!string.IsNullOrEmpty(memberIdClaim) && int.TryParse(memberIdClaim, out int mid)) ? mid : 1;

            var result = await _service.CancelReservationAsync(memberId, id);
            if (result.Success)
            {
                return Ok(new { message = result.Message });
            }
            return BadRequest(new { message = result.Message });
        }
    }
}
