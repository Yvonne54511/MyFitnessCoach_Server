using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.Repositories;
using System.Security.Claims;

namespace MyFitnessCoach_Server.Controllers;

[Route("api/[controller]")]
[ApiController]
public class MemberController : ControllerBase
{
    private readonly MyFitnessCoachDbContext _db;
    private readonly IAccountRepository _accountRepository;
    private readonly IWebHostEnvironment _env;

    public MemberController(
        MyFitnessCoachDbContext db,
        IAccountRepository accountRepository,
        IWebHostEnvironment env)
    {
        _db                = db;
        _accountRepository = accountRepository;
        _env               = env;
    }

    // GET /api/Member/Info — 現有 endpoint，保留給 ReserveDetail / ReserveOrders
    [HttpGet("Info")]
    [Authorize]
    public async Task<ActionResult<MemberInfoDto>> GetMemberInfo()
    {
        if (!int.TryParse(User.FindFirstValue("MemberId"), out var memberId))
            return Unauthorized();
        //[HttpGet("Info")]
        //public async Task<ActionResult<MemberInfoDto>> GetMemberInfo()
        //{
        //    // 1. 優先從 Claims 取得 MemberId
        //    var memberIdClaim = User.FindFirst("MemberId")?.Value;
        //    int memberId = 0;

        //    if (!string.IsNullOrEmpty(memberIdClaim) && int.TryParse(memberIdClaim, out int mid))
        //    {
        //        memberId = mid;
        //    }
        //    else
        //    {
        //        // 2. 如果沒有 MemberId Claim，檢查是否有 UserId
        //        var userIdClaim = User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value;
        //        if (!string.IsNullOrEmpty(userIdClaim) && int.TryParse(userIdClaim, out int uid))
        //        {
        //            var memberRecord = await _db.Members.FirstOrDefaultAsync(m => m.UserId == uid);
        //            if (memberRecord != null)
        //            {
        //                memberId = memberRecord.Id;
        //            }
        //        }
        //    }

        //    // 3. 如果依然沒找到且非登入狀態，不應回傳 Member 6 資料給訪客
        //    if (memberId == 0)
        //    {
        //        return Unauthorized(new { message = "請先登入會員" });
        //    }

        var member = await _db.Members
            .Include(m => m.User)
            .Include(m => m.UserWallet)
            .FirstOrDefaultAsync(m => m.Id == memberId);

        if (member == null) return NotFound();

        return Ok(new MemberInfoDto
        {
            Id     = member.Id,
            Name   = member.User?.UserName ?? string.Empty,
            Avatar = member.ImageUrl,
            Points = member.UserWallet?.CurrentBalance ?? 0,
            Phone  = member.User?.Mobile
        });
    }

    // GET /api/Member/personal-info
    [HttpGet("personal-info")]
    [Authorize]
    public async Task<ActionResult<PersonalInfoDto>> GetPersonalInfo()
    {
        var (userId, memberId) = GetUserAndMemberId();
        if (userId is null) return Unauthorized();

        var user = await _accountRepository.GetUserWithMemberAsync(userId.Value);
        if (user == null) return NotFound();

        Member? member;
        if (memberId is not null)
        {
            member = await _db.Members.FirstOrDefaultAsync(m => m.Id == memberId.Value);
        }
        else
        {
            member = await _db.Members.FirstOrDefaultAsync(m => m.UserId == userId.Value);
        }

        if (member == null) return NotFound();

        return Ok(ToPersonalInfoDto(user, member));
    }

    // PUT /api/Member/personal-info
    [HttpPut("personal-info")]
    [Authorize]
    public async Task<ActionResult<PersonalInfoDto>> UpdatePersonalInfo([FromBody] UpdatePersonalInfoRequest request)
    {
        var (userId, memberId) = GetUserAndMemberId();
        if (userId is null) return Unauthorized();

        var member = memberId is not null
            ? await _db.Members.FirstOrDefaultAsync(m => m.Id == memberId.Value)
            : await _db.Members.FirstOrDefaultAsync(m => m.UserId == userId.Value);

        if (member == null) return NotFound();

        await _accountRepository.UpdatePersonalInfoAsync(userId.Value, member.Id, request);

        var updatedUser = await _accountRepository.GetUserWithMemberAsync(userId.Value);
        var updatedMember = await _db.Members.FirstOrDefaultAsync(m => m.Id == member.Id);

        return Ok(ToPersonalInfoDto(updatedUser!, updatedMember!));
    }

    // POST /api/Member/avatar
    [HttpPost("avatar")]
    [Authorize]
    public async Task<ActionResult<AvatarUploadResponse>> UploadAvatar(IFormFile file)
    {
        var (userId, memberId) = GetUserAndMemberId();
        if (userId is null) return Unauthorized();

        var member = memberId is not null
            ? await _db.Members.FirstOrDefaultAsync(m => m.Id == memberId.Value)
            : await _db.Members.FirstOrDefaultAsync(m => m.UserId == userId.Value);

        if (member == null) return NotFound();

        if (file == null || file.Length == 0)
            return BadRequest(new { message = "請選擇要上傳的圖片" });

        const long maxSize = 2 * 1024 * 1024; // 2 MB
        if (file.Length > maxSize)
            return BadRequest(new { message = "圖片不得超過 2MB" });

        var allowed = new[] { "image/jpeg", "image/png", "image/webp" };
        if (!allowed.Contains(file.ContentType.ToLower()))
            return BadRequest(new { message = "僅支援 JPG、PNG、WebP 格式" });

        var ext      = Path.GetExtension(file.FileName).ToLower();
        var fileName = $"{member.Id}_{Guid.NewGuid():N}{ext}";
        var savePath = Path.Combine(_env.ContentRootPath, "images", "members", fileName);

        Directory.CreateDirectory(Path.GetDirectoryName(savePath)!);
        using (var stream = new FileStream(savePath, FileMode.Create))
            await file.CopyToAsync(stream);

        var imageUrl = $"/images/members/{fileName}";
        await _accountRepository.UpdateMemberImageAsync(member.Id, imageUrl);

        return Ok(new AvatarUploadResponse { ImageUrl = imageUrl });
    }

    // ── helpers ───────────────────────────────────────────────────────────

    private (int? userId, int? memberId) GetUserAndMemberId()
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var uid))
            return (null, null);

        int? mid = int.TryParse(User.FindFirstValue("MemberId"), out var m) ? m : null;
        return (uid, mid);
    }

    private static PersonalInfoDto ToPersonalInfoDto(User user, Member member) => new()
    {
        UserId      = user.Id,
        MemberId    = member.Id,
        UserName    = user.UserName ?? user.Account ?? string.Empty,
        Email       = user.Email,
        Mobile      = user.Mobile ?? string.Empty,
        Gender      = member.Gender switch { 1 => "M", 2 => "F", _ => null },
        DateOfBirth = member.DateOfBirth.HasValue
            ? DateOnly.FromDateTime(member.DateOfBirth.Value)
            : null,
        ImageUrl = member.ImageUrl
    };
}
