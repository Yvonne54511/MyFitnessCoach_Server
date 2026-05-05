using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.IdentityModel.Tokens;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.Repositories;
using MyFitnessCoach_Server.Utilities;

namespace MyFitnessCoach_Server.Models.Services;

public class AccountService : IAccountService
{
    private readonly IAccountRepository _accountRepository;
    private readonly IAccountRateLimitService _accountRateLimitService;
    private readonly IHashHelper _hashHelper;
    private readonly IPasswordEmailService _emailService;
    private readonly IConfiguration _config;
    private readonly IVerifyPasswordRequirements _passwordPolicy;

    public AccountService(
        IAccountRepository accountRepository,
        IAccountRateLimitService accountRateLimitService,
        IHashHelper hashHelper,
        IPasswordEmailService emailService,
        IConfiguration config,
        IVerifyPasswordRequirements passwordPolicy)
    {
        _accountRepository        = accountRepository;
        _accountRateLimitService  = accountRateLimitService;
        _hashHelper               = hashHelper;
        _emailService             = emailService;
        _config                   = config;
        _passwordPolicy           = passwordPolicy;
    }

    // ── Login ──────────────────────────────────────────────────────────────

    public async Task<LoginResultDto> LoginAsync(LoginDto dto)
    {
        var user = await _accountRepository.GetByAccountAsync(dto.Account);

        if (user == null || string.IsNullOrWhiteSpace(user.HashedPassword))
            return new LoginResultDto { IsSuccess = false, Message = "帳號或密碼錯誤" };

        if (!_hashHelper.VerifyPassword(user.HashedPassword, dto.Password))
            return new LoginResultDto { IsSuccess = false, Message = "帳號或密碼錯誤" };

        if (!user.IsConfirmed)
            return new LoginResultDto { IsSuccess = false, Message = "此帳號尚未完成驗證" };

        if (!user.IsActive)
            return new LoginResultDto { IsSuccess = false, Message = "此帳號目前停用中，請洽管理員" };

        await _accountRepository.EnsureMemberAsync(user.Id);

        var instructor = await _accountRepository.GetInstructorByUserIdAsync(user.Id);
        var employee   = await _accountRepository.GetEmployeeByUserIdAsync(user.Id);
        var member     = await _accountRepository.GetMemberByUserIdAsync(user.Id);

        var roles     = user.UserRoles.Select(ur => ur.Role.RoleName).ToList();
        var functions = user.UserRoles
            .SelectMany(ur => ur.Role.RoleFunctions)
            .Select(rf => rf.Function.FunctionName)
            .Distinct()
            .ToList();

        var claims = new List<Claim>
        {
            new(ClaimTypes.NameIdentifier, user.Id.ToString()),
            new(ClaimTypes.Name, user.UserName ?? user.Account),
            new(ClaimTypes.Email, user.Email),
            new("Account", user.Account)
        };

        if (member?.Id is int memberId)
            claims.Add(new Claim("MemberId", memberId.ToString()));

        if (instructor?.Id is int instructorId)
            claims.Add(new Claim("InstructorId", instructorId.ToString()));

        if (employee?.Id is int employeeId)
            claims.Add(new Claim("EmployeeId", employeeId.ToString()));

        if (employee?.DepartmentId is int departmentId)
            claims.Add(new Claim("DepartmentId", departmentId.ToString()));

        foreach (var role in roles)
            claims.Add(new Claim(ClaimTypes.Role, role));

        foreach (var func in functions)
            claims.Add(new Claim("Function", func));

        var key     = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]!));
        var creds   = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
        var lifetimeMinutes = int.TryParse(_config["Jwt:AccessTokenLifetimeMinutes"], out var minutes)
            ? minutes
            : 480;

        var expires = DateTime.UtcNow.AddMinutes(lifetimeMinutes);

        var token = new JwtSecurityToken(
            issuer:             _config["Jwt:Issuer"],
            audience:           _config["Jwt:Audience"],
            claims:             claims,
            expires:            expires,
            signingCredentials: creds
        );

        return new LoginResultDto
        {
            IsSuccess = true,
            Message   = "登入成功",
            Token     = new JwtSecurityTokenHandler().WriteToken(token),
            UserId    = user.Id,
            MemberId  = member?.Id,
            UserName  = user.UserName ?? user.Account,
            ImageUrl  = member?.ImageUrl ?? "/images/members/default.jpg"
        };
    }

    // ── Change password ────────────────────────────────────────────────────

    public async Task<ChangePasswordResultDto> ChangePasswordAsync(ChangePasswordDto dto, int userId)
    {
        var user = await _accountRepository.GetByIdAsync(userId);
        if (user == null || string.IsNullOrWhiteSpace(user.HashedPassword))
            return new ChangePasswordResultDto { IsSuccess = false, Message = "使用者不存在" };

        if (!_hashHelper.VerifyPassword(user.HashedPassword, dto.OldPassword))
            return new ChangePasswordResultDto { IsSuccess = false, Message = "OLD_PASSWORD_WRONG" };

        var policyResult = await _passwordPolicy.VerifyAsync(dto.NewPassword, userId);
        if (!policyResult.IsSuccess)
            return new ChangePasswordResultDto { IsSuccess = false, Message = policyResult.Message };

        var now = DateTime.UtcNow;
        var newHashedPassword = _hashHelper.HashPassword(dto.NewPassword);
        await _accountRepository.UpdatePasswordAsync(userId, newHashedPassword);

        await _accountRepository.AddPasswordHistoryAsync(new UserPasswordHistory
        {
            UserId         = userId,
            HashedPassword = newHashedPassword,
            CreatedAt      = now
        });

        await _emailService.SendPasswordChangedNotificationAsync(user.Email);

        return new ChangePasswordResultDto { IsSuccess = true, Message = "密碼已成功修改" };
    }

    // ── Forgot password ────────────────────────────────────────────────────

    public async Task ForgotPasswordAsync(ForgotPasswordDto dto, string ipAddress)
    {
        const string endPoint = "forgotpassword";
        var now   = DateTime.UtcNow;
        var email = dto.Email.Trim().ToLower();

        await _accountRateLimitService.VerifyIPRequestRateLimit(ipAddress, email, now);

        // 記錄請求（防止 enumeration，不論帳號是否存在都記錄）
        await _accountRateLimitService.VerifyEmailSendRateLimit(ipAddress, endPoint, email, now);

        // 查帳號（silent fail，防止 enumeration attack）
        var user = await _accountRepository.GetByEmailAsync(email);
        if (user == null) return;

        // 產生 token 並存入 DB（hash 儲存）
        var (rawToken, hash) = _hashHelper.ProduceConfirmCode();

        await _accountRepository.UpdateResetTokenAsync(user.Id, hash, now.AddMinutes(15));

        // 寄重設連結
        var resetLink = $"{_config["FrontEnd:BaseUrl"]}/resetpassword?token={rawToken}";
        await _emailService.SendForgotPasswordEmailAsync(user.Email, resetLink);
    }

    // ── Reset password ─────────────────────────────────────────────────────

    public async Task<ResetPasswordResultDto> ResetPasswordAsync(ResetPasswordDto dto)
    {
        var now  = DateTime.UtcNow;
        var hash = _hashHelper.HashConfirmCode(dto.Token);

        // 取得 user 並驗證 token 狀態（未使用、未過期）
        var user = await _accountRepository.GetByResetCodeHashAsync(hash);
        if (user == null
            || user.IsResetPasswordConfirmCodeUsed == true
            || user.ResetPasswordConfirmCodeExpiry == null
            || user.ResetPasswordConfirmCodeExpiry <= now)
            return new ResetPasswordResultDto { IsSuccess = false, Message = "連結已失效或過期，請重新申請" };

        // 密碼規則驗證（長度 > 8、一個月內修改 < 3 次、不可與近 3 次相同）
        var policyResult = await _passwordPolicy.VerifyAsync(dto.NewPassword, user.Id);
        if (!policyResult.IsSuccess)
            return new ResetPasswordResultDto { IsSuccess = false, Message = policyResult.Message! };

        // 所有檢查都通過才原子地把 token 標為已使用（防 race condition：併發請求只有一個會成功）
        var affected = await _accountRepository.MarkResetTokenUsedAsync(hash, now);
        if (affected == 0)
            return new ResetPasswordResultDto { IsSuccess = false, Message = "連結已失效或過期，請重新申請" };

        // 更新密碼
        var newHashedPassword = _hashHelper.HashPassword(dto.NewPassword);
        await _accountRepository.UpdatePasswordAsync(user.Id, newHashedPassword);

        // 新增密碼歷史紀錄
        await _accountRepository.AddPasswordHistoryAsync(new UserPasswordHistory
        {
            UserId         = user.Id,
            HashedPassword = newHashedPassword,
            CreatedAt      = now
        });

        // 寄通知信
        await _emailService.SendPasswordChangedNotificationAsync(user.Email);

        return new ResetPasswordResultDto { IsSuccess = true, Message = "密碼已成功重設" };
    }

    // ── Register ───────────────────────────────────────────────────────────

    public async Task RegisterAsync(RegisterDto dto, string ipAddress)
    {
        const string endPoint = "register";
        var now = DateTime.UtcNow;

        await _accountRateLimitService.EnsureRegisterAllowedAsync(ipAddress, now);

        // 記錄請求（即使後續驗證失敗也計入，防止枚舉攻擊）
        await _accountRateLimitService.VerifyEmailSendRateLimit(ipAddress, endPoint, dto.Email.Trim().ToLower(), now);

        // 正規化輸入
        var account = dto.Account.Trim();
        var email   = dto.Email.Trim().ToLower();
        var mobile  = dto.Mobile.Trim();

        // 驗證帳號/信箱唯一性
        if (await _accountRepository.AccountOrEmailExistsAsync(account, email))
            throw new InvalidOperationException("ACCOUNT_OR_EMAIL_EXISTS");

        // 驗證手機唯一性
        if (await _accountRepository.MobileExistsAsync(mobile))
            throw new InvalidOperationException("MOBILE_EXISTS");

        // 密碼規則驗證（長度 > 8）
        var policyResult = await _passwordPolicy.VerifyAsync(dto.Password);
        if (!policyResult.IsSuccess)
            throw new InvalidOperationException(policyResult.Message);

        // 雜湊密碼
        var hashedPassword = _hashHelper.HashPassword(dto.Password);

        // 產生啟用 token
        var (rawToken, hash) = _hashHelper.ProduceConfirmCode();

        var user = new User
        {
            Account                    = account,
            HashedPassword             = hashedPassword,
            Email                      = email,
            UserName                   = dto.UserName.Trim(),
            Mobile                     = mobile,
            IsConfirmed                = false,
            IsActive                   = true,
            NewMemberConfirmCode       = hash,
            NewMemberConfirmCodeExpiry = now.AddHours(24)
        };

        // 用交易包住「建立帳號 + 寄送啟用信」：寄信失敗時回滾，避免產生無法啟用的孤兒帳號
        using var transaction = await _accountRepository.BeginTransactionAsync();

        await _accountRepository.CreateUserAsync(user);

        await _accountRepository.CreateMemberAsync(new Member
        {
            UserId      = user.Id,
            Gender      = dto.Gender == "M" ? (byte)1 : (byte)2,
            DateOfBirth = dto.DateOfBirth.ToDateTime(TimeOnly.MinValue),
            ImageUrl    = "/images/members/default.jpg",
            CancelCount = 1
        });

        var activationUrl = $"{_config["FrontEnd:BaseUrl"]}/activate?token={rawToken}";
        await _emailService.SendActivationEmailAsync(user.Email, activationUrl);

        await transaction.CommitAsync();
    }

    // ── Activate account ───────────────────────────────────────────────────

    public async Task<ActivateAccountResultDto> ActivateAccountAsync(string rawToken)
    {
        var hash = _hashHelper.HashConfirmCode(rawToken);

        var user = await _accountRepository.GetByActivationCodeHashAsync(hash);

        if (user == null)
            return new ActivateAccountResultDto { IsSuccess = false, ErrorCode = "NOT_FOUND" };

        if (user.IsConfirmed)
            return new ActivateAccountResultDto { IsSuccess = false, ErrorCode = "NOT_FOUND" };

        if (DateTime.UtcNow > user.NewMemberConfirmCodeExpiry)
            return new ActivateAccountResultDto { IsSuccess = false, ErrorCode = "TOKEN_EXPIRED" };

        await _accountRepository.ActivateAndEnsureMemberAsync(user.Id);
        return new ActivateAccountResultDto { IsSuccess = true };
    }

    // ── Resend activation email ────────────────────────────────────────────

    public async Task ResendActivationEmailAsync(ResendActivationDto dto, string ipAddress)
    {
        const string endPoint = "resend-activation";
        var now   = DateTime.UtcNow;
        var email = dto.Email.Trim().ToLower();

        await _accountRateLimitService.EnsureResendActivationAllowedAsync(ipAddress, email, now);

        await _accountRateLimitService.VerifyEmailSendRateLimit(ipAddress, endPoint, email, now);

        // Silent fail：防止帳號枚舉
        var user = await _accountRepository.GetPendingUserByEmailAsync(email);
        if (user == null) return;

        var (rawToken, hash) = _hashHelper.ProduceConfirmCode();
        await _accountRepository.UpdateActivationTokenAsync(user.Id, hash, now.AddHours(24));

        var activationUrl = $"{_config["FrontEnd:BaseUrl"]}/activate?token={rawToken}";
        await _emailService.SendActivationEmailAsync(user.Email, activationUrl);
    }

    // ── Current user (for /api/auth/me) ────────────────────────────────────

    public async Task<CurrentUserDto?> GetCurrentUserAsync(int userId)
    {
        var user = await _accountRepository.GetByIdAsync(userId);
        if (user == null || !user.IsActive) return null;

        var member = await _accountRepository.GetMemberByUserIdAsync(user.Id);

        return new CurrentUserDto
        {
            UserId   = user.Id,
            MemberId = member?.Id,
            UserName = user.UserName ?? user.Account,
            ImageUrl = member?.ImageUrl ?? "/images/members/default.jpg"
        };
    }
}
