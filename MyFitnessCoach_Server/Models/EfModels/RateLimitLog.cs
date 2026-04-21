#nullable disable
namespace MyFitnessCoach_Server.Models.EfModels;

public class RateLimitLog
{
    public int Id { get; set; }
    public string IpAddress { get; set; }
    public string EndPoint { get; set; }
    public string Identity { get; set; }
    public bool IsSuccess { get; set; }
    public DateTime RequestedAt { get; set; }
}
