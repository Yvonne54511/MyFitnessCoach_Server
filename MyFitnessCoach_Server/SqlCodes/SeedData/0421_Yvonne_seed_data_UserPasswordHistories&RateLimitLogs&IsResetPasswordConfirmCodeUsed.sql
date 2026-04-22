-- ============================================================
-- 1. 將現有 Users 中已設定帳號密碼的資料匯入 UserPasswordHistories
--    （第三方登入帳號 Account/HashedPassword 為 NULL 則略過）
-- ============================================================
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
-- 2. 有 ResetPasswordConfirmCode 的 Users 設為已使用
-- ============================================================
UPDATE [dbo].[Users]
SET [IsResetPasswordConfirmCodeUsed] = 1
WHERE [ResetPasswordConfirmCode] IS NOT NULL
GO
