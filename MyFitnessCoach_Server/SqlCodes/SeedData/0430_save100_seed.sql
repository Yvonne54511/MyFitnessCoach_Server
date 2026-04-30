-- =============================================
-- 0430: 新增測試用滿額券 SAVE100
-- 全館滿 1000 享 9 折(上限 100)、全年有效、不設個人有效期
-- 任何帳號、任何日期都能測試
-- =============================================
INSERT INTO [dbo].[Coupons]
    ([Code], [Name], [Description],
     [DiscountType], [DiscountValue],
     [MinSpend], [MaxDiscount],
     [TotalQuota], [RemainingQuota],
     [StartAt], [EndAt], [IsActive],
     [ValidDaysAfterClaim], [VisibleOnlyOnDayOfMonth], [BannerImageUrl])
VALUES
    ('SAVE100', '滿千折百',
     '全館滿 NT$1000 享 9 折，折扣上限 NT$100',
     2, 10,
     1000, 100,
     1000, 1000,
     '2026-01-01', '2026-12-31', 1,
     NULL, NULL, NULL);
GO

-- 驗證
SELECT [Code],[Name],[DiscountType],[DiscountValue],
       [MinSpend],[MaxDiscount],[StartAt],[EndAt],
       [ValidDaysAfterClaim],[VisibleOnlyOnDayOfMonth]
FROM [dbo].[Coupons] WHERE [Code] = 'SAVE100';
