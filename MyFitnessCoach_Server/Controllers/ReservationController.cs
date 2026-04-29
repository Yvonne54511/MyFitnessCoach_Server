using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.Services;
using System.Security.Claims;

namespace MyFitnessCoach_Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ReservationController : ControllerBase
    {
        private readonly ReservationService _service;
        private readonly MyFitnessCoachDbContext _context;

        public ReservationController(ReservationService service, MyFitnessCoachDbContext context)
        {
            _service = service;
            _context = context;
        }

        /// <summary>從 JWT 取 UserId，再查出對應的 Member.Id</summary>
        private async Task<Member?> GetCurrentMemberAsync()
        {
            var userIdStr = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (!int.TryParse(userIdStr, out int userId)) return null;
            return await _context.Members.FirstOrDefaultAsync(m => m.UserId == userId);
        }

        [HttpGet("My")]
        public async Task<ActionResult<IEnumerable<ReservationDto>>> GetMyReservations()
        {
            var member = await GetCurrentMemberAsync();
            if (member == null) return Unauthorized();

            var reservations = await _service.GetMemberReservationsAsync(member.Id);
            return Ok(reservations);
        }

        [HttpPost]
        public async Task<ActionResult> CreateReservation(CreateReservationDto dto)
        {
            var member = await GetCurrentMemberAsync();
            if (member == null) return Unauthorized();

            var (success, reservationId) = await _service.CreateReservationAsync(member.Id, dto);
            if (success)
            {
                string message = dto.PaymentMethod == "CreditCard" ? "預約建立中，請完成付款" : "預約成功";
                return Ok(new { message, reservationId });
            }
            return BadRequest(new { message = "預約失敗，該時段可能已被預約或不存在" });
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> CancelReservation(int id)
        {
            var member = await GetCurrentMemberAsync();
            if (member == null) return Unauthorized();

            var result = await _service.CancelReservationAsync(member.Id, id);
            if (result.Success)
                return Ok(new { message = result.Message });

            return BadRequest(new { message = result.Message });
        }
    }
}
