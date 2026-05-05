-- 補建已啟用帳號但缺少 Member 記錄的資料
-- 適用於舊帳號（IsConfirmed=1 但 Members 表無對應記錄）
INSERT INTO Members (UserId, CancelCount)
SELECT u.Id, 1
FROM Users u
LEFT JOIN Members m ON m.UserId = u.Id
WHERE m.Id IS NULL
  AND u.IsConfirmed = 1;
