using System.Net;
using System.Net.Mail;
using Microsoft.Extensions.Options;
using MyFitnessCoach_Server.Utilities;

namespace MyFitnessCoach_Server.Models.Services;

public class PasswordEmailService : IPasswordEmailService
{
    private readonly EmailSettings _settings;

    public PasswordEmailService(IOptions<EmailSettings> options)
    {
        _settings = options.Value;
    }

    public async Task SendActivationEmailAsync(string toEmail, string activationUrl)
    {
        var subject = "【MyFitnessCoach】啟用您的帳號";
        var body = $"""
            <!DOCTYPE html>
            <html lang="zh-TW">
            <head>
              <meta charset="UTF-8" />
              <meta name="viewport" content="width=device-width, initial-scale=1.0" />
              <title>啟用帳號</title>
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
                            帳號啟用
                          </h1>
                          <p style="font-size:15px;line-height:1.8;color:#1a1613;margin:0 0 12px;">
                            您好，
                          </p>
                          <p style="font-size:15px;line-height:1.8;color:#6b5e52;margin:0 0 32px;">
                            感謝您加入 MyFitnessCoach！請點擊下方按鈕啟用您的帳號，此連結將於 <strong style="color:#1a1613;">24 小時</strong>後失效。
                          </p>

                          <!-- CTA Button -->
                          <table cellpadding="0" cellspacing="0" style="margin:0 auto 32px;">
                            <tr>
                              <td style="background-color:#c4a882;border-radius:12px;text-align:center;">
                                <a href="{activationUrl}"
                                   style="display:inline-block;padding:14px 40px;font-family:'Noto Sans TC','DM Sans',Arial,sans-serif;font-size:15px;font-weight:600;color:#1a1613;text-decoration:none;letter-spacing:0.06em;border-radius:12px;">
                                  啟用我的帳號
                                </a>
                              </td>
                            </tr>
                          </table>

                          <!-- Fallback link -->
                          <div style="background-color:#f5f0eb;border-radius:10px;padding:16px 20px;margin-bottom:28px;">
                            <p style="font-size:12px;color:#6b5e52;margin:0 0 6px;">若按鈕無法點擊，請複製以下連結至瀏覽器：</p>
                            <p style="font-size:12px;color:#a68b6b;word-break:break-all;margin:0;">
                              <a href="{activationUrl}" style="color:#a68b6b;">{activationUrl}</a>
                            </p>
                          </div>

                          <p style="font-size:13px;line-height:1.7;color:#6b5e52;margin:0;">
                            若非您本人註冊，請放心忽略此信件，您的帳號不會有任何異動。
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
                            密碼重設請求
                          </h1>
                          <p style="font-size:15px;line-height:1.8;color:#1a1613;margin:0 0 12px;">
                            您好，
                          </p>
                          <p style="font-size:15px;line-height:1.8;color:#6b5e52;margin:0 0 32px;">
                            我們收到了您的密碼重設請求。請點擊下方按鈕重設密碼，此連結將於 <strong style="color:#1a1613;">15 分鐘</strong>後失效。
                          </p>

                          <!-- CTA Button -->
                          <table cellpadding="0" cellspacing="0" style="margin:0 auto 32px;">
                            <tr>
                              <td style="background-color:#c4a882;border-radius:12px;text-align:center;">
                                <a href="{resetLink}"
                                   style="display:inline-block;padding:14px 40px;font-family:'Noto Sans TC','DM Sans',Arial,sans-serif;font-size:15px;font-weight:600;color:#1a1613;text-decoration:none;letter-spacing:0.06em;border-radius:12px;">
                                  重設我的密碼
                                </a>
                              </td>
                            </tr>
                          </table>

                          <!-- Fallback link -->
                          <div style="background-color:#f5f0eb;border-radius:10px;padding:16px 20px;margin-bottom:28px;">
                            <p style="font-size:12px;color:#6b5e52;margin:0 0 6px;">若按鈕無法點擊，請複製以下連結至瀏覽器：</p>
                            <p style="font-size:12px;color:#a68b6b;word-break:break-all;margin:0;">
                              <a href="{resetLink}" style="color:#a68b6b;">{resetLink}</a>
                            </p>
                          </div>

                          <p style="font-size:13px;line-height:1.7;color:#6b5e52;margin:0;">
                            若非您本人操作，請放心忽略此信件，您的帳號不會有任何異動。
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

        await SendAsync(toEmail, subject, body);
    }

    public async Task SendPasswordChangedNotificationAsync(string toEmail)
    {
        var subject = "【MyFitnessCoach】密碼已變更";
        var body = """
            <!DOCTYPE html>
            <html lang="zh-TW">
            <head>
              <meta charset="UTF-8" />
              <meta name="viewport" content="width=device-width, initial-scale=1.0" />
              <title>密碼已變更</title>
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
                            密碼變更通知
                          </h1>
                          <p style="font-size:15px;line-height:1.8;color:#1a1613;margin:0 0 12px;">
                            您好，
                          </p>
                          <p style="font-size:15px;line-height:1.8;color:#6b5e52;margin:0 0 28px;">
                            您的 <strong style="color:#1a1613;">MyFitnessCoach</strong> 帳號密碼已成功變更。
                          </p>

                          <!-- Security notice -->
                          <div style="background-color:#f5f0eb;border-left:3px solid #c4a882;border-radius:0 10px 10px 0;padding:16px 20px;margin-bottom:28px;">
                            <p style="font-size:13px;font-weight:600;color:#1a1613;margin:0 0 6px;letter-spacing:0.04em;">
                              &#x26A0;&#xFE0F;&nbsp; 安全提醒
                            </p>
                            <p style="font-size:13px;line-height:1.7;color:#6b5e52;margin:0;">
                              若非您本人操作，請立即聯絡我們的客服團隊，以保護您的帳號安全。
                            </p>
                          </div>

                          <p style="font-size:13px;line-height:1.7;color:#6b5e52;margin:0;">
                            感謝您使用 MyFitnessCoach，如有任何疑問歡迎隨時與我們聯繫。
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
