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
            var memberIdClaim = User.FindFirst("MemberId")?.Value;
            int memberId;

            if (!string.IsNullOrEmpty(memberIdClaim) && int.TryParse(memberIdClaim, out int mid))
            {
                memberId = mid;
            }
            else
            {
                // 訪客模式：預設為 MemberId = 6
                memberId = 6;
            }

            var reservations = await _service.GetMemberReservationsAsync(memberId);
            return Ok(reservations);
        }

        [HttpPost]
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
                // 修正：如果選擇信用卡，前端需要跳轉，狀態應先設為待付款（這部分在 Repository 內已處理或需配合）
                // 檢查 Repository 是否已將狀態設為已預約，若是信用卡則應改為待付款
                string message = dto.PaymentMethod == "CreditCard" ? "預約建立中，請完成付款" : "預約成功";
                return Ok(new { message, reservationId });
            }
            return BadRequest(new { message = "預約失敗，該時段可能已被預約或不存在" });
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> CancelReservation(int id)
        {
            var memberIdClaim = User.FindFirst("MemberId")?.Value;
            if (string.IsNullOrEmpty(memberIdClaim) || !int.TryParse(memberIdClaim, out int memberId))
            {
                return Unauthorized(new { message = "請先登入會員" });
            }

            var result = await _service.CancelReservationAsync(memberId, id);
            if (result.Success)
            {
                return Ok(new { message = result.Message });
            }
            return BadRequest(new { message = result.Message });
        }
    }
}
