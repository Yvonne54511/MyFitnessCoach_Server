-- ================================================================
-- 更新說明：商品訂單強化 — 新增 MerchantTradeNo 欄位
-- 日期：2026-04-28
-- ----------------------------------------------------------------
-- 異動內容：
--   ProductOrders 新增 MerchantTradeNo 欄位
--     → 結帳時存入綠界交易編號
--     → Callback 優先用此欄位精確比對訂單，避免抓到別人的訂單
--     → CustomField2（productOrderId）保留作備援查詢
--
-- 執行方式：
--   SSMS 開啟本檔 → 確認連線至 MyFitnessCoachDb → F5 執行
-- ================================================================

USE MyFitnessCoachDb;
GO

-- ── ProductOrders.MerchantTradeNo ─────────────────────────────────
IF NOT EXISTS (
    SELECT 1
    FROM sys.columns
    WHERE object_id = OBJECT_ID(N'dbo.ProductOrders')
      AND name = N'MerchantTradeNo'
)
BEGIN
    ALTER TABLE dbo.ProductOrders
    ADD MerchantTradeNo NVARCHAR(25) NULL;

    PRINT N'✓ ProductOrders.MerchantTradeNo 欄位新增完成';
END
ELSE
    PRINT N'- ProductOrders.MerchantTradeNo 已存在，略過';
GO

-- ── 驗證查詢 ──────────────────────────────────────────────────────
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ProductOrders'
  AND COLUMN_NAME = 'MerchantTradeNo';

PRINT N'=== 異動執行完成 ===';
