-- ============================================================
-- 0429 Goals Schema Migration
-- 套用順序：在 0429_FoodsUpdatedAt_Schema.sql 之後執行
-- 包含：Members.TargetWeight 新增、MemberGoals 新建
-- ============================================================


-- ============================================================
-- 1. Members：新增 TargetWeight 欄位
-- ============================================================
IF NOT EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Members' AND COLUMN_NAME = 'TargetWeight'
)
BEGIN
    ALTER TABLE Members ADD TargetWeight FLOAT NULL;
END
GO


-- ============================================================
-- 2. MemberGoals：新建（每位 Member 最多一筆，1:1）
-- ============================================================
IF OBJECT_ID('MemberGoals', 'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[MemberGoals] (
        [Id]            INT             IDENTITY(1,1) NOT NULL,
        [MemberId]      INT             NOT NULL,
        [TotalCalories] INT             NOT NULL,
        [Protein]       INT             NOT NULL,
        [Carbs]         INT             NOT NULL,
        [Fat]           INT             NOT NULL,
        [Water]         INT             NOT NULL,
        [UpdatedAt]     DATETIME2(0)    NOT NULL
            CONSTRAINT DF_MemberGoals_UpdatedAt DEFAULT (GETDATE()),
        CONSTRAINT PK_MemberGoals PRIMARY KEY CLUSTERED (Id ASC)
    );

    ALTER TABLE MemberGoals
        ADD CONSTRAINT FK_MemberGoals_Members
        FOREIGN KEY (MemberId) REFERENCES Members(Id)
        ON DELETE NO ACTION;

    ALTER TABLE MemberGoals
        ADD CONSTRAINT UX_MemberGoals_MemberId UNIQUE (MemberId);
END
GO

PRINT '0429_goals_schema 執行完成';
GO
