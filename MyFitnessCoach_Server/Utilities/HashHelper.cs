using System.Security.Cryptography;
using System.Text;

namespace MyFitnessCoach_Server.Utilities;

public static class HashHelper
{
    /// <summary>
    /// 產生確認碼：回傳 rawToken（放 Email 連結）和 hash（存 DB）。
    /// </summary>
    public static (string rawToken, string hash) ProduceConfirmCode()
    {
        var rawToken = Guid.NewGuid().ToString("N");
        var hash     = HashConfirmCode(rawToken);
        return (rawToken, hash);
    }

    /// <summary>
    /// 將前端傳回的 rawToken 雜湊，用於與 DB 中的 hash 比對。
    /// </summary>
    public static string HashConfirmCode(string rawToken) =>
        Convert.ToHexString(SHA256.HashData(Encoding.UTF8.GetBytes(rawToken.Trim()))).ToLower();
}
