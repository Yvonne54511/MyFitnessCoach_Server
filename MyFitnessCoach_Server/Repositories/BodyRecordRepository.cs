using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.EfModels;
using MyFitnessCoach_Server.Models.Repositories;

namespace MyFitnessCoach_Server.Repositories;

public class BodyRecordRepository : IBodyRecordRepository
{
    private readonly MyFitnessCoachDbContext _db;

    public BodyRecordRepository(MyFitnessCoachDbContext db) => _db = db;

    // CreateAt 在此表作為「量測日期」使用，不代表實際建立時間
    private static BodyRecordDto ToDto(BodyRecord e) => new()
    {
        Id                 = e.Id,
        MeasureDate        = DateOnly.FromDateTime(e.CreateAt),
        Weight             = e.Weight,
        BodyFat            = e.BodyFat,
        SkeletalMuscle     = e.SkeletalMuscle,
        WaistCircumference = e.WaistCircumference,
        HipCircumference   = e.HipCircumference,
        Note               = e.Note,
        ImageUrl           = e.ImageUrl,
    };

    public async Task<IReadOnlyList<BodyRecordDto>> GetRecordsAsync(
        int memberId, DateOnly? fromDate, DateOnly? toDate, int take)
    {
        var query = _db.BodyRecords.Where(x => x.MemberId == memberId);

        if (fromDate.HasValue)
        {
            var start = fromDate.Value.ToDateTime(TimeOnly.MinValue);
            query = query.Where(x => x.CreateAt >= start);
        }

        if (toDate.HasValue)
        {
            var end = toDate.Value.ToDateTime(TimeOnly.MinValue).AddDays(1);
            query = query.Where(x => x.CreateAt < end);
        }

        return await query
            .OrderByDescending(x => x.CreateAt)
            .Take(take)
            .Select(e => new BodyRecordDto
            {
                Id                 = e.Id,
                MeasureDate        = DateOnly.FromDateTime(e.CreateAt),
                Weight             = e.Weight,
                BodyFat            = e.BodyFat,
                SkeletalMuscle     = e.SkeletalMuscle,
                WaistCircumference = e.WaistCircumference,
                HipCircumference   = e.HipCircumference,
                Note               = e.Note,
                ImageUrl           = e.ImageUrl,
            })
            .ToListAsync();
    }

    public async Task<BodyRecordDto?> GetByIdAsync(int memberId, int id)
    {
        var e = await _db.BodyRecords
            .Where(x => x.MemberId == memberId && x.Id == id)
            .FirstOrDefaultAsync();
        return e is null ? null : ToDto(e);
    }

    public async Task<BodyRecordDto?> GetByDateAsync(int memberId, DateOnly date)
    {
        var start = date.ToDateTime(TimeOnly.MinValue);
        var end   = start.AddDays(1);
        var e = await _db.BodyRecords
            .Where(x => x.MemberId == memberId && x.CreateAt >= start && x.CreateAt < end)
            .FirstOrDefaultAsync();
        return e is null ? null : ToDto(e);
    }

    public async Task<int> CreateAsync(int memberId, CreateBodyRecordRequest request, string? imageUrl)
    {
        var entity = new BodyRecord
        {
            MemberId           = memberId,
            Weight             = request.Weight,
            BodyFat            = request.BodyFat,
            SkeletalMuscle     = request.SkeletalMuscle,
            WaistCircumference = request.WaistCircumference,
            HipCircumference   = request.HipCircumference,
            Note               = request.Note,
            ImageUrl           = imageUrl,
            // CreateAt 在此表作為「量測日期」使用，不代表實際建立時間
            CreateAt           = request.MeasureDate.ToDateTime(TimeOnly.MinValue),
        };
        _db.BodyRecords.Add(entity);
        await _db.SaveChangesAsync();
        return entity.Id;
    }

    public async Task<bool> UpdateAsync(int memberId, int id, UpdateBodyRecordRequest request, string? imageUrl)
    {
        var entity = await _db.BodyRecords
            .FirstOrDefaultAsync(x => x.MemberId == memberId && x.Id == id);
        if (entity is null) return false;

        entity.Weight             = request.Weight;
        entity.BodyFat            = request.BodyFat;
        entity.SkeletalMuscle     = request.SkeletalMuscle;
        entity.WaistCircumference = request.WaistCircumference;
        entity.HipCircumference   = request.HipCircumference;
        entity.Note               = request.Note;
        // CreateAt 在此表作為「量測日期」使用，不代表實際建立時間
        entity.CreateAt           = request.MeasureDate.ToDateTime(TimeOnly.MinValue);

        if (imageUrl is not null)
            entity.ImageUrl = imageUrl;

        await _db.SaveChangesAsync();
        return true;
    }

    public async Task<bool> DeleteAsync(int memberId, int id)
    {
        var entity = await _db.BodyRecords
            .FirstOrDefaultAsync(x => x.MemberId == memberId && x.Id == id);
        if (entity is null) return false;
        _db.BodyRecords.Remove(entity);
        await _db.SaveChangesAsync();
        return true;
    }

    public async Task<string?> GetImageUrlAsync(int memberId, int id)
    {
        return await _db.BodyRecords
            .Where(x => x.MemberId == memberId && x.Id == id)
            .Select(x => x.ImageUrl)
            .FirstOrDefaultAsync();
    }
}
