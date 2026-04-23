using System.Net;
using System.Net.Mail;
using Microsoft.Extensions.Options;
using MyFitnessCoach_Server.Utilities;

namespace MyFitnessCoach_Server.Models.Services;

public class LoginEmailService : ILoginEmailService
{
    private readonly EmailSettings _settings;

    public LoginEmailService(IOptions<EmailSettings> options)
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
            <!DOCTYPE html>
            <html lang="zh-TW">
            <head>
              <meta charset="UTF-8" />
              <meta name="viewport" content="width=device-width, initial-scale=1.0" />
              <title>重設密碼</title>
            </head>
            <body style="margin:0;padding:0;background-color:#f5f0eb;font-family:'Noto Sans TC','DM Sans',Arial,sans-serif;color:#1a1613;">
              <table width="100%" cellpadding="0" cellspacing="0" style="background-color:#f5f0eb;padding:40px 16px;">
                <tr>
                  <td align="center">
                    <table width="100%" cellpadding="0" cellspacing="0" style="max-width:560px;">
                      <tr>
                        <td style="background-color:#1a1613;border-radius:16px 16px 0 0;padding:36px 40px;text-align:center;">
                          <div style="font-family:'Cormorant Garamond',Georgia,serif;font-size:28px;font-weight:600;color:#c4a882;letter-spacing:0.08em;">
                            MyFitnessCoach
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td style="background-color:#eae4dc;padding:40px 40px 32px;border-left:1px solid #d4ccc2;border-right:1px solid #d4ccc2;">
                          <h1 style="font-family:'Cormorant Garamond',Georgia,serif;font-size:22px;font-weight:600;color:#1a1613;margin:0 0 20px;">
                            密碼重設請求
                          </h1>
                          <p>您好，我們收到了您的密碼重設請求。請點擊下方按鈕重設密碼，此連結將於 15 分鐘後失效。</p>
                          <p><a href="{resetLink}" style="display:inline-block;padding:14px 40px;background:#c4a882;color:#1a1613;text-decoration:none;border-radius:12px;font-weight:600;">重設我的密碼</a></p>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </body>
            </html>
            """;

        await SendAsync(toEmail, subject, body);
    }

    public async Task SendPasswordChangedNotificationAsync(string toEmail)
    {
        var subject = "【MyFitnessCoach】密碼已變更";
        var body = "您的 MyFitnessCoach 帳號密碼已成功變更。若非您本人操作，請立即聯絡客服。";

        await SendAsync(toEmail, subject, body);
    }

    private async Task SendAsync(string toEmail, string subject, string body)
    {
        var smtpPort = int.TryParse(_settings.SmtpPort, out var p) ? p : 587;

        using var client = new SmtpClient(_settings.SmtpServer, smtpPort)
        {
            Credentials = new NetworkCredential(_settings.SenderEmail, _settings.ApiKey),
            EnableSsl = true
        };

        var mailMessage = new MailMessage
        {
            From = new MailAddress(_settings.SenderEmail, _settings.SenderName),
            Subject = subject,
            Body = body,
            IsBodyHtml = true
        };
        mailMessage.To.Add(toEmail);

        await client.SendMailAsync(mailMessage);
    }
}
