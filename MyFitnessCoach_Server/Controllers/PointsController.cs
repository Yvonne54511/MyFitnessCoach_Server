using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.EfModels;
using System.Security.Claims;

namespace MyFitnessCoach_Server.Controllers
{
    [Route("api/Points")]
    [ApiController]
    [Authorize]
    public class PointsController : ControllerBase
    {
        private readonly MyFitnessCoachDbContext _context;

        public PointsController(MyFitnessCoachDbContext context)
        {
            _context = context;
        }

        // GET /api/Points/my-points
        // 回傳登入會員的點數餘額與異動紀錄
        [HttpGet("my-points")]
        public async Task<IActionResult> GetMyPoints()
        {
            // JWT 存的是 User.Id，需先轉成 Member.Id
            var userIdStr = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (!int.TryParse(userIdStr, out int userId))
                return Unauthorized(new { error = "無法識別登入用戶" });

            var member = await _context.Members.FirstOrDefaultAsync(m => m.UserId == userId);
            if (member == null)
                return NotFound(new { error = "找不到會員資料" });

            int memberId = member.Id;

            // 查錢包餘額（可能尚未建立）
            var wallet = await _context.UserWallets
                .FirstOrDefaultAsync(w => w.MemberId == memberId);

            int balance = wallet == null ? 0 : (int)wallet.CurrentBalance;

            // 查點數異動紀錄
            List<object> history = new();

            if (wallet != null)
            {
                var records = await _context.PointsRecordDetails
                    .Where(r => r.UserWalletId == wallet.Id)
                    .Include(r => r.PointOrder)
                        .ThenInclude(o => o.TopUpPlan)
                    .Include(r => r.ReserveOrder)
                        .ThenInclude(ro => ro.Shift)
                            .ThenInclude(s => s.Instructor)
                                .ThenInclude(i => i.User)
                    .OrderByDescending(r => r.CreateAt)
                    .ToListAsync();

                history = records.Select(r =>
                {
                    string description = r.MerchandiseCategory switch
                    {
                        "Recharge" => r.PointOrder?.TopUpPlan?.PlanName ?? "購買點數",
                        "Reserve"  => r.ReserveOrder != null
                            ? $"課程預約 - {r.ReserveOrder.Shift?.Instructor?.User?.UserName ?? "教練"}"
                            : "課程預約",
                        "Cancel"   => "取消預約 (點數退回)",
                        _          => r.MerchandiseCategory ?? "點數異動"
                    };

                    string status = r.PointOrder != null
                        ? r.PointOrder.Status == 1 ? "已完成" : "處理中"
                        : "已完成";

                    return (object)new
                    {
                        id          = r.Id,
                        date        = r.CreateAt.ToString("o"),
                        description,
                        amount      = r.PointAmount,
                        status
                    };
                }).ToList();
            }

            return Ok(new { balance, history });
        }
    }
}
