-- =============================================
-- 0428: 資料驅動到期日 + DAY22 限當日顯示 + BannerImageUrl
-- =============================================
-- 重點:
--   1. Coupons 加 3 欄(ValidDaysAfterClaim / VisibleOnlyOnDayOfMonth / BannerImageUrl)
--   2. 刪除 SPRING10
--   3. WELCOME100:低消 1000 → 500、設 30 天個人有效期
--   4. DAY22:設定每月 22 日才顯示
--   5. 為已領取的 WELCOME100 補 ExpiresAt = ClaimedAt + 30 天
-- =============================================
BEGIN TRANSACTION;

-- (1) Coupons 加 3 欄
ALTER TABLE [dbo].[Coupons] ADD
    [ValidDaysAfterClaim]     INT            NULL,
    [VisibleOnlyOnDayOfMonth] TINYINT        NULL,
    [BannerImageUrl]          NVARCHAR(500)  NULL;

-- (2) 刪除 SPRING10:先清會員領取紀錄(FK),再刪主檔
DELETE FROM [dbo].[MemberCoupons]
WHERE [CouponId] = (SELECT [Id] FROM [dbo].[Coupons] WHERE [Code] = 'SPRING10');

DELETE FROM [dbo].[Coupons] WHERE [Code] = 'SPRING10';

-- (3) WELCOME100:低消改 500、設 30 天個人有效期、文案更新
UPDATE [dbo].[Coupons]
SET [MinSpend]            = 500,
    [Description]         = '首次消費滿 NT$500 立折 NT$100,領券後 30 天內有效',
    [ValidDaysAfterClaim] = 30
WHERE [Code] = 'WELCOME100';

-- (4) DAY22:只在每月 22 日顯示
UPDATE [dbo].[Coupons]
SET [VisibleOnlyOnDayOfMonth] = 22
WHERE [Code] = 'DAY22';

-- (5) 為已領取但 ExpiresAt 是 NULL 的 WELCOME100,補上 ClaimedAt + 30 天
UPDATE [dbo].[MemberCoupons]
SET [ExpiresAt] = DATEADD(DAY, 30, [ClaimedAt])
WHERE [ExpiresAt] IS NULL
  AND [CouponId] = (SELECT [Id] FROM [dbo].[Coupons] WHERE [Code] = 'WELCOME100');

COMMIT TRANSACTION;
GO

-- 驗證
SELECT [Id],[Code],[Name],[MinSpend],[ValidDaysAfterClaim],[VisibleOnlyOnDayOfMonth],[BannerImageUrl]
FROM [dbo].[Coupons];
