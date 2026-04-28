-- =============================================
-- HealthTracker Schema
-- Date: 2026-04-28
-- Database: MyFitnessCoachDb
-- =============================================

USE [MyFitnessCoachDb]
GO

-- =============================================
-- 1. Members (會員詳細資料)
--    - Target  → HealthPlan
--    - Weight  → StartWeight（初始體重，無 BodyRecords 時的 BMR fallback）
-- =============================================

IF EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Members]') AND name = 'Target')
    EXEC sp_rename 'dbo.Members.Target', 'HealthPlan', 'COLUMN';
GO

IF EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Members]') AND name = 'Weight')
    EXEC sp_rename 'dbo.Members.Weight', 'StartWeight', 'COLUMN';
GO

-- =============================================
-- 2. MemberGoals (會員目標)
-- =============================================
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberGoals]') AND type = 'U')
BEGIN
    CREATE TABLE [dbo].[MemberGoals] (
        [Id]            INT             NOT NULL IDENTITY(1,1),
        [MemberId]      INT             NOT NULL,
        [TargetWeight]  DECIMAL(5,2)    NULL,
        [CaloriesGoal]  DECIMAL(10,2)   NULL,
        [ProteinGoal]   DECIMAL(10,2)   NULL,
        [CarbGoal]      DECIMAL(10,2)   NULL,
        [FatGoal]       DECIMAL(10,2)   NULL,
        [WaterGoal]     DECIMAL(10,2)   NULL,
        [UpdatedAt]     DATETIME2(0)    NOT NULL CONSTRAINT [DF_MemberGoals_UpdatedAt] DEFAULT (GETDATE()),
        CONSTRAINT [PK_MemberGoals] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [FK_MemberGoals_Members] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Members] ([Id]),
        CONSTRAINT [UX_MemberGoals_MemberId] UNIQUE ([MemberId])
    );
END
GO

-- =============================================
-- 3. FoodCategories (食物分類)
--    修改現有資料表：IsActive → IsDeleted
--    若已存在則跳過建立
-- =============================================
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FoodCategories]') AND type = 'U')
BEGIN
    CREATE TABLE [dbo].[FoodCategories] (
        [Id]            INT             NOT NULL IDENTITY(1,1),
        [CategoryName]  NVARCHAR(50)    NOT NULL,
        [IsDeleted]     BIT             NOT NULL CONSTRAINT [DF_FoodCategories_IsDeleted] DEFAULT (0),
        CONSTRAINT [PK_FoodCategories] PRIMARY KEY CLUSTERED ([Id] ASC)
    );
END
GO

-- =============================================
-- 4. Foods (食物)
--    修改現有資料表：新增 MemberId、WeightInGrams 欄位
--    (WeightInGrams 由此移除，統一放至 NutrientReferenceValues)
-- =============================================
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Foods]') AND type = 'U')
BEGIN
    CREATE TABLE [dbo].[Foods] (
        [Id]            INT             NOT NULL IDENTITY(1,1),
        [MemberId]      INT             NULL,
        [CategoryId]    INT             NULL,
        [FoodName]      NVARCHAR(100)   NOT NULL,
        [IsDeleted]     BIT             NULL CONSTRAINT [DF_Foods_IsDeleted] DEFAULT (0),
        CONSTRAINT [PK_Foods] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [FK_Foods_Members]        FOREIGN KEY ([MemberId])   REFERENCES [dbo].[Members]        ([Id]),
        CONSTRAINT [FK_Foods_FoodCategories] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[FoodCategories] ([Id])
    );
END
ELSE
BEGIN
    -- 補 MemberId 欄位（若已存在舊版 Foods）
    IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Foods]') AND name = 'MemberId')
    BEGIN
        ALTER TABLE [dbo].[Foods] ADD [MemberId] INT NULL;
        ALTER TABLE [dbo].[Foods] ADD CONSTRAINT [FK_Foods_Members] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Members] ([Id]);
    END
END
GO
--把IsDeleted改成IsActive
IF EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Foods]') AND name = 'IsDeleted')
    EXEC sp_rename 'dbo.Foods.IsDeleted', 'IsActive', 'COLUMN';
GO
-- =============================================
-- 5. NutrientReferenceValues (食物營養價值參考)
--    原 Nutrients 資料表重新命名並調整欄位
-- =============================================
DROP TABLE IF EXISTS Nutrients;

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NutrientReferenceValues]') AND type = 'U')
BEGIN
    CREATE TABLE [dbo].[NutrientReferenceValues] (
        [Id]            INT             NOT NULL IDENTITY(1,1),
        [FoodId]        INT             NOT NULL,
        [Measure]       NVARCHAR(20)    NOT NULL,
        [BaseAmount]    DECIMAL(10,2)   NOT NULL,
        [WeightInGrams] INT             NOT NULL,
        [Kcal]          DECIMAL(10,2)   NOT NULL,
        [ProteinGram]   DECIMAL(10,2)   NOT NULL,
        [CarbGram]      DECIMAL(10,2)   NOT NULL,
        [FatGram]       DECIMAL(10,2)   NOT NULL,
        CONSTRAINT [PK_NutrientReferenceValues] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [FK_NutrientReferenceValues_Foods] FOREIGN KEY ([FoodId]) REFERENCES [dbo].[Foods] ([Id])
    );
END
GO

-- =============================================
-- 6. MemberFavoriteFoods (會員常用食物清單)
-- =============================================
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberFavoriteFoods]') AND type = 'U')
BEGIN
    CREATE TABLE [dbo].[MemberFavoriteFoods] (
        [Id]            INT             NOT NULL IDENTITY(1,1),
        [MemberId]      INT             NOT NULL,
        [FoodId]        INT             NOT NULL,
        [CreatedAt]     DATETIME2(0)    NOT NULL CONSTRAINT [DF_MemberFavoriteFoods_CreatedAt] DEFAULT (GETDATE()),
        CONSTRAINT [PK_MemberFavoriteFoods] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [FK_MemberFavoriteFoods_Members] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Members] ([Id]),
        CONSTRAINT [FK_MemberFavoriteFoods_Foods]   FOREIGN KEY ([FoodId])   REFERENCES [dbo].[Foods]   ([Id]),
        CONSTRAINT [UX_MemberFavoriteFoods_Member_Food] UNIQUE ([MemberId], [FoodId])
    );
END
GO

-- =============================================
-- 7. DailyDiets (每日飲食紀錄)
-- =============================================
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DailyDiets]') AND type = 'U')
BEGIN
    CREATE TABLE [dbo].[DailyDiets] (
        [Id]            INT             NOT NULL IDENTITY(1,1),
        [MemberId]      INT             NOT NULL,
        [EatDT]         DATE            NULL,
        [MealType]      NVARCHAR(20)    NULL,
        [FoodId]        INT             NULL,
        [Amount]        DECIMAL(10,2)   NULL,
        [Measure]       NVARCHAR(20)    NULL,
        [CreatedAt]     DATETIME2(0)    NOT NULL CONSTRAINT [DF_DailyDiets_CreatedAt] DEFAULT (GETDATE()),
        [Note]          NVARCHAR(200)   NULL,
        [ImageUrl]      NVARCHAR(300)   NULL,
        CONSTRAINT [PK_DailyDiets] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [FK_DailyDiets_Members] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Members] ([Id]),
        CONSTRAINT [FK_DailyDiets_Foods]   FOREIGN KEY ([FoodId])   REFERENCES [dbo].[Foods]   ([Id])
    );
END
GO

-- =============================================
-- 8. WaterLogs (每日飲水紀錄)
-- =============================================
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WaterLogs]') AND type = 'U')
BEGIN
    CREATE TABLE [dbo].[WaterLogs] (
        [Id]            INT             NOT NULL IDENTITY(1,1),
        [MemberId]      INT             NOT NULL,
        [LogDate]       DATE            NOT NULL,
        [Amount]        INT             NOT NULL,
        CONSTRAINT [PK_WaterLogs] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [FK_WaterLogs_Members] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Members] ([Id]),
        CONSTRAINT [UX_WaterLogs_Member_Date] UNIQUE ([MemberId], [LogDate])
    );
END
GO

-- =============================================
-- 9. BodyRecords (體態紀錄)
--    修改現有資料表：新增 HipCircumference
-- =============================================
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BodyRecords]') AND type = 'U')
BEGIN
    CREATE TABLE [dbo].[BodyRecords] (
        [Id]                    INT             NOT NULL IDENTITY(1,1),
        [MemberId]              INT             NOT NULL,
        [Weight]                FLOAT           NOT NULL,
        [BodyFat]               DECIMAL(4,1)    NULL,
        [SkeletalMuscle]        DECIMAL(4,1)    NULL,
        [WaistCircumference]    DECIMAL(5,1)    NULL,
        [HipCircumference]      DECIMAL(5,1)    NULL,
        [CreatedAt]             DATETIME2(0)    NOT NULL CONSTRAINT [DF_BodyRecords_CreatedAt] DEFAULT (GETDATE()),
        [Note]                  NVARCHAR(200)   NULL,
        [ImageUrl]              NVARCHAR(300)   NULL,
        CONSTRAINT [PK_BodyRecords] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [FK_BodyRecords_Members] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Members] ([Id])
    );
END
ELSE
BEGIN
    -- 補 HipCircumference 欄位（若已存在舊版 BodyRecords）
    IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[BodyRecords]') AND name = 'HipCircumference')
    BEGIN
        ALTER TABLE [dbo].[BodyRecords] ADD [HipCircumference] DECIMAL(5,1) NULL;
    END
END
GO
