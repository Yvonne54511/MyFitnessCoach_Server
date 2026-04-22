using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Repositories;

namespace MyFitnessCoach_Server.Models.Services
{
	public class CartService
	{
		private readonly ICartRepository _repository;

		public CartService(ICartRepository repository)
		{
			_repository = repository;
		}

		/// <summary>
		/// 取得會員購物車;若尚未有任何購物車紀錄,回傳空的 CartDto(Id = 0,Items 空陣列)。
		/// </summary>
		public async Task<CartDto> GetCartAsync(int memberId)
		{
			var cart = await _repository.GetCartByMemberAsync(memberId);
			return cart ?? new CartDto { Id = 0, MemberId = memberId, Items = new() };
		}

		public async Task<CartItemDto> AddItemAsync(int memberId, int productId, int qty)
		{
			var cart = await _repository.GetOrCreateCartAsync(memberId);
			var item = await _repository.AddOrIncrementAsync(cart.Id, productId, qty);
			await _repository.TouchCartAsync(cart.Id);
			return item;
		}

		public async Task<CartItemDto?> UpdateQtyAsync(int memberId, int cartItemId, int qty)
		{
			var cart = await _repository.GetOrCreateCartAsync(memberId);
			var result = await _repository.UpdateQtyAsync(cartItemId, cart.Id, qty);
			if (result != null)
			{
				await _repository.TouchCartAsync(cart.Id);
			}
			return result;
		}

		public async Task RemoveItemAsync(int memberId, int cartItemId)
		{
			var cart = await _repository.GetOrCreateCartAsync(memberId);
			await _repository.RemoveItemAsync(cartItemId, cart.Id);
			await _repository.TouchCartAsync(cart.Id);
		}

		public async Task ClearAsync(int memberId)
		{
			var cart = await _repository.GetOrCreateCartAsync(memberId);
			await _repository.ClearCartAsync(cart.Id);
			await _repository.TouchCartAsync(cart.Id);
		}

		/// <summary>
		/// 登入時合併 localStorage 的 guest 購物車到 DB:
		/// 逐項呼叫 AddOrIncrementAsync,同商品 qty 自動相加。
		/// </summary>
		public async Task<CartDto> MergeAsync(int memberId, List<AddCartItemDto> guestItems)
		{
			var cart = await _repository.GetOrCreateCartAsync(memberId);

			foreach (var item in guestItems)
			{
				if (item.ProductId <= 0 || item.Qty < 1) continue;
				await _repository.AddOrIncrementAsync(cart.Id, item.ProductId, item.Qty);
			}

			await _repository.TouchCartAsync(cart.Id);
			return await GetCartAsync(memberId);
		}
	}
}
