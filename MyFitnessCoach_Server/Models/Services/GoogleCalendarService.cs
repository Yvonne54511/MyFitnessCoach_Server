using Google.Apis.Auth.OAuth2;
using Google.Apis.Auth.OAuth2.Flows;
using Google.Apis.Auth.OAuth2.Responses;
using Google.Apis.Calendar.v3;
using Google.Apis.Calendar.v3.Data;
using Google.Apis.Services;
using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Models.Services;

public class GoogleCalendarService
{
    private readonly IConfiguration _config;
    private readonly MyFitnessCoachDbContext _db;

    public GoogleCalendarService(IConfiguration config, MyFitnessCoachDbContext db)
    {
        _config = config;
        _db = db;
    }

    public async Task<bool> SaveTokenFromCodeAsync(int userId, string code, string redirectUri)
    {
        var clientId = _config["Google:ClientId"];
        var clientSecret = _config["Google:ClientSecret"];

        if (string.IsNullOrEmpty(clientId) || string.IsNullOrEmpty(clientSecret))
        {
            var msg = $"後端設定缺失：ClientId={(string.IsNullOrEmpty(clientId) ? "空" : "有值")}, ClientSecret={(string.IsNullOrEmpty(clientSecret) ? "空" : "有值")}";
            System.Diagnostics.Debug.WriteLine(msg);
            throw new Exception(msg);
        }

        try 
        {
            System.Diagnostics.Debug.WriteLine($"嘗試換票: ClientId 開始於 {clientId.Substring(0, Math.Min(5, clientId.Length))}...");
            var flow = new GoogleAuthorizationCodeFlow(new GoogleAuthorizationCodeFlow.Initializer
            {
                ClientSecrets = new ClientSecrets { ClientId = clientId, ClientSecret = clientSecret },
                Scopes = new[] { 
                    CalendarService.Scope.CalendarEvents,
                    "https://www.googleapis.com/auth/gmail.send"
                }
            });

            // 這裡最容易出錯：如果 redirectUri 與 Google Console 設定的不完全一致，會拋出 Exception
            var tokenResponse = await flow.ExchangeCodeForTokenAsync(userId.ToString(), code, redirectUri, CancellationToken.None);

            if (tokenResponse != null)
            {
                var existingLogin = await _db.UserExternalLogins
                    .FirstOrDefaultAsync(l => l.UserId == userId && l.LoginProvider == "GoogleCalendar");

                if (!string.IsNullOrEmpty(tokenResponse.RefreshToken))
                {
                    if (existingLogin == null)
                    {
                        _db.UserExternalLogins.Add(new UserExternalLogin
                        {
                            UserId = userId,
                            LoginProvider = "GoogleCalendar",
                            ProviderKey = tokenResponse.RefreshToken,
                            ProviderDisplayName = "Google 同步"
                        });
                    }
                    else
                    {
                        existingLogin.ProviderKey = tokenResponse.RefreshToken;
                    }
                    await _db.SaveChangesAsync();
                    return true;
                }
                else if (existingLogin != null && !string.IsNullOrEmpty(existingLogin.ProviderKey))
                {
                    // 如果沒有拿到新的 RefreshToken，但資料庫本來就有，也算成功
                    return true;
                }
            }
            return false;
        }
        catch (Exception ex)
        {
            // 這裡會抓到 Google 回傳的具體錯誤 (例如 redirect_uri_mismatch)
            throw new Exception($"Google 換票失敗: {ex.Message}", ex);
        }
    }

    public async Task<string> AddEventAsync(int userId, string summary, string description, DateTime startTime, DateTime endTime)
    {
        var clientId = _config["Google:ClientId"];
        var clientSecret = _config["Google:ClientSecret"];
        
        var loginInfo = await _db.UserExternalLogins
            .FirstOrDefaultAsync(l => l.UserId == userId && l.LoginProvider == "GoogleCalendar");

        if (loginInfo == null || string.IsNullOrEmpty(loginInfo.ProviderKey)) 
        {
            System.Diagnostics.Debug.WriteLine($"[Google Sync] 跳過同步：找不到 UserId {userId} 的授權紀錄");
            return null;
        }

        try 
        {
            System.Diagnostics.Debug.WriteLine($"[Google Sync] 開始同步 UserId {userId} 的行程...");
            var tokenResponse = new TokenResponse { RefreshToken = loginInfo.ProviderKey };

            var flow = new GoogleAuthorizationCodeFlow(new GoogleAuthorizationCodeFlow.Initializer
            {
                ClientSecrets = new ClientSecrets { ClientId = clientId, ClientSecret = clientSecret },
                Scopes = new[] { 
                    CalendarService.Scope.CalendarEvents,
                    "https://www.googleapis.com/auth/gmail.send"
                }
            });

            var credential = new UserCredential(flow, userId.ToString(), tokenResponse);
            
            var service = new CalendarService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = "MyFitnessCoach",
            });

            var newEvent = new Event()
            {
                Summary = summary,
                Description = description,
                Start = new EventDateTime() { 
                    DateTimeDateTimeOffset = new DateTimeOffset(startTime, TimeZoneInfo.Local.GetUtcOffset(startTime)),
                    TimeZone = "Asia/Taipei"
                },
                End = new EventDateTime() { 
                    DateTimeDateTimeOffset = new DateTimeOffset(endTime, TimeZoneInfo.Local.GetUtcOffset(endTime)),
                    TimeZone = "Asia/Taipei"
                },
                Reminders = new Event.RemindersData() { UseDefault = true }
            };

            var createdEvent = await service.Events.Insert(newEvent, "primary").ExecuteAsync();
            System.Diagnostics.Debug.WriteLine($"[Google Sync] 同步成功！EventId: {createdEvent.Id}");
            return createdEvent.Id; // 回傳 ID 以便存入資料庫
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"[Google Sync] 失敗：{ex.Message}");
            if (ex.Message.Contains("invalid_grant") || (ex.InnerException != null && ex.InnerException.Message.Contains("invalid_grant")))
            {
                var loginToRemove = await _db.UserExternalLogins
                    .FirstOrDefaultAsync(l => l.UserId == userId && l.LoginProvider == "GoogleCalendar");
                if (loginToRemove != null)
                {
                    _db.UserExternalLogins.Remove(loginToRemove);
                    await _db.SaveChangesAsync();
                }
            }
            return null;
        }
    }

    public async Task DeleteEventAsync(int userId, string eventId)
    {
        if (string.IsNullOrEmpty(eventId)) return;

        var clientId = _config["Google:ClientId"];
        var clientSecret = _config["Google:ClientSecret"];
        
        var loginInfo = await _db.UserExternalLogins
            .FirstOrDefaultAsync(l => l.UserId == userId && l.LoginProvider == "GoogleCalendar");

        if (loginInfo == null || string.IsNullOrEmpty(loginInfo.ProviderKey)) return;

        try 
        {
            var tokenResponse = new TokenResponse { RefreshToken = loginInfo.ProviderKey };
            var flow = new GoogleAuthorizationCodeFlow(new GoogleAuthorizationCodeFlow.Initializer
            {
                ClientSecrets = new ClientSecrets { ClientId = clientId, ClientSecret = clientSecret },
                Scopes = new[] { 
                    CalendarService.Scope.CalendarEvents,
                    "https://www.googleapis.com/auth/gmail.send"
                }
            });

            var credential = new UserCredential(flow, userId.ToString(), tokenResponse);
            
            // 這裡不需要手動 RefreshTokenAsync，CalendarService 呼叫時會自動處理
            var service = new CalendarService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = "MyFitnessCoach",
            });

            // 執行刪除
            await service.Events.Delete("primary", eventId).ExecuteAsync();
        }
        catch (Google.GoogleApiException gEx) when (gEx.HttpStatusCode == System.Net.HttpStatusCode.NotFound)
        {
            // 如果事件已經不存在 (例如被使用者手動刪除)，則忽略此錯誤
            System.Diagnostics.Debug.WriteLine($"Google 日曆事件已不存在 (EventId: {eventId})");
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Google Calendar Delete Error: {ex.Message}");
            throw; // 拋出讓呼叫端記錄
        }
    }
}
