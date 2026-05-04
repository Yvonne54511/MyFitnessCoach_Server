USE [MyFitnessCoachDb];
GO

-- =============================================
-- 0502: 設定優惠券 BannerImageUrl(讓商城頁 banner 區能顯示)
-- 圖片檔需自行放在 MyFitnessCoach_Client/public/assets/banners/ 下
-- 也支援填外部 URL(https://...),前端不挑
--
-- 快速驗證(無需準備本機圖檔):把下方 UPDATE 的值改成 placehold.co URL
--   例如:'https://placehold.co/1200x375/c4a882/ffffff?text=FLASH14'
-- =============================================
UPDATE [dbo].[Coupons]
SET [BannerImageUrl] = '/assets/banners/flash14.svg'
WHERE [Code] = 'FLASH14';

UPDATE [dbo].[Coupons]
SET [BannerImageUrl] = '/assets/banners/save100.svg'
WHERE [Code] = 'SAVE100';
GO

-- 驗證
SELECT [Code],[Name],[BannerImageUrl],[IsActive],[StartAt],[EndAt]
FROM [dbo].[Coupons] WHERE [BannerImageUrl] IS NOT NULL;
