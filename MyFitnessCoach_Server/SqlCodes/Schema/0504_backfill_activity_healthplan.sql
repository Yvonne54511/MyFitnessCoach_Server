-- ============================================================
-- 0504 Backfill ActivityLevel & HealthPlan
-- 舊 seed data 使用中文描述，新 Goals 頁面使用數字乘數 / 新目標名稱
-- ============================================================

-- ActivityLevel: 中文描述 → TDEE 數字乘數
UPDATE Members SET ActivityLevel = '1.2'   WHERE ActivityLevel = N'久坐';
UPDATE Members SET ActivityLevel = '1.375' WHERE ActivityLevel = N'輕度活動';
UPDATE Members SET ActivityLevel = '1.55'  WHERE ActivityLevel = N'中度活動';
UPDATE Members SET ActivityLevel = '1.725' WHERE ActivityLevel = N'高度活動';
UPDATE Members SET ActivityLevel = '1.9'   WHERE ActivityLevel = N'非常高強度';

-- HealthPlan: 舊目標名�� → 新目標名稱
UPDATE Members SET HealthPlan = N'健��飲食' WHERE HealthPlan = N'維持體重';
UPDATE Members SET HealthPlan = N'減脂'     WHERE HealthPlan = N'減重';

PRINT '0504_backfill_activity_healthplan 執行完成';
GO
