USE [MyFitnessCoachDb];
GO

-- =============================================
-- 0502: 新增測試用限時券 FLASH14
-- 限時 14 天活動(2026-05-02 ~ 2026-05-15)、全館 88 折(上限 200)
-- 用於補測 StartAt/EndAt 時間窗篩選邏輯
-- =============================================
INSERT INTO [dbo].[Coupons]
    ([Code], [Name], [Description],
     [DiscountType], [DiscountValue],
     [MinSpend], [MaxDiscount],
     [TotalQuota], [RemainingQuota],
     [StartAt], [EndAt], [IsActive],
     [ValidDaysAfterClaim], [VisibleOnlyOnDayOfMonth], [BannerImageUrl])
VALUES
    ('FLASH14', '限時 14 天 88 折',
     '全館 88 折,折扣上限 NT$200,2026-05-02 ~ 2026-05-15 限定',
     2, 12,
     500, 200,
     NULL, NULL,
     '2026-05-02', '2026-05-16', 1,
     NULL, NULL, NULL);
GO

-- 驗證
SELECT [Code],[Name],[DiscountType],[DiscountValue],
       [MinSpend],[MaxDiscount],[StartAt],[EndAt],
       [TotalQuota],[ValidDaysAfterClaim],[VisibleOnlyOnDayOfMonth]
FROM [dbo].[Coupons] WHERE [Code] = 'FLASH14';
