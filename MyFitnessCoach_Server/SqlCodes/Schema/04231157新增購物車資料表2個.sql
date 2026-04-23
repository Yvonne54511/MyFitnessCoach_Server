-- Carts
CREATE TABLE [dbo].[Carts](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [MemberId] [int] NOT NULL,
    [CreatedAt] [datetime2](0) NOT NULL CONSTRAINT [DF_Carts_CreatedAt] DEFAULT (GETDATE()),
    [UpdatedAt] [datetime2](0) NOT NULL CONSTRAINT [DF_Carts_UpdatedAt] DEFAULT (GETDATE()),
    CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO

ALTER TABLE [dbo].[Carts] ADD CONSTRAINT [FK_Carts_Members]
    FOREIGN KEY([MemberId]) REFERENCES [dbo].[Members]([Id]);
GO

CREATE UNIQUE NONCLUSTERED INDEX [UX_Carts_MemberId]
    ON [dbo].[Carts]([MemberId] ASC);
GO

-- CartItems
CREATE TABLE [dbo].[CartItems](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [CartId] [int] NOT NULL,
    [ProductId] [int] NOT NULL,
    [Qty] [int] NOT NULL,
    [CreatedAt] [datetime2](0) NOT NULL CONSTRAINT [DF_CartItems_CreatedAt] DEFAULT (GETDATE()),
    [UpdatedAt] [datetime2](0) NOT NULL CONSTRAINT [DF_CartItems_UpdatedAt] DEFAULT (GETDATE()),
    CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CK_CartItems_Qty] CHECK ([Qty] >= 1)
);
GO

ALTER TABLE [dbo].[CartItems] ADD CONSTRAINT [FK_CartItems_Carts]
    FOREIGN KEY([CartId]) REFERENCES [dbo].[Carts]([Id]) ON DELETE CASCADE;
GO

ALTER TABLE [dbo].[CartItems] ADD CONSTRAINT [FK_CartItems_Products]
    FOREIGN KEY([ProductId]) REFERENCES [dbo].[Products]([Id]);
GO

CREATE UNIQUE NONCLUSTERED INDEX [UX_CartItems_CartId_ProductId]
    ON [dbo].[CartItems]([CartId] ASC, [ProductId] ASC);
GO