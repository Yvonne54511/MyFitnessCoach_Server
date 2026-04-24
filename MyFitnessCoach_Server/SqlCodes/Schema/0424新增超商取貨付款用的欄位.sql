ALTER TABLE ProductOrders ADD
  PaymentMethod    INT          NOT NULL DEFAULT 0,
  StoreId          NVARCHAR(6)  NULL,
  StoreName        NVARCHAR(60) NULL,
  LogisticsOrderNo NVARCHAR(20) NULL;