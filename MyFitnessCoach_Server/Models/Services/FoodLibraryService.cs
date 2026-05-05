using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Repositories;

namespace MyFitnessCoach_Server.Models.Services;

public class FoodLibraryCacheStore
{
    private readonly IMemoryCache _cache;
    private long _version;

    public FoodLibraryCacheStore(IMemoryCache cache) => _cache = cache;

    public long Version => Interlocked.Read(ref _version);

    public void Bump() => Interlocked.Increment(ref _version);

    public bool TryGet<T>(string key, out T? val) => _cache.TryGetValue(key, out val);

    public void Set<T>(string key, T val, MemoryCacheEntryOptions opt) => _cache.Set(key, val, opt);

    public void Remove(string key) => _cache.Remove(key);
}

public class FoodLibraryService
{
    private const string SystemFoodCacheKey = "food_lib:system_foods";
    private const string CategoryCacheKey   = "food_lib:categories";

    private readonly IFoodLibraryRepository _repo;
    private readonly FoodLibraryCacheStore  _store;

    public FoodLibraryService(IFoodLibraryRepository repo, FoodLibraryCacheStore store)
    {
        _repo  = repo;
        _store = store;
    }

    public long GetCurrentVersion() => _store.Version;

    public async Task<int?> GetMemberIdByUserIdAsync(int userId)
        => await _repo.GetMemberIdByUserIdAsync(userId);

    public async Task<List<FoodDto>> GetSystemFoodsAsync()
    {
        if (_store.TryGet(SystemFoodCacheKey, out List<FoodDto>? cached) && cached != null)
            return cached;

        var list = await _repo.GetSystemFoodsQueryable().ToListAsync();

        _store.Set(SystemFoodCacheKey, list, new MemoryCacheEntryOptions
        {
            SlidingExpiration              = TimeSpan.FromHours(24),
            AbsoluteExpirationRelativeToNow = TimeSpan.FromDays(7)
        });

        return list;
    }

    public async Task<List<FoodCategoryDto>> GetCategoriesAsync()
    {
        if (_store.TryGet(CategoryCacheKey, out List<FoodCategoryDto>? cached) && cached != null)
            return cached;

        var list = await _repo.GetCategoriesAsync();

        _store.Set(CategoryCacheKey, list, new MemoryCacheEntryOptions
        {
            AbsoluteExpirationRelativeToNow = TimeSpan.FromDays(7)
        });

        return list;
    }

    public async Task<FoodLibraryBundleDto> GetBundleAsync(int memberId)
    {
        // DbContext is not thread-safe — queries must run sequentially
        var systemFoods     = await GetSystemFoodsAsync();
        var customFoods     = await _repo.GetCustomFoodsAsync(memberId);
        var favoriteFoodIds = await _repo.GetFavoriteFoodIdsAsync(memberId);
        var categories      = await GetCategoriesAsync();

        return new FoodLibraryBundleDto
        {
            SystemFoods     = systemFoods,
            CustomFoods     = customFoods,
            FavoriteFoodIds = favoriteFoodIds,
            Categories      = categories,
            Version         = _store.Version
        };
    }

    public async Task<FoodDto> CreateCustomFoodAsync(int memberId, CreateFoodDto dto)
    {
        var food = await _repo.CreateCustomFoodAsync(memberId, dto);
        return food;
    }

    public async Task<bool> UpdateCustomFoodAsync(int memberId, int foodId, UpdateFoodDto dto)
        => await _repo.UpdateCustomFoodAsync(memberId, foodId, dto);

    public async Task<bool> DeleteCustomFoodAsync(int memberId, int foodId)
        => await _repo.DeleteCustomFoodAsync(memberId, foodId);

    public async Task<bool> AddFavoriteAsync(int memberId, int foodId)
        => await _repo.AddFavoriteAsync(memberId, foodId);

    public async Task<bool> RemoveFavoriteAsync(int memberId, int foodId)
        => await _repo.RemoveFavoriteAsync(memberId, foodId);

    public void InvalidateSystemFoodCache()
    {
        _store.Remove(SystemFoodCacheKey);
        _store.Bump();
    }
}
