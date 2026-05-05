USE [MyFitnessCoachDb];
GO

-- =====================================================================
-- 優惠券系統 — 一鍵完整 Setup（master 檔，照順序執行）
-- ---------------------------------------------------------------------
-- 用途：新環境第一次建表後執行此檔，會把 4 張券 + banner 圖路徑全部設好
-- 安全：所有 INSERT/UPDATE 都有 IF NOT EXISTS 防呆，可重複執行不會出錯
-- 順序：① WELCOME100 + DAY22  →  ② SAVE100  →  ③ FLASH14  →  ④ Banner URL
--
--  ⚠️ 如果只是要新增「單一張券」做測試，請看資料夾裡對應的單檔
--    （0429_… / 0430_save100_seed / 0502_flash14_seed），勿執行此 master 檔
--    重複執行雖然安全但會多跑無謂的查詢
-- =====================================================================

PRINT N'=== 優惠券 Setup 開始 ===';
GO


-- ---------------------------------------------------------------------
-- ① WELCOME100（首購折 100）+ DAY22（每月 22 日 85 折）
-- ---------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[Coupons] WHERE [Code] = 'WELCOME100')
BEGIN
    INSERT INTO [dbo].[Coupons]
        ([Code], [Name], [Description],
         [DiscountType], [DiscountValue], [MinSpend], [MaxDiscount],
         [TotalQuota], [RemainingQuota],
         [StartAt], [EndAt],
         [ValidDaysAfterClaim], [VisibleOnlyOnDayOfMonth])
    VALUES
        ('WELCOME100', N'新會員首購折100',
         N'首次消費滿 NT$500 立折 NT$100,領券後 30 天內有效',
         1, 100, 500, NULL,
         1000, 1000,
         '2026-01-01', '2026-12-31',
         30, NULL);
    PRINT N'  ✓ WELCOME100 已新增';
END
ELSE
    PRINT N'  - WELCOME100 已存在，跳過';

IF NOT EXISTS (SELECT 1 FROM [dbo].[Coupons] WHERE [Code] = 'DAY22')
BEGIN
    INSERT INTO [dbo].[Coupons]
        ([Code], [Name], [Description],
         [DiscountType], [DiscountValue], [MinSpend], [MaxDiscount],
         [TotalQuota], [RemainingQuota],
         [StartAt], [EndAt],
         [ValidDaysAfterClaim], [VisibleOnlyOnDayOfMonth])
    VALUES
        ('DAY22', N'每月 22 日 85 折',
         N'每月 22 日當天全館商品 85 折(限當日使用)',
         2, 15, 0, NULL,
         NULL, NULL,
         '2026-01-01', '2026-12-31',
         NULL, 22);
    PRINT N'  ✓ DAY22 已新增';
END
ELSE
    PRINT N'  - DAY22 已存在，跳過';
GO


-- ---------------------------------------------------------------------
-- ② SAVE100（滿千折百）
-- ---------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[Coupons] WHERE [Code] = 'SAVE100')
BEGIN
    INSERT INTO [dbo].[Coupons]
        ([Code], [Name], [Description],
         [DiscountType], [DiscountValue],
         [MinSpend], [MaxDiscount],
         [TotalQuota], [RemainingQuota],
         [StartAt], [EndAt], [IsActive],
         [ValidDaysAfterClaim], [VisibleOnlyOnDayOfMonth], [BannerImageUrl])
    VALUES
        ('SAVE100', N'滿千折百',
         N'全館滿 NT$1000 享 9 折，折扣上限 NT$100',
         2, 10,
         1000, 100,
         1000, 1000,
         '2026-01-01', '2026-12-31', 1,
         NULL, NULL, NULL);
    PRINT N'  ✓ SAVE100 已新增';
END
ELSE
    PRINT N'  - SAVE100 已存在，跳過';
GO


-- ---------------------------------------------------------------------
-- ③ FLASH14（限時 14 天 88 折）
-- ---------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM [dbo].[Coupons] WHERE [Code] = 'FLASH14')
BEGIN
    INSERT INTO [dbo].[Coupons]
        ([Code], [Name], [Description],
         [DiscountType], [DiscountValue],
         [MinSpend], [MaxDiscount],
         [TotalQuota], [RemainingQuota],
         [StartAt], [EndAt], [IsActive],
         [ValidDaysAfterClaim], [VisibleOnlyOnDayOfMonth], [BannerImageUrl])
    VALUES
        ('FLASH14', N'限時 14 天 88 折',
         N'全館 88 折,折扣上限 NT$200,2026-05-02 ~ 2026-05-15 限定',
         2, 12,
         500, 200,
         NULL, NULL,
         '2026-05-02', '2026-05-16', 1,
         NULL, NULL, NULL);
    PRINT N'  ✓ FLASH14 已新增';
END
ELSE
    PRINT N'  - FLASH14 已存在，跳過';
GO


-- ---------------------------------------------------------------------
-- ④ Banner 圖路徑（必須在 ② SAVE100、③ FLASH14 之後執行）
--   圖檔請放 MyFitnessCoach_Client/public/assets/banners/ 下
--   或改成外部 URL（例如 https://placehold.co/1200x375/c4a882/ffffff?text=FLASH14）
-- ---------------------------------------------------------------------
DECLARE @flashRows INT, @saveRows INT;

UPDATE [dbo].[Coupons]
SET [BannerImageUrl] = '/assets/banners/flash14.svg'
WHERE [Code] = 'FLASH14';
SET @flashRows = @@ROWCOUNT;

UPDATE [dbo].[Coupons]
SET [BannerImageUrl] = '/assets/banners/save100.svg'
WHERE [Code] = 'SAVE100';
SET @saveRows = @@ROWCOUNT;

IF @flashRows = 0 OR @saveRows = 0
BEGIN
    RAISERROR(N'⚠️ Banner 設定失敗：FLASH14(更新 %d 列) 或 SAVE100(更新 %d 列) 不存在於 Coupons。請先執行步驟 ② ③。',
              16, 1, @flashRows, @saveRows);
END
ELSE
    PRINT N'  ✓ Banner URL 已設定（FLASH14 + SAVE100）';
GO


-- =====================================================================
-- 驗證：列出全部 4 張券的關鍵欄位
-- =====================================================================
PRINT N'=== 完成。目前 Coupons 表內容： ===';

SELECT [Code], [Name], [DiscountType], [DiscountValue],
       [MinSpend], [MaxDiscount],
       [StartAt], [EndAt], [IsActive],
       [ValidDaysAfterClaim], [VisibleOnlyOnDayOfMonth],
       [BannerImageUrl]
FROM [dbo].[Coupons]
WHERE [Code] IN ('WELCOME100', 'DAY22', 'SAVE100', 'FLASH14')
ORDER BY [Id];

-- 預期：應該有 4 列，BannerImageUrl 中 FLASH14 / SAVE100 兩列有值
GO
