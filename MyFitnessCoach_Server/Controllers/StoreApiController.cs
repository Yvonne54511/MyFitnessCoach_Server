using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.Services;

namespace MyFitnessCoach_Server.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class StoreApiController : ControllerBase
	{
		private readonly ProductService _productService;
		private readonly CategoryService _categoryService;
		private readonly IWebHostEnvironment _env;

		public StoreApiController(ProductService productService, CategoryService categoryService, IWebHostEnvironment env)
		{
			_productService = productService;
			_categoryService = categoryService;
			_env = env;
		}

		// GET /api/StoreApi/categories
		[HttpGet("categories")]
		public async Task<ActionResult<IEnumerable<CategoryDto>>> GetCategories()
		{
			var categories = await _categoryService.GetAllCategories()
				.Where(c => c.IsActive)
				.OrderBy(c => c.SortOrder)
				.ToListAsync();

			return Ok(categories);
		}

		// GET /api/StoreApi/products?name=蛋白&categoryId=1
		[HttpGet("products")]
		public async Task<ActionResult<IEnumerable<ProductDto>>> GetProducts(
			[FromQuery] string? name,
			[FromQuery] int? categoryId)
		{
			var products = await _productService.GetAllProducts(name, categoryId)
				.Where(p => p.IsActive)
				.OrderBy(p => p.SortOrder)
				.ToListAsync();

			return Ok(products);
		}

		// GET /api/StoreApi/ProductImage/{id}
		[HttpGet("ProductImage/{id}")]
		public async Task<IActionResult> GetProductImage(int id)
		{
			try
			{
				// 1. 取得專案根目錄
				string rootPath = _env.ContentRootPath;

				// 2. 預設圖片路徑 (仍在 StaticFiles 下)
				string noImgPath = Path.Combine(rootPath, "StaticFiles", "images", "NoImage.jpg");

				// 3. 從資料庫取得路徑 (例如: /images/products/chicken_01.jpg)
				var product = await _productService.GetProductAsync(id);
				string dbPath = product?.ImageUrl ?? "";

				// 4. 路徑修正：DB 存的是 /images/products/... 但實體資料夾叫 /img/products/
				string mappedPath = dbPath.Replace("/images/", "/img/");

				// 5. 拼接實體路徑 (去除開頭斜線)
				string relativePath = mappedPath.TrimStart('/');
				string fullPath = Path.Combine(rootPath, relativePath);

				// 6. 檢查與讀取
				if (!string.IsNullOrEmpty(dbPath) && System.IO.File.Exists(fullPath))
				{
					// 根據副檔名判斷 MIME
					string contentType = fullPath.EndsWith(".png") ? "image/png" : "image/jpeg";
					return PhysicalFile(fullPath, contentType);
				}

				// 7. 備援：回傳預設圖
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
