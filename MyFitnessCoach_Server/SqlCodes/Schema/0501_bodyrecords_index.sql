IF NOT EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = 'IX_BodyRecords_MemberId_CreateAt'
      AND object_id = OBJECT_ID(N'dbo.BodyRecords')
)
BEGIN
    CREATE INDEX IX_BodyRecords_MemberId_CreateAt
    ON dbo.BodyRecords (MemberId, CreateAt DESC);
END
GO
