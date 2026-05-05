namespace MyFitnessCoach_Server.Models.Services;

public interface IAccountRateLimitService
{
    Task VerifyIPRequestRateLimit(string ipAddress, string email, DateTime now);
    Task EnsureRegisterAllowedAsync(string ipAddress, DateTime now);
    Task EnsureResendActivationAllowedAsync(string ipAddress, string email, DateTime now);
    Task VerifyEmailSendRateLimit(string ipAddress, string endPoint, string identity, DateTime requestedAt);
}
