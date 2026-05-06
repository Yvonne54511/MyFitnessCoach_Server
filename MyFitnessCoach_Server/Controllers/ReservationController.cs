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
        [AllowAnonymous]
        public async Task<ActionResult> CreateReservation(CreateReservationDto dto)
        {
            // 在建立新預約前先清理過期預約，釋放時段
            await _service.CleanupAllExpiredReservationsAsync();

            var memberIdClaim = User.FindFirst("MemberId")?.Value;
            int memberId;
            
            // 辨識身份：有 Token 則解析 MemberId，無則使用預設訪客 ID (6)
            if (!string.IsNullOrEmpty(memberIdClaim) && int.TryParse(memberIdClaim, out int mid))
            {
                memberId = mid;
            }
            else
            {
                memberId = 6;
                // 訪客強制只能使用信用卡
                if (dto.PaymentMethod != "CreditCard")
                {
                    return BadRequest(new { message = "未登入狀態僅支援信用卡支付" });
                }
            }

            var (success, reservationId) = await _service.CreateReservationAsync(memberId, dto);
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

        [HttpPut("{id}/Target")]
        public async Task<ActionResult> UpdateTarget(int id, [FromBody] UpdateTargetDto dto)
        {
            var member = await GetCurrentMemberAsync();
            if (member == null) return Unauthorized();

            var order = await _context.ReserveOrders.FirstOrDefaultAsync(ro => ro.Id == id && ro.MemberId == member.Id);
            if (order == null) return NotFound(new { message = "找不到該預約紀錄" });

            order.Target = dto.Target;
            await _context.SaveChangesAsync();
            return Ok(new { message = "備註更新成功" });
        }
    }

    public class UpdateTargetDto
    {
        public string Target { get; set; }
    }
}
