using MailKit.Net.Smtp;
using MailKit.Security;
using MimeKit;
using System.Text;
using Microsoft.Extensions.Options;
using MyFitnessCoach_Server.Utilities;

namespace MyFitnessCoach_Server.Models.Services;

public class ReservationEmailService : IReservationEmailService
{
    private readonly EmailSettings _settings;

    public ReservationEmailService(IOptions<EmailSettings> options)
    {
        _settings = options.Value;
    }

    public async Task SendReservationConfirmationEmailAsync(string toEmail, string memberName, string instructorName, DateTime startTime, string target)
    {
        var subject = "【MyFitnessCoach】預約成功通知";
        var endTime = startTime.AddHours(1); // 假設每堂課一小時

        var body = $"""
            <!DOCTYPE html>
            <html lang="zh-TW">
            <head>
              <meta charset="UTF-8" />
              <meta name="viewport" content="width=device-width, initial-scale=1.0" />
              <title>預約成功</title>
            </head>
            <body style="margin:0;padding:0;background-color:#f5f0eb;font-family:'Noto Sans TC','DM Sans',Arial,sans-serif;color:#1a1613;">
              <table width="100%" cellpadding="0" cellspacing="0" style="background-color:#f5f0eb;padding:40px 16px;">
                <tr>
                  <td align="center">
                    <table width="100%" cellpadding="0" cellspacing="0" style="max-width:560px;">

                      <!-- Header -->
                      <tr>
                        <td style="background-color:#1a1613;border-radius:16px 16px 0 0;padding:36px 40px;text-align:center;">
                          <div style="font-family:'Cormorant Garamond',Georgia,serif;font-size:28px;font-weight:600;color:#c4a882;letter-spacing:0.08em;">
                            MyFitnessCoach
                          </div>
                          <div style="font-family:'Noto Sans TC','DM Sans',Arial,sans-serif;font-size:13px;color:#6b5e52;margin-top:6px;letter-spacing:0.12em;text-transform:uppercase;">
                            Your Personal Fitness Journey
                          </div>
                        </td>
                      </tr>

                      <!-- Body Card -->
                      <tr>
                        <td style="background-color:#eae4dc;padding:40px 40px 32px;border-left:1px solid #d4ccc2;border-right:1px solid #d4ccc2;">
                          <h1 style="font-family:'Cormorant Garamond',Georgia,serif;font-size:22px;font-weight:600;color:#1a1613;margin:0 0 20px;letter-spacing:0.04em;">
                            預約成功確認
                          </h1>
                          <p style="font-size:15px;line-height:1.8;color:#1a1613;margin:0 0 12px;">
                            親愛的 {memberName} 您好，
                          </p>
                          <p style="font-size:15px;line-height:1.8;color:#6b5e52;margin:0 0 28px;">
                            您已成功預約課程。我們非常期待能在課堂上與您見面，以下是您的預約明細：
                          </p>

                          <!-- Reservation Details Table -->
                          <div style="background-color:#f5f0eb;border-radius:12px;padding:24px;margin-bottom:28px;border:1px solid #d4ccc2;">
                            <table width="100%" cellpadding="0" cellspacing="0">
                              <tr>
                                <td style="padding-bottom:12px;font-size:14px;color:#6b5e52;width:80px;">課程教練</td>
                                <td style="padding-bottom:12px;font-size:14px;color:#1a1613;font-weight:600;">{instructorName}</td>
                              </tr>
                              <tr>
                                <td style="padding-bottom:12px;font-size:14px;color:#6b5e52;">課程時間</td>
                                <td style="padding-bottom:12px;font-size:14px;color:#1a1613;font-weight:600;">{startTime:yyyy/MM/dd HH:mm}</td>
                              </tr>
                              <tr>
                                <td style="font-size:14px;color:#6b5e52;">課程目標</td>
                                <td style="font-size:14px;color:#1a1613;font-weight:600;">{target}</td>
                              </tr>
                            </table>
                          </div>

                          <div style="background-color:#fdfaf5;border-left:3px solid #c4a882;border-radius:0 10px 10px 0;padding:16px 20px;margin-bottom:28px;">
                            <p style="font-size:13px;line-height:1.7;color:#6b5e52;margin:0;">
                              &#x1F4C5;&nbsp; 我們已將行程附件 (.ics) 夾帶於此信件中，您可以點擊附件將課程加入您的個人日曆。
                            </p>
                          </div>

                          <p style="font-size:13px;line-height:1.7;color:#6b5e52;margin:0;">
                            如果您需要變更或取消預約，請至少於課程開始前 40 分鐘透過系統進行操作。
                          </p>
                        </td>
                      </tr>

                      <!-- Footer -->
                      <tr>
                        <td style="background-color:#1a1613;border-radius:0 0 16px 16px;padding:24px 40px;text-align:center;">
                          <p style="font-size:12px;color:#6b5e52;margin:0 0 6px;letter-spacing:0.06em;">
                            © 2026 MyFitnessCoach．All rights reserved.
                          </p>
                          <p style="font-size:12px;color:#6b5e52;margin:0;">
                            此為系統自動發送郵件，請勿直接回覆。
                          </p>
                        </td>
                      </tr>

                    </table>
                  </td>
                </tr>
              </table>
            </body>
            </html>
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
        var smtpHost = _settings.SmtpServer ?? "smtp.gmail.com";
        var smtpPort = int.Parse(_settings.SmtpPort ?? "587");
        var senderEmail = _settings.SenderEmail;
        var senderName = _settings.SenderName;
        var username = _settings.SenderEmail; // 通常 Username 就是 SenderEmail
        var password = _settings.ApiKey;      // 密碼存放在 ApiKey 欄位

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
