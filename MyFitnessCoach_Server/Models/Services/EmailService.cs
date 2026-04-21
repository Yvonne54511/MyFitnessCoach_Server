using System.Net;
using System.Net.Mail;

namespace MyFitnessCoach_Server.Models.Services;

public class EmailService : IEmailService
{
    private readonly IConfiguration _config;

    public EmailService(IConfiguration config)
    {
        _config = config;
    }

    public async Task SendForgotPasswordEmailAsync(string toEmail, string resetLink)
    {
        var subject = "【MyFitnessCoach】重設密碼";
        var body = $"""
            <p>您好，</p>
            <p>我們收到了您的密碼重設請求。請點擊下方連結重設密碼（連結將於 15 分鐘後失效）：</p>
            <p><a href="{resetLink}">{resetLink}</a></p>
            <p>若非您本人操作，請忽略此信件。</p>
            <p>MyFitnessCoach 團隊</p>
            """;

        await SendAsync(toEmail, subject, body);
    }

    public async Task SendPasswordChangedNotificationAsync(string toEmail)
    {
        var subject = "【MyFitnessCoach】密碼已變更";
        var body = """
            <p>您好，</p>
            <p>您的 MyFitnessCoach 帳號密碼已成功變更。</p>
            <p>若非您本人操作，請立即聯絡客服。</p>
            <p>MyFitnessCoach 團隊</p>
            """;

        await SendAsync(toEmail, subject, body);
    }

    private async Task SendAsync(string toEmail, string subject, string body)
    {
        var smtpHost    = _config["Email:SmtpHost"]!;
        var smtpPort    = int.Parse(_config["Email:SmtpPort"]!);
        var senderEmail = _config["Email:SenderEmail"]!;
        var senderName  = _config["Email:SenderName"]!;
        var username    = _config["Email:Username"]!;
        var password    = _config["Email:Password"]!;

        using var client = new SmtpClient(smtpHost, smtpPort)
        {
            Credentials = new NetworkCredential(username, password),
            EnableSsl   = true
        };

        using var message = new MailMessage
        {
            From       = new MailAddress(senderEmail, senderName),
            Subject    = subject,
            Body       = body,
            IsBodyHtml = true
        };
        message.To.Add(toEmail);

        await client.SendMailAsync(message);
    }
}
