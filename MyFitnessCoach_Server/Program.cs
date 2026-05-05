using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.FileProviders;
using Microsoft.IdentityModel.Tokens;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.Repositories;
using MyFitnessCoach_Server.Models.Services;
using MyFitnessCoach_Server.Repositories;
using MyFitnessCoach_Server.Utilities;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Register DbContext
builder.Services.AddDbContext<MyFitnessCoachDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Configure CORS
builder.Services.AddCors(options =>
{
    options.AddPolicy("MyFitnessCoach_Client", policy =>
    {
        var origins = builder.Configuration.GetSection("Cors:AllowedOrigins").Get<string[]>()
                      ?? new[] { "https://localhost:5173", "http://localhost:5173" };

        policy.WithOrigins(origins)
              .AllowAnyHeader()
              .AllowAnyMethod()
              .AllowCredentials();
    });
});

// Add services to the container
builder.Services.AddHttpClient();
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.AddSecurityDefinition("Bearer", new Microsoft.OpenApi.Models.OpenApiSecurityScheme
    {
        Name         = "Authorization",
        Type         = Microsoft.OpenApi.Models.SecuritySchemeType.Http,
        Scheme       = "Bearer",
        BearerFormat = "JWT",
        In           = Microsoft.OpenApi.Models.ParameterLocation.Header,
        Description  = "�п�J JWT Token�]���ݥ[ Bearer �e��^"
    });
    c.AddSecurityRequirement(new Microsoft.OpenApi.Models.OpenApiSecurityRequirement
    {
        {
            new Microsoft.OpenApi.Models.OpenApiSecurityScheme
            {
                Reference = new Microsoft.OpenApi.Models.OpenApiReference
                {
                    Type = Microsoft.OpenApi.Models.ReferenceType.SecurityScheme,
                    Id   = "Bearer"
                }
            },
            Array.Empty<string>()
        }
    });
});

// Register Repositories & Services
builder.Services.AddSingleton<ReviewLikeService>();
builder.Services.AddScoped<IProductRepository, ProductRepository>();
builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();
builder.Services.AddScoped<IInstructorRepository, InstructorRepository>();
builder.Services.AddScoped<IReservationRepository, ReservationRepository>();
builder.Services.AddScoped<ReviewRepository>();
builder.Services.AddScoped<ProductService>();
builder.Services.AddScoped<CategoryService>();

builder.Services.AddScoped<ITopUpPlanRepository, TopUpPlanRepository>();
builder.Services.AddScoped<TopUpPlanService>();
builder.Services.AddScoped<InstructorService>();
builder.Services.AddScoped<ReviewService>();
builder.Services.AddScoped<ReservationService>();
builder.Services.AddScoped<GoogleCalendarService>();

// Cart (Phase 3)
builder.Services.AddScoped<ICartRepository, CartRepository>();
builder.Services.AddScoped<CartService>();

// Coupon (Phase 4)
builder.Services.AddScoped<ICouponRepository, CouponRepository>();
builder.Services.AddScoped<CouponService>();

// Add services to the container.
// Register application services
builder.Services.AddScoped<IAccountRepository, AccountRepository>();
builder.Services.AddScoped<IAccountRateLimitService, AccountRateLimitService>();
builder.Services.AddScoped<IVerifyPasswordRequirements, VerifyPasswordRequirements>();
builder.Services.AddScoped<IAccountService, AccountService>();
builder.Services.AddScoped<IPasswordEmailService, PasswordEmailService>();
builder.Services.AddSingleton<IHashHelper, HashHelper>();

// Goals
builder.Services.AddScoped<IGoalRepository, GoalRepository>();
builder.Services.AddScoped<IGoalService, GoalService>();

// Daily Diet
builder.Services.AddScoped<IDailyDietRepository, DailyDietRepository>();
builder.Services.AddScoped<IDailyDietService, DailyDietService>();
builder.Services.AddScoped<IDietPrerequisiteService, DietPrerequisiteService>();

// Body Records
builder.Services.AddScoped<IBodyRecordRepository, BodyRecordRepository>();
builder.Services.AddScoped<IBodyRecordService, BodyRecordService>();

// Health Report
builder.Services.AddScoped<IHealthReportRepository, HealthReportRepository>();
builder.Services.AddSingleton<HealthReportTrendCalculator>();
builder.Services.AddScoped<IHealthReportService, HealthReportService>();

// Food Library
builder.Services.AddMemoryCache();
builder.Services.AddSingleton<FoodLibraryCacheStore>();
builder.Services.AddScoped<IFoodLibraryRepository, FoodLibraryRepository>();
builder.Services.AddScoped<FoodLibraryService>();
builder.Services.AddScoped<IReservationEmailService, ReservationEmailService>();
builder.Services.AddSingleton<IPasswordHasher<User>, PasswordHasher<User>>();
builder.Services.Configure<EmailSettings>(builder.Configuration.GetSection("EmailSettings"));

// JWT Authentication
builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme    = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(options =>
{
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer           = true,
        ValidateAudience         = true,
        ValidateLifetime         = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer              = builder.Configuration["Jwt:Issuer"],
        ValidAudience            = builder.Configuration["Jwt:Audience"],
        IssuerSigningKey         = new SymmetricSecurityKey(
                                       Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]!))
    };

    options.Events = new JwtBearerEvents
    {
        OnMessageReceived = ctx =>
        {
            if (string.IsNullOrEmpty(ctx.Token) &&
                ctx.Request.Cookies.TryGetValue("access_token", out var cookieToken) &&
                !string.IsNullOrEmpty(cookieToken))
            {
                ctx.Token = cookieToken;
            }
            return Task.CompletedTask;
        }
    };
});

builder.Services.AddAuthorization();

var app = builder.Build();

app.UseDeveloperExceptionPage(); // �j��}��
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseMiddleware<MyFitnessCoach_Server.Middleware.SecurityHeadersMiddleware>();
app.UseRouting();
app.UseCors("MyFitnessCoach_Client");
app.UseAuthentication();
app.UseAuthorization();
app.UseStaticFiles(); // �w�]�� wwwroot (�p�G��)

app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = new PhysicalFileProvider(
        Path.Combine(builder.Environment.ContentRootPath, "StaticFiles")),
    RequestPath = "/StaticFiles"
});

app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = new PhysicalFileProvider(
        Path.Combine(builder.Environment.ContentRootPath, "images")),
    RequestPath = "/images"
});
app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = new PhysicalFileProvider(
        Path.Combine(builder.Environment.ContentRootPath, "img")),
    RequestPath = "/img"
});

app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = new PhysicalFileProvider(
        Path.Combine(builder.Environment.ContentRootPath, "StaticFiles", "img")),
    RequestPath = "/img"
});

app.MapControllers();

app.Run();
