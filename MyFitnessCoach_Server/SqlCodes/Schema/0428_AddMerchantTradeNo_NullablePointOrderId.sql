-- ================================================================
-- 更新說明：購物/儲值流程強化 — Schema 異動
-- 日期：2026-04-28
-- 異動人：Claude (自動產生)
-- ----------------------------------------------------------------
-- 異動內容：
--   [1] PointOrders      新增 MerchantTradeNo 欄位
--         → 用於綁定綠界交易編號，讓 Callback 能精確比對訂單
--         → 解決原本「所有待付款訂單全部完成」的資料損毀風險
--
--   [2] PointsRecordDetails  PointOrderId 改為 NULL 允許
--         → 退款/扣點等非儲值來源的流水帳記錄不需要對應 PointOrder
--         → 解決原本 PointOrderId = 0 可能違反 FK 約束的問題
--
-- 執行前提：
--   - 資料庫版本：MyFitnessCoachDb (SQL Server 2019+)
--   - 執行身分需有 ALTER TABLE 權限
--
-- 執行方式：
--   在 SQL Server Management Studio 開啟本檔，
--   確認連線至正確資料庫後全選執行 (F5)。
-- ================================================================

USE MyFitnessCoachDb;
GO

-- ----------------------------------------------------------------
-- [1] PointOrders.MerchantTradeNo
--     綠界交易編號，格式範例：MFC260428143025001（最長 20 碼）
-- ----------------------------------------------------------------
IF NOT EXISTS (
    SELECT 1
    FROM sys.columns
    WHERE object_id = OBJECT_ID(N'dbo.PointOrders')
      AND name = N'MerchantTradeNo'
)
BEGIN
    ALTER TABLE dbo.PointOrders
    ADD MerchantTradeNo NVARCHAR(20) NULL;

    PRINT N'[1] ✓ PointOrders.MerchantTradeNo 欄位新增完成';
END
ELSE
BEGIN
    PRINT N'[1] - PointOrders.MerchantTradeNo 已存在，略過';
END
GO

-- ----------------------------------------------------------------
-- [2a] 卸除 PointsRecordDetails 對 PointOrders 的原有 FK
--      （原本 NOT NULL FK，需先卸除才能改欄位型態）
-- ----------------------------------------------------------------
IF EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = N'FK_PointsRecordDetails_PointOrders'
)
BEGIN
    ALTER TABLE dbo.PointsRecordDetails
    DROP CONSTRAINT FK_PointsRecordDetails_PointOrders;

    PRINT N'[2a] ✓ FK_PointsRecordDetails_PointOrders 已卸除';
END
ELSE
BEGIN
    PRINT N'[2a] - FK_PointsRecordDetails_PointOrders 不存在，略過';
END
GO

-- ----------------------------------------------------------------
-- [2b] PointsRecordDetails.PointOrderId 改為 NULL 允許
-- ----------------------------------------------------------------
ALTER TABLE dbo.PointsRecordDetails
ALTER COLUMN PointOrderId INT NULL;

PRINT N'[2b] ✓ PointsRecordDetails.PointOrderId 已改為 NULL 允許';
GO

-- ----------------------------------------------------------------
-- [2c] 重新建立 FK（允許 NULL，ON DELETE NO ACTION）
-- ----------------------------------------------------------------
ALTER TABLE dbo.PointsRecordDetails
ADD CONSTRAINT FK_PointsRecordDetails_PointOrders
    FOREIGN KEY (PointOrderId)
    REFERENCES dbo.PointOrders(Id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

PRINT N'[2c] ✓ FK_PointsRecordDetails_PointOrders 已重建（允許 NULL）';
GO

-- ================================================================
-- 驗證查詢（執行後確認欄位狀態，可選）
-- ================================================================
SELECT
    c.TABLE_NAME,
    c.COLUMN_NAME,
    c.DATA_TYPE,
    c.CHARACTER_MAXIMUM_LENGTH,
    c.IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS c
WHERE (c.TABLE_NAME = 'PointOrders'       AND c.COLUMN_NAME = 'MerchantTradeNo')
   OR (c.TABLE_NAME = 'PointsRecordDetails' AND c.COLUMN_NAME = 'PointOrderId')
ORDER BY c.TABLE_NAME, c.COLUMN_NAME;

PRINT N'';
PRINT N'=== 全部異動執行完成 ===';
