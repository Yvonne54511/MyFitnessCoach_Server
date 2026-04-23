using MailKit.Net.Smtp;
using MailKit.Security;
using MimeKit;
using System.Text;
using Microsoft.Extensions.Configuration;

namespace MyFitnessCoach_Server.Models.Services;

public class ReservationEmailService : IReservationEmailService
{
    private readonly IConfiguration _config;

    public ReservationEmailService(IConfiguration config)
    {
        _config = config;
    }

    public async Task SendReservationConfirmationEmailAsync(string toEmail, string memberName, string instructorName, DateTime startTime, string target)
    {
        var subject = "【MyFitnessCoach】預約成功通知";
        var endTime = startTime.AddHours(1); // 假設每堂課一小時

        var body = $"""
            <div style="font-family: sans-serif; line-height: 1.6; color: #333;">
                <h2>預約成功！</h2>
                <p>親愛的 {memberName} 您好：</p>
                <p>您已成功預約 <strong>MyFitnessCoach</strong> 的課程，以下是您的預約資訊：</p>
                <ul style="list-style: none; padding: 0;">
                    <li><strong>課程教練：</strong> {instructorName}</li>
                    <li><strong>課程時間：</strong> {startTime:yyyy/MM/dd HH:mm}</li>
                    <li><strong>課程目標：</strong> {target}</li>
                </ul>
                <p>我們已將行程附件 (.ics) 夾帶於此信件中，您可以點擊附件將行程加入您的電腦或手機日曆。</p>
                <hr>
                <p>期待在課堂上見到您！</p>
                <p>MyFitnessCoach 團隊</p>
            </div>
            """;

        // 產生 iCalendar (.ics) 內容
        var icsContent = new StringBuilder();
        icsContent.AppendLine("BEGIN:VCALENDAR");
        icsContent.AppendLine("VERSION:2.0");
        icsContent.AppendLine("PRODID:-//MyFitnessCoach//Reservation System//TW");
        icsContent.AppendLine("BEGIN:VEVENT");
        icsContent.AppendLine($"UID:{Guid.NewGuid()}");
        icsContent.AppendLine($"DTSTAMP:{DateTime.UtcNow:yyyyMMddTHHmmssZ}");
        icsContent.AppendLine($"DTSTART:{startTime.ToUniversalTime():yyyyMMddTHHmmssZ}");
        icsContent.AppendLine($"DTEND:{endTime.ToUniversalTime():yyyyMMddTHHmmssZ}");
        icsContent.AppendLine($"SUMMARY:MyFitnessCoach 課程 - 教練: {instructorName}");
        icsContent.AppendLine($"DESCRIPTION:您的預約目標: {target}");
        icsContent.AppendLine("LOCATION:MyFitnessCoach 健身房");
        icsContent.AppendLine("END:VEVENT");
        icsContent.AppendLine("END:VCALENDAR");

        await SendAsync(toEmail, subject, body, icsContent.ToString());
    }

    private async Task SendAsync(string toEmail, string subject, string bodyHtml, string? icsContent = null)
    {
        var smtpHost = _config["Email:SmtpHost"] ?? "smtp.gmail.com";
        var smtpPort = int.Parse(_config["Email:SmtpPort"] ?? "587");
        var senderEmail = _config["Email:SenderEmail"] ?? "";
        var senderName = _config["Email:SenderName"] ?? "MyFitnessCoach";
        var username = _config["Email:Username"] ?? "";
        var password = _config["Email:Password"] ?? "";

        var message = new MimeMessage();
        message.From.Add(new MailboxAddress(senderName, senderEmail));
        message.To.Add(new MailboxAddress("", toEmail));
        message.Subject = subject;

        var bodyBuilder = new BodyBuilder { HtmlBody = bodyHtml };

        if (!string.IsNullOrEmpty(icsContent))
        {
            // 加入日曆附件
            var calendarBytes = Encoding.UTF8.GetBytes(icsContent);
            var attachment = bodyBuilder.Attachments.Add("reservation.ics", calendarBytes, new ContentType("text", "calendar"));
            attachment.ContentDisposition!.Parameters.Add("method", "REQUEST");
        }

        message.Body = bodyBuilder.ToMessageBody();

        using var client = new SmtpClient();
        try
        {
            await client.ConnectAsync(smtpHost, smtpPort, SecureSocketOptions.StartTls);
            await client.AuthenticateAsync(username, password);
            await client.SendAsync(message);
            await client.DisconnectAsync(true);
        }
        catch (Exception ex)
        {
            throw new Exception("郵件發送失敗", ex);
        }
    }
}
