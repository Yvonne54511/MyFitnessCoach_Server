-- ============================================================
-- 0428 HealthTracker Schema Migration
-- 套用順序：在 MyFitnessCoachDb_0409.sql 之後執行
-- 包含：Foods 欄位調整、Nutrients → NutrientReferenceValues、
--        MemberFavoriteFoods 新建
-- 注意：0429_FoodsUpdatedAt_Schema.sql 需在本腳本之後執行
-- ============================================================


-- ============================================================
-- 1. Foods：調整 FoodName 長度、新增 MemberId、IsActive
-- ============================================================

-- 1-a. FoodName: nvarchar(50) → nvarchar(100)
IF EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Foods'
      AND COLUMN_NAME = 'FoodName'
      AND CHARACTER_MAXIMUM_LENGTH < 100
)
BEGIN
    ALTER TABLE Foods ALTER COLUMN FoodName NVARCHAR(100) NOT NULL;
END
GO

-- 1-b. 新增 MemberId 欄位（若不存在）
IF NOT EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Foods' AND COLUMN_NAME = 'MemberId'
)
BEGIN
    ALTER TABLE Foods ADD MemberId INT NULL;
END
GO

-- 1-c. 新增 MemberId → Members FK（若不存在）
IF NOT EXISTS (
    SELECT 1 FROM sys.foreign_keys
    WHERE name = 'FK_Foods_Members'
      AND parent_object_id = OBJECT_ID('Foods')
)
BEGIN
    ALTER TABLE Foods
        ADD CONSTRAINT FK_Foods_Members
        FOREIGN KEY (MemberId) REFERENCES Members(Id);
END
GO

-- 1-d. 新增 IsActive 欄位（若不存在）
IF NOT EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Foods' AND COLUMN_NAME = 'IsActive'
)
BEGIN
    -- 先加上允許 NULL，方便初始化
    ALTER TABLE Foods ADD IsActive BIT NULL;

    -- 若原本有 IsDeleted 欄位，語意相反：IsActive = ~IsDeleted
    IF EXISTS (
        SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = 'Foods' AND COLUMN_NAME = 'IsDeleted'
    )
    BEGIN
        UPDATE Foods SET IsActive = CASE WHEN IsDeleted = 1 THEN 0 ELSE 1 END;
    END
    ELSE
    BEGIN
        UPDATE Foods SET IsActive = 1;  -- 預設全部啟用
    END

    -- 改為 NOT NULL 並設定 DEFAULT
    ALTER TABLE Foods ALTER COLUMN IsActive BIT NOT NULL;
    ALTER TABLE Foods ADD CONSTRAINT DF__Foods__IsActive DEFAULT (1) FOR IsActive;
END
GO

-- 1-e. 若 IsDeleted 欄位仍存在則移除
IF EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Foods' AND COLUMN_NAME = 'IsDeleted'
)
BEGIN
    -- 先移除 IsDeleted 的 DEFAULT constraint（若有）
    DECLARE @dfName NVARCHAR(128);
    SELECT @dfName = dc.name
    FROM sys.default_constraints dc
    JOIN sys.columns c ON dc.parent_object_id = c.object_id
                      AND dc.parent_column_id = c.column_id
    WHERE c.object_id = OBJECT_ID('Foods') AND c.name = 'IsDeleted';

    IF @dfName IS NOT NULL
        EXEC('ALTER TABLE Foods DROP CONSTRAINT [' + @dfName + ']');

    ALTER TABLE Foods DROP COLUMN IsDeleted;
END
GO


-- ============================================================
-- 2. Nutrients → NutrientReferenceValues
-- ============================================================

-- 2-a. 若新表已存在則跳過（冪等保護）
IF OBJECT_ID('NutrientReferenceValues', 'U') IS NULL
BEGIN
    -- 2-a-i. 若舊表存在則改名
    IF OBJECT_ID('Nutrients', 'U') IS NOT NULL
    BEGIN
        -- 移除舊 FK（若存在）
        IF EXISTS (
            SELECT 1 FROM sys.foreign_keys
            WHERE name = 'FK_Nutrients_Foods'
              AND parent_object_id = OBJECT_ID('Nutrients')
        )
            ALTER TABLE Nutrients DROP CONSTRAINT FK_Nutrients_Foods;

        EXEC sp_rename 'Nutrients', 'NutrientReferenceValues';
    END
    ELSE
    BEGIN
        -- 舊表也不存在：建立全新空表
        CREATE TABLE [dbo].[NutrientReferenceValues] (
            [Id]            INT              IDENTITY(1,1) NOT NULL,
            [FoodId]        INT              NOT NULL,
            [Measure]       NVARCHAR(20)     NOT NULL,
            [BaseAmount]    DECIMAL(10,2)    NOT NULL,
            [WeightInGrams] INT              NOT NULL,
            [Kcal]          DECIMAL(10,2)    NULL,
            [ProteinGram]   DECIMAL(10,2)    NULL,
            [CarbGram]      DECIMAL(10,2)    NULL,
            [FatGram]       DECIMAL(10,2)    NULL,
            CONSTRAINT PK_NutrientReferenceValues PRIMARY KEY CLUSTERED (Id ASC)
        );
    END
END
GO

-- 2-b. 確保 FK_NutrientReferenceValues_Foods 存在
IF NOT EXISTS (
    SELECT 1 FROM sys.foreign_keys
    WHERE name = 'FK_NutrientReferenceValues_Foods'
      AND parent_object_id = OBJECT_ID('NutrientReferenceValues')
)
BEGIN
    ALTER TABLE NutrientReferenceValues
        ADD CONSTRAINT FK_NutrientReferenceValues_Foods
        FOREIGN KEY (FoodId) REFERENCES Foods(Id)
        ON DELETE NO ACTION;
END
GO

-- 2-c. 新增 WeightInGrams 欄位（若不存在）
IF NOT EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'NutrientReferenceValues' AND COLUMN_NAME = 'WeightInGrams'
)
BEGIN
    ALTER TABLE NutrientReferenceValues ADD WeightInGrams INT NOT NULL DEFAULT 100;
END
GO

-- 2-d. 確保 Measure 欄位存在（改名前可能叫其他名稱）
IF NOT EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'NutrientReferenceValues' AND COLUMN_NAME = 'Measure'
)
BEGIN
    ALTER TABLE NutrientReferenceValues ADD Measure NVARCHAR(20) NOT NULL DEFAULT '';
END
GO

-- 2-e. 將數值欄位從 float 升級為 decimal(10,2)（若型別不符）
-- BaseAmount
IF EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'NutrientReferenceValues'
      AND COLUMN_NAME = 'BaseAmount'
      AND DATA_TYPE = 'int'
)
    ALTER TABLE NutrientReferenceValues ALTER COLUMN BaseAmount DECIMAL(10,2) NOT NULL;
GO

IF EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'NutrientReferenceValues'
      AND COLUMN_NAME = 'Kcal'
      AND DATA_TYPE IN ('float','real')
)
    ALTER TABLE NutrientReferenceValues ALTER COLUMN Kcal DECIMAL(10,2) NULL;
GO

IF EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'NutrientReferenceValues'
      AND COLUMN_NAME = 'ProteinGram'
      AND DATA_TYPE IN ('float','real')
)
    ALTER TABLE NutrientReferenceValues ALTER COLUMN ProteinGram DECIMAL(10,2) NULL;
GO

IF EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'NutrientReferenceValues'
      AND COLUMN_NAME = 'CarbGram'
      AND DATA_TYPE IN ('float','real')
)
    ALTER TABLE NutrientReferenceValues ALTER COLUMN CarbGram DECIMAL(10,2) NULL;
GO

IF EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'NutrientReferenceValues'
      AND COLUMN_NAME = 'FatGram'
      AND DATA_TYPE IN ('float','real')
)
    ALTER TABLE NutrientReferenceValues ALTER COLUMN FatGram DECIMAL(10,2) NULL;
GO


-- ============================================================
-- 3. 新建 MemberFavoriteFoods 表
-- ============================================================
IF OBJECT_ID('MemberFavoriteFoods', 'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[MemberFavoriteFoods] (
        [Id]        INT             IDENTITY(1,1) NOT NULL,
        [MemberId]  INT             NOT NULL,
        [FoodId]    INT             NOT NULL,
        [CreatedAt] DATETIME2(0)    NOT NULL CONSTRAINT DF_MemberFavoriteFoods_CreatedAt DEFAULT (GETDATE()),
        CONSTRAINT PK_MemberFavoriteFoods PRIMARY KEY CLUSTERED (Id ASC)
    );

    ALTER TABLE MemberFavoriteFoods
        ADD CONSTRAINT FK_MemberFavoriteFoods_Members
        FOREIGN KEY (MemberId) REFERENCES Members(Id)
        ON DELETE NO ACTION;

    ALTER TABLE MemberFavoriteFoods
        ADD CONSTRAINT FK_MemberFavoriteFoods_Foods
        FOREIGN KEY (FoodId) REFERENCES Foods(Id)
        ON DELETE NO ACTION;

    ALTER TABLE MemberFavoriteFoods
        ADD CONSTRAINT UX_MemberFavoriteFoods_Member_Food UNIQUE (MemberId, FoodId);
END
GO

PRINT '0428_healthtracker_schema 執行完成';
GO
