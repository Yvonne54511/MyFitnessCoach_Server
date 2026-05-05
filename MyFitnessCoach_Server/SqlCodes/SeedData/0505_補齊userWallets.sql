USE [MyFitnessCoachDb];
GO

SET NOCOUNT ON;

BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO dbo.UserWallets (MemberId, CurrentBalance, LastUpdated)
    SELECT
        m.Id,
        CAST(0 AS decimal(10, 2)),
        SYSDATETIME()
    FROM dbo.Members AS m
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM dbo.UserWallets AS w
        WHERE w.MemberId = m.Id
    );

    DECLARE @InsertedRows int = @@ROWCOUNT;

    COMMIT TRANSACTION;

    PRINT CONCAT('Inserted UserWallet rows: ', @InsertedRows);
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    THROW;
END CATCH;
GO
