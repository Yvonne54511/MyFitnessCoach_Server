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
            // 模擬目前登入者為 MemberId = 1
            var memberIdClaim = User.FindFirst("MemberId")?.Value;
            int memberId = (!string.IsNullOrEmpty(memberIdClaim) && int.TryParse(memberIdClaim, out int id)) ? id : 1;

            var member = await _db.Members
                .Include(m => m.User)       // 修正這裡為 m.User
                .Include(m => m.UserWallet)
                .FirstOrDefaultAsync(m => m.Id == memberId);

            if (member == null) return NotFound();

            return Ok(new MemberInfoDto
            {
                Id = member.Id,
                Name = member.User?.UserName ?? "測試用戶",
                Avatar = member.ImageUrl, // 使用 Member 表中的 ImageUrl
                Points = member.UserWallet?.CurrentBalance ?? 0,
                Phone = member.User?.Mobile
            });
        }
    }
}
