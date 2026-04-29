USE [MyFitnessCoachDb];
GO

-- =============================================
-- Seed:兩張生效的券(Id 由 IDENTITY 自動配)
-- =============================================
INSERT INTO [dbo].[Coupons]
    ([Code], [Name], [Description],
     [DiscountType], [DiscountValue], [MinSpend], [MaxDiscount],
     [TotalQuota], [RemainingQuota],
     [StartAt], [EndAt],
     [ValidDaysAfterClaim], [VisibleOnlyOnDayOfMonth])
VALUES
    ('WELCOME100', '新會員首購折100',
     '首次消費滿 NT$500 立折 NT$100,領券後 30 天內有效',
     1, 100, 500, NULL,
     1000, 1000,
     '2026-01-01', '2026-12-31',
     30, NULL),

    ('DAY22', '每月 22 日 85 折',
     '每月 22 日當天全館商品 85 折(限當日使用)',
     2, 15, 0, NULL,
     NULL, NULL,
     '2026-01-01', '2026-12-31',
     NULL, 22);
GO