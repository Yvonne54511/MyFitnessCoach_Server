using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.FileProviders;
using MyFitnessCoach_Server.Models.EfModels;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;

var builder = WebApplication.CreateBuilder(args);


// Register DbContext
builder.Services.AddDbContext<MyFitnessCoachDbContext>(options =>
	options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Configure CORS
builder.Services.AddCors(options => {
	options.AddPolicy("MyFitnessCoach_Client", policy => {
		policy.AllowAnyHeader().AllowAnyOrigin().AllowAnyMethod();
	});
});


// Add services to the container.

builder.Services.AddControllers();

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//自己加的Services
// for jwt
builder.Services.AddAuthentication(options =>
{
	//預設認證方式 網站只認JWT Token，其他的認證方式都不認
	options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
	//預設挑戰方式 你要是沒有帶卡片來，我就挑戰你給我一張JWT Token
	options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(options =>
{
	options.TokenValidationParameters = new TokenValidationParameters
	{
		ValidateIssuer = true,   // 檢查發卡的人是誰
		ValidateAudience = true, // 檢查這張卡是給誰用的
		ValidateLifetime = true, // 檢查卡片有沒有過期
		ValidateIssuerSigningKey = true, // 檢查卡片上的防偽簽名
		ValidIssuer = "MyFitnesCoach_Server",
		ValidAudience = "MyFitnesCoach_Client",
		IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("你的超級秘密密鑰"))
	};
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseRouting();
app.UseCors("MyFitnessCoach_Client");
app.UseAuthentication(); // 1. 先辨識你是誰 (你有卡片嗎？)
app.UseAuthorization();  // 2. 再檢查你有沒有權限進去 (這張卡能開這扇門嗎？)
app.UseStaticFiles(new StaticFileOptions
{
	FileProvider = new PhysicalFileProvider(Path.Combine(builder.Environment.ContentRootPath, "StaticFiles")),
	RequestPath = "/StaticFiles"
});

app.MapControllers();

app.Run();
