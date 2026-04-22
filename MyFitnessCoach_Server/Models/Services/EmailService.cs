using System.Net;
using System.Net.Mail;
using Microsoft.Extensions.Options;
using MyFitnessCoach_Server.Utilities;

namespace MyFitnessCoach_Server.Models.Services;

public class EmailService : IEmailService
{
    private readonly EmailSettings _settings;

    public EmailService(IOptions<EmailSettings> options)
    {
        _settings = options.Value;
    }

    public async Task SendActivationEmailAsync(string toEmail, string activationUrl)
    {
        var subject = "【MyFitnessCoach】啟用您的帳號";
        var body = $"""
            <p>您好，</p>
            <p>感謝您加入 MyFitnessCoach！請點擊下方連結以啟用您的帳號（連結將於 24 小時後失效）：</p>
            <p><a href="{activationUrl}" style="display:inline-block;padding:10px 20px;background:#1a1613;color:#f5f0eb;border-radius:8px;text-decoration:none;">啟用帳號</a></p>
            <p>如果按鈕無法點擊，請複製並貼上以下連結：<br/>{activationUrl}</p>
            <p>這封信是由系統自動發出，請勿直接回覆。</p>
            <p>MyFitnessCoach 團隊</p>
            """;

        await SendAsync(toEmail, subject, body);
    }

    public async Task SendForgotPasswordEmailAsync(string toEmail, string resetLink)
    {
        var subject = "【MyFitnessCoach】重設密碼";
        var body = $"""
            <p>您好，</p>
            <p>我們收到了您的密碼重設請求。請點擊下方連結重設密碼（連結將於 15 分鐘後失效）：</p>
            <p><a href="{resetLink}" style="display:inline-block;padding:10px 20px;background:#1a1613;color:#f5f0eb;border-radius:8px;text-decoration:none;">重設密碼</a></p>
            <p>如果按鈕無法點擊，請複製並貼上以下連結：<br/>{resetLink}</p>
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
        var smtpPort = int.TryParse(_settings.SmtpPort, out var p) ? p : 587;

        using var client = new SmtpClient(_settings.SmtpServer, smtpPort)
        {
            Credentials = new NetworkCredential(_settings.SenderEmail, _settings.ApiKey),
            EnableSsl   = true
        };

        using var message = new MailMessage
        {
            From       = new MailAddress(_settings.SenderEmail, _settings.SenderName),
            Subject    = subject,
            Body       = body,
            IsBodyHtml = true
        };
        message.To.Add(toEmail);

        await client.SendMailAsync(message);
    }
}
