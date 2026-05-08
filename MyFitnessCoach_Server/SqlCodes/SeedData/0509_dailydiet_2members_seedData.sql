-- =============================================
-- 0509_dailydiet_2members_seedData.sql  (備份用)
-- 還原 DailyDiets 為原始 2 人資料 (MemberId=1, MemberId=7)
-- Database: MyFitnessCoachDb
--
-- 用途：執行完壓力測試腳本後，用此腳本還原成原始 seed 狀態
-- 預估筆數：27,924 筆  (2 members × 6 records/day × 2,327 days)
-- 預估執行時間：< 5 秒
-- =============================================

USE [MyFitnessCoachDb]
GO

SET NOCOUNT ON;
GO

-- 先移除複合索引（若存在），避免大量 INSERT 時索引維護拖慢速度
IF EXISTS (
    SELECT 1 FROM sys.indexes
    WHERE [object_id] = OBJECT_ID('dbo.DailyDiets')
      AND [name] = 'IX_DailyDiets_MemberId_EatDT'
)
BEGIN
    DROP INDEX [IX_DailyDiets_MemberId_EatDT] ON [dbo].[DailyDiets];
    PRINT '索引 IX_DailyDiets_MemberId_EatDT 已移除';
END
GO

-- 清空 DailyDiets 全部資料（保留資料表結構）
DELETE FROM [dbo].[DailyDiets];
GO

-- 重設 IDENTITY 種子
DBCC CHECKIDENT ('dbo.DailyDiets', RESEED, 0);
GO

PRINT '=== DailyDiets 已清空，開始還原 MemberId=1, 7 的資料 ===';
GO

-- ============================================================
-- INSERT：MemberId=1 & 7，每天 3 餐 × 2 食物 = 6 筆/人/天
-- 日期範圍：2020-01-01 ~ 2026-05-16（2,327 天）
--
-- 食物清單：
--   FoodId  7  燕麥片       早餐  克
--   FoodId  4  牛奶         早餐  ml
--   FoodId  1  水煮雞胸肉   午餐  克
--   FoodId  2  白飯         午餐  克
--   FoodId 14  鮭魚排       晚餐  克
--   FoodId  6  糙米飯       晚餐  克
--
-- Amount 公式：
--   amt0 + trnd×(days/2327) + seas×COS(季節) + wave×SIN(週期)
--   最低保底 20 克/ml
-- ============================================================

;WITH Days AS (
    SELECT CAST('2020-01-01' AS DATE) AS dt
    UNION ALL
    SELECT DATEADD(day, 1, dt) FROM Days WHERE dt < CAST('2026-05-16' AS DATE)
)
INSERT INTO [dbo].[DailyDiets]
    ([MemberId], [EatDT], [MealType], [FoodId], [Amount], [Measure])
SELECT
    cfg.mid,
    dt,
    cfg.meal,
    cfg.fid,
    CAST(
        CASE WHEN
            ROUND(
                cfg.amt0
                + cfg.trnd * (CAST(DATEDIFF(day, '2020-01-01', dt) AS FLOAT) / 2327.0)
                + cfg.seas * COS(2.0*PI()*CAST(DATEPART(dayofyear,dt) AS FLOAT)/365.0)
                + cfg.wave * SIN(2.0*PI()*CAST(DATEDIFF(day,'2020-01-01',dt) AS FLOAT)/7.0)
            , 2) < 20.0
        THEN 20.0
        ELSE ROUND(
                cfg.amt0
                + cfg.trnd * (CAST(DATEDIFF(day, '2020-01-01', dt) AS FLOAT) / 2327.0)
                + cfg.seas * COS(2.0*PI()*CAST(DATEPART(dayofyear,dt) AS FLOAT)/365.0)
                + cfg.wave * SIN(2.0*PI()*CAST(DATEDIFF(day,'2020-01-01',dt) AS FLOAT)/7.0)
             , 2)
        END
    AS DECIMAL(10,2)),
    cfg.msr

FROM Days
CROSS JOIN (VALUES
--  mid   meal      fid  msr    amt0    trnd   seas  wave
    -- ── MemberId=1 (F, 163 cm, StartWeight=58, TDEE≈1878) ──
    (1, N'早餐',  7, N'克',   80.0, -10.0,  8.0,  5.0),   -- 燕麥片 80→70g
    (1, N'早餐',  4, N'ml',  250.0, -20.0,  5.0, 10.0),   -- 牛奶 250→230ml
    (1, N'午餐',  1, N'克',  160.0, -20.0, 15.0,  8.0),   -- 雞胸肉 160→140g
    (1, N'午餐',  2, N'克',  220.0, -30.0, 20.0, 10.0),   -- 白飯 220→190g
    (1, N'晚餐', 14, N'克',  140.0, -15.0, 12.0,  6.0),   -- 鮭魚排 140→125g
    (1, N'晚餐',  6, N'克',  200.0, -30.0, 15.0,  8.0),   -- 糙米飯 200→170g

    -- ── MemberId=7 (F, 180 cm, StartWeight=68, TDEE=2200) ──
    (7, N'早餐',  7, N'克',  100.0, -15.0, 10.0,  6.0),   -- 燕麥片 100→85g
    (7, N'早餐',  4, N'ml',  300.0, -30.0,  8.0, 12.0),   -- 牛奶 300→270ml
    (7, N'午餐',  1, N'克',  190.0, -25.0, 18.0, 10.0),   -- 雞胸肉 190→165g
    (7, N'午餐',  2, N'克',  260.0, -40.0, 22.0, 12.0),   -- 白飯 260→220g
    (7, N'晚餐', 14, N'克',  165.0, -20.0, 15.0,  8.0),   -- 鮭魚排 165→145g
    (7, N'晚餐',  6, N'克',  230.0, -35.0, 18.0, 10.0)    -- 糙米飯 230→195g
) AS cfg(mid, meal, fid, msr, amt0, trnd, seas, wave)
OPTION (MAXRECURSION 2500);
GO

DECLARE @totalCnt INT;
SELECT @totalCnt = COUNT(*) FROM [dbo].[DailyDiets];
PRINT CONCAT('DailyDiets 還原完成，共插入: ', @totalCnt, ' 筆');
GO

-- ============================================================
-- 建立複合索引（若不存在）
-- 加速 WHERE MemberId = ? AND EatDT BETWEEN ? AND ? 的查詢
-- INCLUDE 覆蓋常用欄位，避免回查聚集索引 (Key Lookup)
-- ============================================================
IF NOT EXISTS (
    SELECT 1 FROM sys.indexes
    WHERE [object_id] = OBJECT_ID('dbo.DailyDiets')
      AND [name] = 'IX_DailyDiets_MemberId_EatDT'
)
BEGIN
    CREATE NONCLUSTERED INDEX [IX_DailyDiets_MemberId_EatDT]
    ON [dbo].[DailyDiets] ([MemberId], [EatDT])
    INCLUDE ([MealType], [FoodId], [Amount], [Measure]);

    PRINT '索引 IX_DailyDiets_MemberId_EatDT 建立完成';
END
ELSE
    PRINT '索引 IX_DailyDiets_MemberId_EatDT 已存在，略過建立';
GO

PRINT '=== 0509_dailydiet_2members_seedData.sql 執行完畢 ===';
GO
