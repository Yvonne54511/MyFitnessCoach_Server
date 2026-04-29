-- 填入 Foods.UpdatedAt 初始值
-- 系統食物（MemberId IS NULL）：代表種子資料匯入時間
UPDATE Foods SET UpdatedAt = '2024-12-31' WHERE MemberId IS NULL;

-- 會員自訂食物（MemberId IS NOT NULL）：補填預設值
UPDATE Foods SET UpdatedAt = '2025-05-01' WHERE MemberId IS NOT NULL;
