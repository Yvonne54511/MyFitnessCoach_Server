using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.DTOs;

namespace MyFitnessCoach_Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MemberController : ControllerBase
    {
        private readonly MyFitnessCoachDbContext _db;

        public MemberController(MyFitnessCoachDbContext db)
        {
            _db = db;
        }

        [HttpGet("Info")]
        public async Task<ActionResult<MemberInfoDto>> GetMemberInfo()
        {
            // 1. 優先從 Claims 取得 MemberId
            var memberIdClaim = User.FindFirst("MemberId")?.Value;
            int memberId = 0;

            if (!string.IsNullOrEmpty(memberIdClaim) && int.TryParse(memberIdClaim, out int mid))
            {
                memberId = mid;
            }
            else
            {
                // 2. 如果沒有 MemberId Claim，檢查是否有 UserId
                var userIdClaim = User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value;
                if (!string.IsNullOrEmpty(userIdClaim) && int.TryParse(userIdClaim, out int uid))
                {
                    var memberRecord = await _db.Members.FirstOrDefaultAsync(m => m.UserId == uid);
                    if (memberRecord != null)
                    {
                        memberId = memberRecord.Id;
                    }
                }
            }

            // 3. 如果依然沒找到且非登入狀態，不應回傳 Member 6 資料給訪客
            if (memberId == 0)
            {
                return Unauthorized(new { message = "請先登入會員" });
            }

            var member = await _db.Members
                .Include(m => m.User)
                .Include(m => m.UserWallet)
                .FirstOrDefaultAsync(m => m.Id == memberId);

            if (member == null) return NotFound("找不到該會員資訊");

            return Ok(new MemberInfoDto
            {
                Id = member.Id,
                Name = member.User?.UserName ?? "訪客",
                Avatar = member.ImageUrl, // 使用 Member 表中的 ImageUrl
                Points = member.UserWallet?.CurrentBalance ?? 0,
                Phone = member.User?.Mobile,
                CancelCount = member.CancelCount
            });
        }
    }
}
