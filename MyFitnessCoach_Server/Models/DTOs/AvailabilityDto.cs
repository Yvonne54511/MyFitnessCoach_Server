using System;

namespace MyFitnessCoach_Server.Models.DTOs
{
    public class AvailabilityDto
    {
        public int ShiftId { get; set; }
        public string Date { get; set; } = string.Empty;
        public string TimeSlot { get; set; } = string.Empty;
        public bool IsReserved { get; set; }
    }
}
