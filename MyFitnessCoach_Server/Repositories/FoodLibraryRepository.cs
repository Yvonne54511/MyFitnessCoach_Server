using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;

namespace MyFitnessCoach_Server.Repositories;

public interface IFoodLibraryRepository
{
    IQueryable<FoodDto> GetSystemFoodsQueryable();
    Task<List<FoodDto>> GetCustomFoodsAsync(int memberId);
    Task<List<int>> GetFavoriteFoodIdsAsync(int memberId);
    Task<List<FoodCategoryDto>> GetCategoriesAsync();
    Task<int?> GetMemberIdByUserIdAsync(int userId);
    Task<FoodDto> CreateCustomFoodAsync(int memberId, CreateFoodDto dto);
    Task<bool> UpdateCustomFoodAsync(int memberId, int foodId, UpdateFoodDto dto);
    Task<bool> DeleteCustomFoodAsync(int memberId, int foodId);
    Task<bool> AddFavoriteAsync(int memberId, int foodId);
    Task<bool> RemoveFavoriteAsync(int memberId, int foodId);
}

public class FoodLibraryRepository : IFoodLibraryRepository
{
    private readonly MyFitnessCoachDbContext _db;

    public FoodLibraryRepository(MyFitnessCoachDbContext db) => _db = db;

    private static FoodDto ProjectFood(Food f) => new()
    {
        Id           = f.Id,
        MemberId     = f.MemberId,
        CategoryId   = f.CategoryId,
        CategoryName = f.Category?.CategoryName,
        FoodName     = f.FoodName,
        IsCustom     = f.MemberId != null,
        ServingSizes = f.NutrientReferenceValues.Select(n => new ServingSizeDto
        {
            Id           = n.Id,
            Measure      = n.Measure,
            BaseAmount   = n.BaseAmount,
            WeightInGrams = n.WeightInGrams,
            Kcal         = n.Kcal ?? 0m,
            ProteinGram  = n.ProteinGram ?? 0m,
            CarbGram     = n.CarbGram ?? 0m,
            FatGram      = n.FatGram ?? 0m
        }).ToList()
    };

    public IQueryable<FoodDto> GetSystemFoodsQueryable()
    {
        return _db.Foods
            .AsNoTracking()
            .Where(f => f.MemberId == null && f.IsActive)
            .Include(f => f.Category)
            .Include(f => f.NutrientReferenceValues)
            .Select(f => new FoodDto
            {
                Id           = f.Id,
                MemberId     = f.MemberId,
                CategoryId   = f.CategoryId,
                CategoryName = f.Category.CategoryName,
                FoodName     = f.FoodName,
                IsCustom     = false,
                ServingSizes = f.NutrientReferenceValues.Select(n => new ServingSizeDto
                {
                    Id            = n.Id,
                    Measure       = n.Measure,
                    BaseAmount    = n.BaseAmount,
                    WeightInGrams = n.WeightInGrams,
                    Kcal          = n.Kcal ?? 0m,
                    ProteinGram   = n.ProteinGram ?? 0m,
                    CarbGram      = n.CarbGram ?? 0m,
                    FatGram       = n.FatGram ?? 0m
                }).ToList()
            });
    }

    public async Task<List<FoodDto>> GetCustomFoodsAsync(int memberId)
    {
        return await _db.Foods
            .AsNoTracking()
            .Where(f => f.MemberId == memberId && f.IsActive)
            .Include(f => f.Category)
            .Include(f => f.NutrientReferenceValues)
            .Select(f => new FoodDto
            {
                Id           = f.Id,
                MemberId     = f.MemberId,
                CategoryId   = f.CategoryId,
                CategoryName = f.Category.CategoryName,
                FoodName     = f.FoodName,
                IsCustom     = true,
                ServingSizes = f.NutrientReferenceValues.Select(n => new ServingSizeDto
                {
                    Id            = n.Id,
                    Measure       = n.Measure,
                    BaseAmount    = n.BaseAmount,
                    WeightInGrams = n.WeightInGrams,
                    Kcal          = n.Kcal ?? 0m,
                    ProteinGram   = n.ProteinGram ?? 0m,
                    CarbGram      = n.CarbGram ?? 0m,
                    FatGram       = n.FatGram ?? 0m
                }).ToList()
            })
            .ToListAsync();
    }

    public async Task<List<int>> GetFavoriteFoodIdsAsync(int memberId)
    {
        return await _db.MemberFavoriteFoods
            .AsNoTracking()
            .Where(mf => mf.MemberId == memberId)
            .Select(mf => mf.FoodId)
            .ToListAsync();
    }

    public async Task<List<FoodCategoryDto>> GetCategoriesAsync()
    {
        return await _db.FoodCategories
            .AsNoTracking()
            .Where(c => c.IsActive)
            .Select(c => new FoodCategoryDto { Id = c.Id, CategoryName = c.CategoryName })
            .ToListAsync();
    }

    public async Task<int?> GetMemberIdByUserIdAsync(int userId)
    {
        return await _db.Members
            .AsNoTracking()
            .Where(m => m.UserId == userId)
            .Select(m => (int?)m.Id)
            .FirstOrDefaultAsync();
    }

    public async Task<FoodDto> CreateCustomFoodAsync(int memberId, CreateFoodDto dto)
    {
        using var tx = await _db.Database.BeginTransactionAsync();

        var food = new Food
        {
            MemberId   = memberId,
            CategoryId = dto.CategoryId,
            FoodName   = dto.FoodName,
            IsActive   = true,
            UpdatedAt  = DateTime.UtcNow
        };
        _db.Foods.Add(food);
        await _db.SaveChangesAsync();

        foreach (var s in dto.ServingSizes)
        {
            _db.NutrientReferenceValues.Add(new NutrientReferenceValue
            {
                FoodId        = food.Id,
                Measure       = s.Measure,
                BaseAmount    = s.BaseAmount,
                WeightInGrams = s.WeightInGrams,
                Kcal          = s.Kcal,
                ProteinGram   = s.ProteinGram,
                CarbGram      = s.CarbGram,
                FatGram       = s.FatGram
            });
        }
        await _db.SaveChangesAsync();
        await tx.CommitAsync();

        var categoryName = await _db.FoodCategories
            .AsNoTracking()
            .Where(c => c.Id == dto.CategoryId)
            .Select(c => c.CategoryName)
            .FirstOrDefaultAsync();

        return new FoodDto
        {
            Id           = food.Id,
            MemberId     = memberId,
            CategoryId   = dto.CategoryId,
            CategoryName = categoryName,
            FoodName     = dto.FoodName,
            IsCustom     = true,
            ServingSizes = dto.ServingSizes.Select((s, i) => new ServingSizeDto
            {
                Id            = food.NutrientReferenceValues.ElementAtOrDefault(i)?.Id ?? 0,
                Measure       = s.Measure,
                BaseAmount    = s.BaseAmount,
                WeightInGrams = s.WeightInGrams,
                Kcal          = s.Kcal,
                ProteinGram   = s.ProteinGram,
                CarbGram      = s.CarbGram,
                FatGram       = s.FatGram
            }).ToList()
        };
    }

    public async Task<bool> UpdateCustomFoodAsync(int memberId, int foodId, UpdateFoodDto dto)
    {
        var food = await _db.Foods
            .Include(f => f.NutrientReferenceValues)
            .FirstOrDefaultAsync(f => f.Id == foodId && f.MemberId == memberId && f.IsActive);

        if (food == null) return false;

        using var tx = await _db.Database.BeginTransactionAsync();

        food.CategoryId = dto.CategoryId;
        food.FoodName   = dto.FoodName;
        food.UpdatedAt  = DateTime.UtcNow;

        // 整批覆寫份量：先刪後插
        _db.NutrientReferenceValues.RemoveRange(food.NutrientReferenceValues);
        await _db.SaveChangesAsync();

        foreach (var s in dto.ServingSizes)
        {
            _db.NutrientReferenceValues.Add(new NutrientReferenceValue
            {
                FoodId        = food.Id,
                Measure       = s.Measure,
                BaseAmount    = s.BaseAmount,
                WeightInGrams = s.WeightInGrams,
                Kcal          = s.Kcal,
                ProteinGram   = s.ProteinGram,
                CarbGram      = s.CarbGram,
                FatGram       = s.FatGram
            });
        }
        await _db.SaveChangesAsync();
        await tx.CommitAsync();

        return true;
    }

    public async Task<bool> DeleteCustomFoodAsync(int memberId, int foodId)
    {
        var food = await _db.Foods
            .FirstOrDefaultAsync(f => f.Id == foodId && f.MemberId == memberId && f.IsActive);

        if (food == null) return false;

        using var tx = await _db.Database.BeginTransactionAsync();

        // 軟刪除
        food.IsActive  = false;
        food.UpdatedAt = DateTime.UtcNow;

        // 移除該食物的最愛記錄
        await _db.MemberFavoriteFoods
            .Where(mf => mf.FoodId == foodId && mf.MemberId == memberId)
            .ExecuteDeleteAsync();

        await _db.SaveChangesAsync();
        await tx.CommitAsync();

        return true;
    }

    public async Task<bool> AddFavoriteAsync(int memberId, int foodId)
    {
        var exists = await _db.MemberFavoriteFoods
            .AnyAsync(mf => mf.MemberId == memberId && mf.FoodId == foodId);
        if (exists) return true;

        try
        {
            _db.MemberFavoriteFoods.Add(new MemberFavoriteFood
            {
                MemberId  = memberId,
                FoodId    = foodId,
                CreatedAt = DateTime.UtcNow
            });
            await _db.SaveChangesAsync();
            return true;
        }
        catch (DbUpdateException)
        {
            // UNIQUE constraint violation：另一個並發請求已插入，視為成功
            return true;
        }
    }

    public async Task<bool> RemoveFavoriteAsync(int memberId, int foodId)
    {
        var affected = await _db.MemberFavoriteFoods
            .Where(mf => mf.MemberId == memberId && mf.FoodId == foodId)
            .ExecuteDeleteAsync();
        return affected > 0;
    }
}
