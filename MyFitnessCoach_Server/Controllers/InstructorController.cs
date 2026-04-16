using Microsoft.AspNetCore.Mvc;
using MyFitnessCoach_Server.Models.Services;
using MyFitnessCoach_Server.Models.DTOs;

namespace MyFitnessCoach_Server.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class InstructorController : ControllerBase
	{
		private readonly InstructorService _service;

		private readonly IWebHostEnvironment _env;

		public InstructorController(InstructorService service, IWebHostEnvironment env)
		{
			_service = service;
			_env = env;
		}

		[HttpGet]
		public async Task<ActionResult<IEnumerable<InstructorDto>>> GetAll([FromQuery] string? name)
		{
			var instructors = await _service.GetInstructorsAsync(name);
			return Ok(instructors);
		}

		[HttpGet("{id}")]
		public async Task<ActionResult<InstructorDto>> GetById(int id)
		{
			var instructor = await _service.GetInstructorByIdAsync(id);
			if (instructor == null)
			{
				return NotFound();
			}
			return Ok(instructor);
		}

		[HttpGet("Availability/{id}")]
		public async Task<ActionResult<IEnumerable<AvailabilityDto>>> GetAvailability(int id)
		{
			var availability = await _service.GetAvailabilityAsync(id);
			return Ok(availability);
		}

		[HttpGet("Image/{id}")]
		public async Task<IActionResult> GetImage(int id)
{
	try
	{
		// 1. 取得專案根目錄
		string rootPath = _env.ContentRootPath;

		// 2. 預設圖片路徑 (仍在 StaticFiles 下)
		string noImgPath = Path.Combine(rootPath, "StaticFiles", "images", "NoImage.jpg");

		// 3. 從資料庫取得路徑 (例如: /img/instructors/xxx.png)
		var instructor = await _service.GetInstructorByIdAsync(id);
		string dbPath = instructor?.ImageUrl ?? "";

		// 4. 拼接實體路徑 (直接用資料庫路徑拼接根目錄，去除開頭斜線)
		string relativePath = dbPath.TrimStart('/');
		string fullPath = Path.Combine(rootPath, relativePath);

		// 5. 檢查與讀取
		if (!string.IsNullOrEmpty(dbPath) && System.IO.File.Exists(fullPath))
		{
			// 根據副檔名判斷 MIME
			string contentType = fullPath.EndsWith(".png") ? "image/png" : "image/jpeg";
			return PhysicalFile(fullPath, contentType);
		}

		// 6. 備援：回傳預設圖
		if (System.IO.File.Exists(noImgPath))
		{
			return PhysicalFile(noImgPath, "image/jpeg");
		}

		return NotFound("Image not found on server.");
	}
	catch (Exception ex)
	{
		return StatusCode(500, $"Internal server error: {ex.Message}");
	}
}
	}
}
