namespace MyFitnessCoach_Server.Utilities;

public class RateLimitException : Exception
{
    public int RetryAfterSeconds { get; }

    public RateLimitException(int retryAfterSeconds) : base("Too many requests")
        => RetryAfterSeconds = retryAfterSeconds;
}
