using MyFitnessCoach_Server.Models.Repositories;

namespace MyFitnessCoach_Server.Utilities;

public class VerifyPasswordRequirements : IVerifyPasswordRequirements
{
    private const int MaxChangesPerMonth = 3;
    private const int HistoryCount = 3;

    private readonly IAccountRepository _accountRepository;
    private readonly IHashHelper _hashHelper;

    public VerifyPasswordRequirements(IAccountRepository accountRepository, IHashHelper hashHelper)
    {
        _accountRepository = accountRepository;
        _hashHelper        = hashHelper;
    }

    public async Task<PasswordPolicyResult> VerifyAsync(string newPassword, int? userId = null)
    {
        if (newPassword.Length <= 8)
            return new PasswordPolicyResult(false, "密碼長度必須超過8個字元");

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
