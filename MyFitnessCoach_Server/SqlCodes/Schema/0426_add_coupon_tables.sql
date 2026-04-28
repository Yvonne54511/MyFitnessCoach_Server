-- =============================================
-- Phase 4: 優惠券系統 — 建表 + Seed
-- =============================================

-- Coupons（優惠券定義）
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
    CONSTRAINT [PK_Coupons]            PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CK_Coupons_DiscountType]  CHECK ([DiscountType] IN (1, 2)),
    CONSTRAINT [CK_Coupons_DiscountValue] CHECK ([DiscountValue] > 0),
    CONSTRAINT [CK_Coupons_DateRange]     CHECK ([EndAt] > [StartAt])
);
GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Coupons_Code]
    ON [dbo].[Coupons]([Code]);
GO

-- MemberCoupons（會員領取紀錄）
CREATE TABLE [dbo].[MemberCoupons](
    [Id]        INT          IDENTITY(1,1) NOT NULL,
    [MemberId]  INT          NOT NULL,
    [CouponId]  INT          NOT NULL,
    [ClaimedAt] DATETIME2(0) NOT NULL CONSTRAINT [DF_MemberCoupons_ClaimedAt] DEFAULT (GETDATE()),
    [ExpiresAt] DATETIME2(0) NULL,          -- 個人到期日(自動發券用; NULL=不另外限制, 看 Coupons.EndAt)
    [UsedAt]    DATETIME2(0) NULL,
    [OrderId]   INT          NULL,          -- 未來 FK → ProductOrders.Id(此階段不加 FK)
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

-- =============================================
-- 為「上完課自動發券」預留欄位 (此階段不寫自動發券邏輯，由結帳/預約流程後續接手)
-- =============================================
ALTER TABLE [dbo].[ReserveOrders] ADD
    [CompletedAt] DATETIME2(0) NULL;       -- Status 改為「已完成」時的時間戳
GO

-- =============================================
-- Seed: 3 張測試優惠券
-- =============================================
INSERT INTO [dbo].[Coupons]
    ([Code], [Name], [Description], [DiscountType], [DiscountValue],
     [MinSpend], [MaxDiscount], [TotalQuota], [RemainingQuota], [StartAt], [EndAt])
VALUES
    -- 1. 首購券：滿 1000 折 100（後端 Preview 時加判 ProductOrders 沒有過已完成訂單）
    ('WELCOME100', '新會員首購折100',
     '首次消費滿 NT$1000 立折 NT$100',
     1, 100, 1000, NULL, 1000, 1000, '2026-01-01', '2026-12-31'),

    -- 2. 春季 9 折券：低消 1500，折扣上限 500
    ('SPRING10', '春季全館 9 折',
     '全館商品 9 折，低消 NT$1500，折扣上限 NT$500',
     2, 10, 1500, 500, 500, 500, '2026-01-01', '2026-06-30'),

    -- 3. 22 日券：每月 22 日 85 折(後端 Preview 時硬編碼判斷 Code='DAY22' 且 NOW().Day==22)
    ('DAY22', '每月 22 日 85 折',
     '每月 22 日當天全館商品 85 折(限當日使用)',
     2, 15, 0, NULL, NULL, NULL, '2026-01-01', '2026-12-31');
GO
