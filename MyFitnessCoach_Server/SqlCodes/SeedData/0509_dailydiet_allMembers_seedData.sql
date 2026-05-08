-- =============================================
-- 0509_dailydiet_allMembers_seedData.sql
-- 壓力測試：全部 106 位會員的 DailyDiets 資料
-- Database: MyFitnessCoachDb
--
-- 預估筆數：1,479,972 筆  (106 members × 6 records/day × 2,327 days)
-- 預估執行時間：2 ~ 5 分鐘（依硬體而定）
--
-- ⚠ 注意事項：
--   - 此腳本會產生約 150 萬筆資料，請確認磁碟空間充足
--   - 建議在非上班時段執行，避免影響其他使用者
--   - 執行完畢後建議手動更新統計資訊：
--     UPDATE STATISTICS [dbo].[DailyDiets];
--   - 還原請執行 0509_dailydiet_2members_seedData.sql
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

PRINT '=== DailyDiets 已清空，開始分批產生 106 位會員資料 ===';
PRINT CONCAT('開始時間: ', CONVERT(VARCHAR(20), GETDATE(), 120));
GO

-- ============================================================
-- 分批 INSERT（每批 20 位會員，約 279,240 筆）
-- 避免單次 INSERT 過大導致 tempdb / 交易記錄暴增
-- ============================================================

DECLARE @batchStart INT = 1;
DECLARE @batchSize  INT = 20;
DECLARE @maxId      INT = (SELECT MAX([Id]) FROM [dbo].[Members]);
DECLARE @batchCount INT = 0;

WHILE @batchStart <= @maxId
BEGIN
    ;WITH
    E1(n) AS (SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL
              SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL
              SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1),
    E2(n) AS (SELECT 1 FROM E1 a CROSS JOIN E1 b),
    E4(n) AS (SELECT 1 FROM E2 a CROSS JOIN E2 b),
    Nums AS (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS num FROM E4),
    Days AS (
        SELECT CAST(DATEADD(day, num, '2020-01-01') AS DATE) AS dt
        FROM Nums
        WHERE num <= DATEDIFF(day, '2020-01-01', '2026-05-16')
    ),
    FoodTpl AS (
        SELECT * FROM (VALUES
            (N'早餐',  7, N'克',   80.0,   -10.0,   8.0,  5.0),   -- 燕麥片
            (N'早餐',  4, N'ml',  250.0,   -20.0,   5.0, 10.0),   -- 牛奶
            (N'午餐',  1, N'克',  160.0,   -20.0,  15.0,  8.0),   -- 水煮雞胸肉
            (N'午餐',  2, N'克',  220.0,   -30.0,  20.0, 10.0),   -- 白飯
            (N'晚餐', 14, N'克',  140.0,   -15.0,  12.0,  6.0),   -- 鮭魚排
            (N'晚餐',  6, N'克',  200.0,   -30.0,  15.0,  8.0)    -- 糙米飯
        ) AS t(meal, fid, msr, base_amt, trnd, seas, wave)
    )
    INSERT INTO [dbo].[DailyDiets]
        ([MemberId], [EatDT], [MealType], [FoodId], [Amount], [Measure])
    SELECT
        m.[Id],
        d.dt,
        ft.meal,
        ft.fid,
        CAST(
            CASE WHEN calcAmt < 20.0 THEN 20.0 ELSE calcAmt END
        AS DECIMAL(10,2)),
        ft.msr

    FROM Days d
    CROSS JOIN (
        SELECT
            [Id],
            COALESCE([StartWeight], 65.0) / 58.0 AS wf,
            CASE
                WHEN [HealthPlan] = N'減重' THEN 1.8
                WHEN [HealthPlan] = N'增肌' THEN -0.3
                ELSE 1.0
            END AS trendMul
        FROM [dbo].[Members]
        WHERE [Id] BETWEEN @batchStart AND @batchStart + @batchSize - 1
    ) m
    CROSS JOIN FoodTpl ft
    CROSS APPLY (
        SELECT ROUND(
            ft.base_amt * m.wf
            + ft.trnd * m.trendMul * (CAST(DATEDIFF(day, '2020-01-01', d.dt) AS FLOAT) / 2327.0)
            + ft.seas * m.wf * COS(2.0*PI()*CAST(DATEPART(dayofyear, d.dt) AS FLOAT)/365.0)
            + ft.wave * SIN(2.0*PI()*CAST(DATEDIFF(day,'2020-01-01', d.dt) AS FLOAT)/7.0
                            + CAST(m.[Id] AS FLOAT) * 0.5)
        , 2) AS calcAmt
    ) ca;

    SET @batchCount = @batchCount + 1;
    DECLARE @cnt INT;
    SELECT @cnt = COUNT(*) FROM [dbo].[DailyDiets];
    PRINT CONCAT('  Batch ', @batchCount, ' 完成: Members ',
                 @batchStart, '~', @batchStart + @batchSize - 1,
                 ' (累計: ', @cnt, ' 筆)');

    SET @batchStart = @batchStart + @batchSize;
END
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

-- 更新統計資訊，確保查詢最佳化器能正確估算
UPDATE STATISTICS [dbo].[DailyDiets];
GO

DECLARE @totalCnt INT;
SELECT @totalCnt = COUNT(*) FROM [dbo].[DailyDiets];
PRINT CONCAT('DailyDiets 產生完成，共插入: ', @totalCnt, ' 筆');
PRINT CONCAT('結束時間: ', CONVERT(VARCHAR(20), GETDATE(), 120));
GO

PRINT '=== 0509_dailydiet_allMembers_seedData.sql 執行完畢 ===';
GO
