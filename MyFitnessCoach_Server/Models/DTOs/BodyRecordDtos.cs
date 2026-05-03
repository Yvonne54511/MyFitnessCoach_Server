using Microsoft.AspNetCore.Http;

namespace MyFitnessCoach_Server.Models.DTOs;

public sealed class BodyRecordDto
{
    public int Id { get; set; }
    public DateOnly MeasureDate { get; set; }
    public double Weight { get; set; }
    public decimal? BodyFat { get; set; }
    public decimal? SkeletalMuscle { get; set; }
    public decimal? WaistCircumference { get; set; }
    public decimal? HipCircumference { get; set; }
    public string? Note { get; set; }
    public string? ImageUrl { get; set; }
}

public sealed class CreateBodyRecordRequest
{
    public DateOnly MeasureDate { get; set; }
    public double Weight { get; set; }
    public decimal? BodyFat { get; set; }
    public decimal? SkeletalMuscle { get; set; }
    public decimal? WaistCircumference { get; set; }
    public decimal? HipCircumference { get; set; }
    public string? Note { get; set; }
    public IFormFile? Photo { get; set; }
}

public sealed class UpdateBodyRecordRequest
{
    public DateOnly MeasureDate { get; set; }
    public double Weight { get; set; }
    public decimal? BodyFat { get; set; }
    public decimal? SkeletalMuscle { get; set; }
    public decimal? WaistCircumference { get; set; }
    public decimal? HipCircumference { get; set; }
    public string? Note { get; set; }
    public IFormFile? Photo { get; set; }
}
