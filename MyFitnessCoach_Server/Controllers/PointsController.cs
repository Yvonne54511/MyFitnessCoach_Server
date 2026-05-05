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

        // GET /api/Points/my-points?page=1&pageSize=10&filter=all
        // 回傳登入會員的點數餘額、異動紀錄(支援分頁與類型篩選)、累積統計
        // filter: all | recharge | spend | refund
        [HttpGet("my-points")]
        public async Task<IActionResult> GetMyPoints(
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 10,
            [FromQuery] string filter = "all")
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

            int balance       = wallet == null ? 0 : (int)wallet.CurrentBalance;
            int totalEarned   = 0;   // 累積儲值（不含退款）
            int totalSpent    = 0;   // 累積消費（取絕對值）
            int totalRefunded = 0;   // 累積退回
            List<object> history = new();
            int totalCount = 0;

            if (wallet != null)
            {
                var allRecords = _context.PointsRecordDetails
                    .Where(r => r.UserWalletId == wallet.Id);

                // ── 累積統計（不分頁、不篩選）──
                totalEarned = await allRecords
                    .Where(r => r.MerchandiseCategory == "Recharge")
                    .SumAsync(r => (int?)r.PointAmount) ?? 0;

                totalSpent = -(await allRecords
                    .Where(r => r.PointAmount < 0)
                    .SumAsync(r => (int?)r.PointAmount) ?? 0);

                totalRefunded = await allRecords
                    .Where(r => r.MerchandiseCategory == "Cancel" || r.MerchandiseCategory == "Refund")
                    .SumAsync(r => (int?)r.PointAmount) ?? 0;

                // ── 篩選條件 ──
                var query = allRecords;
                query = filter switch
                {
                    "recharge" => query.Where(r => r.MerchandiseCategory == "Recharge"),
                    "spend"    => query.Where(r => r.PointAmount < 0),
                    "refund"   => query.Where(r => r.MerchandiseCategory == "Cancel" || r.MerchandiseCategory == "Refund"),
                    _          => query
                };

                totalCount = await query.CountAsync();

                // 用 Select 投影只抓需要的欄位，避免 EF 把 ReserveOrder 整張表 SELECT 進來
                var rawRecords = await query
                    .OrderByDescending(r => r.CreateAt)
                    .Skip((page - 1) * pageSize)
                    .Take(pageSize)
                    .Select(r => new
                    {
                        r.Id,
                        r.CreateAt,
                        r.PointAmount,
                        r.MerchandiseCategory,
                        TopUpPlanName  = r.PointOrder != null ? r.PointOrder.TopUpPlan.PlanName : null,
                        PointOrderStatus = (int?)(r.PointOrder != null ? r.PointOrder.Status : (int?)null),
                        InstructorName = r.ReserveOrder != null
                            ? r.ReserveOrder.Shift.Instructor.User.UserName
                            : null
                    })
                    .ToListAsync();

                history = rawRecords.Select(r =>
                {
                    string description = r.MerchandiseCategory switch
                    {
                        "Recharge" => r.TopUpPlanName ?? "購買點數",
                        "Reserve"  => r.InstructorName != null
                            ? $"課程預約 - {r.InstructorName}"
                            : "課程預約",
                        "Cancel"   => "取消預約（點數退回）",
                        "Refund"   => "退款（點數退回）",
                        _          => r.MerchandiseCategory ?? "點數異動"
                    };

                    string status = r.PointOrderStatus.HasValue
                        ? r.PointOrderStatus.Value == 1 ? "已完成" : "處理中"
                        : "已完成";

                    string type = r.MerchandiseCategory switch
                    {
                        "Recharge"            => "recharge",
                        "Cancel" or "Refund"  => "refund",
                        _                     => r.PointAmount < 0 ? "spend" : "other"
                    };

                    return (object)new
                    {
                        id          = r.Id,
                        date        = r.CreateAt.ToString("o"),
                        description,
                        amount      = r.PointAmount,
                        status,
                        type
                    };
                }).ToList();
            }

            return Ok(new
            {
                balance,
                summary = new { totalEarned, totalSpent, totalRefunded },
                history,
                totalCount,
                totalPages  = (int)Math.Ceiling((double)totalCount / pageSize),
                currentPage = page,
                filter
            });
        }
    }
}
