using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Repositories
{
	public interface ICartRepository
	{
		/// <summary>讀該會員的整張購物車（含 items）。沒有購物車時回 null。</summary>
		Task<CartDto?> GetCartByMemberAsync(int memberId);

		/// <summary>取得或建立該會員的 Cart entity（供內部取 CartId 用）。</summary>
		Task<Cart> GetOrCreateCartAsync(int memberId);

		/// <summary>新增商品到購物車；若 (CartId, ProductId) 已存在就累加 Qty。</summary>
		Task<CartItemDto> AddOrIncrementAsync(int cartId, int productId, int qty);

		/// <summary>調整數量；cartId 用於 ownership 驗證，不匹配則不動作並回 null。</summary>
		Task<CartItemDto?> UpdateQtyAsync(int cartItemId, int cartId, int qty);

		/// <summary>移除單項；cartId 用於 ownership 驗證。</summary>
		Task RemoveItemAsync(int cartItemId, int cartId);

		/// <summary>清空購物車（刪 Cart row，CartItems 透過 CASCADE 自動刪）。</summary>
		Task ClearCartAsync(int cartId);

		/// <summary>更新 Cart.UpdatedAt 戳記。</summary>
		Task TouchCartAsync(int cartId);
	}

	public class CartRepository : ICartRepository
	{
		private readonly MyFitnessCoachDbContext _context;

		public CartRepository(MyFitnessCoachDbContext context)
		{
			_context = context;
		}

		public async Task<CartDto?> GetCartByMemberAsync(int memberId)
		{
			var cart = await _context.Carts
				.AsNoTracking()
				.Where(c => c.MemberId == memberId)
				.Select(c => new CartDto
				{
					Id = c.Id,
					MemberId = c.MemberId,
					Items = c.CartItems
						.Where(ci => ci.Product.IsActive)
						.OrderBy(ci => ci.Id)
						.Select(ci => new CartItemDto
						{
							Id = ci.Id,
							ProductId = ci.ProductId,
							Qty = ci.Qty,
							Name = ci.Product.Name,
							UnitPrice = ci.Product.UnitPrice,
							OriginalPrice = ci.Product.OriginalPrice,
							ImageUrl = ci.Product.ImageUrl,
							CategoryName = ci.Product.Category.CategoryName
						})
						.ToList()
				})
				.FirstOrDefaultAsync();

			return cart;
		}

		public async Task<Cart> GetOrCreateCartAsync(int memberId)
		{
			var cart = await _context.Carts
				.FirstOrDefaultAsync(c => c.MemberId == memberId);

			if (cart != null) return cart;

			cart = new Cart
			{
				MemberId = memberId,
				CreatedAt = DateTime.Now,
				UpdatedAt = DateTime.Now
			};
			_context.Carts.Add(cart);
			await _context.SaveChangesAsync();
			return cart;
		}

		public async Task<CartItemDto> AddOrIncrementAsync(int cartId, int productId, int qty)
		{
			if (qty < 1) qty = 1;

			var existing = await _context.CartItems
				.FirstOrDefaultAsync(ci => ci.CartId == cartId && ci.ProductId == productId);

			if (existing != null)
			{
				existing.Qty += qty;
				existing.UpdatedAt = DateTime.Now;
			}
			else
			{
				existing = new CartItem
				{
					CartId = cartId,
					ProductId = productId,
					Qty = qty,
					CreatedAt = DateTime.Now,
					UpdatedAt = DateTime.Now
				};
				_context.CartItems.Add(existing);
			}

			await _context.SaveChangesAsync();
			return await LoadItemDtoAsync(existing.Id);
		}

		public async Task<CartItemDto?> UpdateQtyAsync(int cartItemId, int cartId, int qty)
		{
			var item = await _context.CartItems
				.FirstOrDefaultAsync(ci => ci.Id == cartItemId && ci.CartId == cartId);

			if (item == null) return null;
			if (qty < 1) qty = 1;

			item.Qty = qty;
			item.UpdatedAt = DateTime.Now;
			await _context.SaveChangesAsync();

			return await LoadItemDtoAsync(item.Id);
		}

		public async Task RemoveItemAsync(int cartItemId, int cartId)
		{
			var item = await _context.CartItems
				.FirstOrDefaultAsync(ci => ci.Id == cartItemId && ci.CartId == cartId);

			if (item == null) return;

			_context.CartItems.Remove(item);
			await _context.SaveChangesAsync();
		}

		public async Task ClearCartAsync(int cartId)
		{
			var items = await _context.CartItems
				.Where(ci => ci.CartId == cartId)
				.ToListAsync();

			if (items.Count > 0)
			{
				_context.CartItems.RemoveRange(items);
				await _context.SaveChangesAsync();
			}
		}

		public async Task TouchCartAsync(int cartId)
		{
			var cart = await _context.Carts.FindAsync(cartId);
			if (cart == null) return;
			cart.UpdatedAt = DateTime.Now;
			await _context.SaveChangesAsync();
		}

		private async Task<CartItemDto> LoadItemDtoAsync(int cartItemId)
		{
			return await _context.CartItems
				.AsNoTracking()
				.Where(ci => ci.Id == cartItemId)
				.Select(ci => new CartItemDto
				{
					Id = ci.Id,
					ProductId = ci.ProductId,
					Qty = ci.Qty,
					Name = ci.Product.Name,
					UnitPrice = ci.Product.UnitPrice,
					OriginalPrice = ci.Product.OriginalPrice,
					ImageUrl = ci.Product.ImageUrl,
					CategoryName = ci.Product.Category.CategoryName
				})
				.FirstAsync();
		}
	}
}
