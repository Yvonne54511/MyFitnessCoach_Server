namespace MyFitnessCoach_Server.Models.Services;

public interface IEmailService
{
    Task SendForgotPasswordEmailAsync(string toEmail, string resetLink);
    Task SendPasswordChangedNotificationAsync(string toEmail);
    Task SendReservationConfirmationEmailAsync(string toEmail, string memberName, string instructorName, DateTime startTime, string target);
}
