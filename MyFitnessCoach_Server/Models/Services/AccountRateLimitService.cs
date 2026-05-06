using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.Repositories;
using MyFitnessCoach_Server.Utilities;

namespace MyFitnessCoach_Server.Models.Services;

public class AccountRateLimitService : IAccountRateLimitService
{
    private readonly IAccountRepository _accountRepository;

    public AccountRateLimitService(IAccountRepository accountRepository)
    {
        _accountRepository = accountRepository;
    }

    public async Task VerifyIPRequestRateLimit(string ipAddress, string email, DateTime now)
    {
        const string endPoint = "forgotpassword";

        await EnsureIpLimitAsync(ipAddress, endPoint, now, maxCount: 100, window: TimeSpan.FromHours(1));
        await EnsureIdentityCooldownAsync(email, endPoint, now, maxCount: 100, window: TimeSpan.FromSeconds(60));
        await EnsureIdentityLimitAsync(email, endPoint, now, maxCount: 100, window: TimeSpan.FromHours(1));
        await EnsureIdentityLimitAsync(email, endPoint, now, maxCount: 100, window: TimeSpan.FromHours(24));
    }

    public async Task EnsureRegisterAllowedAsync(string ipAddress, DateTime now)
    {
        const string endPoint = "register";

        await EnsureIpLimitAsync(ipAddress, endPoint, now, maxCount: 10, window: TimeSpan.FromHours(1));
    }

    public async Task EnsureResendActivationAllowedAsync(string ipAddress, string email, DateTime now)
    {
        const string endPoint = "resend-activation";

        await EnsureIpLimitAsync(ipAddress, endPoint, now, maxCount: 5, window: TimeSpan.FromHours(1));
        await EnsureIdentityCooldownAsync(email, endPoint, now, maxCount: 1, window: TimeSpan.FromSeconds(60));
    }

    public Task VerifyEmailSendRateLimit(string ipAddress, string endPoint, string identity, DateTime requestedAt)
    {
        return _accountRepository.LogRateLimitAsync(new RateLimitLog
        {
            IpAddress   = ipAddress,
            EndPoint    = endPoint,
            Identity    = identity,
            IsSuccess   = true,
            RequestedAt = requestedAt
        });
    }

    private async Task EnsureIpLimitAsync(string ipAddress, string endPoint, DateTime now, int maxCount, TimeSpan window)
    {
        var since = now.Subtract(window);
        var ipCount = await _accountRepository.CountRateLimitAsync(ipAddress, endPoint, byIp: true, since);
        if (ipCount < maxCount) return;

        var oldest = await _accountRepository.GetOldestRateLimitTimeAsync(ipAddress, endPoint, since);
        var retryAfter = oldest.HasValue
            ? (int)Math.Ceiling((oldest.Value.Add(window) - now).TotalSeconds)
            : (int)window.TotalSeconds;

        throw new RateLimitException(Math.Max(retryAfter, 1));
    }

    private async Task EnsureIdentityCooldownAsync(string identity, string endPoint, DateTime now, int maxCount, TimeSpan window)
    {
        var since = now.Subtract(window);
        var recentCount = await _accountRepository.CountRateLimitAsync(identity, endPoint, byIp: false, since);
        if (recentCount < maxCount) return;

        var latest = await _accountRepository.GetLatestRateLimitTimeAsync(identity, endPoint, since);
        var retryAfter = latest.HasValue
            ? (int)Math.Ceiling((latest.Value.Add(window) - now).TotalSeconds)
            : (int)window.TotalSeconds;

        throw new RateLimitException(Math.Max(retryAfter, 1));
    }

    private async Task EnsureIdentityLimitAsync(string identity, string endPoint, DateTime now, int maxCount, TimeSpan window)
    {
        var count = await _accountRepository.CountRateLimitAsync(identity, endPoint, byIp: false, now.Subtract(window));
        if (count >= maxCount)
            throw new RateLimitException((int)window.TotalSeconds);
    }
}
