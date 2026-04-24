using System.Security.Cryptography;
using System.Text;
using Microsoft.AspNetCore.Identity;
using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Utilities;

public class HashHelper : IHashHelper
{
    private static readonly PasswordHasher<User> _passwordHasher = new();

    public string HashPassword(string password) =>
        _passwordHasher.HashPassword(new User(), password);

    public bool VerifyPassword(string hashedPassword, string providedPassword) =>
        _passwordHasher.VerifyHashedPassword(new User(), hashedPassword, providedPassword)
            != PasswordVerificationResult.Failed;

    public (string rawToken, string hash) ProduceConfirmCode()
    {
        var rawToken = Guid.NewGuid().ToString("N");
        return (rawToken, HashConfirmCode(rawToken));
    }

    public string HashConfirmCode(string rawToken) =>
        Convert.ToHexString(SHA256.HashData(Encoding.UTF8.GetBytes(rawToken.Trim()))).ToLower();
}
