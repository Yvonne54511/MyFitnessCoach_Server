namespace MyFitnessCoach_Server.Models.Services;

<<<<<<<< HEAD:MyFitnessCoach_Server/Models/Services/ILoginEmailService.cs
public interface ILoginEmailService
========
public interface IPasswordEmailService
>>>>>>>> member:MyFitnessCoach_Server/Models/Services/IPasswordEmailService.cs
{
    Task SendActivationEmailAsync(string toEmail, string activationUrl);
    Task SendForgotPasswordEmailAsync(string toEmail, string resetLink);
    Task SendPasswordChangedNotificationAsync(string toEmail);
}
