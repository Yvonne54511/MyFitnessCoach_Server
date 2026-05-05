namespace MyFitnessCoach_Server.Utilities;

public interface IVerifyPasswordRequirements
{
    // userId = null → 僅驗長度（Register）
    // userId 有值  → 驗長度 + 修改頻率 + 歷史重複（ResetPassword）
    Task<PasswordPolicyResult> VerifyAsync(string newPassword, int? userId = null);
}
