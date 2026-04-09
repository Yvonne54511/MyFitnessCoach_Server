using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.FileProviders;
using MyFitnessCoach_Server.Models.EfModels;

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
app.UseAuthorization();
app.UseStaticFiles(new StaticFileOptions
{
	FileProvider = new PhysicalFileProvider(Path.Combine(builder.Environment.ContentRootPath, "StaticFiles")),
	RequestPath = "/StaticFiles"
});

app.MapControllers();

app.Run();
