namespace MyFitnessCoach_Server.Utilities;

public class EmailSettings
{
    public string ApiKey       { get; set; } = string.Empty;
    public string SenderEmail  { get; set; } = string.Empty;
    public string SenderName   { get; set; } = string.Empty;
    public string SmtpServer   { get; set; } = string.Empty;
    public string SmtpPort     { get; set; } = string.Empty;
    public string ContactEmail { get; set; } = string.Empty;
}
