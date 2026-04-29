using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.EfModels;
using System.Security.Claims;

namespace MyFitnessCoach_Server.Controllers
{
    [Route("api/ProductOrders")]
    [ApiController]
    [Authorize]
    public class ProductOrderController : ControllerBase
    {
        private readonly MyFitnessCoachDbContext _context;

        public ProductOrderController(MyFitnessCoachDbContext context)
        {
            _context = context;
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
}
