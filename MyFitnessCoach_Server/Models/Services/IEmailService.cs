namespace MyFitnessCoach_Server.Models.Services;

public interface IEmailService
{
    Task SendActivationEmailAsync(string toEmail, string activationUrl);
    Task SendForgotPasswordEmailAsync(string toEmail, string resetLink);
    Task SendPasswordChangedNotificationAsync(string toEmail);
}
