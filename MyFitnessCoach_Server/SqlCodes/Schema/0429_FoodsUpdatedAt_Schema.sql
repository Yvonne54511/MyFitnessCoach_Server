-- 新增 Foods.UpdatedAt 欄位（版本號用途）
-- 確認 MemberFavoriteFoods UNIQUE constraint 已存在

ALTER TABLE Foods
ADD UpdatedAt DATETIME2(0) NOT NULL DEFAULT '2024-12-31';

-- 確認 MemberFavoriteFoods unique constraint（如已存在請忽略錯誤）
IF NOT EXISTS (
    SELECT 1 FROM sys.indexes
    WHERE name = 'UX_MemberFavoriteFoods_Member_Food'
      AND object_id = OBJECT_ID('MemberFavoriteFoods')
)
BEGIN
    ALTER TABLE MemberFavoriteFoods
    ADD CONSTRAINT UX_MemberFavoriteFoods_Member_Food
    UNIQUE (MemberId, FoodId);
END
