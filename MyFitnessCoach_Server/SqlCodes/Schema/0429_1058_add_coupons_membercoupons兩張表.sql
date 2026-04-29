USE [MyFitnessCoachDb];
GO

-- =============================================
-- Coupons(優惠券定義)
-- =============================================
CREATE TABLE [dbo].[Coupons](
    [Id]                      INT            IDENTITY(1,1) NOT NULL,
    [Code]                    NVARCHAR(32)   NOT NULL,
    [Name]                    NVARCHAR(100)  NOT NULL,
    [Description]             NVARCHAR(500)  NULL,
    [DiscountType]            TINYINT        NOT NULL,
    [DiscountValue]           DECIMAL(10, 2) NOT NULL,
    [MinSpend]                DECIMAL(10, 2) NOT NULL CONSTRAINT [DF_Coupons_MinSpend]  DEFAULT (0),
    [MaxDiscount]             DECIMAL(10, 2) NULL,
    [TotalQuota]              INT            NULL,
    [RemainingQuota]          INT            NULL,
    [StartAt]                 DATETIME2(0)   NOT NULL,
    [EndAt]                   DATETIME2(0)   NOT NULL,
    [IsActive]                BIT            NOT NULL CONSTRAINT [DF_Coupons_IsActive]  DEFAULT (1),
    [CreatedAt]               DATETIME2(0)   NOT NULL CONSTRAINT [DF_Coupons_CreatedAt] DEFAULT (GETDATE()),
    [ValidDaysAfterClaim]     INT            NULL,
    [VisibleOnlyOnDayOfMonth] TINYINT        NULL,
    [BannerImageUrl]          NVARCHAR(500)  NULL,
    CONSTRAINT [PK_Coupons]               PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [CK_Coupons_DiscountType]  CHECK ([DiscountType] IN (1, 2)),
    CONSTRAINT [CK_Coupons_DiscountValue] CHECK ([DiscountValue] > 0),
    CONSTRAINT [CK_Coupons_DateRange]     CHECK ([EndAt] > [StartAt])
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [UX_Coupons_Code]
    ON [dbo].[Coupons]([Code]);
GO


-- =============================================
-- MemberCoupons(會員領取紀錄)
-- =============================================
CREATE TABLE [dbo].[MemberCoupons](
    [Id]             INT          IDENTITY(1,1) NOT NULL,
    [MemberId]       INT          NOT NULL,
    [CouponId]       INT          NOT NULL,
    [ClaimedAt]      DATETIME2(0) NOT NULL CONSTRAINT [DF_MemberCoupons_ClaimedAt] DEFAULT (GETDATE()),
    [ExpiresAt]      DATETIME2(0) NULL,
    [UsedAt]         DATETIME2(0) NULL,
    [OrderId]        INT          NULL,
    [ClaimYearMonth] AS CONVERT(CHAR(7), [ClaimedAt], 120) PERSISTED,
    CONSTRAINT [PK_MemberCoupons]         PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_MemberCoupons_Members] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Members]([Id]),
    CONSTRAINT [FK_MemberCoupons_Coupons] FOREIGN KEY ([CouponId]) REFERENCES [dbo].[Coupons]([Id])
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [UX_MemberCoupons_Member_Coupon_Month]
    ON [dbo].[MemberCoupons]([MemberId], [CouponId], [ClaimYearMonth]);
GO
