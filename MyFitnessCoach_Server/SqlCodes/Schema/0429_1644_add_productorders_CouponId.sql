ALTER TABLE [dbo].[ProductOrders]
    ADD [CouponId] INT NULL;
GO
ALTER TABLE [dbo].[ProductOrders]
    ADD CONSTRAINT [FK_ProductOrders_Coupons]
    FOREIGN KEY ([CouponId]) REFERENCES [dbo].[Coupons]([Id]);
GO