using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.Repositories;
using MyFitnessCoach_Server.Utilities;

namespace MyFitnessCoach_Server.Models.Services;

public class RateLimitException : Exception
{
    public int RetryAfterSeconds { get; }
    public RateLimitException(int retryAfterSeconds) : base("Too many requests")
        => RetryAfterSeconds = retryAfterSeconds;
}

public class AccountService : IAccountService
{
    private readonly IAccountRepository _accountRepository;
    private readonly IPasswordHasher<User> _passwordHasher;
    private readonly ILoginEmailService _emailService;
    private readonly IConfiguration _config;

    public AccountService(
        IAccountRepository accountRepository,
        IPasswordHasher<User> passwordHasher,
        ILoginEmailService emailService,
        IConfiguration config)
    {
        _accountRepository = accountRepository;
        _passwordHasher    = passwordHasher;
        _emailService      = emailService;
        _config            = config;
    }

    // ── Login ──────────────────────────────────────────────────────────────

    public async Task<LoginResultDto> LoginAsync(LoginDto dto)
    {
        var user = await _accountRepository.GetByAccountAsync(dto.Account);

        if (user == null || string.IsNullOrWhiteSpace(user.HashedPassword))
            return new LoginResultDto { IsSuccess = false, Message = "帳號或密碼錯誤" };

        var result = _passwordHasher.VerifyHashedPassword(user, user.HashedPassword, dto.Password);
        if (result == PasswordVerificationResult.Failed)
            return new LoginResultDto { IsSuccess = false, Message = "帳號或密碼錯誤" };

        if (!user.IsConfirmed)
            return new LoginResultDto { IsSuccess = false, Message = "此帳號尚未完成驗證" };

        if (!user.IsActive)
            return new LoginResultDto { IsSuccess = false, Message = "此帳號目前停用中，請洽管理員" };

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

        if (instructor?.Id is int instructorId)
            claims.Add(new Claim("InstructorId", instructorId.ToString()));

        if (member?.Id is int memberId)
            claims.Add(new Claim("MemberId", memberId.ToString()));

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
        var expires = DateTime.UtcNow.AddHours(8);

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
            UserName  = user.UserName ?? user.Account,
            ImageUrl  = member?.ImageUrl ?? "/images/members/default.jpg"
        };
    }

    // ── Forgot password ────────────────────────────────────────────────────

    public async Task ForgotPasswordAsync(ForgotPasswordDto dto, string ipAddress)
    {
        const string endPoint = "forgotpassword";
        var now   = DateTime.UtcNow;
        var email = dto.Email.Trim().ToLower();

        // IP rate limit：1 小時 5 次
        var ipCount = await _accountRepository.CountRateLimitAsync(ipAddress, endPoint, byIp: true, since: now.AddHours(-1));
        if (ipCount >= 100)
        {
            var oldest = await _accountRepository.GetOldestRateLimitTimeAsync(ipAddress, endPoint, since: now.AddHours(-1));
            var retryAfter = oldest.HasValue
                ? (int)Math.Ceiling((oldest.Value.AddHours(1) - now).TotalSeconds)
                : 3600;
            throw new RateLimitException(Math.Max(retryAfter, 1));
        }

        // Email rate limit：60 秒冷卻
        var recentCount = await _accountRepository.CountRateLimitAsync(email, endPoint, byIp: false, since: now.AddSeconds(-60));
        if (recentCount >= 100)
        {
            var latest = await _accountRepository.GetLatestRateLimitTimeAsync(email, endPoint, since: now.AddSeconds(-60));
            var retryAfter = latest.HasValue
                ? (int)Math.Ceiling((latest.Value.AddSeconds(60) - now).TotalSeconds)
                : 60;
            throw new RateLimitException(Math.Max(retryAfter, 1));
        }

        // Email rate limit：1 小時 5 次
        var hourCount = await _accountRepository.CountRateLimitAsync(email, endPoint, byIp: false, since: now.AddHours(-1));
        if (hourCount >= 100)
            throw new RateLimitException(3600);

        // Email rate limit：24 小時 10 次
        var dayCount = await _accountRepository.CountRateLimitAsync(email, endPoint, byIp: false, since: now.AddHours(-24));
        if (dayCount >= 100)
            throw new RateLimitException(86400);

        // 記錄請求（防止 enumeration，不論帳號是否存在都記錄）
        await _accountRepository.LogRateLimitAsync(new RateLimitLog
        {
            IpAddress   = ipAddress,
            EndPoint    = endPoint,
            Identity    = email,
            IsSuccess   = true,
            RequestedAt = now
        });

        // 查帳號（silent fail，防止 enumeration attack）
        var user = await _accountRepository.GetByEmailAsync(email);
        if (user == null) return;

        // 產生 token 並存入 DB（SHA256 hash）
        var rawToken = Guid.NewGuid().ToString("N");
        var hash     = Convert.ToHexString(SHA256.HashData(Encoding.UTF8.GetBytes(rawToken))).ToLower();

        await _accountRepository.UpdateResetTokenAsync(user.Id, hash, now.AddMinutes(15));

        // 寄重設連結
        var resetLink = $"{_config["FrontEnd:BaseUrl"]}/resetpassword?token={rawToken}";
        await _emailService.SendForgotPasswordEmailAsync(user.Email, resetLink);
    }

    // ── Reset password ─────────────────────────────────────────────────────

    public async Task<ResetPasswordResultDto> ResetPasswordAsync(ResetPasswordDto dto)
    {
        var now  = DateTime.UtcNow;
        var hash = Convert.ToHexString(SHA256.HashData(Encoding.UTF8.GetBytes(dto.Token.Trim()))).ToLower();

        // 取得 user 並驗證 token 狀態（未使用、未過期）
        var user = await _accountRepository.GetByResetCodeHashAsync(hash);
        if (user == null
            || user.IsResetPasswordConfirmCodeUsed == true
            || user.ResetPasswordConfirmCodeExpiry == null
            || user.ResetPasswordConfirmCodeExpiry <= now)
            return new ResetPasswordResultDto { IsSuccess = false, Message = "連結已失效或過期，請重新申請" };

        // 密碼歷史比對（最近 3 次）
        var history = await _accountRepository.GetPasswordHistoryAsync(user.Id, 3);
        foreach (var record in history)
        {
            var verifyResult = _passwordHasher.VerifyHashedPassword(user, record.HashedPassword, dto.NewPassword);
            if (verifyResult != PasswordVerificationResult.Failed)
                return new ResetPasswordResultDto { IsSuccess = false, Message = "新密碼不可與近三次使用過的密碼相同" };
        }

        // 所有檢查都通過才原子地把 token 標為已使用（防 race condition：併發請求只有一個會成功）
        var affected = await _accountRepository.MarkResetTokenUsedAsync(hash, now);
        if (affected == 0)
            return new ResetPasswordResultDto { IsSuccess = false, Message = "連結已失效或過期，請重新申請" };

        // 更新密碼
        var newHashedPassword = _passwordHasher.HashPassword(user, dto.NewPassword);
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

    public async Task RegisterAsync(RegisterDto dto)
    {
        var exists = await _accountRepository.AccountOrEmailExistsAsync(dto.Account, dto.Email);
        if (exists)
            throw new InvalidOperationException("ACCOUNT_OR_EMAIL_EXISTS");

        var (rawToken, hash) = HashHelper.ProduceConfirmCode();

        var tempUser = new User();
        var hashedPassword = _passwordHasher.HashPassword(tempUser, dto.Password);

        var user = new User
        {
            Account                  = dto.Account,
            HashedPassword           = hashedPassword,
            Email                    = dto.Email,
            UserName                 = dto.UserName,
            Mobile                   = dto.Mobile,
            IsConfirmed              = false,
            IsActive                 = true,
            NewMemberConfirmCode     = hash,
            NewMemberConfirmCodeExpiry = DateTime.UtcNow.AddHours(24)
        };

        await _accountRepository.CreateUserAsync(user);

        var activationUrl = $"{_config["FrontEnd:BaseUrl"]}/activate?token={rawToken}";
        await _emailService.SendActivationEmailAsync(user.Email, activationUrl);
    }

    // ── Activate account ───────────────────────────────────────────────────

    public async Task<ActivateAccountResultDto> ActivateAccountAsync(string rawToken)
    {
        var hash = HashHelper.HashConfirmCode(rawToken);

        var user = await _accountRepository.GetByActivationCodeHashAsync(hash);

        if (user == null)
            return new ActivateAccountResultDto { IsSuccess = false, ErrorCode = "NOT_FOUND" };

        if (user.IsConfirmed)
            return new ActivateAccountResultDto { IsSuccess = false, ErrorCode = "NOT_FOUND" };

        if (DateTime.UtcNow > user.NewMemberConfirmCodeExpiry)
            return new ActivateAccountResultDto { IsSuccess = false, ErrorCode = "TOKEN_EXPIRED" };

        await _accountRepository.ActivateUserAsync(user.Id);
        return new ActivateAccountResultDto { IsSuccess = true };
    }

    // ── Resend activation email ────────────────────────────────────────────

    public async Task ResendActivationEmailAsync(ResendActivationDto dto, string ipAddress)
    {
        const string endPoint = "resend-activation";
        var now   = DateTime.UtcNow;
        var email = dto.Email.Trim().ToLower();

        // IP 限流：1 小時 5 次
        var ipCount = await _accountRepository.CountRateLimitAsync(ipAddress, endPoint, byIp: true, since: now.AddHours(-1));
        if (ipCount >= 5)
        {
            var oldest = await _accountRepository.GetOldestRateLimitTimeAsync(ipAddress, endPoint, since: now.AddHours(-1));
            var retryAfter = oldest.HasValue
                ? (int)Math.Ceiling((oldest.Value.AddHours(1) - now).TotalSeconds)
                : 3600;
            throw new RateLimitException(Math.Max(retryAfter, 1));
        }

        // Email 冷卻：60 秒
        var recentCount = await _accountRepository.CountRateLimitAsync(email, endPoint, byIp: false, since: now.AddSeconds(-60));
        if (recentCount >= 1)
        {
            var latest = await _accountRepository.GetLatestRateLimitTimeAsync(email, endPoint, since: now.AddSeconds(-60));
            var retryAfter = latest.HasValue
                ? (int)Math.Ceiling((latest.Value.AddSeconds(60) - now).TotalSeconds)
                : 60;
            throw new RateLimitException(Math.Max(retryAfter, 1));
        }

        await _accountRepository.LogRateLimitAsync(new RateLimitLog
        {
            IpAddress   = ipAddress,
            EndPoint    = endPoint,
            Identity    = email,
            IsSuccess   = true,
            RequestedAt = now
        });

        // Silent fail：防止帳號枚舉
        var user = await _accountRepository.GetPendingUserByEmailAsync(email);
        if (user == null) return;

        var (rawToken, hash) = HashHelper.ProduceConfirmCode();
        await _accountRepository.UpdateActivationTokenAsync(user.Id, hash, now.AddHours(24));

        var activationUrl = $"{_config["FrontEnd:BaseUrl"]}/activate?token={rawToken}";
        await _emailService.SendActivationEmailAsync(user.Email, activationUrl);
    }
}
