using MyFitnessCoach_Server.Models.DTOs;
using MyFitnessCoach_Server.Models.Repositories;

namespace MyFitnessCoach_Server.Models.Services;

public class BodyRecordConflictException : Exception
{
    public int ExistingId { get; }
    public BodyRecordConflictException(int existingId) : base("此日期已有量測紀錄")
    {
        ExistingId = existingId;
    }
}

public class BodyRecordService : IBodyRecordService
{
    private readonly IBodyRecordRepository _repo;
    private readonly IWebHostEnvironment   _env;

    private static readonly string[] AllowedExts = [".jpg", ".jpeg", ".png", ".webp"];

    public BodyRecordService(IBodyRecordRepository repo, IWebHostEnvironment env)
    {
        _repo = repo;
        _env  = env;
    }

    public Task<IReadOnlyList<BodyRecordDto>> GetRecordsAsync(
        int memberId, DateOnly? fromDate, DateOnly? toDate, int take)
        => _repo.GetRecordsAsync(memberId, fromDate, toDate, take);

    public Task<BodyRecordDto?> GetByIdAsync(int memberId, int id)
        => _repo.GetByIdAsync(memberId, id);

    public async Task<BodyRecordDto> CreateAsync(int memberId, CreateBodyRecordRequest request)
    {
        Validate(request.Weight, request.BodyFat, request.SkeletalMuscle,
                 request.WaistCircumference, request.HipCircumference, request.Photo);

        var existing = await _repo.GetByDateAsync(memberId, request.MeasureDate);
        if (existing is not null)
            throw new BodyRecordConflictException(existing.Id);

        var imageUrl = request.Photo is not null ? await SavePhotoAsync(request.Photo) : null;
        var newId    = await _repo.CreateAsync(memberId, request, imageUrl);
        return (await _repo.GetByIdAsync(memberId, newId))!;
    }

    public async Task<BodyRecordDto?> UpdateAsync(int memberId, int id, UpdateBodyRecordRequest request)
    {
        Validate(request.Weight, request.BodyFat, request.SkeletalMuscle,
                 request.WaistCircumference, request.HipCircumference, request.Photo);

        // 先取舊圖路徑，供 DB 更新成功後才刪除
        var oldImageUrl = await _repo.GetImageUrlAsync(memberId, id);

        string? newImageUrl = null;
        if (request.Photo is not null)
            newImageUrl = await SavePhotoAsync(request.Photo);

        var updated = await _repo.UpdateAsync(memberId, id, request, newImageUrl);
        if (!updated)
        {
            // DB 更新失敗，若已存了新檔則刪掉避免孤兒檔
            if (newImageUrl is not null) DeletePhoto(newImageUrl);
            return null;
        }

        // DB 更新成功後才刪除舊檔（保障資料一致性）
        if (newImageUrl is not null)
            DeletePhoto(oldImageUrl);

        return await _repo.GetByIdAsync(memberId, id);
    }

    public async Task<bool> DeleteAsync(int memberId, int id)
    {
        var imageUrl = await _repo.GetImageUrlAsync(memberId, id);
        var deleted  = await _repo.DeleteAsync(memberId, id);
        if (deleted) DeletePhoto(imageUrl);
        return deleted;
    }

    // ── helpers ──────────────────────────────────────────────────
    private static void Validate(
        double weight, decimal? bodyFat, decimal? skeletalMuscle,
        decimal? waist, decimal? hip, IFormFile? photo)
    {
        if (weight <= 0)
            throw new ArgumentException("體重必須大於 0");
        if (bodyFat.HasValue && (bodyFat < 0 || bodyFat > 100))
            throw new ArgumentException("體脂率需介於 0 到 100");
        if (skeletalMuscle.HasValue && skeletalMuscle < 0)
            throw new ArgumentException("骨骼肌量不能為負");
        if (waist.HasValue && waist < 0)
            throw new ArgumentException("腰圍不能為負");
        if (hip.HasValue && hip < 0)
            throw new ArgumentException("臀圍不能為負");

        if (photo is not null)
        {
            if (photo.Length > 5 * 1024 * 1024)
                throw new ArgumentException("圖片不得超過 5 MB");
            var ext = Path.GetExtension(photo.FileName).ToLowerInvariant();
            if (!AllowedExts.Contains(ext))
                throw new ArgumentException("不支援的圖片格式，請上傳 JPG、PNG 或 WEBP");
        }
    }

    private async Task<string> SavePhotoAsync(IFormFile photo)
    {
        var folder = Path.Combine(_env.ContentRootPath, "img", "bodyrecords");
        Directory.CreateDirectory(folder);

        var ext      = Path.GetExtension(photo.FileName).ToLowerInvariant();
        var fileName = $"{Guid.NewGuid():N}{ext}";
        var fullPath = Path.Combine(folder, fileName);

        await using var stream = File.Create(fullPath);
        await photo.CopyToAsync(stream);

        return $"/img/bodyrecords/{fileName}";
    }

    private void DeletePhoto(string? imageUrl)
    {
        if (imageUrl is null || !imageUrl.StartsWith("/img/bodyrecords/")) return;
        var rel      = imageUrl.TrimStart('/').Replace('/', Path.DirectorySeparatorChar);
        var fullPath = Path.Combine(_env.ContentRootPath, rel);
        if (File.Exists(fullPath)) File.Delete(fullPath);
    }
}
