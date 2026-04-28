-- =============================================
-- ReserveOrders 加 GoogleEventId 欄位
-- 程式碼(EF Model + DbContext)早就有這欄位，但 DB 漏建
-- 用途：儲存 Google Calendar 同步建立的 event ID
-- =============================================

IF NOT EXISTS (
    SELECT 1
    FROM sys.columns
    WHERE [Name]      = N'GoogleEventId'
      AND [Object_ID] = OBJECT_ID(N'dbo.ReserveOrders')
)
BEGIN
    ALTER TABLE [dbo].[ReserveOrders]
        ADD [GoogleEventId] NVARCHAR(255) NULL;
END
GO
