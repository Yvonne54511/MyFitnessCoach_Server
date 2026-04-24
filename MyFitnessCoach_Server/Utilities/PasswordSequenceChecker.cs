namespace MyFitnessCoach_Server.Utilities;

/// <summary>
/// 與前端 src/utils/validators.ts 的 hasKeyboardSequence 行為一致：
/// 同一份序列清單、同一個 threshold=6、同樣忽略大小寫。
/// </summary>
public static class PasswordSequenceChecker
{
    private static readonly string[] Sequences =
    {
        "asdfghjkl",
        "qwertyuiop",
        "zxcvbnm",
        "1234567890",
        "abcdefghijklmnopqrstuvwxyz",
    };

    public static bool HasKeyboardSequence(string password, int threshold = 6)
    {
        if (string.IsNullOrEmpty(password) || password.Length < threshold) return false;

        var lower = password.ToLowerInvariant();

        foreach (var seq in Sequences)
        {
            var reversed = new string(seq.Reverse().ToArray());
            foreach (var s in new[] { seq, reversed })
            {
                for (int i = 0; i + threshold <= s.Length; i++)
                {
                    if (lower.Contains(s.Substring(i, threshold))) return true;
                }
            }
        }
        return false;
    }
}
