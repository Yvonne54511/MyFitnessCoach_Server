using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.Repositories;

namespace MyFitnessCoach_Server.Repositories;

public class DailyDietRepository : IDailyDietRepository
{
    private readonly MyFitnessCoachDbContext _db;

    public DailyDietRepository(MyFitnessCoachDbContext db) => _db = db;

    public async Task<IReadOnlyList<FoodRecordDto>> GetDailyFoodRecordsAsync(int memberId, DateOnly eatDate)
        => await FoodRecordBaseQuery(memberId)
            .Where(r => r.EatDT == eatDate)
            .ToListAsync();

    public async Task<FoodRecordDto?> GetFoodRecordByIdAsync(int memberId, int id)
    {
        // join back to DailyDiets for the id+memberId filter
        return await (
            from d in _db.DailyDiets
            join f in _db.Foods on d.FoodId equals f.Id
            join n in _db.NutrientReferenceValues
                on new { FoodId = d.FoodId!.Value, Measure = d.Measure! }
                equals new { n.FoodId, n.Measure }
            where d.Id == id && d.MemberId == memberId
                  && d.FoodId != null && d.Measure != null
            select new FoodRecordDto
            {
                Id       = d.Id,
                FoodId   = f.Id,
                FoodName = f.FoodName,
                Amount   = d.Amount ?? 0m,
                Measure  = d.Measure ?? string.Empty,
                MealType = d.MealType == "早餐" ? "breakfast"
                         : d.MealType == "午餐" ? "lunch"
                         : d.MealType == "晚餐" ? "dinner"
                         : d.MealType == "點心" || d.MealType == "點心/宵夜" ? "snack"
                         : d.MealType ?? string.Empty,
                Calories = (d.Amount!.Value / n.BaseAmount) * (n.Kcal ?? 0m),
                Protein  = (d.Amount!.Value / n.BaseAmount) * (n.ProteinGram ?? 0m),
                Carbs    = (d.Amount!.Value / n.BaseAmount) * (n.CarbGram ?? 0m),
                Fat      = (d.Amount!.Value / n.BaseAmount) * (n.FatGram ?? 0m),
                EatDT    = d.EatDT!.Value,
                Note     = d.Note,
            }
        ).FirstOrDefaultAsync();
    }

    public async Task<int> CreateFoodRecordAsync(int memberId, CreateFoodRecordRequest request)
    {
        var entity = new DailyDiet
        {
            MemberId  = memberId,
            FoodId    = request.FoodId,
            Amount    = request.Amount,
            Measure   = request.Measure,
            MealType  = request.MealType,
            EatDT     = request.EatDT,
            Note      = request.Note,
            CreatedAt = DateTime.UtcNow,
        };
        _db.DailyDiets.Add(entity);
        await _db.SaveChangesAsync();
        return entity.Id;
    }

    public async Task<bool> UpdateFoodRecordAsync(int memberId, int id, UpdateFoodRecordRequest request)
    {
        var entity = await _db.DailyDiets
            .FirstOrDefaultAsync(d => d.Id == id && d.MemberId == memberId);

        if (entity is null) return false;

        entity.Amount   = request.Amount;
        entity.Measure  = request.Measure;
        entity.MealType = request.MealType;
        entity.EatDT    = request.EatDT;
        entity.Note     = request.Note;
        await _db.SaveChangesAsync();
        return true;
    }

    public async Task<bool> DeleteFoodRecordAsync(int memberId, int id)
    {
        var rows = await _db.DailyDiets
            .Where(d => d.Id == id && d.MemberId == memberId)
            .ExecuteDeleteAsync();
        return rows > 0;
    }

    public async Task<bool> HasFoodRecordsAsync(int memberId, DateOnly date)
        => await _db.DailyDiets.AnyAsync(d => d.MemberId == memberId && d.EatDT == date);

    public async Task CopyFoodRecordsAsync(int memberId, DateOnly sourceDate, DateOnly targetDate, bool overwrite)
    {
        await using var tx = await _db.Database.BeginTransactionAsync();
        try
        {
            if (overwrite)
            {
                await _db.DailyDiets
                    .Where(d => d.MemberId == memberId && d.EatDT == targetDate)
                    .ExecuteDeleteAsync();
            }

            var sources = await _db.DailyDiets
                .Where(d => d.MemberId == memberId && d.EatDT == sourceDate)
                .AsNoTracking()
                .ToListAsync();

            var copies = sources.Select(s => new DailyDiet
            {
                MemberId  = memberId,
                EatDT     = targetDate,
                MealType  = s.MealType,
                FoodId    = s.FoodId,
                Amount    = s.Amount,
                Measure   = s.Measure,
                Note      = s.Note,
                CreatedAt = DateTime.UtcNow,
            }).ToList();

            await _db.DailyDiets.AddRangeAsync(copies);
            await _db.SaveChangesAsync();
            await tx.CommitAsync();
        }
        catch
        {
            await tx.RollbackAsync();
            throw;
        }
    }

    public async Task<int> GetWaterAmountAsync(int memberId, DateOnly date)
        => await _db.WaterLogs
            .Where(w => w.MemberId == memberId && w.LogDate == date)
            .Select(w => (int?)w.Amount)
            .FirstOrDefaultAsync() ?? 0;

    public async Task UpsertWaterLogAsync(int memberId, UpdateWaterLogRequest request)
    {
        var entity = await _db.WaterLogs
            .FirstOrDefaultAsync(w => w.MemberId == memberId && w.LogDate == request.LogDate);

        if (entity is null)
        {
            _db.WaterLogs.Add(new WaterLog
            {
                MemberId = memberId,
                LogDate = request.LogDate,
                Amount = request.Amount,
            });
        }
        else
        {
            entity.Amount = request.Amount;
        }

        await _db.SaveChangesAsync();
    }

    // ── shared nutrition join query ────────────────────────────────
    private IQueryable<FoodRecordDto> FoodRecordBaseQuery(int memberId) =>
        from d in _db.DailyDiets
        join f in _db.Foods on d.FoodId equals f.Id
        join n in _db.NutrientReferenceValues
            on new { FoodId = d.FoodId!.Value, Measure = d.Measure! }
            equals new { n.FoodId, n.Measure }
        where d.MemberId == memberId && d.FoodId != null && d.Measure != null
        select new FoodRecordDto
        {
            Id       = d.Id,
            FoodId   = f.Id,
            FoodName = f.FoodName,
            Amount   = d.Amount ?? 0m,
            Measure  = d.Measure ?? string.Empty,
            MealType = d.MealType == "早餐" ? "breakfast"
                     : d.MealType == "午餐" ? "lunch"
                     : d.MealType == "晚餐" ? "dinner"
                     : d.MealType == "點心" || d.MealType == "點心/宵夜" ? "snack"
                     : d.MealType ?? string.Empty,
            Calories = (d.Amount!.Value / n.BaseAmount) * (n.Kcal ?? 0m),
            Protein  = (d.Amount!.Value / n.BaseAmount) * (n.ProteinGram ?? 0m),
            Carbs    = (d.Amount!.Value / n.BaseAmount) * (n.CarbGram ?? 0m),
            Fat      = (d.Amount!.Value / n.BaseAmount) * (n.FatGram ?? 0m),
            EatDT    = d.EatDT!.Value,
            Note     = d.Note,
        };
}
