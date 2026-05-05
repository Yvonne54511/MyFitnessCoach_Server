-- =============================================
-- 0429_HealthRecordsForOne_SeedData.sql
-- Health Tracker Seed Data
-- Date: 2026-04-29
-- Database: MyFitnessCoachDb
--
-- Scope:
--   PART 1 - MemberGoals for ALL 106 members
--   PART 2 - BodyRecords  (weekly)  : MemberId=1 (UserId=1), MemberId=7 (UserId=2052)
--   PART 3 - WaterLogs   (daily)   : MemberId=1, MemberId=7
--   PART 4 - DailyDiets  (daily)   : MemberId=1, MemberId=7
--
-- Date range: 2020-01-01 ~ 2026-05-15
--
-- Prerequisites (run in order):
--   1. MyFitnessCoachDb_0409.sql          (schema + Members seed)
--   2. 0428_healthtracker_schema.sql      (renames Target→HealthPlan, Weight→StartWeight;
--                                          creates MemberGoals, DailyDiets, WaterLogs,
--                                          adds HipCircumference to BodyRecords)
--   3. 0428_FoodLibrary_seedData.sql      (Foods 1-14+ must exist for DailyDiets FK)
-- =============================================

USE [MyFitnessCoachDb]
GO

-- ============================================================
-- PART 1: MemberGoals (all Members)
-- ============================================================
-- Goals derived from each member's HealthPlan + TDEE + StartWeight.
-- Macro split:
--   維持體重 : Protein 25%, Carb 50%, Fat 25%  of TDEE
--   減重     : Calories = TDEE-400; Protein 30%, Carb 40%, Fat 30%
--   增肌     : Calories = TDEE+300; Protein 30%, Carb 50%, Fat 20%
-- WaterGoal  = StartWeight × 33 ml
-- TDEE default = 2000 kcal when NULL (early seed members missing calculation)
-- ============================================================

DELETE FROM [dbo].[MemberGoals];
GO

INSERT INTO [dbo].[MemberGoals]
    ([MemberId], [TargetWeight], [CaloriesGoal], [ProteinGoal], [CarbGoal], [FatGoal], [WaterGoal])
SELECT
    m.[Id],

    -- TargetWeight
    CAST(ROUND(CASE
        WHEN m.[HealthPlan] = N'減重' THEN COALESCE(m.[StartWeight], 65.0) * 0.90
        WHEN m.[HealthPlan] = N'增肌' THEN COALESCE(m.[StartWeight], 70.0) * 1.05
        ELSE                               COALESCE(m.[StartWeight], 65.0)
    END, 2) AS DECIMAL(5,2)),

    -- CaloriesGoal
    CAST(ROUND(CASE
        WHEN m.[HealthPlan] = N'減重' THEN COALESCE(m.[TDEE], 2000.0) - 400.0
        WHEN m.[HealthPlan] = N'增肌' THEN COALESCE(m.[TDEE], 2000.0) + 300.0
        ELSE                               COALESCE(m.[TDEE], 2000.0)
    END, 2) AS DECIMAL(10,2)),

    -- ProteinGoal (g): kcal × ratio ÷ 4 kcal/g
    CAST(ROUND(CASE
        WHEN m.[HealthPlan] IN (N'減重', N'增肌') THEN COALESCE(m.[TDEE], 2000.0) * 0.30 / 4.0
        ELSE                                         COALESCE(m.[TDEE], 2000.0) * 0.25 / 4.0
    END, 2) AS DECIMAL(10,2)),

    -- CarbGoal (g): kcal × ratio ÷ 4 kcal/g
    CAST(ROUND(CASE
        WHEN m.[HealthPlan] = N'減重' THEN COALESCE(m.[TDEE], 2000.0) * 0.40 / 4.0
        ELSE                              COALESCE(m.[TDEE], 2000.0) * 0.50 / 4.0
    END, 2) AS DECIMAL(10,2)),

    -- FatGoal (g): kcal × ratio ÷ 9 kcal/g
    CAST(ROUND(CASE
        WHEN m.[HealthPlan] = N'增肌' THEN COALESCE(m.[TDEE], 2000.0) * 0.20 / 9.0
        ELSE                              COALESCE(m.[TDEE], 2000.0) * 0.25 / 9.0
    END, 2) AS DECIMAL(10,2)),

    -- WaterGoal (ml)
    CAST(ROUND(COALESCE(m.[StartWeight], 65.0) * 33.0, 2) AS DECIMAL(10,2))

FROM [dbo].[Members] m;
GO

PRINT CONCAT('MemberGoals inserted: ', CAST(@@ROWCOUNT AS NVARCHAR(10)));
GO

-- ============================================================
-- PART 2: BodyRecords (weekly records, MemberId 1 and 7)
-- ============================================================
-- Measurement formula for each metric M at date dt:
--
--   M(dt) = baseline
--           + trend   × (days_elapsed / 2327)        ← long-term improvement
--           ± seasonal × COS(2π × dayofyear / 365)   ← worse in winter, better in summer
--           ± wave     × SIN(2π × days_elapsed / 28) ← ~monthly wobble
--
-- MemberId=1 (Female, 163 cm, 維持體重)
--   Weight    : 65.0 → 58.0 kg   (trend −7.0, seasonal +2.0, wave +0.8)
--   BodyFat   : 32.0 → 25.0 %    (trend −7.0, seasonal +1.5, wave +0.5)
--   SkeletalMuscle: 37.0 → 43.0 %(trend +6.0, seasonal −1.0, wave +0.4)
--   Waist     : 74.0 → 68.0 cm   (trend −6.0, seasonal +2.0, wave +0.7)
--   Hip       : 93.0 → 87.0 cm   (trend −6.0, seasonal +1.5, wave +0.6)
--
-- MemberId=7 (Female, 180 cm, 維持體重, TDEE=2200)
--   Weight    : 76.0 → 68.0 kg   (trend −8.0, seasonal +2.5, wave +1.0)
--   BodyFat   : 30.0 → 23.0 %    (trend −7.0, seasonal +1.5, wave +0.5)
--   SkeletalMuscle: 38.0 → 44.0 %(trend +6.0, seasonal −1.0, wave +0.4)
--   Waist     : 76.0 → 69.0 cm   (trend −7.0, seasonal +2.0, wave +0.8)
--   Hip       : 96.0 → 90.0 cm   (trend −6.0, seasonal +1.5, wave +0.6)
--
-- NOTE: BodyRecords was created by 0409 schema; column name is [CreateAt] (not CreatedAt).
-- ============================================================

DELETE FROM [dbo].[BodyRecords] WHERE [MemberId] IN (1, 7);
GO

;WITH Wk AS (
    SELECT CAST('2020-01-01' AS DATE) AS dt
    UNION ALL
    SELECT DATEADD(week, 1, dt) FROM Wk WHERE dt < CAST('2026-05-09' AS DATE)
)
INSERT INTO [dbo].[BodyRecords]
    ([MemberId], [Weight], [BodyFat], [SkeletalMuscle],
     [WaistCircumference], [HipCircumference], [CreateAt])
SELECT
    cfg.mid,

    -- Weight (FLOAT, 1 dp)
    CAST(ROUND(
        cfg.w0
        - cfg.wd * (CAST(DATEDIFF(day, '2020-01-01', dt) AS FLOAT) / 2327.0)
        + cfg.ws * COS(2.0 * PI() * CAST(DATEPART(dayofyear, dt) AS FLOAT) / 365.0)
        + cfg.wm * SIN(2.0 * PI() * CAST(DATEDIFF(day, '2020-01-01', dt) AS FLOAT) / 28.0)
    , 1) AS FLOAT),

    -- BodyFat % (DECIMAL 4,1)
    CAST(ROUND(
        cfg.f0
        - cfg.fd * (CAST(DATEDIFF(day, '2020-01-01', dt) AS FLOAT) / 2327.0)
        + cfg.fs * COS(2.0 * PI() * CAST(DATEPART(dayofyear, dt) AS FLOAT) / 365.0)
        + cfg.fm * SIN(2.0 * PI() * CAST(DATEDIFF(day, '2020-01-01', dt) AS FLOAT) / 28.0)
    , 1) AS DECIMAL(4,1)),

    -- SkeletalMuscle % (DECIMAL 4,1) — inverse seasonal: dips in winter
    CAST(ROUND(
        cfg.m0
        + cfg.md * (CAST(DATEDIFF(day, '2020-01-01', dt) AS FLOAT) / 2327.0)
        - cfg.ms * COS(2.0 * PI() * CAST(DATEPART(dayofyear, dt) AS FLOAT) / 365.0)
        + cfg.mm * SIN(2.0 * PI() * CAST(DATEDIFF(day, '2020-01-01', dt) AS FLOAT) / 28.0 + 1.0)
    , 1) AS DECIMAL(4,1)),

    -- WaistCircumference cm (DECIMAL 5,1)
    CAST(ROUND(
        cfg.c0
        - cfg.cd * (CAST(DATEDIFF(day, '2020-01-01', dt) AS FLOAT) / 2327.0)
        + cfg.cs * COS(2.0 * PI() * CAST(DATEPART(dayofyear, dt) AS FLOAT) / 365.0)
        + cfg.cm * SIN(2.0 * PI() * CAST(DATEDIFF(day, '2020-01-01', dt) AS FLOAT) / 28.0)
    , 1) AS DECIMAL(5,1)),

    -- HipCircumference cm (DECIMAL 5,1)
    CAST(ROUND(
        cfg.h0
        - cfg.hd * (CAST(DATEDIFF(day, '2020-01-01', dt) AS FLOAT) / 2327.0)
        + cfg.hs * COS(2.0 * PI() * CAST(DATEPART(dayofyear, dt) AS FLOAT) / 365.0)
        + cfg.hm * SIN(2.0 * PI() * CAST(DATEDIFF(day, '2020-01-01', dt) AS FLOAT) / 28.0)
    , 1) AS DECIMAL(5,1)),

    CAST(CAST(dt AS DATETIME2) AS DATETIME2(0))

FROM Wk
CROSS JOIN (VALUES
--  mid   w0    wd    ws   wm    f0    fd    fs   fm    m0    md    ms   mm    c0    cd    cs   cm    h0    hd    hs   hm
    (1,  65.0, 7.0, 2.0, 0.8,  32.0, 7.0, 1.5, 0.5,  37.0, 6.0, 1.0, 0.4,  74.0, 6.0, 2.0, 0.7,  93.0, 6.0, 1.5, 0.6),
    (7,  76.0, 8.0, 2.5, 1.0,  30.0, 7.0, 1.5, 0.5,  38.0, 6.0, 1.0, 0.4,  76.0, 7.0, 2.0, 0.8,  96.0, 6.0, 1.5, 0.6)
) AS cfg(mid, w0,wd,ws,wm, f0,fd,fs,fm, m0,md,ms,mm, c0,cd,cs,cm, h0,hd,hs,hm)
OPTION (MAXRECURSION 400);
GO

PRINT CONCAT('BodyRecords inserted: ', CAST(@@ROWCOUNT AS NVARCHAR(10)));
GO

-- ============================================================
-- PART 3: WaterLogs (daily, MemberId 1 and 7)
-- ============================================================
-- Amount (ml, INT):
--   base     = starting daily intake
--   trend    = total increase over 6 years
--   seasonal = SIN with −π/2 shift → peak in summer (July), trough in winter
--   wave     = weekly variation (7-day cycle)
--
-- Minimum floor: 500 ml (prevents unrealistic zero/negative values)
--
-- MemberId=1: ~1200 ml/day (2020) → ~1800 ml/day (2026)
-- MemberId=7: ~1500 ml/day (2020) → ~2200 ml/day (2026)
-- ============================================================

DELETE FROM [dbo].[WaterLogs] WHERE [MemberId] IN (1, 7);
GO

;WITH Days AS (
    SELECT CAST('2020-01-01' AS DATE) AS dt
    UNION ALL
    SELECT DATEADD(day, 1, dt) FROM Days WHERE dt < CAST('2026-05-16' AS DATE)
)
INSERT INTO [dbo].[WaterLogs] ([MemberId], [LogDate], [Amount])
SELECT
    cfg.mid,
    dt,
    CAST(
        CASE WHEN
            ROUND(
                cfg.base
                + cfg.trend * (CAST(DATEDIFF(day, '2020-01-01', dt) AS FLOAT) / 2327.0)
                + cfg.seas  * SIN(2.0*PI()*CAST(DATEPART(dayofyear,dt) AS FLOAT)/365.0 - PI()/2.0)
                + cfg.wave  * SIN(2.0*PI()*CAST(DATEDIFF(day,'2020-01-01',dt) AS FLOAT)/7.0)
            , 0) < 500
        THEN 500
        ELSE CAST(ROUND(
                cfg.base
                + cfg.trend * (CAST(DATEDIFF(day, '2020-01-01', dt) AS FLOAT) / 2327.0)
                + cfg.seas  * SIN(2.0*PI()*CAST(DATEPART(dayofyear,dt) AS FLOAT)/365.0 - PI()/2.0)
                + cfg.wave  * SIN(2.0*PI()*CAST(DATEDIFF(day,'2020-01-01',dt) AS FLOAT)/7.0)
             , 0) AS INT)
        END
    AS INT)
FROM Days
CROSS JOIN (VALUES
--  mid  base    trend   seas   wave
    (1,  1200.0,  600.0,  250.0, 150.0),
    (7,  1500.0,  700.0,  300.0, 200.0)
) AS cfg(mid, base, trend, seas, wave)
OPTION (MAXRECURSION 2500);
GO

PRINT CONCAT('WaterLogs inserted: ', CAST(@@ROWCOUNT AS NVARCHAR(10)));
GO

-- ============================================================
-- PART 4: DailyDiets (3 meals × 2 foods per day, MemberId 1 and 7)
-- ============================================================
-- 6 rows per member per day (2 foods × 3 meal types).
-- Total ≈ 27,924 rows (2327 days × 6 entries × 2 members).
--
-- Food roster (all exist in 0428_FoodLibrary_seedData.sql):
--   FoodId  7  燕麥片       早餐 碳水
--   FoodId  4  牛奶         早餐 蛋白/乳品
--   FoodId  1  水煮雞胸肉   午餐 蛋白質
--   FoodId  2  白飯         午餐 碳水
--   FoodId 14  鮭魚排       晚餐 蛋白質
--   FoodId  6  糙米飯       晚餐 碳水
--
-- Amount formula:
--   amt0   = starting portion size (grams / ml)
--   trnd   = total reduction over 6 years (portions normalise downward)
--   seas   = COS → peak amounts in winter (holiday eating), low in summer
--   wave   = 7-day weekly variation
--
-- Minimum floor: 20 克/ml (avoids zero/negative inserts)
-- ============================================================

DELETE FROM [dbo].[DailyDiets] WHERE [MemberId] IN (1, 7);
GO

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
    -- ── MemberId=1 (F, 163 cm, StartWeight=58, TDEE≈1878) ──────────────────
    (1, N'早餐',  7, N'克',   80.0, -10.0,  8.0,  5.0),   -- 燕麥片 80→70g
    (1, N'早餐',  4, N'ml',  250.0, -20.0,  5.0, 10.0),   -- 牛奶 250→230ml
    (1, N'午餐',  1, N'克',  160.0, -20.0, 15.0,  8.0),   -- 雞胸肉 160→140g
    (1, N'午餐',  2, N'克',  220.0, -30.0, 20.0, 10.0),   -- 白飯 220→190g
    (1, N'晚餐', 14, N'克',  140.0, -15.0, 12.0,  6.0),   -- 鮭魚排 140→125g
    (1, N'晚餐',  6, N'克',  200.0, -30.0, 15.0,  8.0),   -- 糙米飯 200→170g

    -- ── MemberId=7 (F, 180 cm, StartWeight=68, TDEE=2200) ──────────────────
    (7, N'早餐',  7, N'克',  100.0, -15.0, 10.0,  6.0),   -- 燕麥片 100→85g
    (7, N'早餐',  4, N'ml',  300.0, -30.0,  8.0, 12.0),   -- 牛奶 300→270ml
    (7, N'午餐',  1, N'克',  190.0, -25.0, 18.0, 10.0),   -- 雞胸肉 190→165g
    (7, N'午餐',  2, N'克',  260.0, -40.0, 22.0, 12.0),   -- 白飯 260→220g
    (7, N'晚餐', 14, N'克',  165.0, -20.0, 15.0,  8.0),   -- 鮭魚排 165→145g
    (7, N'晚餐',  6, N'克',  230.0, -35.0, 18.0, 10.0)    -- 糙米飯 230→195g
) AS cfg(mid, meal, fid, msr, amt0, trnd, seas, wave)
OPTION (MAXRECURSION 2500);
GO

PRINT CONCAT('DailyDiets inserted: ', CAST(@@ROWCOUNT AS NVARCHAR(10)));
GO

PRINT '=== 0429_HealthRecordsForOne_SeedData.sql completed ===';
GO
