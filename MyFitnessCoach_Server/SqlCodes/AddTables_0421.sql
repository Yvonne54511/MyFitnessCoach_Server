-- ============================================================
-- 1. UserPasswordHistories
-- ============================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserPasswordHistories](
    [Id]             [int]           IDENTITY(1,1) NOT NULL,
    [UserId]         [int]           NOT NULL,
    [HashedPassword] [nvarchar](256) NOT NULL,
    [CreatedAt]      [datetime2](0)  NOT NULL,
 CONSTRAINT [PK_UserPasswordHistories] PRIMARY KEY CLUSTERED
(
    [Id] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[UserPasswordHistories]
    ADD CONSTRAINT [FK_UserPasswordHistories_Users]
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users]([Id])
GO

-- 將現有 Users 中已設定帳號密碼的資料匯入（第三方登入帳號 Account/HashedPassword 為 NULL 則略過）
INSERT INTO [dbo].[UserPasswordHistories] ([UserId], [HashedPassword], [CreatedAt])
SELECT
    [Id],
    [HashedPassword],
    -- 隨機產生 2025-01-01 ~ 2025-12-31 之間的日期
    DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 365, CAST('2025-01-01' AS datetime2(0)))
FROM [dbo].[Users]
WHERE [Account]        IS NOT NULL
  AND [HashedPassword] IS NOT NULL
GO


-- ============================================================
-- 2. RateLimitLogs
-- ============================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RateLimitLogs](
    [Id]          [int]           IDENTITY(1,1) NOT NULL,
    [IpAddress]   [varchar](45)   NOT NULL,   -- 最長 45 字元可容納 IPv6
    [EndPoint]    [nvarchar](200) NOT NULL,
    [Identity]    [nvarchar](100) NULL,        -- 登入帳號或其他識別；匿名請求可為 NULL
    [IsSuccess]   [bit]           NOT NULL,
    [RequestedAt] [datetime2](0)  NOT NULL CONSTRAINT [DF_RateLimitLogs_RequestedAt] DEFAULT (GETDATE()),
 CONSTRAINT [PK_RateLimitLogs] PRIMARY KEY CLUSTERED
(
    [Id] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
