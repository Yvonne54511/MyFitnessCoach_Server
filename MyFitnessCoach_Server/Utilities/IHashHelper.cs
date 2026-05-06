namespace MyFitnessCoach_Server.Utilities;

public interface IHashHelper
{
    string HashPassword(string password);

    bool VerifyPassword(string hashedPassword, string providedPassword);

    (string rawToken, string hash) ProduceConfirmCode();

    string HashConfirmCode(string rawToken);
}
