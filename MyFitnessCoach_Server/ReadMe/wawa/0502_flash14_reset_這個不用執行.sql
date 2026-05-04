-- =============================================
-- 0502: FLASH14 測試重置 — 清掉所有領取紀錄
-- 用途:測過「領取 → 套用 → 結帳」流程後重設,讓同一帳號可再次領取
-- 注意:不限量(TotalQuota=NULL),所以無 RemainingQuota 需回補
-- =============================================
DECLARE @couponId INT = (SELECT [Id] FROM [dbo].[Coupons] WHERE [Code] = 'FLASH14');

DELETE FROM [dbo].[MemberCoupons] WHERE [CouponId] = @couponId;
GO

-- 驗證
SELECT COUNT(*) AS RemainingClaims FROM [dbo].[MemberCoupons]
WHERE [CouponId] = (SELECT [Id] FROM [dbo].[Coupons] WHERE [Code] = 'FLASH14');
