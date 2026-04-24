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

            var orders = await _context.ProductOrders
                .Where(o => o.MemberId == member.Id)
                .Include(o => o.ProductOrderDetails)
                .OrderByDescending(o => o.CreateAt)
                .Select(o => new
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
                        d.ImageURL,
                    })
                })
                .ToListAsync();

            return Ok(orders);
        }
    }
}
