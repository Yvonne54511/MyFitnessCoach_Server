namespace MyFitnessCoach_Server.Models.Services;

public interface IEmailService
{
    Task SendForgotPasswordEmailAsync(string toEmail, string resetLink);
    Task SendPasswordChangedNotificationAsync(string toEmail);
}
