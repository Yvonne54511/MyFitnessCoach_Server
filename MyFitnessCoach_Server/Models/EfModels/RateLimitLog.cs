#nullable disable
using System;

namespace MyFitnessCoach_Server.Models.EfModels;

public partial class RateLimitLog
{
    public int Id { get; set; }

    public string IpAddress { get; set; }

    public string EndPoint { get; set; }

    public string Identity { get; set; }

    public bool IsSuccess { get; set; }

    public DateTime RequestedAt { get; set; }
}
