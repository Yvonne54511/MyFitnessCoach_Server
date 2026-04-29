namespace MyFitnessCoach_Server.Models.Services;

public interface IReservationEmailService
{
    Task SendReservationConfirmationEmailAsync(string toEmail, string memberName, string instructorName, DateTime startTime, string target);
    Task SendCancellationEmailAsync(string toEmail, string memberName, string instructorName, DateTime startTime);
}
