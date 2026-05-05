/* ════════════════════════════════════════════════════════════
   📦 MyFitnessCoach — 資料庫變更腳本
   日期：2026-05-05
   負責功能：結帳發票類型（含手機載具）
   ────────────────────────────────────────────────────────────
   執行方式：
     1) SSMS 連線到本機 MyFitnessCoach 資料庫
     2) 開啟此檔（新分頁）
     3) 確認上方「資料庫」下拉選到 MyFitnessCoach
     4) 按 F5 執行
   特性：
     ✅ 冪等（已存在的欄位會自動跳過，重跑無副作用）
     ✅ 交易包裝（任一步失敗會整體 rollback）
     ✅ 執行後自動印出新欄位結構讓你確認
   變更摘要：
     ProductOrders 新增 3 個欄位
       • InvoiceType  TINYINT      NOT NULL DEFAULT 1
       • DonationCode VARCHAR(10)  NULL
       • CarrierCode  VARCHAR(10)  NULL
   發票類型對照（InvoiceType）：
       1 = 二聯式（個人）
       2 = 三聯式（公司，需 8 碼統編，存於既有 TaxNumber 欄位）
       3 = 捐贈   （需 3–7 碼愛心碼，存於 DonationCode）
       4 = 手機載具（/XXXXXXX 共 8 碼，存於 CarrierCode）
   ════════════════════════════════════════════════════════════ */

USE [MyFitnessCoachDb];   -- ← 若你的 DB 名稱不同請改這裡
GO

SET XACT_ABORT ON;
BEGIN TRAN;

------------------------------------------------------------
-- 1) ProductOrders.InvoiceType
------------------------------------------------------------
IF NOT EXISTS (
    SELECT 1 FROM sys.columns
    WHERE object_id = OBJECT_ID(N'dbo.ProductOrders')
      AND name = N'InvoiceType'
)
BEGIN
    ALTER TABLE dbo.ProductOrders
    ADD InvoiceType TINYINT NOT NULL
        CONSTRAINT DF_ProductOrders_InvoiceType DEFAULT (1);

    PRINT N'✓ 已新增 ProductOrders.InvoiceType（預設 1=二聯式）';
END
ELSE
    PRINT N'↷ ProductOrders.InvoiceType 已存在，跳過';

------------------------------------------------------------
-- 2) ProductOrders.DonationCode（捐贈愛心碼，3–7 碼）
------------------------------------------------------------
IF NOT EXISTS (
    SELECT 1 FROM sys.columns
    WHERE object_id = OBJECT_ID(N'dbo.ProductOrders')
      AND name = N'DonationCode'
)
BEGIN
    ALTER TABLE dbo.ProductOrders
    ADD DonationCode VARCHAR(10) NULL;

    PRINT N'✓ 已新增 ProductOrders.DonationCode';
END
ELSE
    PRINT N'↷ ProductOrders.DonationCode 已存在，跳過';

------------------------------------------------------------
-- 3) ProductOrders.CarrierCode（手機載具，/XXXXXXX 共 8 碼）
------------------------------------------------------------
IF NOT EXISTS (
    SELECT 1 FROM sys.columns
    WHERE object_id = OBJECT_ID(N'dbo.ProductOrders')
      AND name = N'CarrierCode'
)
BEGIN
    ALTER TABLE dbo.ProductOrders
    ADD CarrierCode VARCHAR(10) NULL;

    PRINT N'✓ 已新增 ProductOrders.CarrierCode';
END
ELSE
    PRINT N'↷ ProductOrders.CarrierCode 已存在，跳過';

COMMIT;
GO

/* ════════════════════════════════════════════════════════════
   ✅ 驗證區：印出 ProductOrders 的新欄位結構
   ════════════════════════════════════════════════════════════ */
SELECT
    c.name        AS ColumnName,
    t.name        AS DataType,
    CASE
        WHEN t.name IN ('varchar','char') THEN CAST(c.max_length AS VARCHAR(10))
        WHEN t.name IN ('nvarchar','nchar') THEN CAST(c.max_length / 2 AS VARCHAR(10))
        ELSE NULL
    END           AS MaxLength,
    c.is_nullable AS IsNullable,
    OBJECT_DEFINITION(c.default_object_id) AS DefaultValue
FROM sys.columns c
JOIN sys.types   t ON c.user_type_id = t.user_type_id
WHERE c.object_id = OBJECT_ID(N'dbo.ProductOrders')
  AND c.name IN (N'InvoiceType', N'DonationCode', N'CarrierCode')
ORDER BY
    CASE c.name
        WHEN N'InvoiceType'  THEN 1
        WHEN N'DonationCode' THEN 2
        WHEN N'CarrierCode'  THEN 3
    END;
GO

PRINT N'━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━';
PRINT N'🎉 完成！';
PRINT N'下一步：';
PRINT N'  1. git pull 拉最新程式';
PRINT N'  2. 重啟後端 (dotnet run / Ctrl+F5)';
PRINT N'  3. 結帳頁應出現「發票類型」四選一';
PRINT N'━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━';
