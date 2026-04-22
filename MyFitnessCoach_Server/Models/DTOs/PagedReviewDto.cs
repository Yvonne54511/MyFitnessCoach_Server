namespace MyFitnessCoach_Server.Models.DTOs
{
    public class PagedReviewDto
    {
        public IEnumerable<ReviewDto> Reviews { get; set; } = new List<ReviewDto>();
        public int TotalCount { get; set; }
        public int TotalPages { get; set; }
        public int CurrentPage { get; set; }
        public int PageSize { get; set; }
    }
}
