-- =============================================
-- 0430: SAVE100 測試重置 — 清領取紀錄、回補配額
-- 用途：測試「領取 → 套用 → 結帳」流程後重設,讓同一帳號可再次領取
-- 警告：正式環境不要執行
-- =============================================
DECLARE @couponId INT = (SELECT [Id] FROM [dbo].[Coupons] WHERE [Code] = 'SAVE100');
DECLARE @claimedCount INT;

BEGIN TRANSACTION;

SELECT @claimedCount = COUNT(*) FROM [dbo].[MemberCoupons] WHERE [CouponId] = @couponId;

DELETE FROM [dbo].[MemberCoupons] WHERE [CouponId] = @couponId;

UPDATE [dbo].[Coupons]
SET [RemainingQuota] = [RemainingQuota] + @claimedCount
WHERE [Id] = @couponId;

COMMIT TRANSACTION;
GO

-- 驗證
SELECT [Code],[RemainingQuota] FROM [dbo].[Coupons] WHERE [Code] = 'SAVE100';
SELECT COUNT(*) AS RemainingClaims FROM [dbo].[MemberCoupons]
WHERE [CouponId] = (SELECT [Id] FROM [dbo].[Coupons] WHERE [Code] = 'SAVE100');
