using MyFitnessCoach_Server.Models.Repositories;

namespace MyFitnessCoach_Server.Utilities;

public class VerifyPasswordRequirements : IVerifyPasswordRequirements
{
    private const int MinLength          = 8;
    private const int MaxLength          = 12;
    private const int MaxChangesPerMonth = 3;
    private const int HistoryCount       = 3;

    private readonly IAccountRepository _accountRepository;
    private readonly IHashHelper _hashHelper;

    public VerifyPasswordRequirements(IAccountRepository accountRepository, IHashHelper hashHelper)
    {
        _accountRepository = accountRepository;
        _hashHelper        = hashHelper;
    }

    public async Task<PasswordPolicyResult> VerifyAsync(string newPassword, int? userId = null)
    {
        // 1) 長度 8-12 碼（含）
        if (string.IsNullOrEmpty(newPassword) || newPassword.Length < MinLength || newPassword.Length > MaxLength)
            return new PasswordPolicyResult(false, $"密碼長度須為 {MinLength}-{MaxLength} 碼");

        // 2) 前後不可空白
        if (newPassword != newPassword.Trim())
            return new PasswordPolicyResult(false, "密碼前後不可包含空白");

        // 3) 複雜度：≥1 大寫、≥1 數字、≥1 特殊字元
        if (!newPassword.Any(char.IsUpper))
            return new PasswordPolicyResult(false, "密碼需包含至少一個大寫字母");
        if (!newPassword.Any(char.IsDigit))
            return new PasswordPolicyResult(false, "密碼需包含至少一個數字");
        if (!newPassword.Any(c => !char.IsLetterOrDigit(c)))
            return new PasswordPolicyResult(false, "密碼需包含至少一個特殊字元");

        // 4) 鍵盤連續字串（包含即擋，門檻 6）
        if (PasswordSequenceChecker.HasKeyboardSequence(newPassword))
            return new PasswordPolicyResult(false, "密碼不可包含鍵盤連續字串（如 asdfgh、qwerty、123456）");

        if (userId is null)
            return new PasswordPolicyResult(true);

        var since       = DateTime.UtcNow.AddMonths(-1);
        var changeCount = await _accountRepository.CountPasswordChangesInPeriodAsync(userId.Value, since);
        if (changeCount >= MaxChangesPerMonth)
            return new PasswordPolicyResult(false, "一個月內密碼修改次數已達上限（3次）");

        var history = await _accountRepository.GetPasswordHistoryAsync(userId.Value, HistoryCount);
        foreach (var record in history)
        {
            if (_hashHelper.VerifyPassword(record.HashedPassword, newPassword))
                return new PasswordPolicyResult(false, "新密碼不可與近三次使用過的密碼相同");
        }

        return new PasswordPolicyResult(true);
    }
}
