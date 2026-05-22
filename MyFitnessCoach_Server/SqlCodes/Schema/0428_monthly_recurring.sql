-- =============================================
-- 0428: DAY22 等限當日券改成「每月可重領一次」
-- =============================================
-- 重點:
--   1. MemberCoupons 加 computed 欄位 ClaimYearMonth(從 ClaimedAt 推導出 'YYYY-MM')
--   2. 把舊 UNIQUE(MemberId, CouponId) 換成 UNIQUE(MemberId, CouponId, ClaimYearMonth)
--   3. 對 WELCOME100(一生一次)沒影響:應用層 HasClaimedAsync 會擋,不會跑到 DB 約束
--   4. 對 DAY22(每月一次)有影響:不同月份允許各一筆
-- =============================================

-- (1) 加 computed 欄位
ALTER TABLE [dbo].[MemberCoupons] ADD
    [ClaimYearMonth] AS CONVERT(CHAR(7), [ClaimedAt], 120) PERSISTED;
GO

-- (2) 拿掉舊 UNIQUE
DROP INDEX [UX_MemberCoupons_Member_Coupon] ON [dbo].[MemberCoupons];
GO

-- (3) 換成新 UNIQUE(含年月)
CREATE UNIQUE NONCLUSTERED INDEX [UX_MemberCoupons_Member_Coupon_Month]
    ON [dbo].[MemberCoupons] ([MemberId], [CouponId], [ClaimYearMonth]);
GO

-- 驗證
SELECT [Id],[MemberId],[CouponId],[ClaimedAt],[ClaimYearMonth],[UsedAt]
FROM [dbo].[MemberCoupons]
ORDER BY [Id];
