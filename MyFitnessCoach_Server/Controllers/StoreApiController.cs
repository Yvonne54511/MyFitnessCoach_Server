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

		// GET /api/StoreApi/products?name=蛋白&categoryId=1&minPrice=100&maxPrice=500
		[HttpGet("products")]
		public async Task<ActionResult<IEnumerable<ProductDto>>> GetProducts(
			[FromQuery] string? name,
			[FromQuery] int? categoryId,
			[FromQuery] decimal? minPrice,
			[FromQuery] decimal? maxPrice)
		{
			var products = await _productService.GetAllProducts(name, categoryId, minPrice, maxPrice)
				.Where(p => p.IsActive)
				.OrderBy(p => p.SortOrder)
				.ToListAsync();

			return Ok(products);
		}

		// GET /api/StoreApi/products/{id}
		[HttpGet("products/{id}")]
		public async Task<ActionResult<ProductDto>> GetProduct(int id)
		{
			var product = await _productService.GetProductAsync(id);
			if (product == null || !product.IsActive)
				return NotFound();
			return Ok(product);
		}

		// GET /api/StoreApi/ProductImage/{id}
		[HttpGet("ProductImage/{id}")]
		public async Task<IActionResult> GetProductImage(int id)
		{
			try
			{
				string rootPath = _env.ContentRootPath;
				string noImgPath = Path.Combine(rootPath, "StaticFiles", "images", "NoImage.jpg");

				var product = await _productService.GetProductAsync(id);
				string dbPath = product?.ImageUrl ?? "";

				if (!string.IsNullOrEmpty(dbPath))
				{
					// DB 存的路徑格式：/images/products/xxx.jpg
					// 實體檔案可能在多個位置，依序嘗試
					string trimmed = dbPath.TrimStart('/');                          // images/products/xxx.jpg
					string mapped  = dbPath.Replace("/images/", "/img/").TrimStart('/'); // img/products/xxx.jpg

					// MVC 後台上傳的路徑
					string mvcRoot = Path.Combine(rootPath, "..", "MyFitnessCoach", "Project-MyFitnessCoach", "wwwroot");

					var candidates = new[]
					{
						Path.Combine(rootPath, "StaticFiles", trimmed),   // StaticFiles/images/products/xxx.jpg
						Path.Combine(rootPath, "StaticFiles", mapped),    // StaticFiles/img/products/xxx.jpg
						Path.Combine(rootPath, trimmed),                  // images/products/xxx.jpg
						Path.Combine(rootPath, mapped),                   // img/products/xxx.jpg
						Path.Combine(mvcRoot, trimmed),                   // MVC wwwroot/images/products/xxx.jpg
					};

					foreach (var path in candidates)
					{
						string fullPath = Path.GetFullPath(path);
						if (System.IO.File.Exists(fullPath))
						{
							string contentType = Path.GetExtension(fullPath).ToLower() switch
							{
								".png"  => "image/png",
								".webp" => "image/webp",
								".avif" => "image/avif",
								".gif"  => "image/gif",
								_       => "image/jpeg"
							};
							return PhysicalFile(fullPath, contentType);
						}
					}
				}

				// 備援：回傳預設圖
				if (System.IO.File.Exists(noImgPath))
					return PhysicalFile(noImgPath, "image/jpeg");

				return NotFound("Image not found on server.");
			}
			catch (Exception ex)
			{
				return StatusCode(500, $"Internal server error: {ex.Message}");
			}
		}
	}
}
