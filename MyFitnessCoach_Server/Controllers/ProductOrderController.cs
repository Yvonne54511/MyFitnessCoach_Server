using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.Services;
using System.Security.Claims;

namespace MyFitnessCoach_Server.Controllers
{
    [Route("api/ProductOrders")]
    [ApiController]
    [Authorize]
    public class ProductOrderController : ControllerBase
    {
        private readonly MyFitnessCoachDbContext _context;
        private readonly CouponService _couponService;

        public ProductOrderController(MyFitnessCoachDbContext context, CouponService couponService)
        {
            _context = context;
            _couponService = couponService;
        }

        // POST /api/ProductOrders/{id}/return
        [HttpPost("{id}/return")]
        public async Task<IActionResult> RequestReturn(int id, [FromBody] ReturnRequestDto dto)
        {
            var userIdStr = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (!int.TryParse(userIdStr, out int userId))
                return Unauthorized();

            var member = await _context.Members.FirstOrDefaultAsync(m => m.UserId == userId);
            if (member == null) return Unauthorized();

            var order = await _context.ProductOrders
                .FirstOrDefaultAsync(o => o.Id == id && o.MemberId == member.Id);

            if (order == null)
                return NotFound(new { message = "找不到該訂單" });

            if (order.Status != 1 && order.Status != 2)
                return BadRequest(new { message = "僅已付款或已取貨的訂單可申請退換貨" });

            order.Status = 3;
            if (!string.IsNullOrWhiteSpace(dto.Reason))
            {
                var reason = dto.Reason.Trim();
                // Memo 欄位上限 50 字，前綴 8 字後剩 42 字
                if (reason.Length > 42) reason = reason[..42];
                order.Memo = $"[退換貨] {reason}";
            }

            await _context.SaveChangesAsync();
            return Ok(new { message = "退換貨申請已送出，我們將盡快與您聯繫" });
        }

        // POST /api/ProductOrders/{id}/approve-refund
        // 核准退款（status 3 申請中 → 5 已退款），並退還訂單使用的優惠券
        [HttpPost("{id}/approve-refund")]
        public async Task<IActionResult> ApproveRefund(int id)
        {
            var order = await _context.ProductOrders.FirstOrDefaultAsync(o => o.Id == id);
            if (order == null)
                return NotFound(new { message = "找不到該訂單" });

            if (order.Status != 3 && order.Status != 4)
                return BadRequest(new { message = "僅退換貨申請中或已核准的訂單可執行退款" });

            using var tx = await _context.Database.BeginTransactionAsync();
            try
            {
                order.Status = 5;
                await _context.SaveChangesAsync();

                // 退還優惠券（若訂單未使用券則靜默跳過）
                var restoredCouponId = await _couponService.RestoreByOrderAsync(order.Id);

                await tx.CommitAsync();

                return Ok(new
                {
                    message = "退款已完成",
                    restoredMemberCouponId = restoredCouponId
                });
            }
            catch (Exception ex)
            {
                await tx.RollbackAsync();
                return StatusCode(500, new { message = $"退款處理失敗：{ex.Message}" });
            }
        }

        // POST /api/ProductOrders/{id}/reject-refund
        // 拒絕退款（status 3 → 6），不退還優惠券
        [HttpPost("{id}/reject-refund")]
        public async Task<IActionResult> RejectRefund(int id, [FromBody] ReturnRequestDto dto)
        {
            var order = await _context.ProductOrders.FirstOrDefaultAsync(o => o.Id == id);
            if (order == null)
                return NotFound(new { message = "找不到該訂單" });

            if (order.Status != 3)
                return BadRequest(new { message = "僅退換貨申請中的訂單可拒絕" });

            order.Status = 6;
            if (!string.IsNullOrWhiteSpace(dto?.Reason))
            {
                var reason = dto.Reason.Trim();
                if (reason.Length > 42) reason = reason[..42];
                order.Memo = $"[退換貨] {reason}";
            }
            await _context.SaveChangesAsync();

            return Ok(new { message = "退換貨申請已拒絕" });
        }

        // GET /api/ProductOrders
        [HttpGet]
        public async Task<IActionResult> GetMyOrders()
        {
            var userIdStr = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (!int.TryParse(userIdStr, out int userId))
                return Unauthorized();

            var member = await _context.Members.FirstOrDefaultAsync(m => m.UserId == userId);
            if (member == null) return Unauthorized();

            // 先從 DB 取出資料，再於記憶體中組合 ImageURL
            // 直接使用 /api/StoreApi/ProductImage/{productId}，與 Cart/Store 頁面一致
            var rawOrders = await _context.ProductOrders
                .Where(o => o.MemberId == member.Id)
                .Include(o => o.ProductOrderDetails)
                .OrderByDescending(o => o.CreateAt)
                .ToListAsync();

            var orders = rawOrders.Select(o => new
            {
                o.Id,
                o.CreateAt,
                o.OriginalAmount,
                o.DiscountAmount,
                o.FinalAmount,
                o.Status,
                o.PaymentMethod,
                o.Receiver,
                o.Address,
                o.Mobile,
                o.StoreName,
                o.LogisticsOrderNo,
                o.Memo,
                o.InvoiceType,
                o.TaxNumber,
                o.DonationCode,
                o.CarrierCode,
                Details = o.ProductOrderDetails.Select(d => new
                {
                    d.ProductName,
                    d.UnitPrice,
                    d.Qty,
                    d.SubTotal,
                    ImageURL = $"/api/StoreApi/ProductImage/{d.ProductId}",
                })
            });

            return Ok(orders);
        }
    }

    public class ReturnRequestDto
    {
        public string? Reason { get; set; }
    }
}
