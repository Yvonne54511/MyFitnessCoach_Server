using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.Repositories;

namespace MyFitnessCoach_Server.Models.Services;

public class AccountService : IAccountService
{
    private readonly IAccountRepository _accountRepository;
    private readonly IPasswordHasher<User> _passwordHasher;
    private readonly IConfiguration _config;

    public AccountService(
        IAccountRepository accountRepository,
        IPasswordHasher<User> passwordHasher,
        IConfiguration config)
    {
        _accountRepository = accountRepository;
        _passwordHasher    = passwordHasher;
        _config            = config;
    }

    public async Task<LoginResultDto> LoginAsync(LoginDto dto)
    {
        var user = await _accountRepository.GetByAccountAsync(dto.Account);

        if (user == null || string.IsNullOrWhiteSpace(user.HashedPassword))
            return new LoginResultDto { IsSuccess = false, Message = "帳號或密碼錯誤" };

        var result = _passwordHasher.VerifyHashedPassword(user, user.HashedPassword, dto.Password);
        if (result == PasswordVerificationResult.Failed)
            return new LoginResultDto { IsSuccess = false, Message = "帳號或密碼錯誤" };

        if (!user.IsConfirmed)
            return new LoginResultDto { IsSuccess = false, Message = "此帳號尚未完成驗證" };

        if (!user.IsActive)
            return new LoginResultDto { IsSuccess = false, Message = "此帳號目前停用中，請洽管理員" };

        var instructor = await _accountRepository.GetInstructorByUserIdAsync(user.Id);
        var employee   = await _accountRepository.GetEmployeeByUserIdAsync(user.Id);
        var member     = await _accountRepository.GetMemberByUserIdAsync(user.Id);

        var roles     = user.UserRoles.Select(ur => ur.Role.RoleName).ToList();
        var functions = user.UserRoles
            .SelectMany(ur => ur.Role.RoleFunctions)
            .Select(rf => rf.Function.FunctionName)
            .Distinct()
            .ToList();

        var claims = new List<Claim>
        {
            new(ClaimTypes.NameIdentifier, user.Id.ToString()),
            new(ClaimTypes.Name, user.UserName ?? user.Account),
            new(ClaimTypes.Email, user.Email),
            new("Account", user.Account)
        };

        if (instructor?.Id is int instructorId)
            claims.Add(new Claim("InstructorId", instructorId.ToString()));

        if (employee?.Id is int employeeId)
            claims.Add(new Claim("EmployeeId", employeeId.ToString()));

        if (employee?.DepartmentId is int departmentId)
            claims.Add(new Claim("DepartmentId", departmentId.ToString()));

        foreach (var role in roles)
            claims.Add(new Claim(ClaimTypes.Role, role));

        foreach (var func in functions)
            claims.Add(new Claim("Function", func));

        var key     = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]!));
        var creds   = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
        var expires = DateTime.UtcNow.AddHours(8);

        var token = new JwtSecurityToken(
            issuer:             _config["Jwt:Issuer"],
            audience:           _config["Jwt:Audience"],
            claims:             claims,
            expires:            expires,
            signingCredentials: creds
        );

        return new LoginResultDto
        {
            IsSuccess = true,
            Message   = "登入成功",
            Token     = new JwtSecurityTokenHandler().WriteToken(token),
            UserId    = user.Id,
            UserName  = user.UserName ?? user.Account,
            ImageUrl  = member?.ImageUrl ?? "/images/members/default.jpg"
        };
    }
}
