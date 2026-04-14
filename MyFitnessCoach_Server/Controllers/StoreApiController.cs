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

		public StoreApiController(ProductService productService, CategoryService categoryService)
		{
			_productService = productService;
			_categoryService = categoryService;
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

		// GET /api/StoreApi/products?categoryId=1
		[HttpGet("products")]
		public async Task<ActionResult<IEnumerable<ProductDto>>> GetProducts([FromQuery] int? categoryId)
		{
			var products = await _productService.GetAllProducts(null, categoryId)
				.Where(p => p.IsActive)
				.OrderBy(p => p.SortOrder)
				.ToListAsync();

			return Ok(products);
		}
	}
}
