using System;

namespace MyFitnessCoach_Server.Models.DTOs
{
    public class AvailabilityDto
    {
        public int ShiftId { get; set; }
        public DateTime Date { get; set; }
        public string TimeSlot { get; set; }
        public bool IsReserved { get; set; }
    }
}
