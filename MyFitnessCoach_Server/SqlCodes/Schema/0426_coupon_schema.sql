-- =============================================
-- Phase 4: 優惠券系統 — 建表 + ALTER（純 schema，不含資料）
-- =============================================

-- ---------- Coupons（優惠券定義）----------
CREATE TABLE [dbo].[Coupons](
    [Id]             INT IDENTITY(1,1) NOT NULL,
    [Code]           NVARCHAR(32)      NOT NULL,
    [Name]           NVARCHAR(100)     NOT NULL,
    [Description]    NVARCHAR(500)     NULL,
    [DiscountType]   TINYINT           NOT NULL,           -- 1=固定金額, 2=百分比
    [DiscountValue]  DECIMAL(10,2)     NOT NULL,           -- Type=1→金額; Type=2→百分比值(10=9折)
    [MinSpend]       DECIMAL(10,2)     NOT NULL CONSTRAINT [DF_Coupons_MinSpend]   DEFAULT (0),
    [MaxDiscount]    DECIMAL(10,2)     NULL,               -- 百分比券專用：折扣上限
    [TotalQuota]     INT               NULL,               -- 總發放量(NULL=不限)
    [RemainingQuota] INT               NULL,               -- 剩餘可領取數
    [StartAt]        DATETIME2(0)      NOT NULL,
    [EndAt]          DATETIME2(0)      NOT NULL,
    [IsActive]       BIT               NOT NULL CONSTRAINT [DF_Coupons_IsActive]   DEFAULT (1),
    [CreatedAt]      DATETIME2(0)      NOT NULL CONSTRAINT [DF_Coupons_CreatedAt]  DEFAULT (GETDATE()),
    CONSTRAINT [PK_Coupons]                PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CK_Coupons_DiscountType]   CHECK ([DiscountType] IN (1, 2)),
    CONSTRAINT [CK_Coupons_DiscountValue]  CHECK ([DiscountValue] > 0),
    CONSTRAINT [CK_Coupons_DateRange]      CHECK ([EndAt] > [StartAt])
);
GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Coupons_Code]
    ON [dbo].[Coupons]([Code]);
GO

-- ---------- MemberCoupons（會員領取紀錄）----------
CREATE TABLE [dbo].[MemberCoupons](
    [Id]        INT          IDENTITY(1,1) NOT NULL,
    [MemberId]  INT          NOT NULL,
    [CouponId]  INT          NOT NULL,
    [ClaimedAt] DATETIME2(0) NOT NULL CONSTRAINT [DF_MemberCoupons_ClaimedAt] DEFAULT (GETDATE()),
    [ExpiresAt] DATETIME2(0) NULL,          -- 個人到期日(自動發券用; NULL=不另外限制)
    [UsedAt]    DATETIME2(0) NULL,
    [OrderId]   INT          NULL,          -- 未來 FK → ProductOrders.Id (此階段不接 FK)
    CONSTRAINT [PK_MemberCoupons] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO
ALTER TABLE [dbo].[MemberCoupons]
    ADD CONSTRAINT [FK_MemberCoupons_Members]
    FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Members]([Id]);
GO
ALTER TABLE [dbo].[MemberCoupons]
    ADD CONSTRAINT [FK_MemberCoupons_Coupons]
    FOREIGN KEY ([CouponId]) REFERENCES [dbo].[Coupons]([Id]);
GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_MemberCoupons_Member_Coupon]
    ON [dbo].[MemberCoupons]([MemberId], [CouponId]);
GO

-- ---------- Phase 5 預留：ReserveOrders 加完成時間戳 ----------
-- (此階段不寫自動發券邏輯, 由預約完成流程接手)
ALTER TABLE [dbo].[ReserveOrders] ADD
    [CompletedAt] DATETIME2(0) NULL;
GO
