USE [MyFitnessCoachDb]
GO

-- =============================================
-- 1. FoodCategories (9)
-- IsDeleted = 0 (not deleted = active)
-- =============================================
SET IDENTITY_INSERT [dbo].[FoodCategories] ON 
GO
INSERT [dbo].[FoodCategories] ([Id], [CategoryName], [IsActive]) VALUES (1, N'豆魚蛋肉類', 1)
GO
INSERT [dbo].[FoodCategories] ([Id], [CategoryName], [IsActive]) VALUES (2, N'澱粉類', 1)
GO
INSERT [dbo].[FoodCategories] ([Id], [CategoryName], [IsActive]) VALUES (3, N'水果類', 1)
GO
INSERT [dbo].[FoodCategories] ([Id], [CategoryName], [IsActive]) VALUES (4, N'乳品類', 1)
GO
INSERT [dbo].[FoodCategories] ([Id], [CategoryName], [IsActive]) VALUES (5, N'蔬菜類', 1)
GO
INSERT [dbo].[FoodCategories] ([Id], [CategoryName], [IsActive]) VALUES (6, N'油脂與堅果類', 1)
GO
INSERT [dbo].[FoodCategories] ([Id], [CategoryName], [IsActive]) VALUES (7, N'加工調理食品及其他類', 1)
GO
INSERT [dbo].[FoodCategories] ([Id], [CategoryName], [IsActive]) VALUES (8, N'飲料類', 1)
GO
INSERT [dbo].[FoodCategories] ([Id], [CategoryName], [IsActive]) VALUES (9, N'調味料及香辛料類', 1)
GO
SET IDENTITY_INSERT [dbo].[FoodCategories] OFF

-- =============================================
-- 2. Foods (2211)
-- IsDeleted->IsActive, value 0->1, MemberId=NULL
-- =============================================
SET IDENTITY_INSERT [dbo].[Foods] ON 
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1, NULL, 1, N'水煮雞胸肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2, NULL, 2, N'白飯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (3, NULL, 3, N'蘋果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (4, NULL, 4, N'牛奶', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (5, NULL, 1, N'蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (6, NULL, 2, N'糙米飯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (7, NULL, 2, N'燕麥片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (8, NULL, 2, N'地瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (9, NULL, 2, N'馬鈴薯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (10, NULL, 2, N'吐司', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (11, NULL, 1, N'滷雞腿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (12, NULL, 1, N'豬里肌', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (13, NULL, 1, N'牛腱', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (14, NULL, 1, N'鮭魚排', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (15, NULL, 1, N'鮪魚罐頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (16, NULL, 1, N'水煮蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (17, NULL, 1, N'傳統豆腐', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (18, NULL, 1, N'無糖豆漿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (19, NULL, 1, N'蛤蜊', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (20, NULL, 5, N'高麗菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (21, NULL, 5, N'花椰菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (22, NULL, 5, N'菠菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (23, NULL, 5, N'洋蔥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (24, NULL, 5, N'小黃瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (25, NULL, 3, N'香蕉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (26, NULL, 3, N'芭樂', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (27, NULL, 3, N'奇異果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (28, NULL, 3, N'小番茄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (29, NULL, 4, N'全脂鮮乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (30, NULL, 4, N'低脂鮮乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (31, NULL, 4, N'希臘優格', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (32, NULL, 2, N'大麥仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (33, NULL, 2, N'大麥片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (34, NULL, 2, N'大麥仁粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (35, NULL, 2, N'小米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (36, NULL, 2, N'糯小米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (37, NULL, 2, N'小麥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (38, NULL, 2, N'小麥胚芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (39, NULL, 2, N'去筋麵粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (40, NULL, 2, N'低筋麵粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (41, NULL, 2, N'中筋麵粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (42, NULL, 2, N'高筋麵粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (43, NULL, 2, N'高筋麵粉(2021年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (44, NULL, 2, N'全麥麵粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (45, NULL, 2, N'雜糧中筋麵粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (46, NULL, 2, N'雜糧高筋麵粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (47, NULL, 2, N'白玉米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (48, NULL, 2, N'紫玉米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (49, NULL, 2, N'甜玉米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (50, NULL, 2, N'雙色水果玉米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (51, NULL, 2, N'糯玉米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (52, NULL, 2, N'冷凍玉米粒', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (53, NULL, 2, N'乾玉米粒', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (54, NULL, 2, N'玉米胚芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (55, NULL, 2, N'玉米粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (56, NULL, 2, N'秈米平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (57, NULL, 2, N'秈米(台中在來2號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (58, NULL, 2, N'秈米(台中秈10號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (59, NULL, 2, N'秈米(台中秈10號)(2024年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (60, NULL, 2, N'稉米平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (61, NULL, 2, N'稉米(台中189號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (62, NULL, 2, N'稉米(台南11號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (63, NULL, 2, N'稉米(台稉2號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (64, NULL, 2, N'稉米(台稉8號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (65, NULL, 2, N'稉米(台稉9號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (66, NULL, 2, N'稉米(台農71號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (67, NULL, 2, N'稉米(高雄139號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (68, NULL, 2, N'稉米(高雄142號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (69, NULL, 2, N'稉米(高雄145號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (70, NULL, 2, N'稉米(高雄139號)(2021年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (71, NULL, 2, N'越光米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (72, NULL, 2, N'越光米(台南16號)(2024年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (73, NULL, 2, N'秈型糯米(台中糯70號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (74, NULL, 2, N'稉型糯米平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (75, NULL, 2, N'稉型糯米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (76, NULL, 2, N'稉型糯米(台稉糯1號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (77, NULL, 2, N'野生紅米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (78, NULL, 2, N'紅糯糙米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (79, NULL, 2, N'黑秈糯糙米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (80, NULL, 2, N'胚芽秈米(台中秈10號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (81, NULL, 2, N'胚芽稉米平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (82, NULL, 2, N'胚芽稉米(台稉10號）', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (83, NULL, 2, N'胚芽稉米(台稉9號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (84, NULL, 2, N'發芽稉米平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (85, NULL, 2, N'發芽稉米(台稉71號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (86, NULL, 2, N'發芽稉米(台稉9號）', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (87, NULL, 2, N'糙秈米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (88, NULL, 2, N'糙稉米平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (89, NULL, 2, N'糙稉米(台稉71號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (90, NULL, 2, N'糙稉米(台稉9號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (91, NULL, 2, N'黑秈糙米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (92, NULL, 2, N'加鈣米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (93, NULL, 2, N'高纖米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (94, NULL, 2, N'五穀米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (95, NULL, 2, N'米胚芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (96, NULL, 2, N'秈米粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (97, NULL, 2, N'糙米粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (98, NULL, 2, N'白糯米粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (99, NULL, 2, N'白飯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (100, NULL, 2, N'高梁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (101, NULL, 2, N'糯高梁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (102, NULL, 2, N'黑麥片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (103, NULL, 2, N'燕麥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (104, NULL, 2, N'燕麥片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (105, NULL, 2, N'即食燕麥片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (106, NULL, 2, N'蕎麥(甜蕎)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (107, NULL, 2, N'薏仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (108, NULL, 2, N'糙薏仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (109, NULL, 2, N'薏仁粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (110, NULL, 2, N'紅藜麥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (111, NULL, 2, N'台灣藜(紅)(帶殼)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (112, NULL, 2, N'淮山', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (113, NULL, 2, N'山藥平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (114, NULL, 2, N'山藥(二刺)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (115, NULL, 2, N'山藥(大汕1號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (116, NULL, 2, N'山藥(大汕3號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (117, NULL, 2, N'山藥(大刺)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (118, NULL, 2, N'山藥(中國長品)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (119, NULL, 2, N'山藥(台農1號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (120, NULL, 2, N'山藥(台農2號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (121, NULL, 2, N'山藥(白皮削)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (122, NULL, 2, N'山藥(尖石原生種)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (123, NULL, 2, N'山藥(宜蘭原生種)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (124, NULL, 2, N'山藥(花蓮3號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (125, NULL, 2, N'山藥(青森)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (126, NULL, 2, N'山藥(高田)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (127, NULL, 2, N'山藥(白肉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (128, NULL, 2, N'紫山藥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (129, NULL, 2, N'木薯粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (130, NULL, 2, N'白皮甘藷', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (131, NULL, 2, N'菱角牛奶甘藷', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (132, NULL, 2, N'芋心甘藷', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (133, NULL, 2, N'紅肉甘藷', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (134, NULL, 2, N'金時甘藷', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (135, NULL, 2, N'黃肉甘藷', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (136, NULL, 2, N'甘藷粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (137, NULL, 2, N'油炸脫水甘藷', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (138, NULL, 2, N'芋頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (139, NULL, 2, N'小芋頭(山芋)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (140, NULL, 2, N'檳榔心芋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (141, NULL, 2, N'檳榔心芋(2021年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (142, NULL, 2, N'冷凍芋頭塊', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (143, NULL, 2, N'芋頭粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (144, NULL, 2, N'豆薯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (145, NULL, 2, N'紅馬鈴薯(粉紅珍珠馬鈴薯)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (146, NULL, 2, N'馬鈴薯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (147, NULL, 2, N'馬鈴薯(2022年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (148, NULL, 2, N'小馬鈴薯(珍珠馬鈴薯)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (149, NULL, 2, N'馬鈴薯粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (150, NULL, 2, N'荸薺', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (151, NULL, 2, N'荸薺粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (152, NULL, 2, N'蓮藕', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (153, NULL, 2, N'熟蓮藕', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (154, NULL, 2, N'熟蓮藕切片(水煮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (155, NULL, 2, N'蓮藕粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (156, NULL, 2, N'菱角(生)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (157, NULL, 2, N'菱角仁(生)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (158, NULL, 2, N'菱角(熟)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (159, NULL, 2, N'蒟蒻粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (160, NULL, 6, N'甘扁桃仁片(生)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (161, NULL, 6, N'甘扁桃仁片(熟)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (162, NULL, 6, N'甘扁桃仁(熟)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (163, NULL, 6, N'松子仁(生)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (164, NULL, 6, N'原味松子仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (165, NULL, 6, N'原味夏威夷豆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (166, NULL, 6, N'生核桃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (167, NULL, 6, N'栗子(生)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (168, NULL, 6, N'栗子仁(生)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (169, NULL, 6, N'開心果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (170, NULL, 6, N'腰果(生)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (171, NULL, 6, N'原味腰果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (172, NULL, 6, N'原味榛果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (173, NULL, 6, N'山粉圓', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (174, NULL, 6, N'亞麻仁籽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (175, NULL, 6, N'亞麻仁籽粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (176, NULL, 6, N'咖啡豆(曼特寧)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (177, NULL, 6, N'奇亞子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (178, NULL, 6, N'白芝麻(生)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (179, NULL, 6, N'黑芝麻(生)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (180, NULL, 6, N'白芝麻(熟)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (181, NULL, 6, N'白芝麻(熟)2022年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (182, NULL, 6, N'黑芝麻(熟)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (183, NULL, 6, N'黑芝麻(熟)(2022年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (184, NULL, 6, N'黑芝麻粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (185, NULL, 6, N'帶殼花生(生)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (186, NULL, 6, N'冷凍帶殼花生(熟)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (187, NULL, 6, N'黑金剛花生(生)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (188, NULL, 6, N'帶膜花生仁(生)(1995年之前取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (189, NULL, 6, N'去膜花生仁(生)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (190, NULL, 6, N'帶膜花生仁(生)(2004年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (191, NULL, 6, N'紅土帶殼花生(熟)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (192, NULL, 6, N'花生粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (193, NULL, 6, N'芡實', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (194, NULL, 6, N'愛玉子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (195, NULL, 6, N'原味葵瓜子(去殼)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (196, NULL, 6, N'銀杏果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (197, NULL, 6, N'蓮子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (198, NULL, 6, N'蓮子(乾)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (199, NULL, 3, N'山竹', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (200, NULL, 3, N'木瓜平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (201, NULL, 3, N'木瓜(2月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (202, NULL, 3, N'木瓜(5月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (203, NULL, 3, N'木瓜(8月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (204, NULL, 3, N'木瓜(11月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (205, NULL, 3, N'青木瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (206, NULL, 3, N'安石榴', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (207, NULL, 3, N'百香果(台農一號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (208, NULL, 3, N'百香果汁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (209, NULL, 3, N'金黃奇異果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (210, NULL, 3, N'奇異果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (211, NULL, 3, N'紅毛丹', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (212, NULL, 3, N'紅龍果(白肉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (213, NULL, 3, N'紅龍果(紅肉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (214, NULL, 3, N'北蕉平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (215, NULL, 3, N'北蕉(2月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (216, NULL, 3, N'北蕉(5月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (217, NULL, 3, N'北蕉(9月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (218, NULL, 3, N'北蕉(11月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (219, NULL, 3, N'北蕉(0天,綠皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (220, NULL, 3, N'北蕉(1天)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (221, NULL, 3, N'北蕉(3天)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (222, NULL, 3, N'北蕉(7天)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (223, NULL, 3, N'李林蕉(2007年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (224, NULL, 3, N'李林蕉(2012年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (225, NULL, 3, N'南華蕉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (226, NULL, 3, N'紅皮蕉(2004年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (227, NULL, 3, N'紅皮蕉(2012年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (228, NULL, 3, N'蛋蕉(2023年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (229, NULL, 3, N'酪梨(綠皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (230, NULL, 3, N'酪梨(室溫存放0天)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (231, NULL, 3, N'酪梨(室溫存放3天)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (232, NULL, 3, N'酪梨(室溫存放6天)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (233, NULL, 3, N'榴槤', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (234, NULL, 3, N'開英種1號鳳梨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (235, NULL, 3, N'鳳梨平均值(雜交種)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (236, NULL, 3, N'甘蔗鳳梨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (237, NULL, 3, N'甜蜜蜜鳳梨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (238, NULL, 3, N'金鑽鳳梨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (239, NULL, 3, N'牛奶鳳梨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (240, NULL, 3, N'釋迦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (241, NULL, 3, N'鳳梨釋迦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (242, NULL, 3, N'桑葚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (243, NULL, 3, N'桑葚汁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (244, NULL, 3, N'草莓', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (245, NULL, 3, N'土芭樂', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (246, NULL, 3, N'芭樂平均值(白肉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (247, NULL, 3, N'番石榴(珍珠拔)(有機)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (248, NULL, 3, N'世紀芭樂', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (249, NULL, 3, N'珍珠芭樂', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (250, NULL, 3, N'泰國芭樂', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (251, NULL, 3, N'無子芭樂', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (252, NULL, 3, N'紅心芭樂', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (253, NULL, 3, N'楊桃平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (254, NULL, 3, N'楊桃(2月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (255, NULL, 3, N'楊桃(4月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (256, NULL, 3, N'楊桃(5月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (257, NULL, 3, N'楊桃(9月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (258, NULL, 3, N'楊桃(11月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (259, NULL, 3, N'美國紅葡萄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (260, NULL, 3, N'巨峰葡萄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (261, NULL, 3, N'綠葡萄平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (262, NULL, 3, N'美國綠葡萄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (263, NULL, 3, N'意大利葡萄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (264, NULL, 3, N'美國紅葡萄(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (265, NULL, 3, N'美國紫葡萄(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (266, NULL, 3, N'美國黑葡萄(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (267, NULL, 3, N'美國綠葡萄(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (268, NULL, 3, N'無子紅葡萄(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (269, NULL, 3, N'黑美人葡萄(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (270, NULL, 3, N'金香葡萄(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (271, NULL, 3, N'葡萄乾', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (272, NULL, 3, N'蓮霧平均值(粉紅色種)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (273, NULL, 3, N'蓮霧(紅寶石)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (274, NULL, 3, N'蓮霧(黑金剛)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (275, NULL, 3, N'蓮霧(黑珍珠)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (276, NULL, 3, N'華寶大西瓜(花蓮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (277, NULL, 3, N'西瓜平均值(紅肉小瓜)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (278, NULL, 3, N'皇宮西瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (279, NULL, 3, N'紅鈴西瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (280, NULL, 3, N'黑美人西瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (281, NULL, 3, N'鳳光西瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (282, NULL, 3, N'無籽西瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (283, NULL, 3, N'西瓜平均值(黃肉小瓜)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (284, NULL, 3, N'小玉西瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (285, NULL, 3, N'金蘭西瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (286, NULL, 3, N'嘉寶瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (287, NULL, 3, N'甜瓜平均值(光皮洋香瓜)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (288, NULL, 3, N'太陽洋香瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (289, NULL, 3, N'狀元瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (290, NULL, 3, N'蜜世界洋香瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (291, NULL, 3, N'甜瓜平均值(東洋系脆瓜)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (292, NULL, 3, N'美濃瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (293, NULL, 3, N'黃香瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (294, NULL, 3, N'嘉玉甜瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (295, NULL, 3, N'洋香瓜(新世紀)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (296, NULL, 3, N'新疆哈密瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (297, NULL, 3, N'洋香瓜(卡蜜拉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (298, NULL, 3, N'甜瓜平均值(網紋洋香瓜)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (299, NULL, 3, N'七股香洋香瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (300, NULL, 3, N'天香洋香瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (301, NULL, 3, N'秋香洋香瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (302, NULL, 3, N'紅寶石洋香瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (303, NULL, 3, N'香華洋香瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (304, NULL, 3, N'藍寶石洋香瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (305, NULL, 3, N'土芒果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (306, NULL, 3, N'芒果平均值(西洋種)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (307, NULL, 3, N'肯特芒果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (308, NULL, 3, N'海頓芒果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (309, NULL, 3, N'凱特芒果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (310, NULL, 3, N'愛文芒果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (311, NULL, 3, N'聖心芒果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (312, NULL, 3, N'黑香芒果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (313, NULL, 3, N'芒果平均值(新興種)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (314, NULL, 3, N'四季芒果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (315, NULL, 3, N'玉文芒果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (316, NULL, 3, N'金煌芒果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (317, NULL, 3, N'金蜜芒果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (318, NULL, 3, N'金興芒果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (319, NULL, 3, N'香水芒果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (320, NULL, 3, N'蓮花芒果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (321, NULL, 3, N'芒果乾', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (322, NULL, 3, N'荔枝平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (323, NULL, 3, N'玉荷苞荔枝', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (324, NULL, 3, N'黑葉仔荔枝', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (325, NULL, 3, N'冷凍荔枝', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (326, NULL, 3, N'龍眼', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (327, NULL, 3, N'龍眼乾', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (328, NULL, 3, N'帶殼龍眼乾', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (329, NULL, 3, N'李子平均值(青皮黃肉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (330, NULL, 3, N'加州青李', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (331, NULL, 3, N'翡翠李', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (332, NULL, 3, N'李子平均值(紅皮紅肉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (333, NULL, 3, N'紅肉李(大)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (334, NULL, 3, N'紅肉李(小)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (335, NULL, 3, N'李子平均值(紅皮黃肉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (336, NULL, 3, N'加州紅李(台灣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (337, NULL, 3, N'加州紅李(進口)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (338, NULL, 3, N'加州蜜李(進口)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (339, NULL, 3, N'香水李', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (340, NULL, 3, N'桃接李(大)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (341, NULL, 3, N'桃接李(小)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (342, NULL, 3, N'蜜棗李(進口)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (343, NULL, 3, N'黃肉李', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (344, NULL, 3, N'黑李', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (345, NULL, 3, N'枇杷', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (346, NULL, 3, N'筆柿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (347, NULL, 3, N'甜柿平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (348, NULL, 3, N'富有甜柿(大雪山)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (349, NULL, 3, N'甜柿(進口)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (350, NULL, 3, N'國產甜柿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (351, NULL, 3, N'牛心柿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (352, NULL, 3, N'四周柿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (353, NULL, 3, N'柿餅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (354, NULL, 3, N'水蜜桃平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (355, NULL, 3, N'水蜜桃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (356, NULL, 3, N'甜蜜桃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (357, NULL, 3, N'脆桃平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (358, NULL, 3, N'白油桃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (359, NULL, 3, N'玫瑰桃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (360, NULL, 3, N'福壽桃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (361, NULL, 3, N'鶯哥桃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (362, NULL, 3, N'蟠桃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (363, NULL, 3, N'青梅(胭脂梅)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (364, NULL, 3, N'西洋梨平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (365, NULL, 3, N'西洋梨(青皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (366, NULL, 3, N'西洋梨(紅皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (367, NULL, 3, N'西洋梨(黃皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (368, NULL, 3, N'幸水梨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (369, NULL, 3, N'大雪梨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (370, NULL, 3, N'新世紀梨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (371, NULL, 3, N'新興梨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (372, NULL, 3, N'橫山梨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (373, NULL, 3, N'豐水梨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (374, NULL, 3, N'將軍蜜梨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (375, NULL, 3, N'梨山蜜梨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (376, NULL, 3, N'蜜棗平均值(大)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (377, NULL, 3, N'蜜棗(長形)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (378, NULL, 3, N'蜜棗(圓形)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (379, NULL, 3, N'珍珠蜜棗', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (380, NULL, 3, N'國產紅棗', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (381, NULL, 3, N'紅棗(乾)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (382, NULL, 3, N'黑棗(乾)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (383, NULL, 3, N'蘋果平均值(青皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (384, NULL, 3, N'青龍蘋果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (385, NULL, 3, N'翠玉青蘋果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (386, NULL, 3, N'翠玉青蘋果(帶皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (387, NULL, 3, N'美國五爪蘋果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (388, NULL, 3, N'蘋果平均值(混色)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (389, NULL, 3, N'加拉蘋果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (390, NULL, 3, N'津輕蜜蘋果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (391, NULL, 3, N'秋香蘋果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (392, NULL, 3, N'富士蘋果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (393, NULL, 3, N'富士蘋果(帶皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (394, NULL, 3, N'金冠蘋果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (395, NULL, 3, N'櫻桃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (396, NULL, 3, N'白櫻桃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (397, NULL, 3, N'椪柑', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (398, NULL, 3, N'紅柑', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (399, NULL, 3, N'茂谷柑', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (400, NULL, 3, N'海梨桶柑', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (401, NULL, 3, N'高牆桶柑', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (402, NULL, 3, N'檸檬柑', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (403, NULL, 3, N'砂糖橘', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (404, NULL, 3, N'長果金柑', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (405, NULL, 3, N'圓果金柑', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (406, NULL, 3, N'圓果金柑汁(綠皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (407, NULL, 3, N'文旦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (408, NULL, 3, N'文旦(2023年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (409, NULL, 3, N'白柚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (410, NULL, 3, N'西施蜜柚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (411, NULL, 3, N'甜橙平均值(普遍系)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (412, NULL, 3, N'柳橙', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (413, NULL, 3, N'香吉士(進口)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (414, NULL, 3, N'澳洲甜橙(進口)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (415, NULL, 3, N'青皮葡萄柚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (416, NULL, 3, N'紅寶石葡萄柚(古坑)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (417, NULL, 3, N'黃皮葡萄柚(進口)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (418, NULL, 3, N'黃皮葡萄柚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (419, NULL, 3, N'檸檬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (420, NULL, 3, N'萊姆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (421, NULL, 3, N'檸檬汁平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (422, NULL, 3, N'檸檬汁(黃皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (423, NULL, 3, N'檸檬汁(綠皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (424, NULL, 3, N'萊姆汁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (425, NULL, 3, N'紅甘蔗汁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (426, NULL, 3, N'紅甘蔗汁(有機,2023年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (427, NULL, 3, N'人心果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (428, NULL, 3, N'可可椰子汁平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (429, NULL, 3, N'可可椰子汁(屏東)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (430, NULL, 3, N'可可椰子汁(進口)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (431, NULL, 3, N'蛋黃果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (432, NULL, 3, N'無花果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (433, NULL, 3, N'無花果乾', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (434, NULL, 3, N'黃金果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (435, NULL, 3, N'菠蘿蜜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (436, NULL, 3, N'榴槤蜜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (437, NULL, 3, N'牛奶果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (438, NULL, 3, N'餘甘子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (439, NULL, 3, N'嘉寶果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (440, NULL, 3, N'藍莓(台灣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (441, NULL, 5, N'牛蒡', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (442, NULL, 5, N'胡蘿蔔平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (443, NULL, 5, N'胡蘿蔔', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (444, NULL, 5, N'向陽二號胡蘿蔔', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (445, NULL, 5, N'澳洲胡蘿蔔(細長型)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (446, NULL, 5, N'黃胡蘿蔔', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (447, NULL, 5, N'冷凍胡蘿蔔', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (448, NULL, 5, N'根菾菜根', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (449, NULL, 5, N'根菾菜根(2023年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (450, NULL, 5, N'白蘿蔔平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (451, NULL, 5, N'白蘿蔔', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (452, NULL, 5, N'白蘿蔔(長形)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (453, NULL, 5, N'櫻桃蘿蔔', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (454, NULL, 5, N'青蘿蔔', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (455, NULL, 5, N'蘿蔔乾', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (456, NULL, 5, N'百合鱗片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (457, NULL, 5, N'乾百合鱗片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (458, NULL, 5, N'芋莖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (459, NULL, 5, N'金針菜嫩莖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (460, NULL, 5, N'草石蠶', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (461, NULL, 5, N'球莖甘藍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (462, NULL, 5, N'孟宗竹筍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (463, NULL, 5, N'熟桂竹筍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (464, NULL, 5, N'烏殼綠竹筍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (465, NULL, 5, N'茭白筍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (466, NULL, 5, N'玉米筍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (467, NULL, 5, N'麻竹筍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (468, NULL, 5, N'冷凍麻竹筍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (469, NULL, 5, N'綠竹筍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (470, NULL, 5, N'帶殼熟綠竹筍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (471, NULL, 5, N'沙拉筍塊', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (472, NULL, 5, N'熟箭竹筍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (473, NULL, 5, N'白蘆筍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (474, NULL, 5, N'綠蘆筍平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (475, NULL, 5, N'綠蘆筍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (476, NULL, 5, N'澳洲綠蘆筍(粗短型)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (477, NULL, 5, N'綠蘆筍(細短型)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (478, NULL, 5, N'綠蘆筍(短型)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (479, NULL, 5, N'蘆筍花', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (480, NULL, 5, N'嫩莖萵苣', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (481, NULL, 5, N'嫩薑', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (482, NULL, 5, N'粉薑', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (483, NULL, 5, N'老薑', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (484, NULL, 5, N'檳榔嫩莖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (485, NULL, 5, N'大蒜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (486, NULL, 5, N'青蒜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (487, NULL, 5, N'蒜苗', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (488, NULL, 5, N'青蔥平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (489, NULL, 5, N'青蔥(有機)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (490, NULL, 5, N'山東大蔥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (491, NULL, 5, N'日本甜蔥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (492, NULL, 5, N'宜蘭粉蔥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (493, NULL, 5, N'白洋蔥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (494, NULL, 5, N'紫洋蔥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (495, NULL, 5, N'黃洋蔥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (496, NULL, 5, N'紅蔥頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (497, NULL, 5, N'韮菜花', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (498, NULL, 5, N'韮菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (499, NULL, 5, N'韮黃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (500, NULL, 5, N'九層塔', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (501, NULL, 5, N'小麥苗', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (502, NULL, 5, N'水菜(日本種)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (503, NULL, 5, N'甘藍平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (504, NULL, 5, N'梨山甘藍(尖球形)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (505, NULL, 5, N'甘藍(扁圓形)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (506, NULL, 5, N'甘藍(圓球形)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (507, NULL, 5, N'甘藍(圓球形)(2021年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (508, NULL, 5, N'紫色甘藍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (509, NULL, 5, N'甘藍芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (510, NULL, 5, N'冷凍甘藍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (511, NULL, 5, N'羽衣甘藍(有機)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (512, NULL, 5, N'脫水甘藍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (513, NULL, 5, N'甘藷葉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (514, NULL, 5, N'蚵仔白菜(2022年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (515, NULL, 5, N'荷葉白菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (516, NULL, 5, N'葵扇白菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (517, NULL, 5, N'黑葉白菜(短梗)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (518, NULL, 5, N'千寶菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (519, NULL, 5, N'小白菜(土植)(1月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (520, NULL, 5, N'小白菜(土植)(3月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (521, NULL, 5, N'小白菜(土植)(4月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (522, NULL, 5, N'小白菜(土植)(7月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (523, NULL, 5, N'小白菜(土植)(10月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (524, NULL, 5, N'小白菜(水耕)(1月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (525, NULL, 5, N'小白菜(水耕)(4月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (526, NULL, 5, N'小白菜(水耕)(7月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (527, NULL, 5, N'小白菜(水耕)(10月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (528, NULL, 5, N'小白菜(有機)(1月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (529, NULL, 5, N'小白菜(有機)(4月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (530, NULL, 5, N'小白菜(有機)(7月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (531, NULL, 5, N'小白菜(有機)(10月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (532, NULL, 5, N'珍珠小白菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (533, NULL, 5, N'油菜心', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (534, NULL, 5, N'油菜(有機)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (535, NULL, 5, N'青江菜(土植)(1月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (536, NULL, 5, N'青江菜(土植)(3月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (537, NULL, 5, N'青江菜(土植)(4月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (538, NULL, 5, N'青江菜(土植)(7月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (539, NULL, 5, N'青江菜(土植)(10月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (540, NULL, 5, N'青江菜(水耕)(1月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (541, NULL, 5, N'青江菜(水耕)(4月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (542, NULL, 5, N'青江菜(水耕)(7月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (543, NULL, 5, N'青江菜(水耕)(10月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (544, NULL, 5, N'青江菜(有機)(1月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (545, NULL, 5, N'青江菜(有機)(4月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (546, NULL, 5, N'青江菜(有機)(7月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (547, NULL, 5, N'青江菜(有機)(10月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (548, NULL, 5, N'塔菇菜(有機)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (549, NULL, 5, N'廣島野菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (550, NULL, 5, N'日本油菜(有機)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (551, NULL, 5, N'結球白菜平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (552, NULL, 5, N'煙台白菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (553, NULL, 5, N'迷你竹筍白菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (554, NULL, 5, N'翠玉白菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (555, NULL, 5, N'包心白菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (556, NULL, 5, N'白菜芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (557, NULL, 5, N'白鳳菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (558, NULL, 5, N'紅鳳菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (559, NULL, 5, N'豆瓣菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (560, NULL, 5, N'明日葉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (561, NULL, 5, N'山芹菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (562, NULL, 5, N'芹菜平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (563, NULL, 5, N'芹菜(青梗)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (564, NULL, 5, N'芹菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (565, NULL, 5, N'西洋芹菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (566, NULL, 5, N'大心芥菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (567, NULL, 5, N'大芥菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (568, NULL, 5, N'包心芥菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (569, NULL, 5, N'芥菜平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (570, NULL, 5, N'芥菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (571, NULL, 5, N'雪裡蕻', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (572, NULL, 5, N'抱子芥菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (573, NULL, 5, N'芥藍菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (574, NULL, 5, N'芥藍芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (575, NULL, 5, N'芫荽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (576, NULL, 5, N'紅梗珍珠菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (577, NULL, 5, N'食茱萸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (578, NULL, 5, N'香樁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (579, NULL, 5, N'茴香', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (580, NULL, 5, N'馬齒莧', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (581, NULL, 5, N'茼蒿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (582, NULL, 5, N'日本茼蒿(有機)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (583, NULL, 5, N'昭和草', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (584, NULL, 5, N'隼人瓜苗', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (585, NULL, 5, N'白莧菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (586, NULL, 5, N'紅莧菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (587, NULL, 5, N'野莧菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (588, NULL, 5, N'紫蘇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (589, NULL, 5, N'菠菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (590, NULL, 5, N'菠菜(葉)(有機)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (591, NULL, 5, N'冷凍菠菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (592, NULL, 5, N'菾菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (593, NULL, 5, N'黃金菾菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (594, NULL, 5, N'落葵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (595, NULL, 5, N'藤三七', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (596, NULL, 5, N'不結球萵苣平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (597, NULL, 5, N'奶油萵苣(日本種)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (598, NULL, 5, N'紅葉萵苣(荷蘭種）', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (599, NULL, 5, N'廣東萵苣', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (600, NULL, 5, N'蘿美萵苣', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (601, NULL, 5, N'本島萵苣(土植)(1月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (602, NULL, 5, N'本島萵苣(土植)(3月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (603, NULL, 5, N'本島萵苣(土植)(4月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (604, NULL, 5, N'本島萵苣(土植)(7月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (605, NULL, 5, N'本島萵苣(土植)(10月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (606, NULL, 5, N'本島萵苣(水耕)(1月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (607, NULL, 5, N'本島萵苣(水耕)(4月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (608, NULL, 5, N'本島萵苣(水耕)(7月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (609, NULL, 5, N'本島萵苣(水耕)(10月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (610, NULL, 5, N'本島萵苣(有機)(1月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (611, NULL, 5, N'本島萵苣(有機)(4月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (612, NULL, 5, N'本島萵苣(有機)(7月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (613, NULL, 5, N'本島萵苣(有機)(10月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (614, NULL, 5, N'水耕波士頓萵苣', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (615, NULL, 5, N'結球萵苣', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (616, NULL, 5, N'豌豆苗', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (617, NULL, 5, N'龍葵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (618, NULL, 5, N'蕹菜(土植)(1月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (619, NULL, 5, N'蕹菜(土植)(4月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (620, NULL, 5, N'蕹菜(土植)(7月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (621, NULL, 5, N'蕹菜(土植)(10月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (622, NULL, 5, N'蕹菜(水耕)(1月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (623, NULL, 5, N'蕹菜(水耕)(4月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (624, NULL, 5, N'蕹菜(水耕)(7月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (625, NULL, 5, N'蕹菜(水耕)(10月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (626, NULL, 5, N'蕹菜(有機)(4月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (627, NULL, 5, N'蕹菜(有機)(10月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (628, NULL, 5, N'水蕹菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (629, NULL, 5, N'蘿蔔葉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (630, NULL, 5, N'花椰菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (631, NULL, 5, N'冷凍花椰菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (632, NULL, 5, N'紫色花椰菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (633, NULL, 5, N'青花菜(1999年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (634, NULL, 5, N'青花菜(2021年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (635, NULL, 5, N'冷凍青花菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (636, NULL, 5, N'青花菜筍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (637, NULL, 5, N'花椰菜乾', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (638, NULL, 5, N'金針菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (639, NULL, 5, N'金針菜乾', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (640, NULL, 5, N'洛神花乾', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (641, NULL, 5, N'絲瓜花', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (642, NULL, 5, N'冬瓜平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (643, NULL, 5, N'冬瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (644, NULL, 5, N'香芋冬瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (645, NULL, 5, N'冬瓜(2022年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (646, NULL, 5, N'南瓜平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (647, NULL, 5, N'日本南瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (648, NULL, 5, N'台灣南瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (649, NULL, 5, N'栗子南瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (650, NULL, 5, N'菊花南瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (651, NULL, 5, N'胡瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (652, NULL, 5, N'花胡瓜(有機)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (653, NULL, 5, N'苦瓜(白皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (654, NULL, 5, N'苦瓜(青皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (655, NULL, 5, N'珍珠苦瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (656, NULL, 5, N'野苦瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (657, NULL, 5, N'隼人瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (658, NULL, 5, N'隼人瓜(2023年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (659, NULL, 5, N'白皮蛇瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (660, NULL, 5, N'綠皮蛇瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (661, NULL, 5, N'絲瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (662, NULL, 5, N'稜角絲瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (663, NULL, 5, N'越瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (664, NULL, 5, N'蒲瓜平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (665, NULL, 5, N'蒲瓜(長形)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (666, NULL, 5, N'蒲瓜(圓形)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (667, NULL, 5, N'花蒲瓜(圓形)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (668, NULL, 5, N'葫蘆瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (669, NULL, 5, N'黃櫛瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (670, NULL, 5, N'綠櫛瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (671, NULL, 5, N'枸杞乾', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (672, NULL, 5, N'長茄子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (673, NULL, 5, N'圓茄子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (674, NULL, 5, N'大番茄平均值(紅色系)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (675, NULL, 5, N'牛番茄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (676, NULL, 5, N'紅番茄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (677, NULL, 5, N'桃太郎番茄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (678, NULL, 5, N'黃番茄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (679, NULL, 5, N'大番茄平均值(綠色系)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (680, NULL, 5, N'粉柿番茄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (681, NULL, 5, N'黑柿番茄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (682, NULL, 5, N'綠番茄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (683, NULL, 5, N'小番茄平均值(紅色系)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (684, NULL, 5, N'聖女小番茄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (685, NULL, 5, N'試交二號小番茄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (686, NULL, 5, N'櫻桃小番茄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (687, NULL, 5, N'黃金小蕃茄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (688, NULL, 5, N'小番茄平均值(橙色系)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (689, NULL, 5, N'金女小番茄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (690, NULL, 5, N'黃金聖女小番茄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (691, NULL, 5, N'橙蕃茄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (692, NULL, 5, N'香瓜茄', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (693, NULL, 5, N'甜椒平均值(青皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (694, NULL, 5, N'甜椒(青皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (695, NULL, 5, N'小甜椒(青皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (696, NULL, 5, N'高山甜椒(青皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (697, NULL, 5, N'甜椒(紅皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (698, NULL, 5, N'甜椒(黃皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (699, NULL, 5, N'甜椒(橙皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (700, NULL, 5, N'青辣椒平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (701, NULL, 5, N'角椒', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (702, NULL, 5, N'長辣椒(青皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (703, NULL, 5, N'糯米椒', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (704, NULL, 5, N'紅辣椒平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (705, NULL, 5, N'長辣椒(紅皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (706, NULL, 5, N'朝天椒(長果)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (707, NULL, 5, N'朝天椒(圓果)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (708, NULL, 5, N'乾長辣椒(紅皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (709, NULL, 5, N'黃秋葵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (710, NULL, 5, N'青花菜芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (711, NULL, 5, N'苜蓿芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (712, NULL, 5, N'紫甘藍芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (713, NULL, 5, N'黃豆芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (714, NULL, 5, N'黃豆芽(有機,2023年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (715, NULL, 5, N'黑豆芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (716, NULL, 5, N'葵花芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (717, NULL, 5, N'綠豆芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (718, NULL, 5, N'豌豆芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (719, NULL, 5, N'蕎麥芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (720, NULL, 5, N'蘿蔔芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (721, NULL, 5, N'山蘇菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (722, NULL, 5, N'火炭母草', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (723, NULL, 5, N'石蓮花', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (724, NULL, 5, N'青葙', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (725, NULL, 5, N'假人蔘', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (726, NULL, 5, N'野苦瓜嫩梢', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (727, NULL, 5, N'過溝菜蕨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (728, NULL, 5, N'蔘鬚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (729, NULL, 5, N'龍骨瓣莕菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (730, NULL, 5, N'薄荷', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (731, NULL, 5, N'蕺菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (732, NULL, 5, N'蘆薈', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (733, NULL, 5, N'皇宮菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (734, NULL, 5, N'香芫荽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (735, NULL, 5, N'荷蘭豆菜心', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (736, NULL, 5, N'厥子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (737, NULL, 5, N'義大利茼蒿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (738, NULL, 5, N'龍延草', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (739, NULL, 5, N'麵包果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (740, NULL, 5, N'冰花', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (741, NULL, 5, N'紅毛苔', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (742, NULL, 5, N'紫菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (743, NULL, 5, N'熟紫菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (744, NULL, 5, N'髮菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (745, NULL, 5, N'麒麟菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (746, NULL, 5, N'乾麒麟菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (747, NULL, 5, N'礁膜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (748, NULL, 5, N'乾海茸芯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (749, NULL, 5, N'海帶平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (750, NULL, 5, N'海帶卷', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (751, NULL, 5, N'海帶茸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (752, NULL, 5, N'海帶梗', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (753, NULL, 5, N'海帶結', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (754, NULL, 5, N'海帶絲', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (755, NULL, 5, N'乾海帶', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (756, NULL, 5, N'裙帶菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (757, NULL, 5, N'乾裙帶菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (758, NULL, 5, N'乾裙帶菜根', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (759, NULL, 5, N'鳳尾藻', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (760, NULL, 5, N'葛仙米藻', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (761, NULL, 5, N'壽司海苔片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (762, NULL, 5, N'木耳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (763, NULL, 5, N'冷凍木耳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (764, NULL, 5, N'乾木耳平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (765, NULL, 5, N'乾木耳(紅耳仔)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (766, NULL, 5, N'乾木耳(黑耳仔)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (767, NULL, 5, N'乾川耳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (768, NULL, 5, N'銀耳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (769, NULL, 5, N'白毛木耳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (770, NULL, 5, N'乾銀耳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (771, NULL, 5, N'草菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (772, NULL, 5, N'雞腿菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (773, NULL, 5, N'雞腿菇(乾)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (774, NULL, 5, N'松茸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (775, NULL, 5, N'雪白菇(長)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (776, NULL, 5, N'柳松菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (777, NULL, 5, N'乾柳松菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (778, NULL, 5, N'香菇平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (779, NULL, 5, N'香菇(大)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (780, NULL, 5, N'香菇(小)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (781, NULL, 5, N'花菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (782, NULL, 5, N'乾香菇平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (783, NULL, 5, N'乾香菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (784, NULL, 5, N'乾花菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (785, NULL, 5, N'乾白花菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (786, NULL, 5, N'乾鈕釦菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (787, NULL, 5, N'姬松茸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (788, NULL, 5, N'乾姬松茸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (789, NULL, 5, N'酒杯菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (790, NULL, 5, N'秀珍菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (791, NULL, 5, N'天喜菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (792, NULL, 5, N'白蠔菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (793, NULL, 5, N'玫瑰菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (794, NULL, 5, N'杏香菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (795, NULL, 5, N'杏鮑菇平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (796, NULL, 5, N'杏鮑菇(大)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (797, NULL, 5, N'杏鮑菇(中)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (798, NULL, 5, N'杏鮑菇(小)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (799, NULL, 5, N'珊瑚菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (800, NULL, 5, N'蠔菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (801, NULL, 5, N'鮑魚菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (802, NULL, 5, N'金針菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (803, NULL, 5, N'華翠菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (804, NULL, 5, N'滑菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (805, NULL, 5, N'舞菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (806, NULL, 5, N'鴻喜菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (807, NULL, 5, N'雪白菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (808, NULL, 5, N'洋菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (809, NULL, 5, N'冷凍洋菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (810, NULL, 5, N'白茯苓', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (811, NULL, 5, N'猴頭菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (812, NULL, 5, N'乾猴頭菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (813, NULL, 5, N'乾竹笙', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (814, NULL, 5, N'松茸白菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (815, NULL, 5, N'金喜菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (816, NULL, 5, N'喜來菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (817, NULL, 5, N'富珍茸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (818, NULL, 1, N'白鳳豆平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (819, NULL, 1, N'白鳳豆(台灣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (820, NULL, 1, N'白鳳豆(進口)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (821, NULL, 1, N'米豆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (822, NULL, 1, N'花豆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (823, NULL, 1, N'紅豆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (824, NULL, 1, N'紅雲豆(大紅豆)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (825, NULL, 1, N'青仁黑豆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (826, NULL, 1, N'黃仁黑豆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (827, NULL, 1, N'黑豆胚芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (828, NULL, 1, N'烘烤黑豆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (829, NULL, 1, N'黑豆粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (830, NULL, 1, N'毛綠豆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (831, NULL, 1, N'綠豆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (832, NULL, 1, N'綠豆仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (833, NULL, 1, N'綠豆粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (834, NULL, 1, N'豇豆(莢)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (835, NULL, 1, N'萊豆仁(帶膜)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (836, NULL, 1, N'萊豆仁(去膜)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (837, NULL, 1, N'粉豆莢', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (838, NULL, 1, N'敏豆莢', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (839, NULL, 1, N'冷凍菜豆(莢)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (840, NULL, 1, N'毛豆仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (841, NULL, 1, N'毛豆莢(高雄13號)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (842, NULL, 1, N'冷凍毛豆仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (843, NULL, 1, N'黃豆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (844, NULL, 1, N'黃豆胚芽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (845, NULL, 1, N'黃豆粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (846, NULL, 1, N'黃豆粉(有機)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (847, NULL, 1, N'豆漿(無糖)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (848, NULL, 1, N'豌豆仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (849, NULL, 1, N'豌豆莢', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (850, NULL, 1, N'高山大豌豆莢', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (851, NULL, 1, N'甜豌豆莢', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (852, NULL, 1, N'冷凍豌豆仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (853, NULL, 1, N'鵲豆莢', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (854, NULL, 1, N'紅扁豆仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (855, NULL, 1, N'鷹嘴豆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (856, NULL, 1, N'樹豆(白)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (857, NULL, 1, N'翼豆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (858, NULL, 1, N'天貝(黃豆)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (859, NULL, 1, N'牛小排平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (860, NULL, 1, N'去骨牛小排', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (861, NULL, 1, N'帶骨牛小排', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (862, NULL, 1, N'無骨牛小排(美牛)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (863, NULL, 1, N'牛肋條', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (864, NULL, 1, N'牛肋條(2021年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (865, NULL, 1, N'沙朗牛排', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (866, NULL, 1, N'板腱 ', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (867, NULL, 1, N'牛去骨肩胛小排', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (868, NULL, 1, N'牛前胸肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (869, NULL, 1, N'牛修清前胸肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (870, NULL, 1, N'去骨紐約克牛排', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (871, NULL, 1, N'腓力牛排', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (872, NULL, 1, N'牛後腿肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (873, NULL, 1, N'牛後腿股肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (874, NULL, 1, N'牛後腿腱子心', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (875, NULL, 1, N'牛後腿腱子心(2022年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (876, NULL, 1, N'牛肉火鍋片平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (877, NULL, 1, N'牛五花肉火鍋片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (878, NULL, 1, N'牛紐約客火鍋片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (879, NULL, 1, N'牛梅花肉火鍋片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (880, NULL, 1, N'牛嫩肩里肌火鍋片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (881, NULL, 1, N'牛肚平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (882, NULL, 1, N'牛肚(瘤胃)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (883, NULL, 1, N'牛肚切片(瘤胃)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (884, NULL, 1, N'牛肚(蜂巢胃)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (885, NULL, 1, N'牛筋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (886, NULL, 1, N'山羊帶皮羊肉塊', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (887, NULL, 1, N'山羊前腿肉片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (888, NULL, 1, N'山羊後腿肉火鍋片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (889, NULL, 1, N'綿羊肉切片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (890, NULL, 1, N'法式羊排', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (891, NULL, 1, N'去骨肩頸眼羊肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (892, NULL, 1, N'小羊腰脊肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (893, NULL, 1, N'綿羊腹脅肉火鍋片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (894, NULL, 1, N'豬下肩肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (895, NULL, 1, N'豬下肩瘦肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (896, NULL, 1, N'豬上肩肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (897, NULL, 1, N'豬肩胛肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (898, NULL, 1, N'豬肩胛排', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (899, NULL, 1, N'豬肩胛排(2021年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (900, NULL, 1, N'豬前腿外腱肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (901, NULL, 1, N'豬後腿外腱肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (902, NULL, 1, N'豬後腿肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (903, NULL, 1, N'豬後腿瘦肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (904, NULL, 1, N'豬大里肌', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (905, NULL, 1, N'豬大排', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (906, NULL, 1, N'豬小排', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (907, NULL, 1, N'僧帽肌', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (908, NULL, 1, N'豬小里肌', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (909, NULL, 1, N'豬去皮腹脇肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (910, NULL, 1, N'豬帶皮腹脇肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (911, NULL, 1, N'豬腹脇排', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (912, NULL, 1, N'豬肝連', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (913, NULL, 1, N'豬頰肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (914, NULL, 1, N'豬頰肉(2022年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (915, NULL, 1, N'豬頸肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (916, NULL, 1, N'豬絞肉平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (917, NULL, 1, N'豬絞肉(70％瘦肉率)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (918, NULL, 1, N'豬絞肉(90％瘦肉率)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (919, NULL, 1, N'豬心', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (920, NULL, 1, N'豬白管', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (921, NULL, 1, N'豬皮', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (922, NULL, 1, N'豬耳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (923, NULL, 1, N'豬舌', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (924, NULL, 1, N'豬血', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (925, NULL, 1, N'豬尾', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (926, NULL, 1, N'豬肝', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (927, NULL, 1, N'豬肚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (928, NULL, 1, N'熟豬肚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (929, NULL, 1, N'豬油渣', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (930, NULL, 1, N'豬骨湯平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (931, NULL, 1, N'豬大骨湯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (932, NULL, 1, N'豬肋骨湯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (933, NULL, 1, N'豬肩骨湯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (934, NULL, 1, N'豬軟骨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (935, NULL, 1, N'豬腎', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (936, NULL, 1, N'豬脾臟', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (937, NULL, 1, N'豬大腸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (938, NULL, 1, N'豬小腸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (939, NULL, 1, N'豬空腸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (940, NULL, 1, N'豬前腳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (941, NULL, 1, N'豬後腳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (942, NULL, 1, N'豬蹄膀', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (943, NULL, 1, N'豬腳筋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (944, NULL, 1, N'豬腦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (945, NULL, 1, N'土雞', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (946, NULL, 1, N'肉雞', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (947, NULL, 1, N'烏骨雞', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (948, NULL, 1, N'里肌肉平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (949, NULL, 1, N'里肌肉(土雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (950, NULL, 1, N'里肌肉(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (951, NULL, 1, N'帶骨去皮對切胸(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (952, NULL, 1, N'帶骨帶皮對切胸(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (953, NULL, 1, N'去皮清肉平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (954, NULL, 1, N'去皮清肉(土雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (955, NULL, 1, N'去皮清肉(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (956, NULL, 1, N'骨腿平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (957, NULL, 1, N'骨腿(土雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (958, NULL, 1, N'骨腿(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (959, NULL, 1, N'清腿平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (960, NULL, 1, N'清腿(土雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (961, NULL, 1, N'清腿(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (962, NULL, 1, N'棒棒腿平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (963, NULL, 1, N'棒棒腿(土雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (964, NULL, 1, N'棒棒腿(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (965, NULL, 1, N'雞排平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (966, NULL, 1, N'雞排(土雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (967, NULL, 1, N'雞排(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (968, NULL, 1, N'雞排(肉雞)(2021年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (969, NULL, 1, N'去皮去骨雞腿(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (970, NULL, 1, N'二節翅平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (971, NULL, 1, N'二節翅(土雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (972, NULL, 1, N'二節翅(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (973, NULL, 1, N'三節翅平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (974, NULL, 1, N'三節翅(土雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (975, NULL, 1, N'三節翅(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (976, NULL, 1, N'翅腿(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (977, NULL, 1, N'雞絞肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (978, NULL, 1, N'雞心(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (979, NULL, 1, N'雞心(肉雞)(2021年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (980, NULL, 1, N'雞尾椎', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (981, NULL, 1, N'雞肝(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (982, NULL, 1, N'雞胗(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (983, NULL, 1, N'雞胸骨湯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (984, NULL, 1, N'雞睪丸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (985, NULL, 1, N'雞腳(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (986, NULL, 1, N'雞膝軟骨(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (987, NULL, 1, N'雞皮(肉雞)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (988, NULL, 1, N'太空鴨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (989, NULL, 1, N'番鴨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (990, NULL, 1, N'太空鴨(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (991, NULL, 1, N'土番鴨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (992, NULL, 1, N'櫻桃鴨胸肉片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (993, NULL, 1, N'鴨腿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (994, NULL, 1, N'鴨血', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (995, NULL, 1, N'鴨胗', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (996, NULL, 1, N'去骨鴨掌', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (997, NULL, 1, N'鴨腸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (998, NULL, 1, N'鴨翅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (999, NULL, 1, N'鴨頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1000, NULL, 1, N'鴨舌', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1001, NULL, 1, N'鵝肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1002, NULL, 1, N'鵝胸肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1003, NULL, 1, N'鵝腿肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1004, NULL, 1, N'鵝心', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1005, NULL, 1, N'鵝肝', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1006, NULL, 1, N'鵝胗', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1007, NULL, 1, N'鵝腸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1008, NULL, 1, N'火雞肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1009, NULL, 1, N'鴕鳥菲力肉排', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1010, NULL, 1, N'鴕鳥沙朗肉排', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1011, NULL, 1, N'鴕腱肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1012, NULL, 1, N'鴕腩肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1013, NULL, 1, N'山豬肉片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1014, NULL, 1, N'虎皮蛙', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1015, NULL, 1, N'蛇肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1016, NULL, 1, N'雙髻鯊', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1017, NULL, 1, N'雙髻鯊腹肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1018, NULL, 1, N'鯊魚切片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1019, NULL, 1, N'魟魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1020, NULL, 1, N'日本鰻鱺魚片(生)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1021, NULL, 1, N'灰海鰻', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1022, NULL, 1, N'魩仔魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1023, NULL, 1, N'魩仔魚平均值(加工)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1024, NULL, 1, N'魩仔魚(加工,大)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1025, NULL, 1, N'魩仔魚(加工,小)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1026, NULL, 1, N'魩仔魚(加工)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1027, NULL, 1, N'鱙仔魚(加工)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1028, NULL, 1, N'日本銀帶鯡(加工)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1029, NULL, 1, N'日本銀帶鯡魚干(丁香魚脯)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1030, NULL, 1, N'虱目魚平均值(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1031, NULL, 1, N'虱目魚(2月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1032, NULL, 1, N'虱目魚(5月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1033, NULL, 1, N'虱目魚(8月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1034, NULL, 1, N'虱目魚(9月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1035, NULL, 1, N'虱目魚(12月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1036, NULL, 1, N'虱目魚(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1037, NULL, 1, N'虱目魚(2022年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1038, NULL, 1, N'虱目魚腹肉(虱目魚肚)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1039, NULL, 1, N'草魚切片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1040, NULL, 1, N'草魚(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1041, NULL, 1, N'鯉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1042, NULL, 1, N'鱅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1043, NULL, 1, N'鬍鯰', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1044, NULL, 1, N'斑海鯰', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1045, NULL, 1, N'長體油胡瓜魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1046, NULL, 1, N'香魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1047, NULL, 1, N'銀魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1048, NULL, 1, N'白肉鮭魚切片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1049, NULL, 1, N'紅肉鮭魚切片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1050, NULL, 1, N'大西洋鮭魚平均值(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1051, NULL, 1, N'大西洋鮭魚(台灣養殖)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1052, NULL, 1, N'大西洋鮭魚切片(中段)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1053, NULL, 1, N'大西洋鮭魚切片(尾段)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1054, NULL, 1, N'大西洋鮭魚生魚片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1055, NULL, 1, N'大西洋鮭魚腹肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1056, NULL, 1, N'麥奇鈎吻鮭(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1057, NULL, 1, N'麥奇鈎吻鮭(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1058, NULL, 1, N'姬魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1059, NULL, 1, N'印度鐮齒魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1060, NULL, 1, N'狗母魚(蛇鯔)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1061, NULL, 1, N'鮟鱇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1062, NULL, 1, N'鯔平均值(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1063, NULL, 1, N'鯔(2月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1064, NULL, 1, N'鯔(4月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1065, NULL, 1, N'鯔(8月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1066, NULL, 1, N'鯔(11月,雄魚)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1067, NULL, 1, N'鯔(11月,雌魚)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1068, NULL, 1, N'鯔(12月,雄魚)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1069, NULL, 1, N'鯔(12月,雌魚)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1070, NULL, 1, N'鯔切片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1071, NULL, 1, N'鯔(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1072, NULL, 1, N'斑鰭飛魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1073, NULL, 1, N'斑鱵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1074, NULL, 1, N'鱷形叉尾鶴鱵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1075, NULL, 1, N'金鱗魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1076, NULL, 1, N'鱗馬鞭魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1077, NULL, 1, N'黃鱔', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1078, NULL, 1, N'石狗公', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1079, NULL, 1, N'環紋簑鮋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1080, NULL, 1, N'深海鱗角魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1081, NULL, 1, N'尖嘴鱸(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1082, NULL, 1, N'尖嘴鱸(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1083, NULL, 1, N'日本花鱸平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1084, NULL, 1, N'日本花鱸(2月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1085, NULL, 1, N'日本花鱸((3月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1086, NULL, 1, N'日本花鱸((8月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1087, NULL, 1, N'日本花鱸((11月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1088, NULL, 1, N'日本花鱸((12月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1089, NULL, 1, N'日本花鱸(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1090, NULL, 1, N'白鱸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1091, NULL, 1, N'條紋狼鱸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1092, NULL, 1, N'鱖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1093, NULL, 1, N'白緣星鱠', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1094, NULL, 1, N'青星九刺鮨平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1095, NULL, 1, N'青星九刺鮨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1096, NULL, 1, N'青星九刺鮨魚片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1097, NULL, 1, N'斑帶石斑魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1098, NULL, 1, N'龍虎石斑魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1099, NULL, 1, N'斑點九刺鮨(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1100, NULL, 1, N'斑點九刺鮨(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1101, NULL, 1, N'棕點石斑魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1102, NULL, 1, N'鞍帶石斑魚片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1103, NULL, 1, N'駝背鱸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1104, NULL, 1, N'橫紋九刺鮨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1105, NULL, 1, N'大口黑鱸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1106, NULL, 1, N'日本紅目大眼鯛', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1107, NULL, 1, N'血斑異大眼鯛', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1108, NULL, 1, N'多鱗沙鮻', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1109, NULL, 1, N'日本馬頭魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1110, NULL, 1, N'白馬頭魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1111, NULL, 1, N'鬼頭刀魚片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1112, NULL, 1, N'鬼頭刀', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1113, NULL, 1, N'海鱺', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1114, NULL, 1, N'海鱺魚片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1115, NULL, 1, N'大口逆鈎鰺', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1116, NULL, 1, N'大甲鰺', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1117, NULL, 1, N'日本竹筴魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1118, NULL, 1, N'布氏鯧鰺(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1119, NULL, 1, N'布氏鯧鰺(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1120, NULL, 1, N'杜氏鰤', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1121, NULL, 1, N'長鰭鰤魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1122, NULL, 1, N'范氏副葉鰺', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1123, NULL, 1, N'泰勃圓鰺', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1124, NULL, 1, N'烏鯧', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1125, NULL, 1, N'無斑圓鰺', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1126, NULL, 1, N'藍圓鰺', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1127, NULL, 1, N'雙帶鰺', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1128, NULL, 1, N'眼眶魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1129, NULL, 1, N'斯氏長鰭烏魴', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1130, NULL, 1, N'史氏紅諧魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1131, NULL, 1, N'希氏姬鯛', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1132, NULL, 1, N'赤鰭笛鯛', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1133, NULL, 1, N'孟加拉笛鯛', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1134, NULL, 1, N'前鱗笛鯛', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1135, NULL, 1, N'馬拉巴笛鯛', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1136, NULL, 1, N'單斑笛鯛', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1137, NULL, 1, N'黃擬烏尾鮗', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1138, NULL, 1, N'葉唇笛鯛', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1139, NULL, 1, N'松鯛', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1140, NULL, 1, N'三線磯鱸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1141, NULL, 1, N'星雞魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1142, NULL, 1, N'密點少棘胡椒鯛', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1143, NULL, 1, N'金線魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1144, NULL, 1, N'青嘴龍占魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1145, NULL, 1, N'網紋龍占魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1146, NULL, 1, N'平鯛', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1147, NULL, 1, N'阿部牙鯛', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1148, NULL, 1, N'真鯛平均值(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1149, NULL, 1, N'真鯛(1月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1150, NULL, 1, N'真鯛(3月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1151, NULL, 1, N'真鯛(5月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1152, NULL, 1, N'真鯛(8月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1153, NULL, 1, N'真鯛(9月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1154, NULL, 1, N'真鯛(11月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1155, NULL, 1, N'黃鰭棘鯛', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1156, NULL, 1, N'黑棘鯛(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1157, NULL, 1, N'黑棘鯛(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1158, NULL, 1, N'多鱗四指馬鮁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1159, NULL, 1, N'大黃魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1160, NULL, 1, N'小黃魚(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1161, NULL, 1, N'小黃魚(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1162, NULL, 1, N'白姑魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1163, NULL, 1, N'眼斑擬石首魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1164, NULL, 1, N'黃姑魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1165, NULL, 1, N'黑䱛 ', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1166, NULL, 1, N'鮸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1167, NULL, 1, N'鱗鰭叫姑魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1168, NULL, 1, N'黑斑海緋鯉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1169, NULL, 1, N'斑點雞籠鯧', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1170, NULL, 1, N'花身鯻', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1171, NULL, 1, N'花尾唇指翁(翁加魚邊) ', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1172, NULL, 1, N'尼羅口孵非鯽(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1173, NULL, 1, N'尼羅口孵非鯽(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1174, NULL, 1, N'尼羅口孵非鯽(含皮)(2022年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1175, NULL, 1, N'花身副麗魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1176, NULL, 1, N'紅色吳郭魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1177, NULL, 1, N'台灣鯛魚片(生)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1178, NULL, 1, N'台灣鯛魚片(生)(2021年)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1179, NULL, 1, N'台灣鯛魚片(水煮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1180, NULL, 1, N'台灣鯛魚片(油煎)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1181, NULL, 1, N'台灣鯛魚片(烤,190℃,10分鐘)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1182, NULL, 1, N'台灣鯛魚片(烤,190℃,20分鐘)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1183, NULL, 1, N'台灣鯛魚片(烤,230℃,10分鐘)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1184, NULL, 1, N'台灣鯛魚片(烤,230℃,20分鐘)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1185, NULL, 1, N'台灣鯛魚片(清蒸)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1186, NULL, 1, N'台灣鯛魚片(微波)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1187, NULL, 1, N'台灣鯛魚湯(水煮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1188, NULL, 1, N'莫三比克口孵非鯽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1189, NULL, 1, N'薔薇項鰭魚(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1190, NULL, 1, N'薔薇項鰭魚(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1191, NULL, 1, N'藍豬齒魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1192, NULL, 1, N'福氏鸚哥魚(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1193, NULL, 1, N'橫紋鸚哥魚(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1194, NULL, 1, N'藍點鸚哥魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1195, NULL, 1, N'金錢魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1196, NULL, 1, N'褐臭肚魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1197, NULL, 1, N'杜氏刺尾鯛', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1198, NULL, 1, N'後刺尾鯛', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1199, NULL, 1, N'鋸尾鯛', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1200, NULL, 1, N'大眼金梭魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1201, NULL, 1, N'鱗網帶鰆切片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1202, NULL, 1, N'鱗網帶鰆(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1203, NULL, 1, N'白帶魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1204, NULL, 1, N'大目鮪', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1205, NULL, 1, N'正鰹', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1206, NULL, 1, N'花腹鯖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1207, NULL, 1, N'高麗馬加鰆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1208, NULL, 1, N'康氏馬加鰆切片(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1209, NULL, 1, N'康氏馬加鰆切片(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1210, NULL, 1, N'臺灣馬加鰆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1211, NULL, 1, N'鮪魚生魚片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1212, NULL, 1, N'鯖魚(生)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1213, NULL, 1, N'鯖魚(炒)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1214, NULL, 1, N'鯖魚(炸)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1215, NULL, 1, N'鯖魚(烤,150度,10分)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1216, NULL, 1, N'鯖魚(烤,150度,20分)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1217, NULL, 1, N'鯖魚(烤,150度,30分)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1218, NULL, 1, N'鯖魚(烤,180度,10分)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1219, NULL, 1, N'鯖魚(烤,210度,10分)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1220, NULL, 1, N'鯖魚(煮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1221, NULL, 1, N'鯖魚(煎)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1222, NULL, 1, N'鯖魚(蒸)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1223, NULL, 1, N'旗魚切片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1224, NULL, 1, N'旗魚腹肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1225, NULL, 1, N'刺鯧(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1226, NULL, 1, N'刺鯧(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1227, NULL, 1, N'星斑真鯧', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1228, NULL, 1, N'銀鯧平均值(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1229, NULL, 1, N'銀鯧(2月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1230, NULL, 1, N'銀鯧(3月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1231, NULL, 1, N'銀鯧(5月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1232, NULL, 1, N'銀鯧(8月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1233, NULL, 1, N'銀鯧(12月)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1234, NULL, 1, N'銀鯧(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1235, NULL, 1, N'斑鱧', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1236, NULL, 1, N'大口鰜切片(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1237, NULL, 1, N'鰈魚切片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1238, NULL, 1, N'雙線鬚鰨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1239, NULL, 1, N'單角革單棘魨(去皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1240, NULL, 1, N'單角革單棘魨(含皮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1241, NULL, 1, N'克氏兔頭魨', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1242, NULL, 1, N'翻車魨腹肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1243, NULL, 1, N'犬牙南極魚切片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1244, NULL, 1, N'低眼無齒芒魚片(芒加魚邊)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1245, NULL, 1, N'秋刀魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1246, NULL, 1, N'毛鱗魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1247, NULL, 1, N'圓鱈魚鰓肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1248, NULL, 1, N'鯛魚下巴', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1249, NULL, 1, N'鯊魚翅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1250, NULL, 1, N'魚翅唇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1251, NULL, 1, N'翻車魨魚皮', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1252, NULL, 1, N'鯊魚皮', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1253, NULL, 1, N'魚漿(旗魚)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1254, NULL, 1, N'鮸魚卵(加工)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1255, NULL, 1, N'鯔魚卵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1256, NULL, 1, N'鰆魚卵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1257, NULL, 1, N'鰹魚卵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1258, NULL, 1, N'鯔魚精囊', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1259, NULL, 1, N'鮟鱇魚肝', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1260, NULL, 1, N'旗魚肚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1261, NULL, 1, N'鮪魚肚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1262, NULL, 1, N'小魚干', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1263, NULL, 1, N'扁魚干', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1264, NULL, 1, N'柴魚片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1265, NULL, 1, N'羅氏沼蝦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1266, NULL, 1, N'北方長額蝦(加工)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1267, NULL, 1, N'東方異腕蝦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1268, NULL, 1, N'胭脂蝦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1269, NULL, 1, N'日本玻璃蝦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1270, NULL, 1, N'相模後海螯蝦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1271, NULL, 1, N'中國對蝦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1272, NULL, 1, N'日本對蝦平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1273, NULL, 1, N'日本對蝦(大)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1274, NULL, 1, N'日本對蝦(小)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1275, NULL, 1, N'白對蝦平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1276, NULL, 1, N'白對蝦(大)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1277, NULL, 1, N'白對蝦(小)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1278, NULL, 1, N'白對蝦(小)(2022年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1279, NULL, 1, N'哈氏彷對蝦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1280, NULL, 1, N'草對蝦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1281, NULL, 1, N'藍對蝦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1282, NULL, 1, N'鬚赤蝦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1283, NULL, 1, N'大管鞭蝦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1284, NULL, 1, N'隆脊管鞭蝦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1285, NULL, 1, N'螳螂蝦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1286, NULL, 1, N'日本龍蝦', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1287, NULL, 1, N'正櫻蝦(生)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1288, NULL, 1, N'正櫻蝦(熟)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1289, NULL, 1, N'正櫻蝦乾', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1290, NULL, 1, N'大頭蝦仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1291, NULL, 1, N'明蝦仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1292, NULL, 1, N'紅蝦仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1293, NULL, 1, N'海鱸蝦仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1294, NULL, 1, N'草蝦仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1295, NULL, 1, N'鳳尾蝦仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1296, NULL, 1, N'鬚赤蝦仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1297, NULL, 1, N'蝦皮', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1298, NULL, 1, N'蝦米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1299, NULL, 1, N'金鉤蝦乾', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1300, NULL, 1, N'紅蟳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1301, NULL, 1, N'蛙形蟹', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1302, NULL, 1, N'蟹腳肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1303, NULL, 1, N'竹蟶(冷凍)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1304, NULL, 1, N'真牡蠣平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1305, NULL, 1, N'真牡蠣', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1306, NULL, 1, N'帶殼真牡蠣(生蠔)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1307, NULL, 1, N'黑齒牡蠣', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1308, NULL, 1, N'蝦夷海扇蛤', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1309, NULL, 1, N'綠殼菜蛤', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1310, NULL, 1, N'綠殼菜蛤干', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1311, NULL, 1, N'西施舌', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1312, NULL, 1, N'台灣蜆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1313, NULL, 1, N'大文蛤', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1314, NULL, 1, N'文蛤', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1315, NULL, 1, N'波紋橫簾蛤 ', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1316, NULL, 1, N'菲律賓簾蛤', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1317, NULL, 1, N'環文蛤', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1318, NULL, 1, N'干貝(冷凍)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1319, NULL, 1, N'干貝(乾)平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1320, NULL, 1, N'干貝(乾)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1321, NULL, 1, N'珠貝(乾)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1322, NULL, 1, N'牡蠣干', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1323, NULL, 1, N'真烏賊平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1324, NULL, 1, N'真烏賊(大)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1325, NULL, 1, N'真烏賊(小)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1326, NULL, 1, N'章魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1327, NULL, 1, N'阿根廷魷', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1328, NULL, 1, N'泡魷魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1329, NULL, 1, N'台灣鎖管', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1330, NULL, 1, N'尖鎖管 ', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1331, NULL, 1, N'軟翅仔', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1332, NULL, 1, N'香螺 ', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1333, NULL, 1, N'象牙鳳螺', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1334, NULL, 1, N'泥螺', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1335, NULL, 1, N'雪螺', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1336, NULL, 1, N'九孔螺', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1337, NULL, 1, N'鮑魚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1338, NULL, 1, N'蝸牛肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1339, NULL, 1, N'烏賊精囊', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1340, NULL, 1, N'小卷干', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1341, NULL, 1, N'白海參', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1342, NULL, 1, N'仿刺參', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1343, NULL, 1, N'南美刺參', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1344, NULL, 1, N'紅海參', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1345, NULL, 1, N'黑烏參', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1346, NULL, 1, N'海蜇皮', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1347, NULL, 1, N'雞蛋平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1348, NULL, 1, N'雞蛋(白殼)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1349, NULL, 1, N'雞蛋(黃殼)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1350, NULL, 1, N'土雞蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1351, NULL, 1, N'土雞蛋(2022年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1352, NULL, 1, N'烏骨雞蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1353, NULL, 1, N'雞蛋(高DHA)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1354, NULL, 1, N'雞蛋(高次亞麻油酸)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1355, NULL, 1, N'雞蛋(高亞麻油酸)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1356, NULL, 1, N'初卵雞蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1357, NULL, 1, N'雞蛋(高維生素A&E)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1358, NULL, 1, N'雞蛋(高維生素E)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1359, NULL, 1, N'雞蛋白平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1360, NULL, 1, N'雞蛋白(白殼)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1361, NULL, 1, N'雞蛋白(黃殼)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1362, NULL, 1, N'烏骨雞蛋白', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1363, NULL, 1, N'雞蛋黃平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1364, NULL, 1, N'雞蛋黃(白殼)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1365, NULL, 1, N'雞蛋黃(黃殼)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1366, NULL, 1, N'烏骨雞蛋黃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1367, NULL, 1, N'雞蛋黃(高維生素E)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1368, NULL, 1, N'溫泉蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1369, NULL, 1, N'雞水煮蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1370, NULL, 1, N'雞水煮蛋白', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1371, NULL, 1, N'雞水煮蛋黃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1372, NULL, 1, N'茶葉蛋平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1373, NULL, 1, N'茶葉蛋(市售)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1374, NULL, 1, N'茶葉蛋(浸泡隔夜)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1375, NULL, 1, N'茶葉蛋白(浸泡隔夜)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1376, NULL, 1, N'茶葉蛋黃(浸泡隔夜)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1377, NULL, 1, N'雞皮蛋平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1378, NULL, 1, N'雞皮蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1379, NULL, 1, N'土雞皮蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1380, NULL, 1, N'滷蛋平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1381, NULL, 1, N'雞滷蛋(市售)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1382, NULL, 1, N'雞滷蛋(現煮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1383, NULL, 1, N'雞滷蛋(浸泡隔夜)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1384, NULL, 1, N'滷蛋白平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1385, NULL, 1, N'雞滷蛋白(現煮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1386, NULL, 1, N'雞滷蛋白(浸泡隔夜)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1387, NULL, 1, N'滷蛋黃平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1388, NULL, 1, N'雞滷蛋黃(現煮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1389, NULL, 1, N'雞滷蛋黃(浸泡隔夜)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1390, NULL, 1, N'雞鐵蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1391, NULL, 1, N'雞水波蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1392, NULL, 1, N'荷包蛋(不加油)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1393, NULL, 1, N'荷包蛋(加油1小匙)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1394, NULL, 1, N'煎蛋(不加油)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1395, NULL, 1, N'炒蛋(加油3大匙)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1396, NULL, 1, N'蒸蛋平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1397, NULL, 1, N'蒸蛋(市售)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1398, NULL, 1, N'蒸蛋(微波爐)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1399, NULL, 1, N'蒸蛋(電鍋)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1400, NULL, 1, N'鴨蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1401, NULL, 1, N'紅面番鴨蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1402, NULL, 1, N'鴨蛋白', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1403, NULL, 1, N'鴨蛋黃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1404, NULL, 1, N'鴨皮蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1405, NULL, 1, N'鴨鹹蛋平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1406, NULL, 1, N'鴨生鹹蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1407, NULL, 1, N'鴨熟鹹蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1408, NULL, 1, N'鴨熟鹹蛋(薄鹽)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1409, NULL, 1, N'鴨鹹蛋黃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1410, NULL, 1, N'鵪鶉蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1411, NULL, 1, N'鵪鶉水煮蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1412, NULL, 1, N'鵪鶉皮蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1413, NULL, 1, N'鵪鶉鹹蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1414, NULL, 1, N'鵪鶉滷蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1415, NULL, 1, N'鵪鶉鐵蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1416, NULL, 1, N'鴿蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1417, NULL, 1, N'鵝蛋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1418, NULL, 4, N'高脂鮮乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1419, NULL, 4, N'全脂鮮乳平均值', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1420, NULL, 4, N'全脂鮮乳(1月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1421, NULL, 4, N'全脂鮮乳(4月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1422, NULL, 4, N'全脂鮮乳(6月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1423, NULL, 4, N'全脂鮮乳(9月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1424, NULL, 4, N'全脂鮮乳(10月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1425, NULL, 4, N'全脂鮮乳(11月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1426, NULL, 4, N'全脂鮮乳(12月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1427, NULL, 4, N'全脂鮮乳(7月取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1428, NULL, 4, N'中脂鮮乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1429, NULL, 4, N'低脂鮮乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1430, NULL, 4, N'高脂強化鮮乳(鈣強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1431, NULL, 4, N'高脂強化鮮乳(寡醣強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1432, NULL, 4, N'中脂強化鮮乳(脂肪酸調整)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1433, NULL, 4, N'低脂強化鮮乳(維生素E強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1434, NULL, 4, N'低脂強化鮮乳(寡醣強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1435, NULL, 4, N'脫脂強化鮮乳(鈣強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1436, NULL, 4, N'脫脂強化鮮乳(寡醣強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1437, NULL, 4, N'脫脂強化鮮乳(鐵強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1438, NULL, 4, N'中脂調味乳(巧克力)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1439, NULL, 4, N'中脂調味乳(多穀類)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1440, NULL, 4, N'中脂調味乳(果汁)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1441, NULL, 4, N'中脂調味乳(鈣強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1442, NULL, 4, N'中脂調味乳(維生素強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1443, NULL, 4, N'中脂調味乳(纖維&維生素E強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1444, NULL, 4, N'低脂調味乳(木瓜)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1445, NULL, 4, N'高脂保久乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1446, NULL, 4, N'全脂保久乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1447, NULL, 4, N'中脂保久乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1448, NULL, 4, N'低脂強化保久乳(寡糖強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1449, NULL, 4, N'中脂調味保久乳(巧克力)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1450, NULL, 4, N'中脂調味保久乳(布丁)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1451, NULL, 4, N'全脂奶粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1452, NULL, 4, N'部份脫脂奶粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1453, NULL, 4, N'部份脫脂奶粉(即溶)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1454, NULL, 4, N'部份脫脂低乳糖奶粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1455, NULL, 4, N'脫脂奶粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1456, NULL, 4, N'脫脂奶粉(即溶)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1457, NULL, 4, N'全脂強化奶粉(纖維強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1458, NULL, 4, N'部份脫脂強化奶粉(鈣強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1459, NULL, 4, N'部份脫脂強化奶粉(纖維&DHA強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1460, NULL, 4, N'部份脫脂強化奶粉(纖維&鈣強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1461, NULL, 4, N'部份脫脂強化奶粉(脂肪酸調整)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1462, NULL, 4, N'脫脂強化奶粉(抗氧化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1463, NULL, 4, N'脫脂強化奶粉(鈣&維生素A強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1464, NULL, 4, N'脫脂強化奶粉(鈣&維生素C,E強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1465, NULL, 4, N'脫脂強化奶粉(鈣&鐵強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1466, NULL, 4, N'部份脫脂調味奶粉(巧克力)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1467, NULL, 4, N'部份脫脂調味奶粉(果汁)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1468, NULL, 4, N'脫脂稀釋發酵乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1469, NULL, 4, N'脫脂稀釋發酵乳(鈣強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1470, NULL, 4, N'全脂濃稠發酵乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1471, NULL, 4, N'中脂濃稠發酵乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1472, NULL, 4, N'中脂濃稠發酵乳(無糖&纖維強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1473, NULL, 4, N'中脂濃稠發酵乳(草莓)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1474, NULL, 4, N'低脂濃稠發酵乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1475, NULL, 4, N'脫脂濃稠發酵乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1476, NULL, 4, N'脫脂濃稠發酵乳(低熱量)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1477, NULL, 4, N'脫脂濃稠發酵乳(草莓)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1478, NULL, 4, N'脫脂濃稠發酵乳(啤酒酵母)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1479, NULL, 4, N'高脂凝態發酵乳(纖維強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1480, NULL, 4, N'全脂凝態發酵乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1481, NULL, 4, N'中脂凝態發酵乳(草莓)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1482, NULL, 4, N'中脂凝態發酵乳(蘆薈)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1483, NULL, 4, N'脫脂凝態發酵乳(纖維強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1484, NULL, 4, N'脫脂保久稀釋發酵乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1485, NULL, 4, N'脫脂保久濃稠發酵乳(草莓&蘋果)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1486, NULL, 4, N'淡煉乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1487, NULL, 4, N'加糖部份脫脂煉乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1488, NULL, 4, N'切片乾酪', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1489, NULL, 4, N'切片乾酪(低脂)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1490, NULL, 4, N'刨絲乾酪', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1491, NULL, 4, N'乾酪粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1492, NULL, 4, N'鮮奶可可', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1493, NULL, 4, N'木瓜牛奶', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1494, NULL, 4, N'高脂鮮羊乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1495, NULL, 4, N'中脂鮮羊乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1496, NULL, 4, N'保久羊乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1497, NULL, 4, N'中脂調味保久羊乳(巧克力)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1498, NULL, 4, N'中脂調味保久羊乳(果汁)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1499, NULL, 4, N'全脂羊奶粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1500, NULL, 4, N'全脂羊奶粉(即溶)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1501, NULL, 6, N'牛油(未精煉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1502, NULL, 6, N'牛油(精煉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1503, NULL, 6, N'豬油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1504, NULL, 6, N'豬油(2022年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1505, NULL, 6, N'高油酸豬油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1506, NULL, 6, N'雞油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1507, NULL, 6, N'奶油(固態,不加鹽)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1508, NULL, 6, N'奶油(固態,加鹽)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1509, NULL, 6, N'奶油(液態)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1510, NULL, 6, N'人造奶油(維生素強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1511, NULL, 6, N'人造奶油(2021年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1512, NULL, 6, N'中脂人造奶油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1513, NULL, 6, N'人造奶油(低熱量)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1514, NULL, 6, N'大豆油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1515, NULL, 6, N'大豆油(卵磷脂強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1516, NULL, 6, N'大豆油(多種維生素強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1517, NULL, 6, N'玉米油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1518, NULL, 6, N'米油(秈米)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1519, NULL, 6, N'米油(粳米)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1520, NULL, 6, N'亞麻仁油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1521, NULL, 6, N'白芝麻油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1522, NULL, 6, N'黑芝麻油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1523, NULL, 6, N'調合芝麻油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1524, NULL, 6, N'花生油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1525, NULL, 6, N'調合花生油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1526, NULL, 6, N'油菜籽油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1527, NULL, 6, N'芥花油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1528, NULL, 6, N'南瓜籽油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1529, NULL, 6, N'紅花籽油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1530, NULL, 6, N'高油酸紅花籽油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1531, NULL, 6, N'核桃油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1532, NULL, 6, N'油茶油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1533, NULL, 6, N'熟油茶油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1534, NULL, 6, N'高油酸棕櫚油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1535, NULL, 6, N'椰子油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1536, NULL, 6, N'葵花籽油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1537, NULL, 6, N'葵花籽油(多種維生素強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1538, NULL, 6, N'高油酸葵花籽油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1539, NULL, 6, N'葡萄籽油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1540, NULL, 6, N'橄欖油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1541, NULL, 6, N'烤酥油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1542, NULL, 6, N'調合植物油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1543, NULL, 6, N'中鏈脂肪酸油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1544, NULL, 2, N'方糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1545, NULL, 2, N'冰糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1546, NULL, 2, N'紅砂糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1547, NULL, 2, N'黑砂糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1548, NULL, 2, N'麥芽糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1549, NULL, 2, N'果糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1550, NULL, 2, N'果寡糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1551, NULL, 2, N'楓糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1552, NULL, 2, N'蜂蜜(冬蜜)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1553, NULL, 2, N'蜂蜜(春蜜)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1554, NULL, 2, N'黑糖蜜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1555, NULL, 2, N'冬瓜糖磚', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1556, NULL, 8, N'西瓜汁(非原汁)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1557, NULL, 8, N'芭樂汁(非原汁)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1558, NULL, 8, N'柳橙汁(非原汁)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1559, NULL, 8, N'柳橙汁(100%)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1560, NULL, 8, N'烏梅汁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1561, NULL, 8, N'黑棗茶', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1562, NULL, 8, N'楊桃汁(非原汁)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1563, NULL, 8, N'葡萄柚汁(非原汁)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1564, NULL, 8, N'鳳梨汁(非原汁)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1565, NULL, 8, N'蔓越莓汁(非原汁)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1566, NULL, 8, N'檸檬汁(非原汁)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1567, NULL, 8, N'蘋果汁(非原汁)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1568, NULL, 8, N'蘋果汁(100%)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1569, NULL, 8, N'蕃茄汁(非原汁)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1570, NULL, 8, N'仙草蜜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1571, NULL, 8, N'薑母茶', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1572, NULL, 8, N'蘆薈露飲料', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1573, NULL, 8, N'黑豆茶', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1574, NULL, 8, N'龜苓茶', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1575, NULL, 8, N'麥茶', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1576, NULL, 8, N'黑麥汁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1577, NULL, 8, N'果汁醋飲料(綜合)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1578, NULL, 8, N'可樂', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1579, NULL, 8, N'可樂(低熱量)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1580, NULL, 8, N'沙士', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1581, NULL, 8, N'加鹽沙士', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1582, NULL, 8, N'沙士(低糖)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1583, NULL, 8, N'汽水(綜合口味)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1584, NULL, 8, N'汽水(維生素強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1585, NULL, 8, N'美式咖啡(無糖)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1586, NULL, 8, N'無糖咖啡飲料', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1587, NULL, 8, N'拿鐵咖啡(無糖)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1588, NULL, 8, N'咖啡(三合一)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1589, NULL, 8, N'紅茶茶湯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1590, NULL, 8, N'紅茶(大麥)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1591, NULL, 8, N'紅茶(蘋果)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1592, NULL, 8, N'烏龍茶茶湯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1593, NULL, 8, N'烏龍茶', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1594, NULL, 8, N'烏龍茶(去冰,微糖)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1595, NULL, 8, N'烏龍茶(去冰,半糖)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1596, NULL, 8, N'烏龍茶(去冰,全糖)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1597, NULL, 8, N'綠茶茶湯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1598, NULL, 8, N'綠茶', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1599, NULL, 8, N'鮮奶茶(無糖)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1600, NULL, 8, N'奶茶(三合一)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1601, NULL, 8, N'烏龍奶茶(去冰,微糖)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1602, NULL, 8, N'烏龍奶茶(去冰,半糖)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1603, NULL, 8, N'烏龍奶茶(去冰,全糖)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1604, NULL, 8, N'珍珠奶茶(去冰,微糖)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1605, NULL, 8, N'珍珠奶茶(去冰,半糖)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1606, NULL, 8, N'珍珠奶茶(去冰,全糖)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1607, NULL, 8, N'奶茶沖泡包(三合一)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1608, NULL, 8, N'茉莉花茶湯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1609, NULL, 8, N'茉莉花茶', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1610, NULL, 8, N'菊花茶', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1611, NULL, 8, N'多多綠茶(全糖)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1612, NULL, 8, N'冬瓜茶', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1613, NULL, 8, N'乳酸飲料', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1614, NULL, 8, N'維生素強化飲料(胡蘿蔔素)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1615, NULL, 8, N'維生素強化飲料(綜合)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1616, NULL, 8, N'維生素強化飲料(維生素C)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1617, NULL, 8, N'運動飲料', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1618, NULL, 8, N'米醋飲料', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1619, NULL, 8, N'即溶咖啡粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1620, NULL, 8, N'咖啡沖泡包(二合一)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1621, NULL, 8, N'咖啡沖泡包(三合一)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1622, NULL, 8, N'紅茶沖泡包(檸檬)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1623, NULL, 8, N'薑茶沖泡包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1624, NULL, 8, N'抹茶粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1625, NULL, 8, N'可可粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1626, NULL, 8, N'小麥草粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1627, NULL, 8, N'椰奶', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1628, NULL, 9, N'八角', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1629, NULL, 9, N'小茴香粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1630, NULL, 9, N'山葵粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1631, NULL, 9, N'五香粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1632, NULL, 9, N'甘草粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1633, NULL, 9, N'肉桂粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1634, NULL, 9, N'西洋芹菜片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1635, NULL, 9, N'花椒粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1636, NULL, 9, N'洋香菜片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1637, NULL, 9, N'洋蔥粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1638, NULL, 9, N'白胡椒粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1639, NULL, 9, N'紅胡椒粒', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1640, NULL, 9, N'黑胡椒粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1641, NULL, 9, N'綠胡椒粒', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1642, NULL, 9, N'迷迭香粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1643, NULL, 9, N'荳蔻粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1644, NULL, 9, N'蒜粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1645, NULL, 9, N'辣椒粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1646, NULL, 9, N'薑黃粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1647, NULL, 9, N'薑粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1648, NULL, 9, N'羅勒片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1649, NULL, 9, N'花椒粒', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1650, NULL, 9, N'七味唐辛子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1651, NULL, 9, N'沙茶粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1652, NULL, 9, N'豆酥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1653, NULL, 9, N'咖哩粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1654, NULL, 9, N'咖哩塊', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1655, NULL, 9, N'油蔥酥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1656, NULL, 9, N'梅子粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1657, NULL, 9, N'椰子粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1658, NULL, 9, N'蒜頭酥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1659, NULL, 9, N'糖粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1660, NULL, 9, N'椰漿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1661, NULL, 9, N'黃耆水', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1662, NULL, 9, N'黃耆片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1663, NULL, 9, N'陳皮', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1664, NULL, 9, N'山楂', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1665, NULL, 9, N'岩鹽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1666, NULL, 9, N'低鈉鹽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1667, NULL, 9, N'味精', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1668, NULL, 9, N'高鮮味精', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1669, NULL, 9, N'鮮雞精', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1670, NULL, 9, N'鰹魚粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1671, NULL, 9, N'高湯塊(排骨)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1672, NULL, 9, N'高湯塊(雞肉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1673, NULL, 9, N'高湯(豬大骨)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1674, NULL, 9, N'低脂高湯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1675, NULL, 9, N'素食高湯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1676, NULL, 9, N'米醋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1677, NULL, 9, N'糯米醋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1678, NULL, 9, N'高梁醋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1679, NULL, 9, N'薏仁醋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1680, NULL, 9, N'紅醋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1681, NULL, 9, N'香醋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1682, NULL, 9, N'烏醋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1683, NULL, 9, N'素食烏醋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1684, NULL, 9, N'壽司醋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1685, NULL, 9, N'醬油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1686, NULL, 9, N'薏仁醬油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1687, NULL, 9, N'黑豆醬油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1688, NULL, 9, N'淡色醬油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1689, NULL, 9, N'薄鹽醬油(低鈉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1690, NULL, 9, N'薄鹽醬油(低鈉高鉀)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1691, NULL, 9, N'醬油膏', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1692, NULL, 9, N'黑豆油膏', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1693, NULL, 9, N'薄鹽黑豆醬油膏', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1694, NULL, 9, N'味醂', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1695, NULL, 9, N'鮮味露', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1696, NULL, 9, N'蠔油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1697, NULL, 9, N'魚露', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1698, NULL, 9, N'紅辣椒油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1699, NULL, 9, N'香油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1700, NULL, 9, N'蝦油', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1701, NULL, 9, N'干貝醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1702, NULL, 9, N'牛肉醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1703, NULL, 9, N'肉燥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1704, NULL, 9, N'素肉燥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1705, NULL, 9, N'義式乳酪醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1706, NULL, 9, N'炸醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1707, NULL, 9, N'素食炸醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1708, NULL, 9, N'海苔醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1709, NULL, 9, N'麻醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1710, NULL, 9, N'速食乾麵麻醬包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1711, NULL, 9, N'白醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1712, NULL, 9, N'青醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1713, NULL, 9, N'蕃茄義大利麵醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1714, NULL, 9, N'五味醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1715, NULL, 9, N'牛排醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1716, NULL, 9, N'羊肉爐醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1717, NULL, 9, N'沙茶醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1718, NULL, 9, N'素沙茶醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1719, NULL, 9, N'黃芥茉醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1720, NULL, 9, N'山葵醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1721, NULL, 9, N'金桔醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1722, NULL, 9, N'海鮮醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1723, NULL, 9, N'烤肉醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1724, NULL, 9, N'排骨醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1725, NULL, 9, N'甜辣醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1726, NULL, 9, N'甜麵醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1727, NULL, 9, N'朝鮮醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1728, NULL, 9, N'黑胡椒醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1729, NULL, 9, N'日式照燒醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1730, NULL, 9, N'蒜蓉醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1731, NULL, 9, N'辣蒜蓉醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1732, NULL, 9, N'辣椒醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1733, NULL, 9, N'蔥醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1734, NULL, 9, N'糖醋醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1735, NULL, 9, N'蕃茄醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1736, NULL, 9, N'薑蓉醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1737, NULL, 9, N'蘑菇醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1738, NULL, 9, N'米豆醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1739, NULL, 9, N'蒜味豆豉醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1740, NULL, 9, N'豆酥醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1741, NULL, 9, N'豆瓣醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1742, NULL, 9, N'辣豆瓣醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1743, NULL, 9, N'紅麴醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1744, NULL, 9, N'韭花醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1745, NULL, 9, N'香椿醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1746, NULL, 9, N'麻婆醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1747, NULL, 9, N'蝦醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1748, NULL, 9, N'沙拉醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1749, NULL, 9, N'沙拉醬(2021年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1750, NULL, 9, N'無蛋沙拉醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1751, NULL, 9, N'無蛋沙拉醬(2021年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1752, NULL, 9, N'千島沙拉醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1753, NULL, 9, N'和風沙拉醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1754, NULL, 9, N'凱撒沙拉醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1755, NULL, 9, N'味噌', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1756, NULL, 9, N'法式奶酥醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1757, NULL, 9, N'巧克力醬(液體)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1758, NULL, 9, N'草莓果醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1759, NULL, 9, N'葡萄果醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1760, NULL, 9, N'柚子果醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1761, NULL, 9, N'桑葚果醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1762, NULL, 9, N'白芝麻麵包醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1763, NULL, 9, N'黑芝麻麵包醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1764, NULL, 9, N'花生醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1765, NULL, 9, N'洋蔥麵包醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1766, NULL, 9, N'法式香蒜醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1767, NULL, 9, N'無糖黑芝麻醬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1768, NULL, 9, N'液體奶精', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1769, NULL, 9, N'液體奶精(2021年)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1770, NULL, 9, N'奶精粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1771, NULL, 9, N'奶精粉(2021年)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1772, NULL, 9, N'奶精粉(低脂)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1773, NULL, 9, N'炸排粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1774, NULL, 9, N'炸雞粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1775, NULL, 9, N'蒸肉粉(五香)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1776, NULL, 9, N'熱狗粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1777, NULL, 9, N'麵包粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1778, NULL, 9, N'酵母粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1779, NULL, 2, N'冷藏寧波年糕', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1780, NULL, 2, N'冷藏甜年糕', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1781, NULL, 2, N'冷藏廣式芋頭粿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1782, NULL, 2, N'冷藏廣式蘿蔔糕', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1783, NULL, 2, N'包餡甜麻糬(紅豆)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1784, NULL, 2, N'鹹麻糬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1785, NULL, 2, N'芋仔餅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1786, NULL, 2, N'月餅(棗泥)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1787, NULL, 2, N'綠豆凸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1788, NULL, 2, N'蕃薯餅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1789, NULL, 2, N'車輪餅(紅豆)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1790, NULL, 2, N'車輪餅(菜脯)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1791, NULL, 2, N'太陽餅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1792, NULL, 2, N'牛舌餅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1793, NULL, 2, N'蛋黃芋頭酥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1794, NULL, 2, N'蛋黃酥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1795, NULL, 2, N'鳳梨酥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1796, NULL, 2, N'蘿蔔酥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1797, NULL, 2, N'鳳眼糕', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1798, NULL, 2, N'米粩', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1799, NULL, 2, N'可頌', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1800, NULL, 2, N'泡芙(巧克力)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1801, NULL, 2, N'蛋塔', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1802, NULL, 2, N'蛋塔(葡式)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1803, NULL, 2, N'鬆餅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1804, NULL, 2, N'冷凍馬拉糕', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1805, NULL, 2, N'銅鑼燒', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1806, NULL, 2, N'冷凍馬蹄條', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1807, NULL, 2, N'乳酪蛋糕', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1808, NULL, 2, N'海綿蛋糕(圓形)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1809, NULL, 2, N'提拉米蘇(圓形)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1810, NULL, 2, N'蜂蜜蛋糕(原味)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1811, NULL, 2, N'蜂蜜蛋糕(巧克力)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1812, NULL, 2, N'蜂蜜蛋糕(起司)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1813, NULL, 2, N'黑森林蛋糕', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1814, NULL, 2, N'土司', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1815, NULL, 2, N'土司(含全穀粉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1816, NULL, 2, N'紅豆土司', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1817, NULL, 2, N'奶酥麵包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1818, NULL, 2, N'肉鬆麵包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1819, NULL, 2, N'蜜糖甜甜圈(波/摩堤)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1820, NULL, 2, N'糖粒甜甜圈(油炸)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1821, NULL, 2, N'菠蘿麵包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1822, NULL, 2, N'葡萄乾奶酥麵包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1823, NULL, 2, N'漢堡包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1824, NULL, 2, N'餐包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1825, NULL, 2, N'雙胞胎麵包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1826, NULL, 2, N'仙草凍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1827, NULL, 2, N'仙草凍(2020取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1828, NULL, 2, N'咖啡凍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1829, NULL, 2, N'果凍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1830, NULL, 2, N'原味愛玉凍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1831, NULL, 2, N'檸檬愛玉凍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1832, NULL, 2, N'粉粿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1833, NULL, 2, N'鮮奶布丁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1834, NULL, 2, N'烤布丁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1835, NULL, 2, N'黃布丁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1836, NULL, 2, N'豆花(花生)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1837, NULL, 2, N'傳統豆花(未加糖)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1838, NULL, 2, N'羊羹', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1839, NULL, 2, N'巧克力冰淇淋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1840, NULL, 2, N'香草冰淇淋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1841, NULL, 2, N'紅豆牛奶冰棒', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1842, NULL, 2, N'花生仁湯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1843, NULL, 2, N'方塊酥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1844, NULL, 2, N'夾心餅乾(草莓)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1845, NULL, 2, N'捲心酥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1846, NULL, 2, N'蛋捲(芝麻)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1847, NULL, 2, N'煎餅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1848, NULL, 2, N'營養口糧', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1849, NULL, 2, N'蘇打餅乾(蔬菜)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1850, NULL, 2, N'玉米餅乾(原味)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1851, NULL, 2, N'洋芋片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1852, NULL, 2, N'魚酥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1853, NULL, 2, N'零食泡麵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1854, NULL, 2, N'雪餅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1855, NULL, 2, N'沙其馬', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1856, NULL, 2, N'牛奶巧克力', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1857, NULL, 2, N'花生牛奶巧克力', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1858, NULL, 2, N'榛果牛奶巧克力', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1859, NULL, 2, N'糖衣牛奶巧克力', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1860, NULL, 2, N'白巧克力風味糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1861, NULL, 2, N'黑巧克力(85%)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1862, NULL, 2, N'白芝麻糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1863, NULL, 2, N'黑芝麻糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1864, NULL, 2, N'花生糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1865, NULL, 2, N'花生貢糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1866, NULL, 2, N'牛軋糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1867, NULL, 2, N'核棗糕', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1868, NULL, 2, N'水果軟糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1869, NULL, 2, N'水果QQ軟糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1870, NULL, 2, N'牛奶軟糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1871, NULL, 2, N'巧克力牛奶軟糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1872, NULL, 2, N'太妃糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1873, NULL, 2, N'蓮藕糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1874, NULL, 2, N'枇杷糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1875, NULL, 2, N'苦茶糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1876, NULL, 2, N'薑糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1877, NULL, 2, N'巧克力夾心糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1878, NULL, 2, N'維生素C口含錠(檸檬)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1879, NULL, 2, N'酵母菌咀嚼錠', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1880, NULL, 2, N'乳酸球', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1881, NULL, 2, N'羊乳片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1882, NULL, 2, N'紅豆球', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1883, NULL, 2, N'綠豆球', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1884, NULL, 2, N'棉花糖', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1885, NULL, 2, N'甘薯蜜餞', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1886, NULL, 2, N'芒果青', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1887, NULL, 2, N'芭樂果乾', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1888, NULL, 2, N'鳳梨果乾', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1889, NULL, 2, N'檸檬果乾', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1890, NULL, 2, N'豆干丁(五香)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1891, NULL, 2, N'豆干片(沙茶)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1892, NULL, 2, N'布丁粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1893, NULL, 2, N'冰淇淋粉(香草)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1894, NULL, 2, N'起酥片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1895, NULL, 7, N'廣東粥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1896, NULL, 7, N'冷凍火腿炒飯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1897, NULL, 7, N'冷凍蝦仁炒飯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1898, NULL, 7, N'三角飯糰(肉鬆)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1899, NULL, 7, N'糯米飯糰', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1900, NULL, 7, N'壽司(豆皮壽司)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1901, NULL, 7, N'肉粽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1902, NULL, 7, N'鹼粽', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1903, NULL, 7, N'冷凍筒仔米糕', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1904, NULL, 7, N'筒仔米糕', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1905, NULL, 7, N'豬血糕', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1906, NULL, 7, N'鴨血糕', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1907, NULL, 7, N'肉圓', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1908, NULL, 7, N'清蒸蝦仁肉圓', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1909, NULL, 7, N'甜酒釀', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1910, NULL, 7, N'紫米酒釀', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1911, NULL, 7, N'冷凍芝麻湯圓', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1912, NULL, 7, N'冷凍花生湯圓', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1913, NULL, 7, N'冷凍豬肉湯圓', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1914, NULL, 7, N'免煮飯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1915, NULL, 7, N'埔里米粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1916, NULL, 7, N'細米粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1917, NULL, 7, N'濁水米粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1918, NULL, 7, N'米粄條', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1919, NULL, 7, N'米苔目', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1920, NULL, 7, N'粿仔條', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1921, NULL, 7, N'米漿(散裝)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1922, NULL, 7, N'保久米漿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1923, NULL, 7, N'糙米漿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1924, NULL, 2, N'糙秈米漿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1925, NULL, 7, N'糯米漿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1926, NULL, 7, N'黑糯米漿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1927, NULL, 7, N'米漿粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1928, NULL, 7, N'燕麥奶', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1929, NULL, 7, N'玉米粒罐頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1930, NULL, 7, N'玉米醬罐頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1931, NULL, 7, N'麵筋(未調味)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1932, NULL, 7, N'麵腸(未調味)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1933, NULL, 7, N'水餃皮', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1934, NULL, 7, N'春捲皮', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1935, NULL, 7, N'餛飩皮', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1936, NULL, 7, N'長麵線', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1937, NULL, 7, N'紅麵線', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1938, NULL, 7, N'麵線', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1939, NULL, 7, N'雞絲麵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1940, NULL, 7, N'乾麵條', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1941, NULL, 7, N'油麵條', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1942, NULL, 7, N'紅蘿蔔麵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1943, NULL, 7, N'通心麵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1944, NULL, 7, N'菠菜麵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1945, NULL, 7, N'鍋燒意麵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1946, NULL, 7, N'雞蛋麵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1947, NULL, 7, N'刀削麵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1948, NULL, 7, N'拉麵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1949, NULL, 7, N'意麵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1950, NULL, 7, N'衛生油麵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1951, NULL, 7, N'金門黃麵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1952, NULL, 7, N'冷凍烏龍麵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1953, NULL, 7, N'鍋燒麵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1954, NULL, 7, N'蕎麥麵(乾)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1955, NULL, 7, N'蕎麥麵(濕)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1956, NULL, 7, N'炒板條', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1957, NULL, 7, N'泡麵(牛肉口味)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1958, NULL, 7, N'泡麵(鮮蝦口味)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1959, NULL, 7, N'擔仔麵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1960, NULL, 7, N'冷凍牛肉水餃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1961, NULL, 7, N'冷凍豬肉水餃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1962, NULL, 7, N'冷凍豬肉韭菜水餃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1963, NULL, 7, N'冷凍豬肉蟹黃水餃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1964, NULL, 7, N'冷凍香菇雞肉水餃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1965, NULL, 7, N'冷凍素食水餃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1966, NULL, 7, N'冷凍鮪魚水餃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1967, NULL, 7, N'冷凍豬肉熟水餃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1968, NULL, 7, N'冷凍素食熟水餃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1969, NULL, 7, N'冷凍冬菜蝦仁餛飩', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1970, NULL, 7, N'冷凍豬肉餛飩', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1971, NULL, 7, N'冷凍菜肉餛飩', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1972, NULL, 7, N'溫州餛飩', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1973, NULL, 7, N'豬肉鍋貼', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1974, NULL, 7, N'熟水餃(高麗菜水餃)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1975, NULL, 7, N'冷凍叉燒包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1976, NULL, 7, N'冷凍酸菜焢肉包子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1977, NULL, 7, N'冷凍芋泥包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1978, NULL, 7, N'冷凍豆沙包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1979, NULL, 7, N'冷凍芝麻包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1980, NULL, 7, N'冷凍蓮蓉包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1981, NULL, 7, N'冷凍叉燒包子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1982, NULL, 7, N'冷凍牛肉包子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1983, NULL, 7, N'冷凍豬肉包子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1984, NULL, 7, N'冷凍豬肉湯包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1985, NULL, 7, N'小籠包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1986, NULL, 7, N'冷凍素菜包子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1987, NULL, 7, N'竹筍包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1988, NULL, 7, N'冷凍白饅頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1989, NULL, 7, N'白饅頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1990, NULL, 7, N'芋頭饅頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1991, NULL, 7, N'花捲', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1992, NULL, 7, N'冷藏堅果饅頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1993, NULL, 7, N'黑糖饅頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1994, NULL, 7, N'冷凍銀絲卷(奶黃)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1995, NULL, 7, N'火腿蛋三明治', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1996, NULL, 7, N'披薩(夏威夷)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1997, NULL, 7, N'冷凍披薩(黑胡椒火腿)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1998, NULL, 7, N'蔥油餅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (1999, NULL, 7, N'冷凍蔥油餅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2000, NULL, 7, N'冷凍蛋餅皮', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2001, NULL, 7, N'燒餅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2002, NULL, 7, N'韭菜盒子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2003, NULL, 7, N'大餅包小餅(紅豆)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2004, NULL, 7, N'水煎包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2005, NULL, 7, N'牛肉餡餅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2006, NULL, 7, N'豬肉餡餅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2007, NULL, 7, N'冷凍燒賣', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2008, NULL, 7, N'冷凍水晶包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2009, NULL, 7, N'冷凍,水晶餃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2010, NULL, 7, N'油條', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2011, NULL, 7, N'冷凍春捲', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2012, NULL, 7, N'蚵仔煎', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2013, NULL, 7, N'棺材板', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2014, NULL, 7, N'油豆腐粉絲(阿給)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2015, NULL, 7, N'冷凍可樂餅(奶汁)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2016, NULL, 7, N'芋圓', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2017, NULL, 7, N'粉圓', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2018, NULL, 7, N'冷凍甘薯條', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2019, NULL, 7, N'冷凍馬鈴薯條', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2020, NULL, 7, N'西谷米', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2021, NULL, 7, N'台式泡菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2022, NULL, 7, N'黃金泡菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2023, NULL, 7, N'韓式泡菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2024, NULL, 7, N'花瓜罐頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2025, NULL, 7, N'冷凍洋蔥圈', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2026, NULL, 7, N'醃辣椒', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2027, NULL, 7, N'桂竹筍片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2028, NULL, 7, N'麻竹筍干', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2029, NULL, 7, N'薤', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2030, NULL, 7, N'甘藍乾', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2031, NULL, 7, N'酸甘藍菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2032, NULL, 7, N'梅乾菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2033, NULL, 7, N'榨菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2034, NULL, 7, N'酸菜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2035, NULL, 7, N'醃漬冬瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2036, NULL, 7, N'醃漬花胡瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2037, NULL, 7, N'醃漬越瓜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2038, NULL, 7, N'銀耳罐頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2039, NULL, 7, N'草菇罐頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2040, NULL, 7, N'醃漬香菇', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2041, NULL, 7, N'秀珍菇罐頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2042, NULL, 7, N'金針菇罐頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2043, NULL, 7, N'洋菇罐頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2044, NULL, 7, N'猴頭菇罐頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2045, NULL, 7, N'高纖胚芽冬粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2046, NULL, 7, N'冬粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2047, NULL, 7, N'寬粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2048, NULL, 7, N'佃煮黑豆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2049, NULL, 7, N'豆干絲', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2050, NULL, 7, N'五香豆干', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2051, NULL, 7, N'小方豆干', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2052, NULL, 7, N'黑豆干', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2053, NULL, 7, N'豆腐皮', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2054, NULL, 7, N'日式炸豆皮', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2055, NULL, 7, N'豆豉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2056, NULL, 7, N'豆棗', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2057, NULL, 7, N'百頁豆腐', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2058, NULL, 7, N'傳統豆腐', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2059, NULL, 7, N'傳統豆腐(2022年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2060, NULL, 7, N'冷凍豆腐', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2061, NULL, 7, N'小三角油豆腐', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2062, NULL, 7, N'嫩豆腐', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2063, NULL, 7, N'雞蛋豆腐', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2064, NULL, 7, N'麻油辣腐乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2065, NULL, 7, N'素肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2066, NULL, 7, N'冷凍素雞塊', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2067, NULL, 7, N'花生麵筋罐頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2068, NULL, 7, N'香菇麵筋罐頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2069, NULL, 7, N'花豆罐頭(糖漬)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2070, NULL, 7, N'紅豆罐頭(糖漬)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2071, NULL, 7, N'甘納豆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2072, NULL, 7, N'豌豆仁罐頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2073, NULL, 7, N'鹽酥蠶豆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2074, NULL, 7, N'豆漿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2075, NULL, 7, N'雞蛋豆漿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2076, NULL, 7, N'鹹豆漿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2077, NULL, 7, N'豆漿優酪乳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2078, NULL, 7, N'DHA豆奶', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2079, NULL, 7, N'豆漿粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2080, NULL, 7, N'叉燒肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2081, NULL, 7, N'切片火腿(牛肉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2082, NULL, 7, N'切片火腿(豬肉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2083, NULL, 7, N'切片火腿(雞肉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2084, NULL, 7, N'條狀火腿(牛肉,黑胡椒)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2085, NULL, 7, N'條狀火腿(豬肉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2086, NULL, 7, N'醬肘子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2087, NULL, 7, N'培根', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2088, NULL, 7, N'臘肉(五花肉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2089, NULL, 7, N'臘肉(腿肉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2090, NULL, 7, N'滷牛筋', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2091, NULL, 7, N'滷豬腳', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2092, NULL, 7, N'醃燻豬肝', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2093, NULL, 7, N'膽肝', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2094, NULL, 7, N'片狀肉乾(牛肉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2095, NULL, 7, N'片狀肉乾(牛肉,辣味)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2096, NULL, 7, N'片狀肉乾(豬肉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2097, NULL, 7, N'條狀肉乾(豬肉)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2098, NULL, 7, N'牛肉香腸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2099, NULL, 7, N'香腸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2100, NULL, 7, N'香腸(蒜味)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2101, NULL, 7, N'蒟蒻香腸(蒜味)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2102, NULL, 7, N'小巧香腸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2103, NULL, 7, N'雞肉香腸(大)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2104, NULL, 7, N'雞肉香腸(小)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2105, NULL, 7, N'熱狗', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2106, NULL, 7, N'德國香腸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2107, NULL, 7, N'冷凍小香腸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2108, NULL, 7, N'冷凍珍珠丸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2109, NULL, 7, N'冷凍貢丸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2110, NULL, 7, N'冷凍雞肉丸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2111, NULL, 7, N'冷凍牛肉漢堡肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2112, NULL, 7, N'冷凍雞塊', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2113, NULL, 7, N'豬肉脯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2114, NULL, 7, N'豬肉酥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2115, NULL, 7, N'雞肉酥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2116, NULL, 7, N'肉羹', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2117, NULL, 7, N'冷凍咕咾肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2118, NULL, 7, N'豬腳凍', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2119, NULL, 7, N'冷凍花枝丸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2120, NULL, 7, N'冷凍虱目魚丸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2121, NULL, 7, N'冷凍文蛤丸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2122, NULL, 7, N'冷凍旗魚丸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2123, NULL, 7, N'冷凍鱈魚丸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2124, NULL, 7, N'冷凍蝦丸', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2125, NULL, 7, N'冷凍花枝排', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2126, NULL, 7, N'冷凍鮪排', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2127, NULL, 7, N'冷凍蝦餅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2128, NULL, 7, N'冷凍干貝酥', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2129, NULL, 7, N'冷凍花枝塊', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2130, NULL, 7, N'冷凍旗魚塊', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2131, NULL, 7, N'冷凍蚵捲', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2132, NULL, 7, N'冷凍魚捲', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2133, NULL, 7, N'冷凍蝦捲', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2134, NULL, 7, N'冷凍魷魚圈', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2135, NULL, 7, N'冷凍花枝餃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2136, NULL, 7, N'冷凍香菇餃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2137, NULL, 7, N'冷凍蛋餃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2138, NULL, 7, N'冷凍雪螺餃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2139, NULL, 7, N'冷凍魚餃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2140, NULL, 7, N'冷凍蝦餃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2141, NULL, 7, N'冷凍燕餃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2142, NULL, 7, N'冷凍蟹味棒', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2143, NULL, 7, N'冷凍魚卵卷', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2144, NULL, 7, N'魚板', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2145, NULL, 7, N'天婦羅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2146, NULL, 7, N'冷凍花枝漿', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2147, NULL, 7, N'冷凍花枝羹', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2148, NULL, 7, N'魚肉脯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2149, NULL, 7, N'鯖魚肉脯', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2150, NULL, 7, N'魚肉鬆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2151, NULL, 7, N'旗魚鬆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2152, NULL, 7, N'鮭魚鬆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2153, NULL, 7, N'香筍鮪魚罐頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2154, NULL, 7, N'茄汁鯖魚罐頭', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2155, NULL, 7, N'蒜味甘扁桃仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2156, NULL, 7, N'杏仁霜', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2157, NULL, 7, N'蜜汁松子仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2158, NULL, 7, N'鹽酥夏威夷豆', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2159, NULL, 7, N'甜核桃', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2160, NULL, 7, N'糖炒栗子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2161, NULL, 7, N'蜜汁腰果', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2162, NULL, 7, N'玉桂西瓜子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2163, NULL, 7, N'醬油西瓜子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2164, NULL, 7, N'鹽酥帶殼花生(熟)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2165, NULL, 7, N'醃漬花生仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2166, NULL, 7, N'糖漬花生仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2167, NULL, 7, N'油炸花生仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2168, NULL, 7, N'蛋酥花生仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2169, NULL, 7, N'鹽酥花生仁', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2170, NULL, 7, N'調味南瓜子(去殼)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2171, NULL, 7, N'調味南瓜子(帶殼)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2172, NULL, 7, N'甘草葵瓜子(帶殼)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2173, NULL, 7, N'鹽酥葵瓜子(帶殼)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2174, NULL, 7, N'糖漬蓮子', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2175, NULL, 7, N'烤雞', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2176, NULL, 7, N'冷凍烤雞翅', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2177, NULL, 7, N'鴨賞', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2178, NULL, 7, N'茶鵝', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2179, NULL, 7, N'熟鵝腿肉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2180, NULL, 7, N'鯊魚煙', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2181, NULL, 7, N'日本鰻鱺魚片(蒲燒)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2182, NULL, 7, N'鹽漬小鱗脂眼鯡(鹹馧仔)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2183, NULL, 7, N'鯖魚(醃製)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2184, NULL, 7, N'鯖魚(醃製)(2022年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2185, NULL, 7, N'毛鱗魚(柳葉魚)(裹粉未炸)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2186, NULL, 7, N'油魚卵(加工)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2187, NULL, 7, N'圓鱈魚卵(加工)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2188, NULL, 7, N'鯔魚卵(加工)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2189, NULL, 7, N'鯔魚卵(加工)(2022年取樣)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2190, NULL, 7, N'醃漬鮭魚卵', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2191, NULL, 7, N'香魚片', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2192, NULL, 7, N'龍蝦卵(調味)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2193, NULL, 7, N'蠑螺(加工)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2194, NULL, 7, N'鹹小卷', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2195, NULL, 7, N'沖泡濃湯(海鮮)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2196, NULL, 7, N'玉米濃湯調理包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2197, NULL, 7, N'麥片沖泡包(三合一)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2198, NULL, 7, N'三合一麥片(野菜蘑菇)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2199, NULL, 7, N'糙米麩', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2200, NULL, 7, N'麵茶粉', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2201, NULL, 7, N'植物燕麥奶粉(營養強化)', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2202, NULL, 7, N'杏仁茶沖泡包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2203, NULL, 7, N'芝麻糊沖泡包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2204, NULL, 7, N'綜合堅果穀物沖泡包', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2205, NULL, 7, N'寒天脆藻', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2206, NULL, 7, N'生啤酒', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2207, NULL, 7, N'啤酒', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2208, NULL, 7, N'陳年紹興酒', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2209, NULL, 7, N'白葡萄酒', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2210, NULL, 7, N'紅葡萄酒', 1)
GO
INSERT [dbo].[Foods] ([Id], [MemberId], [CategoryId], [FoodName], [IsActive]) VALUES (2211, NULL, 7, N'雞精', 1)
GO
SET IDENTITY_INSERT [dbo].[Foods] OFF
GO

-- =============================================
-- 3. NutrientReferenceValues (2214)
-- New: WeightInGrams (克->100, 顆->50)
-- NULL -> 0.00
-- =============================================
SET IDENTITY_INSERT [dbo].[NutrientReferenceValues] ON 
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1, 1, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(110.00 AS Decimal(10, 2)), CAST(23.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2, 2, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(130.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(28.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (3, 3, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(52.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(14.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (4, 4, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(45.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (5, 5, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(142.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (6, 5, N'顆', CAST(1.00 AS Decimal(10, 2)), 50, CAST(71.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (7, 6, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(112.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(24.50 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (8, 7, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(406.00 AS Decimal(10, 2)), CAST(10.90 AS Decimal(10, 2)), CAST(67.90 AS Decimal(10, 2)), CAST(9.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (9, 8, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(120.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(28.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (10, 9, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(77.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(17.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (11, 10, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(290.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (12, 11, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(180.00 AS Decimal(10, 2)), CAST(18.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (13, 12, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(180.00 AS Decimal(10, 2)), CAST(22.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (14, 13, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(130.00 AS Decimal(10, 2)), CAST(21.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (15, 14, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(200.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (16, 15, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(100.00 AS Decimal(10, 2)), CAST(23.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (17, 16, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(155.00 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (18, 17, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(88.00 AS Decimal(10, 2)), CAST(8.50 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (19, 18, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(35.00 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (20, 19, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(50.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (21, 20, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(25.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(5.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (22, 21, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(28.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (23, 22, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(24.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (24, 23, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(40.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (25, 24, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(15.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (26, 25, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(85.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(22.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (27, 26, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(38.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (28, 27, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(55.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (29, 28, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (30, 29, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(63.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (31, 30, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(45.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (32, 31, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(60.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (33, 32, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(347.00 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)), CAST(77.10 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (34, 33, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(352.00 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)), CAST(76.70 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (35, 34, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(374.00 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)), CAST(85.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (36, 35, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(365.00 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)), CAST(71.70 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (37, 36, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(357.00 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(72.50 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (38, 37, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(338.00 AS Decimal(10, 2)), CAST(14.10 AS Decimal(10, 2)), CAST(69.20 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (39, 38, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(396.00 AS Decimal(10, 2)), CAST(31.40 AS Decimal(10, 2)), CAST(47.90 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (40, 39, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(354.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(85.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (41, 40, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(359.00 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)), CAST(78.20 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (42, 41, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(357.00 AS Decimal(10, 2)), CAST(11.50 AS Decimal(10, 2)), CAST(74.10 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (43, 42, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(358.00 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(73.10 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (44, 43, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(357.00 AS Decimal(10, 2)), CAST(13.80 AS Decimal(10, 2)), CAST(72.20 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (45, 44, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(342.00 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), CAST(71.40 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (46, 45, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(350.00 AS Decimal(10, 2)), CAST(13.10 AS Decimal(10, 2)), CAST(72.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (47, 46, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(350.00 AS Decimal(10, 2)), CAST(14.30 AS Decimal(10, 2)), CAST(69.60 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (48, 47, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(58.00 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(11.50 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (49, 48, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(157.00 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(34.40 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (50, 49, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(97.00 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), CAST(17.80 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (51, 50, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(97.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(17.50 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (52, 51, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(165.00 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)), CAST(33.40 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (53, 52, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(167.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(22.50 AS Decimal(10, 2)), CAST(8.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (54, 53, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(346.00 AS Decimal(10, 2)), CAST(10.90 AS Decimal(10, 2)), CAST(72.20 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (55, 54, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(354.00 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(80.30 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (56, 55, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(368.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(88.30 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (57, 56, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(355.00 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)), CAST(77.40 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (58, 57, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(354.00 AS Decimal(10, 2)), CAST(8.20 AS Decimal(10, 2)), CAST(76.30 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (59, 58, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(357.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(78.50 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (60, 59, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(356.00 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)), CAST(79.80 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (61, 60, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(352.00 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(77.80 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (62, 61, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(355.00 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)), CAST(78.10 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (63, 62, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(347.00 AS Decimal(10, 2)), CAST(6.70 AS Decimal(10, 2)), CAST(77.20 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (64, 63, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(355.00 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(78.70 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (65, 64, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(354.00 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(78.80 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (66, 65, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(352.00 AS Decimal(10, 2)), CAST(6.60 AS Decimal(10, 2)), CAST(78.20 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (67, 66, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(355.00 AS Decimal(10, 2)), CAST(7.90 AS Decimal(10, 2)), CAST(77.80 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (68, 67, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(355.00 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)), CAST(78.50 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (69, 68, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(352.00 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(77.70 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (70, 69, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(362.00 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)), CAST(80.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (71, 70, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(351.00 AS Decimal(10, 2)), CAST(5.70 AS Decimal(10, 2)), CAST(79.20 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (72, 71, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(338.00 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)), CAST(73.30 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (73, 72, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(354.00 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(79.10 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (74, 73, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(360.00 AS Decimal(10, 2)), CAST(7.90 AS Decimal(10, 2)), CAST(78.40 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (75, 74, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(357.00 AS Decimal(10, 2)), CAST(8.30 AS Decimal(10, 2)), CAST(77.40 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (76, 75, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(357.00 AS Decimal(10, 2)), CAST(8.40 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (77, 76, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(356.00 AS Decimal(10, 2)), CAST(8.20 AS Decimal(10, 2)), CAST(76.80 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (78, 77, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(352.00 AS Decimal(10, 2)), CAST(7.70 AS Decimal(10, 2)), CAST(74.70 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (79, 78, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(352.00 AS Decimal(10, 2)), CAST(9.90 AS Decimal(10, 2)), CAST(72.60 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (80, 79, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(350.00 AS Decimal(10, 2)), CAST(10.10 AS Decimal(10, 2)), CAST(70.10 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (81, 80, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(357.00 AS Decimal(10, 2)), CAST(8.30 AS Decimal(10, 2)), CAST(76.10 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (82, 81, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(358.00 AS Decimal(10, 2)), CAST(8.20 AS Decimal(10, 2)), CAST(76.80 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (83, 82, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(357.00 AS Decimal(10, 2)), CAST(7.30 AS Decimal(10, 2)), CAST(77.20 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (84, 83, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(360.00 AS Decimal(10, 2)), CAST(9.10 AS Decimal(10, 2)), CAST(76.50 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (85, 84, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(348.00 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)), CAST(74.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (86, 85, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(350.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(73.90 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (87, 86, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(346.00 AS Decimal(10, 2)), CAST(8.20 AS Decimal(10, 2)), CAST(74.10 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (88, 87, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(352.00 AS Decimal(10, 2)), CAST(7.30 AS Decimal(10, 2)), CAST(73.60 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (89, 88, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(355.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(76.60 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (90, 89, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(353.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(73.60 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (91, 90, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(355.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(76.60 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (92, 91, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(354.00 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)), CAST(74.00 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (93, 92, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(354.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(77.70 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (94, 93, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(357.00 AS Decimal(10, 2)), CAST(8.30 AS Decimal(10, 2)), CAST(75.20 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (95, 94, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(348.00 AS Decimal(10, 2)), CAST(8.70 AS Decimal(10, 2)), CAST(72.90 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (96, 95, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(360.00 AS Decimal(10, 2)), CAST(17.00 AS Decimal(10, 2)), CAST(52.90 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (97, 96, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(362.00 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(83.40 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (98, 97, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(386.00 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)), CAST(78.10 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (99, 98, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(359.00 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(82.30 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (100, 99, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(182.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(41.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (101, 100, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(361.00 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(73.60 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (102, 101, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(357.00 AS Decimal(10, 2)), CAST(10.70 AS Decimal(10, 2)), CAST(75.70 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (103, 102, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(336.00 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)), CAST(77.30 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (104, 103, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(388.00 AS Decimal(10, 2)), CAST(10.90 AS Decimal(10, 2)), CAST(67.40 AS Decimal(10, 2)), CAST(10.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (105, 104, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(383.00 AS Decimal(10, 2)), CAST(12.30 AS Decimal(10, 2)), CAST(64.10 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (106, 105, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(384.00 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)), CAST(67.90 AS Decimal(10, 2)), CAST(9.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (107, 106, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(353.00 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(71.30 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (108, 107, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(375.00 AS Decimal(10, 2)), CAST(14.10 AS Decimal(10, 2)), CAST(66.20 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (109, 108, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(379.00 AS Decimal(10, 2)), CAST(13.70 AS Decimal(10, 2)), CAST(65.90 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (110, 109, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(389.00 AS Decimal(10, 2)), CAST(10.90 AS Decimal(10, 2)), CAST(80.00 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (111, 110, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(361.00 AS Decimal(10, 2)), CAST(12.10 AS Decimal(10, 2)), CAST(66.80 AS Decimal(10, 2)), CAST(6.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (112, 111, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(346.00 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)), CAST(62.30 AS Decimal(10, 2)), CAST(8.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (113, 112, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(351.00 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)), CAST(82.40 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (114, 113, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(83.00 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)), CAST(17.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (115, 114, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(86.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(18.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (116, 115, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(78.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(17.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (117, 116, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(70.00 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (118, 117, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(82.00 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(17.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (119, 118, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(73.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(15.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (120, 119, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(91.00 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(19.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (121, 120, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(94.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(19.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (122, 121, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(72.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(15.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (123, 122, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(62.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(12.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (124, 123, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(135.00 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(29.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (125, 124, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(90.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(20.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (126, 125, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(89.00 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(19.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (127, 126, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(69.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(14.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (128, 127, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(67.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(14.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (129, 128, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(90.00 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)), CAST(19.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (130, 129, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(361.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(87.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (131, 130, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(113.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(27.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (132, 131, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(130.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(29.90 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (133, 132, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(116.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(28.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (134, 133, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(109.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(25.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (135, 134, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(134.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(31.30 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (136, 135, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(115.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(27.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (137, 136, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(356.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(85.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (138, 137, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(475.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(61.20 AS Decimal(10, 2)), CAST(30.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (139, 138, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(123.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(26.40 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (140, 139, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(107.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(22.80 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (141, 140, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(115.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(28.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (142, 141, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(103.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(24.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (143, 142, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(135.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(24.90 AS Decimal(10, 2)), CAST(4.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (144, 143, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(315.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(83.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (145, 144, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (146, 145, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(63.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(14.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (147, 146, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(74.00 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(15.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (148, 147, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(68.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (149, 148, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(57.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(12.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (150, 149, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(346.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(83.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (151, 150, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(63.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(14.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (152, 151, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(364.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(87.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (153, 152, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(58.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (154, 153, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(47.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (155, 154, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(66.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(16.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (156, 155, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(364.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(88.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (157, 156, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(72.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(16.10 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (158, 157, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(113.00 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(24.10 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (159, 158, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(140.00 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(31.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (160, 159, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(337.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(87.20 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (161, 160, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(550.00 AS Decimal(10, 2)), CAST(27.30 AS Decimal(10, 2)), CAST(17.00 AS Decimal(10, 2)), CAST(47.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (162, 161, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(588.00 AS Decimal(10, 2)), CAST(23.40 AS Decimal(10, 2)), CAST(14.80 AS Decimal(10, 2)), CAST(56.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (163, 162, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(568.00 AS Decimal(10, 2)), CAST(21.90 AS Decimal(10, 2)), CAST(23.20 AS Decimal(10, 2)), CAST(49.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (164, 163, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(669.00 AS Decimal(10, 2)), CAST(16.60 AS Decimal(10, 2)), CAST(9.40 AS Decimal(10, 2)), CAST(69.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (165, 164, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(668.00 AS Decimal(10, 2)), CAST(14.50 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), CAST(69.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (166, 165, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(687.00 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)), CAST(18.20 AS Decimal(10, 2)), CAST(71.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (167, 166, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(655.00 AS Decimal(10, 2)), CAST(15.40 AS Decimal(10, 2)), CAST(11.20 AS Decimal(10, 2)), CAST(67.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (168, 167, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(173.00 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(41.50 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (169, 168, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(158.00 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)), CAST(38.70 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (170, 169, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(573.00 AS Decimal(10, 2)), CAST(22.40 AS Decimal(10, 2)), CAST(20.10 AS Decimal(10, 2)), CAST(52.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (171, 170, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(561.00 AS Decimal(10, 2)), CAST(18.30 AS Decimal(10, 2)), CAST(30.30 AS Decimal(10, 2)), CAST(45.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (172, 171, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(556.00 AS Decimal(10, 2)), CAST(16.40 AS Decimal(10, 2)), CAST(35.20 AS Decimal(10, 2)), CAST(43.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (173, 172, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(655.00 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), CAST(17.20 AS Decimal(10, 2)), CAST(66.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (174, 173, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(280.00 AS Decimal(10, 2)), CAST(16.30 AS Decimal(10, 2)), CAST(58.00 AS Decimal(10, 2)), CAST(12.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (175, 174, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(476.00 AS Decimal(10, 2)), CAST(20.80 AS Decimal(10, 2)), CAST(28.10 AS Decimal(10, 2)), CAST(40.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (176, 175, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(506.00 AS Decimal(10, 2)), CAST(21.70 AS Decimal(10, 2)), CAST(28.60 AS Decimal(10, 2)), CAST(43.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (177, 176, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(337.00 AS Decimal(10, 2)), CAST(13.90 AS Decimal(10, 2)), CAST(65.10 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (178, 177, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(422.00 AS Decimal(10, 2)), CAST(21.70 AS Decimal(10, 2)), CAST(34.80 AS Decimal(10, 2)), CAST(31.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (179, 178, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(576.00 AS Decimal(10, 2)), CAST(22.30 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(54.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (180, 179, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(519.00 AS Decimal(10, 2)), CAST(22.20 AS Decimal(10, 2)), CAST(17.60 AS Decimal(10, 2)), CAST(48.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (181, 180, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(603.00 AS Decimal(10, 2)), CAST(20.30 AS Decimal(10, 2)), CAST(15.70 AS Decimal(10, 2)), CAST(58.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (182, 181, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(580.00 AS Decimal(10, 2)), CAST(21.70 AS Decimal(10, 2)), CAST(21.20 AS Decimal(10, 2)), CAST(52.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (183, 182, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(571.00 AS Decimal(10, 2)), CAST(17.30 AS Decimal(10, 2)), CAST(20.60 AS Decimal(10, 2)), CAST(54.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (184, 183, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(561.00 AS Decimal(10, 2)), CAST(20.70 AS Decimal(10, 2)), CAST(21.10 AS Decimal(10, 2)), CAST(51.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (185, 184, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(576.00 AS Decimal(10, 2)), CAST(15.70 AS Decimal(10, 2)), CAST(20.80 AS Decimal(10, 2)), CAST(55.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (186, 185, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(314.00 AS Decimal(10, 2)), CAST(15.30 AS Decimal(10, 2)), CAST(12.20 AS Decimal(10, 2)), CAST(27.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (187, 186, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(344.00 AS Decimal(10, 2)), CAST(17.20 AS Decimal(10, 2)), CAST(13.30 AS Decimal(10, 2)), CAST(27.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (188, 187, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(538.00 AS Decimal(10, 2)), CAST(27.60 AS Decimal(10, 2)), CAST(16.60 AS Decimal(10, 2)), CAST(46.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (189, 188, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(478.00 AS Decimal(10, 2)), CAST(28.80 AS Decimal(10, 2)), CAST(20.60 AS Decimal(10, 2)), CAST(38.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (190, 189, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(544.00 AS Decimal(10, 2)), CAST(28.80 AS Decimal(10, 2)), CAST(19.10 AS Decimal(10, 2)), CAST(45.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (191, 190, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(500.00 AS Decimal(10, 2)), CAST(23.60 AS Decimal(10, 2)), CAST(28.40 AS Decimal(10, 2)), CAST(38.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (192, 191, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(540.00 AS Decimal(10, 2)), CAST(31.20 AS Decimal(10, 2)), CAST(19.50 AS Decimal(10, 2)), CAST(43.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (193, 192, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(506.00 AS Decimal(10, 2)), CAST(28.50 AS Decimal(10, 2)), CAST(33.00 AS Decimal(10, 2)), CAST(33.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (194, 193, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(336.00 AS Decimal(10, 2)), CAST(9.90 AS Decimal(10, 2)), CAST(75.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (195, 194, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(300.00 AS Decimal(10, 2)), CAST(12.20 AS Decimal(10, 2)), CAST(63.70 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (196, 195, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(569.00 AS Decimal(10, 2)), CAST(22.00 AS Decimal(10, 2)), CAST(18.70 AS Decimal(10, 2)), CAST(51.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (197, 196, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(136.00 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(28.90 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (198, 197, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(124.00 AS Decimal(10, 2)), CAST(9.30 AS Decimal(10, 2)), CAST(25.60 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (199, 198, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(307.00 AS Decimal(10, 2)), CAST(21.80 AS Decimal(10, 2)), CAST(60.90 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (200, 199, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(67.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(18.10 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (201, 200, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(9.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (202, 201, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(7.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (203, 202, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(41.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (204, 203, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(31.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (205, 204, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(11.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (206, 205, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(25.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (207, 206, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(60.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(16.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (208, 207, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(94.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(21.30 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (209, 208, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(73.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(18.60 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (210, 209, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(57.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (211, 210, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(52.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(14.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (212, 211, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(71.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(17.90 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (213, 212, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(49.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(12.40 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (214, 213, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(48.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(12.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (215, 214, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(82.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(22.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (216, 215, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(90.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(24.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (217, 216, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(89.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(23.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (218, 217, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(63.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(16.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (219, 218, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(88.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(23.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (220, 219, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(87.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(23.30 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (221, 220, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(84.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(22.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (222, 221, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(81.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(21.30 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (223, 222, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(65.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(17.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (224, 223, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(98.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(26.30 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (225, 224, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(105.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(29.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (226, 225, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(119.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(33.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (227, 226, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(90.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(24.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (228, 227, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(93.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (229, 228, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(86.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(23.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (230, 229, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(60.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(7.90 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (231, 230, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(73.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)), CAST(5.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (232, 231, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(80.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(6.30 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (233, 232, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(83.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(6.60 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (234, 233, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(127.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(29.70 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (235, 234, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(55.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(14.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (236, 235, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(51.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(13.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (237, 236, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(55.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(15.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (238, 237, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(41.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (239, 238, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(49.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(13.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (240, 239, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(59.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(15.40 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (241, 240, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(100.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(26.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (242, 241, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(99.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(26.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (243, 242, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (244, 243, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(25.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(5.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (245, 244, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(9.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (246, 245, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(31.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (247, 246, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(34.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(10.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (248, 247, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(34.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(10.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (249, 248, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(34.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(10.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (250, 249, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (251, 250, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(34.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (252, 251, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (253, 252, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(10.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (254, 253, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(8.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (255, 254, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(27.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (256, 255, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (257, 256, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(8.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (258, 257, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(31.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (259, 258, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (260, 259, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(68.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(17.70 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (261, 260, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(63.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(16.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (262, 261, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(57.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(15.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (263, 262, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(63.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(16.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (264, 263, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(51.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(13.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (265, 264, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(60.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(16.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (266, 265, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(79.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(21.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (267, 266, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(61.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(16.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (268, 267, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(86.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(22.70 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (269, 268, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(71.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(19.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (270, 269, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(65.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(17.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (271, 270, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(59.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(16.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (272, 271, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(297.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(78.70 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (273, 272, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(38.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (274, 273, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (275, 274, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (276, 275, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(50.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (277, 276, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(8.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (278, 277, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (279, 278, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (280, 279, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(34.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(8.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (281, 280, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(9.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (282, 281, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(27.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (283, 282, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(8.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (284, 283, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(7.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (285, 284, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(34.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(8.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (286, 285, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(23.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (287, 286, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(40.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (288, 287, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (289, 288, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (290, 289, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(26.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(6.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (291, 290, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(28.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (292, 291, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(8.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (293, 292, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (294, 293, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (295, 294, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(10.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (296, 295, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(38.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(10.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (297, 296, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(27.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (298, 297, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(37.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (299, 298, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(9.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (300, 299, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(39.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(10.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (301, 300, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(44.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (302, 301, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(8.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (303, 302, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(38.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(9.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (304, 303, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(7.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (305, 304, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(8.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (306, 305, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(53.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(13.80 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (307, 306, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(48.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (308, 307, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(48.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (309, 308, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(57.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(15.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (310, 309, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(48.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (311, 310, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(41.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (312, 311, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(48.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (313, 312, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(64.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(16.90 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (314, 313, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(54.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(14.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (315, 314, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(57.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(15.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (316, 315, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(61.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(16.10 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (317, 316, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(49.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (318, 317, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(62.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(16.30 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (319, 318, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(40.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (320, 319, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(63.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(17.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (321, 320, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(46.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(12.20 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (322, 321, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(328.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(90.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (323, 322, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(64.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(16.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (324, 323, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(67.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(17.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (325, 324, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(60.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(15.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (326, 325, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(27.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (327, 326, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(69.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(18.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (328, 327, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(272.00 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)), CAST(70.90 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (329, 328, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(274.00 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)), CAST(72.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (330, 329, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(45.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(11.70 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (331, 330, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(44.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (332, 331, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(46.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (333, 332, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(37.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(9.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (334, 333, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(38.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (335, 334, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(35.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (336, 335, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(45.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (337, 336, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (338, 337, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(58.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(15.30 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (339, 338, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(63.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(17.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (340, 339, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(35.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (341, 340, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (342, 341, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (343, 342, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(51.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(13.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (344, 343, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(34.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(8.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (345, 344, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(55.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(14.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (346, 345, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(9.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (347, 346, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(63.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(18.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (348, 347, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(55.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(15.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (349, 348, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(55.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(15.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (350, 349, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(55.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(15.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (351, 350, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(46.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (352, 351, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(56.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(16.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (353, 352, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(59.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(17.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (354, 353, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(175.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(52.20 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (355, 354, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(37.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (356, 355, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(38.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(9.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (357, 356, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(9.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (358, 357, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(40.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(11.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (359, 358, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(9.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (360, 359, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(48.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(12.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (361, 360, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (362, 361, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(38.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(10.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (363, 362, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(43.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (364, 363, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(31.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (365, 364, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(49.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(14.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (366, 365, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(58.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(16.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (367, 366, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(50.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(13.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (368, 367, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(41.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(11.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (369, 368, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (370, 369, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(40.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(11.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (371, 370, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(39.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(10.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (372, 371, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (373, 372, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(44.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(12.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (374, 373, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(35.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(9.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (375, 374, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(48.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(13.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (376, 375, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(44.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (377, 376, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(41.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(10.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (378, 377, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(40.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(10.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (379, 378, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(41.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (380, 379, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(11.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (381, 380, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(81.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(23.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (382, 381, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(215.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(59.50 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (383, 382, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(213.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(60.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (384, 383, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(47.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(13.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (385, 384, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(51.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(14.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (386, 385, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(43.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(12.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (387, 386, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(50.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(14.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (388, 387, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(48.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(13.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (389, 388, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(49.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(13.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (390, 389, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(53.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (391, 390, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(54.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(15.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (392, 391, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(43.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(12.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (393, 392, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(47.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(13.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (394, 393, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (395, 394, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(46.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (396, 395, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(73.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(19.10 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (397, 396, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(68.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(18.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (398, 397, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(38.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (399, 398, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(40.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (400, 399, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(11.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (401, 400, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(41.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (402, 401, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(43.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(11.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (403, 402, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(45.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(12.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (404, 403, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(47.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(12.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (405, 404, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(50.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(14.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (406, 405, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(28.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (407, 406, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (408, 407, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (409, 408, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(46.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (410, 409, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(9.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (411, 410, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(38.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(10.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (412, 411, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (413, 412, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(40.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (414, 413, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(44.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (415, 414, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(43.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (416, 415, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(31.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(8.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (417, 416, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(35.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(8.90 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (418, 417, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (419, 418, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(35.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (420, 419, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(31.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (421, 420, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(35.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(7.70 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (422, 421, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (423, 422, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (424, 423, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(31.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (425, 424, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(34.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (426, 425, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(76.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(20.20 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (427, 426, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(72.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(18.80 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (428, 427, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(68.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(20.50 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (429, 428, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (430, 429, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (431, 430, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (432, 431, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(96.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(27.30 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (433, 432, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(63.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(16.50 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (434, 433, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(307.00 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(77.80 AS Decimal(10, 2)), CAST(4.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (435, 434, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(43.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (436, 435, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(103.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(28.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (437, 436, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(119.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(32.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (438, 437, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(58.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(15.80 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (439, 438, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(10.80 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (440, 439, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(57.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(15.30 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (441, 440, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(51.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(13.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (442, 441, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(75.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(19.10 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (443, 442, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(34.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(8.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (444, 443, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(8.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (445, 444, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(39.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (446, 445, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (447, 446, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(34.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(9.40 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (448, 447, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(9.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (449, 448, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(24.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (450, 449, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (451, 450, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (452, 451, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (453, 452, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (454, 453, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(9.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (455, 454, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (456, 455, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(44.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(10.80 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (457, 456, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(132.00 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(32.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (458, 457, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(255.00 AS Decimal(10, 2)), CAST(11.80 AS Decimal(10, 2)), CAST(68.40 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (459, 458, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (460, 459, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(20.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (461, 460, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(70.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(18.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (462, 461, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(18.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (463, 462, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(7.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (464, 463, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(18.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (465, 464, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(18.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (466, 465, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (467, 466, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (468, 467, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (469, 468, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (470, 469, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(22.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (471, 470, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(22.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(4.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (472, 471, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(20.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (473, 472, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (474, 473, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(22.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(4.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (475, 474, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(20.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (476, 475, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(20.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (477, 476, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(18.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (478, 477, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(21.00 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (479, 478, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(20.00 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (480, 479, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (481, 480, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (482, 481, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (483, 482, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(23.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (484, 483, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(47.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(11.70 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (485, 484, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(26.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(5.60 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (486, 485, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(115.00 AS Decimal(10, 2)), CAST(6.70 AS Decimal(10, 2)), CAST(26.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (487, 486, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(27.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(6.40 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (488, 487, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(47.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (489, 488, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(26.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(6.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (490, 489, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(26.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (491, 490, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(28.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(6.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (492, 491, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(28.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (493, 492, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(23.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(5.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (494, 493, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(40.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (495, 494, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(7.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (496, 495, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(39.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (497, 496, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(70.00 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(16.40 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (498, 497, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(24.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(5.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (499, 498, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(18.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (500, 499, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (501, 500, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(21.00 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (502, 501, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(27.00 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), CAST(5.50 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (503, 502, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(8.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (504, 503, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(21.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (505, 504, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(22.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (506, 505, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(4.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (507, 506, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(22.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(4.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (508, 507, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(18.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (509, 508, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(24.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(5.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (510, 509, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(5.40 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (511, 510, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (512, 511, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(28.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (513, 512, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(308.00 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(82.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (514, 513, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(22.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (515, 514, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(10.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (516, 515, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(12.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (517, 516, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(11.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (518, 517, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (519, 518, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (520, 519, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(8.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (521, 520, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(11.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (522, 521, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(11.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (523, 522, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(8.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (524, 523, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(9.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (525, 524, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(10.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (526, 525, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(11.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (527, 526, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(10.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (528, 527, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(10.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (529, 528, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(6.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (530, 529, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(12.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (531, 530, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(8.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (532, 531, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(11.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (533, 532, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(8.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (534, 533, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(27.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (535, 534, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(10.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (536, 535, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(8.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (537, 536, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(11.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (538, 537, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(9.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (539, 538, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(12.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (540, 539, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(15.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (541, 540, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(10.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (542, 541, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(12.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (543, 542, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(12.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (544, 543, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(7.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (545, 544, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(7.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (546, 545, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (547, 546, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (548, 547, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (549, 548, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(11.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (550, 549, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (551, 550, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (552, 551, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(15.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (553, 552, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(12.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (554, 553, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(18.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (555, 554, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (556, 555, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(12.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (557, 556, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (558, 557, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(21.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (559, 558, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(18.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (560, 559, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (561, 560, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(45.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (562, 561, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(21.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(5.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (563, 562, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (564, 563, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(10.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (565, 564, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(15.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (566, 565, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(8.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (567, 566, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(11.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (568, 567, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (569, 568, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (570, 569, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (571, 570, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(15.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (572, 571, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (573, 572, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (574, 573, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (575, 574, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(23.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (576, 575, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(20.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (577, 576, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(25.00 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(5.60 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (578, 577, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(95.00 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)), CAST(23.80 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (579, 578, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(88.00 AS Decimal(10, 2)), CAST(4.30 AS Decimal(10, 2)), CAST(19.40 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (580, 579, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (581, 580, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (582, 581, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (583, 582, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(20.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (584, 583, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(26.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (585, 584, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (586, 585, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (587, 586, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (588, 587, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(6.30 AS Decimal(10, 2)), CAST(4.90 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (589, 588, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(54.00 AS Decimal(10, 2)), CAST(5.50 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (590, 589, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (591, 590, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(21.00 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (592, 591, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (593, 592, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (594, 593, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (595, 594, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (596, 595, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (597, 596, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (598, 597, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (599, 598, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(12.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (600, 599, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (601, 600, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(11.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (602, 601, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (603, 602, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (604, 603, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (605, 604, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(20.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (606, 605, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(12.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (607, 606, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(11.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (608, 607, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(12.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (609, 608, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(10.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (610, 609, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(10.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (611, 610, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(11.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (612, 611, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (613, 612, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(15.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (614, 613, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(11.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (615, 614, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (616, 615, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(12.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (617, 616, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(27.00 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (618, 617, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(21.00 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (619, 618, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (620, 619, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(15.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (621, 620, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (622, 621, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (623, 622, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(22.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (624, 623, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(18.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(4.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (625, 624, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (626, 625, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (627, 626, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(20.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (628, 627, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(15.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (629, 628, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (630, 629, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(10.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (631, 630, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (632, 631, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(15.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (633, 632, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (634, 633, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(23.00 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (635, 634, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (636, 635, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (637, 636, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(27.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (638, 637, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(238.00 AS Decimal(10, 2)), CAST(16.00 AS Decimal(10, 2)), CAST(62.50 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (639, 638, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(34.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (640, 639, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(270.00 AS Decimal(10, 2)), CAST(14.30 AS Decimal(10, 2)), CAST(65.40 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (641, 640, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(240.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(71.20 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (642, 641, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(25.00 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (643, 642, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(9.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (644, 643, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(11.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (645, 644, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(7.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (646, 645, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (647, 646, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(69.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(17.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (648, 647, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(80.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(20.80 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (649, 648, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(46.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(11.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (650, 649, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(79.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(20.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (651, 650, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(72.00 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(16.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (652, 651, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (653, 652, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (654, 653, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (655, 654, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (656, 655, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(15.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (657, 656, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(22.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (658, 657, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(20.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(5.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (659, 658, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (660, 659, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (661, 660, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(26.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(5.60 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (662, 661, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (663, 662, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(18.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (664, 663, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (665, 664, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(15.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (666, 665, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (667, 666, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(15.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (668, 667, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (669, 668, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (670, 669, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (671, 670, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(11.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (672, 671, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(325.00 AS Decimal(10, 2)), CAST(12.30 AS Decimal(10, 2)), CAST(77.80 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (673, 672, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(20.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (674, 673, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(18.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (675, 674, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (676, 675, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (677, 676, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(18.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (678, 677, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(15.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (679, 678, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(22.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (680, 679, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(20.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (681, 680, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (682, 681, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(21.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(5.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (683, 682, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(22.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(5.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (684, 683, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (685, 684, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(31.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (686, 685, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(26.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (687, 686, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(31.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (688, 687, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(28.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (689, 688, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (690, 689, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(28.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(6.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (691, 690, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(28.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (692, 691, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (693, 692, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(25.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(6.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (694, 693, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(24.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(5.90 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (695, 694, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(4.90 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (696, 695, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(28.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (697, 696, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(23.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (698, 697, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (699, 698, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(25.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (700, 699, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(7.70 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (701, 700, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(27.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (702, 701, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (703, 702, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(41.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(10.30 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (704, 703, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(22.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(5.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (705, 704, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(59.00 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(16.40 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (706, 705, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(35.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(9.30 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (707, 706, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(64.00 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(17.90 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (708, 707, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(77.00 AS Decimal(10, 2)), CAST(4.90 AS Decimal(10, 2)), CAST(21.90 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (709, 708, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(303.00 AS Decimal(10, 2)), CAST(19.90 AS Decimal(10, 2)), CAST(47.60 AS Decimal(10, 2)), CAST(17.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (710, 709, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(28.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (711, 710, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)), CAST(4.90 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (712, 711, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (713, 712, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(27.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(6.60 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (714, 713, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(41.00 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (715, 714, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(35.00 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (716, 715, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(43.00 AS Decimal(10, 2)), CAST(6.60 AS Decimal(10, 2)), CAST(6.40 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (717, 716, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(22.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(4.30 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (718, 717, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(21.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (719, 718, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(22.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (720, 719, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (721, 720, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(21.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (722, 721, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(20.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (723, 722, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(9.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (724, 723, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(9.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (725, 724, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(44.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(7.70 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (726, 725, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (727, 726, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(60.00 AS Decimal(10, 2)), CAST(5.70 AS Decimal(10, 2)), CAST(12.20 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (728, 727, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(22.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (729, 728, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(300.00 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(76.20 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (730, 729, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (731, 730, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(41.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(10.90 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (732, 731, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(7.70 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (733, 732, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(2.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (734, 733, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(18.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (735, 734, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (736, 735, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(25.00 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (737, 736, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(12.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (738, 737, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(12.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (739, 738, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(77.00 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (740, 739, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(53.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(11.20 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (741, 740, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(6.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (742, 741, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(214.00 AS Decimal(10, 2)), CAST(39.90 AS Decimal(10, 2)), CAST(36.90 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (743, 742, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(212.00 AS Decimal(10, 2)), CAST(28.10 AS Decimal(10, 2)), CAST(47.90 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (744, 743, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(223.00 AS Decimal(10, 2)), CAST(18.10 AS Decimal(10, 2)), CAST(62.40 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (745, 744, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(275.00 AS Decimal(10, 2)), CAST(10.30 AS Decimal(10, 2)), CAST(69.50 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (746, 745, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(9.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (747, 746, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(166.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(46.70 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (748, 747, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(9.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (749, 748, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(178.00 AS Decimal(10, 2)), CAST(8.40 AS Decimal(10, 2)), CAST(59.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (750, 749, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (751, 750, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(9.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (752, 751, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(25.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (753, 752, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(9.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (754, 753, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(12.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (755, 754, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (756, 755, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(169.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(47.30 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (757, 756, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(39.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (758, 757, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(160.00 AS Decimal(10, 2)), CAST(22.90 AS Decimal(10, 2)), CAST(40.80 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (759, 758, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(126.00 AS Decimal(10, 2)), CAST(6.20 AS Decimal(10, 2)), CAST(46.10 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (760, 759, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(135.00 AS Decimal(10, 2)), CAST(11.70 AS Decimal(10, 2)), CAST(43.90 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (761, 760, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(15.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(5.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (762, 761, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(227.00 AS Decimal(10, 2)), CAST(46.50 AS Decimal(10, 2)), CAST(32.10 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (763, 762, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(24.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (764, 763, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(27.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(12.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (765, 764, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(224.00 AS Decimal(10, 2)), CAST(13.80 AS Decimal(10, 2)), CAST(74.70 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (766, 765, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(182.00 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)), CAST(79.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (767, 766, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(265.00 AS Decimal(10, 2)), CAST(21.40 AS Decimal(10, 2)), CAST(69.60 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (768, 767, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(188.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(79.40 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (769, 768, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (770, 769, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(31.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (771, 770, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(187.00 AS Decimal(10, 2)), CAST(9.30 AS Decimal(10, 2)), CAST(70.80 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (772, 771, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(5.90 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (773, 772, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (774, 773, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(259.00 AS Decimal(10, 2)), CAST(20.10 AS Decimal(10, 2)), CAST(59.80 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (775, 774, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(5.90 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (776, 775, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(31.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (777, 776, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (778, 777, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(234.00 AS Decimal(10, 2)), CAST(23.50 AS Decimal(10, 2)), CAST(53.50 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (779, 778, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(31.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (780, 779, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(31.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (781, 780, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(21.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(4.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (782, 781, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(10.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (783, 782, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(250.00 AS Decimal(10, 2)), CAST(20.90 AS Decimal(10, 2)), CAST(64.90 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (784, 783, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(259.00 AS Decimal(10, 2)), CAST(23.30 AS Decimal(10, 2)), CAST(66.60 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (785, 784, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(253.00 AS Decimal(10, 2)), CAST(17.00 AS Decimal(10, 2)), CAST(67.40 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (786, 785, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(233.00 AS Decimal(10, 2)), CAST(18.70 AS Decimal(10, 2)), CAST(64.50 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (787, 786, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(256.00 AS Decimal(10, 2)), CAST(24.60 AS Decimal(10, 2)), CAST(60.90 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (788, 787, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (789, 788, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(259.00 AS Decimal(10, 2)), CAST(34.00 AS Decimal(10, 2)), CAST(46.70 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (790, 789, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (791, 790, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(25.00 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (792, 791, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(22.00 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (793, 792, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(27.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(6.40 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (794, 793, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(26.00 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(5.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (795, 794, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(24.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (796, 795, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(35.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(8.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (797, 796, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (798, 797, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(35.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(8.20 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (799, 798, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(41.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (800, 799, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(5.20 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (801, 800, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(20.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (802, 801, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(21.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (803, 802, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (804, 803, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(24.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (805, 804, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(24.00 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (806, 805, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(27.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(5.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (807, 806, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(25.00 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (808, 807, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(26.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(6.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (809, 808, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(23.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (810, 809, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(31.00 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(4.30 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (811, 810, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(162.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(79.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (812, 811, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(26.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(5.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (813, 812, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(242.00 AS Decimal(10, 2)), CAST(12.30 AS Decimal(10, 2)), CAST(64.30 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (814, 813, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(250.00 AS Decimal(10, 2)), CAST(17.50 AS Decimal(10, 2)), CAST(64.10 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (815, 814, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (816, 815, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(34.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(7.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (817, 816, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(6.30 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (818, 817, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (819, 818, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(296.00 AS Decimal(10, 2)), CAST(23.80 AS Decimal(10, 2)), CAST(58.20 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (820, 819, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(301.00 AS Decimal(10, 2)), CAST(27.40 AS Decimal(10, 2)), CAST(56.40 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (821, 820, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(291.00 AS Decimal(10, 2)), CAST(20.10 AS Decimal(10, 2)), CAST(60.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (822, 821, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(317.00 AS Decimal(10, 2)), CAST(21.70 AS Decimal(10, 2)), CAST(62.20 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (823, 822, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(288.00 AS Decimal(10, 2)), CAST(21.20 AS Decimal(10, 2)), CAST(59.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (824, 823, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(290.00 AS Decimal(10, 2)), CAST(20.90 AS Decimal(10, 2)), CAST(61.50 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (825, 824, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(285.00 AS Decimal(10, 2)), CAST(20.20 AS Decimal(10, 2)), CAST(60.40 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (826, 825, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(340.00 AS Decimal(10, 2)), CAST(37.00 AS Decimal(10, 2)), CAST(33.70 AS Decimal(10, 2)), CAST(14.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (827, 826, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(205.00 AS Decimal(10, 2)), CAST(20.60 AS Decimal(10, 2)), CAST(40.30 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (828, 827, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(161.00 AS Decimal(10, 2)), CAST(16.10 AS Decimal(10, 2)), CAST(15.90 AS Decimal(10, 2)), CAST(7.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (829, 828, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(379.00 AS Decimal(10, 2)), CAST(39.00 AS Decimal(10, 2)), CAST(32.40 AS Decimal(10, 2)), CAST(20.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (830, 829, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(396.00 AS Decimal(10, 2)), CAST(36.00 AS Decimal(10, 2)), CAST(39.00 AS Decimal(10, 2)), CAST(17.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (831, 830, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(312.00 AS Decimal(10, 2)), CAST(22.10 AS Decimal(10, 2)), CAST(63.60 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (832, 831, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(312.00 AS Decimal(10, 2)), CAST(22.80 AS Decimal(10, 2)), CAST(63.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (833, 832, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(315.00 AS Decimal(10, 2)), CAST(24.60 AS Decimal(10, 2)), CAST(59.60 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (834, 833, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(319.00 AS Decimal(10, 2)), CAST(21.70 AS Decimal(10, 2)), CAST(62.90 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (835, 834, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(6.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (836, 835, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(102.00 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)), CAST(20.10 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (837, 836, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(131.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(24.70 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (838, 837, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(23.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (839, 838, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(26.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (840, 839, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(52.00 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(10.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (841, 840, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(116.00 AS Decimal(10, 2)), CAST(14.60 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (842, 841, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(126.00 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(13.20 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (843, 842, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(121.00 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(9.80 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (844, 843, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(359.00 AS Decimal(10, 2)), CAST(35.60 AS Decimal(10, 2)), CAST(33.00 AS Decimal(10, 2)), CAST(15.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (845, 844, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(139.00 AS Decimal(10, 2)), CAST(16.60 AS Decimal(10, 2)), CAST(16.40 AS Decimal(10, 2)), CAST(5.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (846, 845, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(374.00 AS Decimal(10, 2)), CAST(37.40 AS Decimal(10, 2)), CAST(32.20 AS Decimal(10, 2)), CAST(16.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (847, 846, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(405.00 AS Decimal(10, 2)), CAST(42.00 AS Decimal(10, 2)), CAST(25.90 AS Decimal(10, 2)), CAST(21.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (848, 847, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (849, 848, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(108.00 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)), CAST(21.70 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (850, 849, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(34.00 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (851, 850, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(44.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(9.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (852, 851, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(37.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (853, 852, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(79.00 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)), CAST(17.10 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (854, 853, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(24.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (855, 854, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(308.00 AS Decimal(10, 2)), CAST(25.30 AS Decimal(10, 2)), CAST(58.30 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (856, 855, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(338.00 AS Decimal(10, 2)), CAST(19.40 AS Decimal(10, 2)), CAST(61.00 AS Decimal(10, 2)), CAST(5.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (857, 856, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(271.00 AS Decimal(10, 2)), CAST(22.10 AS Decimal(10, 2)), CAST(59.40 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (858, 857, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(24.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (859, 858, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(175.00 AS Decimal(10, 2)), CAST(23.60 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (860, 859, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(325.00 AS Decimal(10, 2)), CAST(15.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(28.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (861, 860, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(290.00 AS Decimal(10, 2)), CAST(17.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(24.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (862, 861, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(360.00 AS Decimal(10, 2)), CAST(13.10 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(33.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (863, 862, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(335.00 AS Decimal(10, 2)), CAST(15.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(29.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (864, 863, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(225.00 AS Decimal(10, 2)), CAST(18.60 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(16.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (865, 864, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(358.00 AS Decimal(10, 2)), CAST(15.70 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(32.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (866, 865, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(162.00 AS Decimal(10, 2)), CAST(20.40 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(8.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (867, 866, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(166.00 AS Decimal(10, 2)), CAST(19.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (868, 867, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(233.00 AS Decimal(10, 2)), CAST(16.90 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(17.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (869, 868, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(331.00 AS Decimal(10, 2)), CAST(14.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(29.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (870, 869, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(120.00 AS Decimal(10, 2)), CAST(22.30 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (871, 870, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(200.00 AS Decimal(10, 2)), CAST(21.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (872, 871, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(184.00 AS Decimal(10, 2)), CAST(20.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(10.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (873, 872, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(122.00 AS Decimal(10, 2)), CAST(19.40 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)), CAST(4.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (874, 873, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(153.00 AS Decimal(10, 2)), CAST(20.60 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (875, 874, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(139.00 AS Decimal(10, 2)), CAST(19.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (876, 875, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(151.00 AS Decimal(10, 2)), CAST(23.70 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(5.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (877, 876, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(250.00 AS Decimal(10, 2)), CAST(19.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(18.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (878, 877, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(430.00 AS Decimal(10, 2)), CAST(15.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(40.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (879, 878, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(263.00 AS Decimal(10, 2)), CAST(20.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(19.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (880, 879, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(120.00 AS Decimal(10, 2)), CAST(20.30 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (881, 880, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(188.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (882, 881, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(56.00 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (883, 882, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(44.00 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (884, 883, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(67.00 AS Decimal(10, 2)), CAST(15.30 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (885, 884, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(107.00 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (886, 885, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(157.00 AS Decimal(10, 2)), CAST(21.70 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (887, 886, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(164.00 AS Decimal(10, 2)), CAST(20.30 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (888, 887, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(123.00 AS Decimal(10, 2)), CAST(21.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (889, 888, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(170.00 AS Decimal(10, 2)), CAST(18.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(9.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (890, 889, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(198.00 AS Decimal(10, 2)), CAST(18.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (891, 890, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(260.00 AS Decimal(10, 2)), CAST(18.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (892, 891, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(198.00 AS Decimal(10, 2)), CAST(17.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (893, 892, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(143.00 AS Decimal(10, 2)), CAST(26.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (894, 893, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(252.00 AS Decimal(10, 2)), CAST(16.90 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (895, 894, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(200.00 AS Decimal(10, 2)), CAST(18.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(13.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (896, 895, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(131.00 AS Decimal(10, 2)), CAST(20.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (897, 896, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(207.00 AS Decimal(10, 2)), CAST(18.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(14.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (898, 897, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(295.00 AS Decimal(10, 2)), CAST(16.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(24.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (899, 898, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(191.00 AS Decimal(10, 2)), CAST(17.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (900, 899, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(244.00 AS Decimal(10, 2)), CAST(17.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(18.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (901, 900, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(146.00 AS Decimal(10, 2)), CAST(20.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (902, 901, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(184.00 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (903, 902, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(123.00 AS Decimal(10, 2)), CAST(20.40 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (904, 903, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(120.00 AS Decimal(10, 2)), CAST(21.10 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (905, 904, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(212.00 AS Decimal(10, 2)), CAST(19.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(14.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (906, 905, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(214.00 AS Decimal(10, 2)), CAST(19.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(14.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (907, 906, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(287.00 AS Decimal(10, 2)), CAST(18.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(23.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (908, 907, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(209.00 AS Decimal(10, 2)), CAST(20.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (909, 908, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(139.00 AS Decimal(10, 2)), CAST(21.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (910, 909, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(360.00 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(32.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (911, 910, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(368.00 AS Decimal(10, 2)), CAST(14.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(33.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (912, 911, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(267.00 AS Decimal(10, 2)), CAST(18.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (913, 912, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(220.00 AS Decimal(10, 2)), CAST(14.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(17.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (914, 913, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(182.00 AS Decimal(10, 2)), CAST(17.50 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (915, 914, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(157.00 AS Decimal(10, 2)), CAST(18.90 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(8.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (916, 915, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(284.00 AS Decimal(10, 2)), CAST(17.20 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(23.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (917, 916, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(212.00 AS Decimal(10, 2)), CAST(18.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(14.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (918, 917, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(218.00 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (919, 918, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(205.00 AS Decimal(10, 2)), CAST(18.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(14.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (920, 919, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(128.00 AS Decimal(10, 2)), CAST(13.60 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (921, 920, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(93.00 AS Decimal(10, 2)), CAST(14.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (922, 921, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(491.00 AS Decimal(10, 2)), CAST(22.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(44.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (923, 922, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(219.00 AS Decimal(10, 2)), CAST(24.20 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(12.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (924, 923, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(185.00 AS Decimal(10, 2)), CAST(18.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(11.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (925, 924, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(6.30 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (926, 925, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(295.00 AS Decimal(10, 2)), CAST(16.20 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (927, 926, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(137.00 AS Decimal(10, 2)), CAST(20.80 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (928, 927, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(152.00 AS Decimal(10, 2)), CAST(12.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (929, 928, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(137.00 AS Decimal(10, 2)), CAST(16.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (930, 929, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(837.00 AS Decimal(10, 2)), CAST(17.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(84.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (931, 930, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(8.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (932, 931, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(7.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (933, 932, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(9.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (934, 933, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(8.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (935, 934, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(332.00 AS Decimal(10, 2)), CAST(15.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(29.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (936, 935, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(82.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (937, 936, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(79.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (938, 937, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(198.00 AS Decimal(10, 2)), CAST(6.60 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(18.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (939, 938, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(156.00 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (940, 939, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(186.00 AS Decimal(10, 2)), CAST(10.90 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)), CAST(15.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (941, 940, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(252.00 AS Decimal(10, 2)), CAST(21.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(17.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (942, 941, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(253.00 AS Decimal(10, 2)), CAST(19.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(18.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (943, 942, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(331.00 AS Decimal(10, 2)), CAST(17.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(28.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (944, 943, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(72.00 AS Decimal(10, 2)), CAST(14.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (945, 944, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(125.00 AS Decimal(10, 2)), CAST(10.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (946, 945, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(196.00 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (947, 946, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(248.00 AS Decimal(10, 2)), CAST(16.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(19.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (948, 947, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(212.00 AS Decimal(10, 2)), CAST(17.90 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(15.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (949, 948, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(109.00 AS Decimal(10, 2)), CAST(24.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (950, 949, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(112.00 AS Decimal(10, 2)), CAST(24.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (951, 950, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(106.00 AS Decimal(10, 2)), CAST(23.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (952, 951, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(104.00 AS Decimal(10, 2)), CAST(22.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (953, 952, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(219.00 AS Decimal(10, 2)), CAST(19.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (954, 953, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(119.00 AS Decimal(10, 2)), CAST(23.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (955, 954, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(121.00 AS Decimal(10, 2)), CAST(23.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (956, 955, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(117.00 AS Decimal(10, 2)), CAST(23.30 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (957, 956, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(163.00 AS Decimal(10, 2)), CAST(18.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (958, 957, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(130.00 AS Decimal(10, 2)), CAST(21.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (959, 958, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(196.00 AS Decimal(10, 2)), CAST(14.40 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (960, 959, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(157.00 AS Decimal(10, 2)), CAST(18.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (961, 960, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(142.00 AS Decimal(10, 2)), CAST(20.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (962, 961, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(173.00 AS Decimal(10, 2)), CAST(16.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (963, 962, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(151.00 AS Decimal(10, 2)), CAST(18.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (964, 963, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(143.00 AS Decimal(10, 2)), CAST(21.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (965, 964, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(159.00 AS Decimal(10, 2)), CAST(16.80 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (966, 965, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(183.00 AS Decimal(10, 2)), CAST(17.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (967, 966, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(158.00 AS Decimal(10, 2)), CAST(18.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (968, 967, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(208.00 AS Decimal(10, 2)), CAST(15.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (969, 968, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(251.00 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (970, 969, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(165.00 AS Decimal(10, 2)), CAST(19.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (971, 970, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(226.00 AS Decimal(10, 2)), CAST(18.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(16.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (972, 971, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(228.00 AS Decimal(10, 2)), CAST(19.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (973, 972, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(223.00 AS Decimal(10, 2)), CAST(16.40 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(17.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (974, 973, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(210.00 AS Decimal(10, 2)), CAST(18.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(14.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (975, 974, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(198.00 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (976, 975, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(222.00 AS Decimal(10, 2)), CAST(17.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(16.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (977, 976, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(210.00 AS Decimal(10, 2)), CAST(17.80 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(14.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (978, 977, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(131.00 AS Decimal(10, 2)), CAST(27.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (979, 978, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(190.00 AS Decimal(10, 2)), CAST(13.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(14.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (980, 979, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(204.00 AS Decimal(10, 2)), CAST(14.40 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(15.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (981, 980, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(452.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(45.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (982, 981, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(111.00 AS Decimal(10, 2)), CAST(18.80 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (983, 982, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(89.00 AS Decimal(10, 2)), CAST(16.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (984, 983, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(9.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (985, 984, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(71.00 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (986, 985, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(209.00 AS Decimal(10, 2)), CAST(20.70 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(13.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (987, 986, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(107.00 AS Decimal(10, 2)), CAST(20.40 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (988, 987, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(442.00 AS Decimal(10, 2)), CAST(11.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(43.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (989, 988, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(319.00 AS Decimal(10, 2)), CAST(16.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(27.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (990, 989, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(229.00 AS Decimal(10, 2)), CAST(18.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(16.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (991, 990, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(102.00 AS Decimal(10, 2)), CAST(20.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (992, 991, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(111.00 AS Decimal(10, 2)), CAST(20.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (993, 992, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(227.00 AS Decimal(10, 2)), CAST(16.70 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)), CAST(17.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (994, 993, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(282.00 AS Decimal(10, 2)), CAST(14.40 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(24.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (995, 994, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (996, 995, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(97.00 AS Decimal(10, 2)), CAST(20.50 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (997, 996, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(113.00 AS Decimal(10, 2)), CAST(12.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(6.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (998, 997, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(94.00 AS Decimal(10, 2)), CAST(13.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (999, 998, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(170.00 AS Decimal(10, 2)), CAST(22.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1000, 999, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(199.00 AS Decimal(10, 2)), CAST(16.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(14.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1001, 1000, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(187.00 AS Decimal(10, 2)), CAST(16.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(13.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1002, 1001, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(187.00 AS Decimal(10, 2)), CAST(15.60 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(13.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1003, 1002, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(120.00 AS Decimal(10, 2)), CAST(23.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1004, 1003, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(130.00 AS Decimal(10, 2)), CAST(21.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1005, 1004, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(241.00 AS Decimal(10, 2)), CAST(14.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(19.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1006, 1005, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(123.00 AS Decimal(10, 2)), CAST(20.50 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1007, 1006, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(95.00 AS Decimal(10, 2)), CAST(17.40 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1008, 1007, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(63.00 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1009, 1008, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(141.00 AS Decimal(10, 2)), CAST(21.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1010, 1009, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(105.00 AS Decimal(10, 2)), CAST(22.80 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1011, 1010, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(97.00 AS Decimal(10, 2)), CAST(20.90 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1012, 1011, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(107.00 AS Decimal(10, 2)), CAST(18.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1013, 1012, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(144.00 AS Decimal(10, 2)), CAST(21.20 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(5.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1014, 1013, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(466.00 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(46.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1015, 1014, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(94.00 AS Decimal(10, 2)), CAST(21.10 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1016, 1015, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(85.00 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1017, 1016, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(117.00 AS Decimal(10, 2)), CAST(27.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1018, 1017, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(110.00 AS Decimal(10, 2)), CAST(25.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1019, 1018, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(106.00 AS Decimal(10, 2)), CAST(24.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1020, 1019, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(106.00 AS Decimal(10, 2)), CAST(24.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1021, 1020, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(254.00 AS Decimal(10, 2)), CAST(18.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(19.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1022, 1021, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(97.00 AS Decimal(10, 2)), CAST(20.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1023, 1022, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(56.00 AS Decimal(10, 2)), CAST(11.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1024, 1023, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(124.00 AS Decimal(10, 2)), CAST(26.20 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1025, 1024, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(97.00 AS Decimal(10, 2)), CAST(20.70 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1026, 1025, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(151.00 AS Decimal(10, 2)), CAST(31.80 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1027, 1026, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(105.00 AS Decimal(10, 2)), CAST(23.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1028, 1027, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(101.00 AS Decimal(10, 2)), CAST(21.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1029, 1028, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(111.00 AS Decimal(10, 2)), CAST(21.50 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1030, 1029, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(275.00 AS Decimal(10, 2)), CAST(51.80 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1031, 1030, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(179.00 AS Decimal(10, 2)), CAST(21.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1032, 1031, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(180.00 AS Decimal(10, 2)), CAST(19.80 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1033, 1032, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(189.00 AS Decimal(10, 2)), CAST(22.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1034, 1033, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(124.00 AS Decimal(10, 2)), CAST(23.70 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1035, 1034, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(208.00 AS Decimal(10, 2)), CAST(22.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1036, 1035, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(192.00 AS Decimal(10, 2)), CAST(21.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(11.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1037, 1036, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(200.00 AS Decimal(10, 2)), CAST(21.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1038, 1037, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(243.00 AS Decimal(10, 2)), CAST(20.10 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(17.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1039, 1038, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(342.00 AS Decimal(10, 2)), CAST(17.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(29.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1040, 1039, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(166.00 AS Decimal(10, 2)), CAST(21.40 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(8.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1041, 1040, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(91.00 AS Decimal(10, 2)), CAST(17.20 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1042, 1041, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(91.00 AS Decimal(10, 2)), CAST(14.50 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1043, 1042, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(145.00 AS Decimal(10, 2)), CAST(18.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1044, 1043, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(194.00 AS Decimal(10, 2)), CAST(16.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(13.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1045, 1044, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(86.00 AS Decimal(10, 2)), CAST(19.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1046, 1045, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(104.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1047, 1046, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(147.00 AS Decimal(10, 2)), CAST(18.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1048, 1047, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(69.00 AS Decimal(10, 2)), CAST(14.30 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1049, 1048, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(151.00 AS Decimal(10, 2)), CAST(22.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1050, 1049, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(158.00 AS Decimal(10, 2)), CAST(24.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1051, 1050, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(221.00 AS Decimal(10, 2)), CAST(20.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1052, 1051, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(155.00 AS Decimal(10, 2)), CAST(23.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1053, 1052, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(174.00 AS Decimal(10, 2)), CAST(20.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1054, 1053, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(204.00 AS Decimal(10, 2)), CAST(20.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1055, 1054, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(222.00 AS Decimal(10, 2)), CAST(19.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1056, 1055, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(349.00 AS Decimal(10, 2)), CAST(16.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(31.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1057, 1056, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(160.00 AS Decimal(10, 2)), CAST(20.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1058, 1057, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(147.00 AS Decimal(10, 2)), CAST(20.10 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1059, 1058, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(104.00 AS Decimal(10, 2)), CAST(24.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1060, 1059, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(49.00 AS Decimal(10, 2)), CAST(10.40 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1061, 1060, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(103.00 AS Decimal(10, 2)), CAST(20.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1062, 1061, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(68.00 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1063, 1062, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(152.00 AS Decimal(10, 2)), CAST(20.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1064, 1063, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(137.00 AS Decimal(10, 2)), CAST(20.40 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(5.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1065, 1064, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(133.00 AS Decimal(10, 2)), CAST(20.40 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1066, 1065, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(224.00 AS Decimal(10, 2)), CAST(17.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(16.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1067, 1066, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(129.00 AS Decimal(10, 2)), CAST(21.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1068, 1067, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(141.00 AS Decimal(10, 2)), CAST(21.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1069, 1068, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(137.00 AS Decimal(10, 2)), CAST(21.10 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(5.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1070, 1069, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(149.00 AS Decimal(10, 2)), CAST(21.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(6.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1071, 1070, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(170.00 AS Decimal(10, 2)), CAST(21.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1072, 1071, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(155.00 AS Decimal(10, 2)), CAST(20.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1073, 1072, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(94.00 AS Decimal(10, 2)), CAST(22.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1074, 1073, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(91.00 AS Decimal(10, 2)), CAST(20.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1075, 1074, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(98.00 AS Decimal(10, 2)), CAST(22.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1076, 1075, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(85.00 AS Decimal(10, 2)), CAST(19.50 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1077, 1076, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(84.00 AS Decimal(10, 2)), CAST(18.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1078, 1077, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(88.00 AS Decimal(10, 2)), CAST(17.60 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1079, 1078, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(80.00 AS Decimal(10, 2)), CAST(18.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1080, 1079, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(79.00 AS Decimal(10, 2)), CAST(18.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1081, 1080, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(80.00 AS Decimal(10, 2)), CAST(17.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1082, 1081, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(98.00 AS Decimal(10, 2)), CAST(20.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1083, 1082, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(107.00 AS Decimal(10, 2)), CAST(19.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1084, 1083, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(98.00 AS Decimal(10, 2)), CAST(19.90 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1085, 1084, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(95.00 AS Decimal(10, 2)), CAST(20.10 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1086, 1085, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(100.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1087, 1086, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(95.00 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1088, 1087, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(99.00 AS Decimal(10, 2)), CAST(20.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1089, 1088, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(101.00 AS Decimal(10, 2)), CAST(19.60 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1090, 1089, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(111.00 AS Decimal(10, 2)), CAST(19.20 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1091, 1090, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(76.00 AS Decimal(10, 2)), CAST(17.70 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1092, 1091, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(147.00 AS Decimal(10, 2)), CAST(21.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(6.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1093, 1092, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(89.00 AS Decimal(10, 2)), CAST(17.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1094, 1093, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(101.00 AS Decimal(10, 2)), CAST(19.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1095, 1094, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(94.00 AS Decimal(10, 2)), CAST(20.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1096, 1095, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(83.00 AS Decimal(10, 2)), CAST(19.30 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1097, 1096, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(104.00 AS Decimal(10, 2)), CAST(22.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1098, 1097, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(90.00 AS Decimal(10, 2)), CAST(20.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1099, 1098, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(122.00 AS Decimal(10, 2)), CAST(20.60 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1100, 1099, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(82.00 AS Decimal(10, 2)), CAST(18.80 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1101, 1100, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(84.00 AS Decimal(10, 2)), CAST(19.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1102, 1101, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(115.00 AS Decimal(10, 2)), CAST(19.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1103, 1102, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(155.00 AS Decimal(10, 2)), CAST(19.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(8.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1104, 1103, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(83.00 AS Decimal(10, 2)), CAST(18.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1105, 1104, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(85.00 AS Decimal(10, 2)), CAST(19.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1106, 1105, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(130.00 AS Decimal(10, 2)), CAST(20.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1107, 1106, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(97.00 AS Decimal(10, 2)), CAST(19.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1108, 1107, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(93.00 AS Decimal(10, 2)), CAST(20.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1109, 1108, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(90.00 AS Decimal(10, 2)), CAST(18.60 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1110, 1109, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(85.00 AS Decimal(10, 2)), CAST(18.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1111, 1110, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(91.00 AS Decimal(10, 2)), CAST(19.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1112, 1111, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(78.00 AS Decimal(10, 2)), CAST(17.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1113, 1112, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(107.00 AS Decimal(10, 2)), CAST(21.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1114, 1113, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(106.00 AS Decimal(10, 2)), CAST(20.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1115, 1114, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(264.00 AS Decimal(10, 2)), CAST(19.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1116, 1115, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(103.00 AS Decimal(10, 2)), CAST(21.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1117, 1116, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(105.00 AS Decimal(10, 2)), CAST(21.20 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1118, 1117, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(116.00 AS Decimal(10, 2)), CAST(23.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1119, 1118, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(192.00 AS Decimal(10, 2)), CAST(20.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(11.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1120, 1119, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(190.00 AS Decimal(10, 2)), CAST(17.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1121, 1120, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(115.00 AS Decimal(10, 2)), CAST(21.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1122, 1121, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(114.00 AS Decimal(10, 2)), CAST(22.80 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1123, 1122, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(108.00 AS Decimal(10, 2)), CAST(20.90 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1124, 1123, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(113.00 AS Decimal(10, 2)), CAST(22.80 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1125, 1124, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(94.00 AS Decimal(10, 2)), CAST(20.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1126, 1125, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(119.00 AS Decimal(10, 2)), CAST(23.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1127, 1126, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(114.00 AS Decimal(10, 2)), CAST(24.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1128, 1127, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(118.00 AS Decimal(10, 2)), CAST(22.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1129, 1128, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(113.00 AS Decimal(10, 2)), CAST(20.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1130, 1129, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(97.00 AS Decimal(10, 2)), CAST(22.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1131, 1130, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(97.00 AS Decimal(10, 2)), CAST(21.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1132, 1131, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(91.00 AS Decimal(10, 2)), CAST(21.10 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1133, 1132, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(88.00 AS Decimal(10, 2)), CAST(20.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1134, 1133, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(87.00 AS Decimal(10, 2)), CAST(19.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1135, 1134, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(101.00 AS Decimal(10, 2)), CAST(22.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1136, 1135, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(86.00 AS Decimal(10, 2)), CAST(20.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1137, 1136, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(106.00 AS Decimal(10, 2)), CAST(20.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1138, 1137, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(80.00 AS Decimal(10, 2)), CAST(18.70 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1139, 1138, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(118.00 AS Decimal(10, 2)), CAST(19.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1140, 1139, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(98.00 AS Decimal(10, 2)), CAST(18.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1141, 1140, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(130.00 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(5.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1142, 1141, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(99.00 AS Decimal(10, 2)), CAST(20.60 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1143, 1142, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(94.00 AS Decimal(10, 2)), CAST(19.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1144, 1143, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(119.00 AS Decimal(10, 2)), CAST(20.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1145, 1144, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(128.00 AS Decimal(10, 2)), CAST(22.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1146, 1145, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(101.00 AS Decimal(10, 2)), CAST(21.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1147, 1146, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(158.00 AS Decimal(10, 2)), CAST(21.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1148, 1147, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(124.00 AS Decimal(10, 2)), CAST(18.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1149, 1148, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(110.00 AS Decimal(10, 2)), CAST(20.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1150, 1149, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(100.00 AS Decimal(10, 2)), CAST(20.10 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1151, 1150, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(101.00 AS Decimal(10, 2)), CAST(20.80 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1152, 1151, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(87.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1153, 1152, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(176.00 AS Decimal(10, 2)), CAST(20.60 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(9.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1154, 1153, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(92.00 AS Decimal(10, 2)), CAST(21.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1155, 1154, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(105.00 AS Decimal(10, 2)), CAST(20.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1156, 1155, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(136.00 AS Decimal(10, 2)), CAST(19.20 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1157, 1156, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(136.00 AS Decimal(10, 2)), CAST(20.30 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(5.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1158, 1157, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(165.00 AS Decimal(10, 2)), CAST(19.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1159, 1158, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(146.00 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1160, 1159, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(142.00 AS Decimal(10, 2)), CAST(16.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1161, 1160, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(100.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1162, 1161, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(100.00 AS Decimal(10, 2)), CAST(19.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1163, 1162, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(97.00 AS Decimal(10, 2)), CAST(18.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1164, 1163, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(95.00 AS Decimal(10, 2)), CAST(19.70 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1165, 1164, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(89.00 AS Decimal(10, 2)), CAST(19.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1166, 1165, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(149.00 AS Decimal(10, 2)), CAST(17.90 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1167, 1166, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(104.00 AS Decimal(10, 2)), CAST(23.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1168, 1167, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(99.00 AS Decimal(10, 2)), CAST(18.40 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1169, 1168, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(97.00 AS Decimal(10, 2)), CAST(18.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1170, 1169, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(97.00 AS Decimal(10, 2)), CAST(21.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1171, 1170, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(157.00 AS Decimal(10, 2)), CAST(19.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1172, 1171, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(116.00 AS Decimal(10, 2)), CAST(19.80 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1173, 1172, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(113.00 AS Decimal(10, 2)), CAST(20.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1174, 1173, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(125.00 AS Decimal(10, 2)), CAST(19.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1175, 1174, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(122.00 AS Decimal(10, 2)), CAST(20.40 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1176, 1175, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(112.00 AS Decimal(10, 2)), CAST(17.70 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1177, 1176, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(108.00 AS Decimal(10, 2)), CAST(18.30 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1178, 1177, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(110.00 AS Decimal(10, 2)), CAST(18.20 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1179, 1178, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(109.00 AS Decimal(10, 2)), CAST(17.90 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1180, 1179, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(130.00 AS Decimal(10, 2)), CAST(23.40 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1181, 1180, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(162.00 AS Decimal(10, 2)), CAST(23.10 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1182, 1181, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(111.00 AS Decimal(10, 2)), CAST(19.70 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1183, 1182, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(134.00 AS Decimal(10, 2)), CAST(23.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1184, 1183, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(127.00 AS Decimal(10, 2)), CAST(21.30 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1185, 1184, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(142.00 AS Decimal(10, 2)), CAST(24.60 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1186, 1185, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(112.00 AS Decimal(10, 2)), CAST(19.30 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1187, 1186, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(140.00 AS Decimal(10, 2)), CAST(24.90 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1188, 1187, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(5.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1189, 1188, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(112.00 AS Decimal(10, 2)), CAST(19.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1190, 1189, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(96.00 AS Decimal(10, 2)), CAST(17.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1191, 1190, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(93.00 AS Decimal(10, 2)), CAST(17.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1192, 1191, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(81.00 AS Decimal(10, 2)), CAST(18.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1193, 1192, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(84.00 AS Decimal(10, 2)), CAST(19.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1194, 1193, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(81.00 AS Decimal(10, 2)), CAST(18.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1195, 1194, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(86.00 AS Decimal(10, 2)), CAST(20.10 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1196, 1195, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(196.00 AS Decimal(10, 2)), CAST(19.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1197, 1196, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(164.00 AS Decimal(10, 2)), CAST(19.90 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1198, 1197, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(137.00 AS Decimal(10, 2)), CAST(19.10 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(6.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1199, 1198, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(102.00 AS Decimal(10, 2)), CAST(20.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1200, 1199, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(93.00 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1201, 1200, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(157.00 AS Decimal(10, 2)), CAST(21.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1202, 1201, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(272.00 AS Decimal(10, 2)), CAST(17.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(22.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1203, 1202, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(263.00 AS Decimal(10, 2)), CAST(18.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1204, 1203, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(102.00 AS Decimal(10, 2)), CAST(19.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1205, 1204, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(103.00 AS Decimal(10, 2)), CAST(23.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1206, 1205, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(149.00 AS Decimal(10, 2)), CAST(23.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1207, 1206, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(138.00 AS Decimal(10, 2)), CAST(23.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1208, 1207, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(119.00 AS Decimal(10, 2)), CAST(19.40 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1209, 1208, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(193.00 AS Decimal(10, 2)), CAST(18.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1210, 1209, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(176.00 AS Decimal(10, 2)), CAST(19.30 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(10.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1211, 1210, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(180.00 AS Decimal(10, 2)), CAST(20.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1212, 1211, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(100.00 AS Decimal(10, 2)), CAST(23.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1213, 1212, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(417.00 AS Decimal(10, 2)), CAST(14.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(39.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1214, 1213, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(410.00 AS Decimal(10, 2)), CAST(16.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(37.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1215, 1214, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(555.00 AS Decimal(10, 2)), CAST(17.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(53.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1216, 1215, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(412.00 AS Decimal(10, 2)), CAST(16.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(37.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1217, 1216, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(396.00 AS Decimal(10, 2)), CAST(19.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(34.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1218, 1217, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(536.00 AS Decimal(10, 2)), CAST(19.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1219, 1218, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(373.00 AS Decimal(10, 2)), CAST(20.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(31.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1220, 1219, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(472.00 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(43.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1221, 1220, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(375.00 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(34.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1222, 1221, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(403.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(35.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1223, 1222, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(392.00 AS Decimal(10, 2)), CAST(14.60 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(36.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1224, 1223, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(111.00 AS Decimal(10, 2)), CAST(26.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1225, 1224, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(105.00 AS Decimal(10, 2)), CAST(22.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1226, 1225, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(95.00 AS Decimal(10, 2)), CAST(18.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1227, 1226, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(155.00 AS Decimal(10, 2)), CAST(17.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1228, 1227, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(214.00 AS Decimal(10, 2)), CAST(15.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(16.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1229, 1228, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(115.00 AS Decimal(10, 2)), CAST(17.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1230, 1229, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(123.00 AS Decimal(10, 2)), CAST(17.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1231, 1230, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(120.00 AS Decimal(10, 2)), CAST(17.60 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1232, 1231, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(105.00 AS Decimal(10, 2)), CAST(16.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1233, 1232, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(101.00 AS Decimal(10, 2)), CAST(17.70 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1234, 1233, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(126.00 AS Decimal(10, 2)), CAST(19.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1235, 1234, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(124.00 AS Decimal(10, 2)), CAST(16.80 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(5.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1236, 1235, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(119.00 AS Decimal(10, 2)), CAST(18.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1237, 1236, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(166.00 AS Decimal(10, 2)), CAST(14.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(11.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1238, 1237, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(201.00 AS Decimal(10, 2)), CAST(13.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(16.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1239, 1238, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(92.00 AS Decimal(10, 2)), CAST(19.90 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1240, 1239, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(79.00 AS Decimal(10, 2)), CAST(17.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1241, 1240, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(76.00 AS Decimal(10, 2)), CAST(17.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1242, 1241, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(77.00 AS Decimal(10, 2)), CAST(17.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1243, 1242, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(47.00 AS Decimal(10, 2)), CAST(10.20 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1244, 1243, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(282.00 AS Decimal(10, 2)), CAST(12.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1245, 1244, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(76.00 AS Decimal(10, 2)), CAST(14.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1246, 1245, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(277.00 AS Decimal(10, 2)), CAST(18.80 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(21.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1247, 1246, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(145.00 AS Decimal(10, 2)), CAST(14.10 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(9.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1248, 1247, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(84.00 AS Decimal(10, 2)), CAST(14.50 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1249, 1248, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(245.00 AS Decimal(10, 2)), CAST(16.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(19.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1250, 1249, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(186.00 AS Decimal(10, 2)), CAST(43.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1251, 1250, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(47.00 AS Decimal(10, 2)), CAST(9.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1252, 1251, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(28.00 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1253, 1252, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(54.00 AS Decimal(10, 2)), CAST(12.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1254, 1253, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(105.00 AS Decimal(10, 2)), CAST(16.80 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1255, 1254, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(184.00 AS Decimal(10, 2)), CAST(21.90 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(10.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1256, 1255, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(256.00 AS Decimal(10, 2)), CAST(26.30 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(15.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1257, 1256, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(193.00 AS Decimal(10, 2)), CAST(23.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(10.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1258, 1257, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(184.00 AS Decimal(10, 2)), CAST(21.50 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(10.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1259, 1258, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(89.00 AS Decimal(10, 2)), CAST(17.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1260, 1259, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(136.00 AS Decimal(10, 2)), CAST(13.60 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1261, 1260, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(99.00 AS Decimal(10, 2)), CAST(22.50 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1262, 1261, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(106.00 AS Decimal(10, 2)), CAST(23.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1263, 1262, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(335.00 AS Decimal(10, 2)), CAST(69.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1264, 1263, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(354.00 AS Decimal(10, 2)), CAST(66.30 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(7.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1265, 1264, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(383.00 AS Decimal(10, 2)), CAST(76.50 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(6.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1266, 1265, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(88.00 AS Decimal(10, 2)), CAST(20.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1267, 1266, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(122.00 AS Decimal(10, 2)), CAST(19.90 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1268, 1267, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(78.00 AS Decimal(10, 2)), CAST(17.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1269, 1268, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(114.00 AS Decimal(10, 2)), CAST(13.80 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1270, 1269, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(83.00 AS Decimal(10, 2)), CAST(16.20 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1271, 1270, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(79.00 AS Decimal(10, 2)), CAST(17.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1272, 1271, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(84.00 AS Decimal(10, 2)), CAST(19.30 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1273, 1272, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(97.00 AS Decimal(10, 2)), CAST(21.30 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1274, 1273, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(97.00 AS Decimal(10, 2)), CAST(21.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1275, 1274, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(96.00 AS Decimal(10, 2)), CAST(20.90 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1276, 1275, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(99.00 AS Decimal(10, 2)), CAST(21.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1277, 1276, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(109.00 AS Decimal(10, 2)), CAST(22.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1278, 1277, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(96.00 AS Decimal(10, 2)), CAST(21.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1279, 1278, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(93.00 AS Decimal(10, 2)), CAST(20.30 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1280, 1279, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(82.00 AS Decimal(10, 2)), CAST(18.70 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1281, 1280, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(100.00 AS Decimal(10, 2)), CAST(22.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1282, 1281, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(95.00 AS Decimal(10, 2)), CAST(20.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1283, 1282, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(92.00 AS Decimal(10, 2)), CAST(20.70 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1284, 1283, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(88.00 AS Decimal(10, 2)), CAST(19.80 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1285, 1284, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(96.00 AS Decimal(10, 2)), CAST(22.10 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1286, 1285, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(67.00 AS Decimal(10, 2)), CAST(14.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1287, 1286, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(93.00 AS Decimal(10, 2)), CAST(21.50 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1288, 1287, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(88.00 AS Decimal(10, 2)), CAST(17.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1289, 1288, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(97.00 AS Decimal(10, 2)), CAST(19.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1290, 1289, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(253.00 AS Decimal(10, 2)), CAST(52.60 AS Decimal(10, 2)), CAST(13.40 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1291, 1290, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(40.00 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1292, 1291, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(52.00 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1293, 1292, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(43.00 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1294, 1293, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(73.00 AS Decimal(10, 2)), CAST(16.30 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1295, 1294, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(44.00 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1296, 1295, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(64.00 AS Decimal(10, 2)), CAST(13.40 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1297, 1296, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(80.00 AS Decimal(10, 2)), CAST(17.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1298, 1297, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(155.00 AS Decimal(10, 2)), CAST(33.60 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1299, 1298, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(264.00 AS Decimal(10, 2)), CAST(57.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1300, 1299, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(257.00 AS Decimal(10, 2)), CAST(54.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1301, 1300, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(122.00 AS Decimal(10, 2)), CAST(20.90 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1302, 1301, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(72.00 AS Decimal(10, 2)), CAST(16.60 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1303, 1302, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(53.00 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1304, 1303, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1305, 1304, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(54.00 AS Decimal(10, 2)), CAST(9.40 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1306, 1305, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(49.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1307, 1306, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(59.00 AS Decimal(10, 2)), CAST(9.80 AS Decimal(10, 2)), CAST(6.70 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1308, 1307, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(55.00 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1309, 1308, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(70.00 AS Decimal(10, 2)), CAST(13.70 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1310, 1309, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(96.00 AS Decimal(10, 2)), CAST(17.80 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1311, 1310, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(263.00 AS Decimal(10, 2)), CAST(43.70 AS Decimal(10, 2)), CAST(23.90 AS Decimal(10, 2)), CAST(8.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1312, 1311, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(53.00 AS Decimal(10, 2)), CAST(8.90 AS Decimal(10, 2)), CAST(5.40 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1313, 1312, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(51.00 AS Decimal(10, 2)), CAST(8.90 AS Decimal(10, 2)), CAST(9.80 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1314, 1313, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(21.00 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1315, 1314, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(37.00 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1316, 1315, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(48.00 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1317, 1316, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(37.00 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1318, 1317, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(46.00 AS Decimal(10, 2)), CAST(8.70 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1319, 1318, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(57.00 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1320, 1319, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(242.00 AS Decimal(10, 2)), CAST(53.70 AS Decimal(10, 2)), CAST(10.80 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1321, 1320, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(256.00 AS Decimal(10, 2)), CAST(58.50 AS Decimal(10, 2)), CAST(15.50 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1322, 1321, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(228.00 AS Decimal(10, 2)), CAST(48.90 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1323, 1322, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(243.00 AS Decimal(10, 2)), CAST(41.00 AS Decimal(10, 2)), CAST(26.20 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1324, 1323, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(57.00 AS Decimal(10, 2)), CAST(12.20 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1325, 1324, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(61.00 AS Decimal(10, 2)), CAST(13.90 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1326, 1325, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(53.00 AS Decimal(10, 2)), CAST(10.50 AS Decimal(10, 2)), CAST(6.60 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1327, 1326, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(61.00 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1328, 1327, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(71.00 AS Decimal(10, 2)), CAST(12.40 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1329, 1328, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(50.00 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1330, 1329, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(72.00 AS Decimal(10, 2)), CAST(16.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1331, 1330, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(100.00 AS Decimal(10, 2)), CAST(20.20 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1332, 1331, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(70.00 AS Decimal(10, 2)), CAST(14.70 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1333, 1332, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(86.00 AS Decimal(10, 2)), CAST(19.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1334, 1333, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(78.00 AS Decimal(10, 2)), CAST(16.90 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1335, 1334, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(95.00 AS Decimal(10, 2)), CAST(21.50 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1336, 1335, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(40.00 AS Decimal(10, 2)), CAST(8.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1337, 1336, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(73.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(5.80 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1338, 1337, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(69.00 AS Decimal(10, 2)), CAST(15.80 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1339, 1338, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(78.00 AS Decimal(10, 2)), CAST(16.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1340, 1339, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(43.00 AS Decimal(10, 2)), CAST(9.80 AS Decimal(10, 2)), CAST(6.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1341, 1340, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(246.00 AS Decimal(10, 2)), CAST(53.20 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1342, 1341, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1343, 1342, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(8.20 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1344, 1343, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(52.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1345, 1344, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1346, 1345, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1347, 1346, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1348, 1347, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(135.00 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(8.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1349, 1348, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(139.00 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1350, 1349, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(132.00 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1351, 1350, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(129.00 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1352, 1351, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(137.00 AS Decimal(10, 2)), CAST(12.20 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(9.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1353, 1352, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(160.00 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1354, 1353, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(132.00 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1355, 1354, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(139.00 AS Decimal(10, 2)), CAST(12.40 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)), CAST(9.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1356, 1355, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(133.00 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(8.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1357, 1356, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(136.00 AS Decimal(10, 2)), CAST(12.30 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1358, 1357, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(134.00 AS Decimal(10, 2)), CAST(12.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1359, 1358, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(143.00 AS Decimal(10, 2)), CAST(12.80 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1360, 1359, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(50.00 AS Decimal(10, 2)), CAST(11.20 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1361, 1360, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(48.00 AS Decimal(10, 2)), CAST(10.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1362, 1361, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(52.00 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1363, 1362, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(47.00 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1364, 1363, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(308.00 AS Decimal(10, 2)), CAST(15.20 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(26.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1365, 1364, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(330.00 AS Decimal(10, 2)), CAST(16.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(28.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1366, 1365, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(286.00 AS Decimal(10, 2)), CAST(14.50 AS Decimal(10, 2)), CAST(5.60 AS Decimal(10, 2)), CAST(24.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1367, 1366, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(344.00 AS Decimal(10, 2)), CAST(15.50 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(30.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1368, 1367, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(314.00 AS Decimal(10, 2)), CAST(16.20 AS Decimal(10, 2)), CAST(5.40 AS Decimal(10, 2)), CAST(27.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1369, 1368, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(137.00 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1370, 1369, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(144.00 AS Decimal(10, 2)), CAST(14.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1371, 1370, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(61.00 AS Decimal(10, 2)), CAST(13.60 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1372, 1371, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(343.00 AS Decimal(10, 2)), CAST(15.50 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(30.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1373, 1372, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(145.00 AS Decimal(10, 2)), CAST(13.70 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(9.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1374, 1373, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(147.00 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(8.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1375, 1374, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(143.00 AS Decimal(10, 2)), CAST(13.80 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(9.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1376, 1375, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(54.00 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1377, 1376, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(344.00 AS Decimal(10, 2)), CAST(15.70 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(30.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1378, 1377, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(134.00 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1379, 1378, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(142.00 AS Decimal(10, 2)), CAST(12.80 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(8.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1380, 1379, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(127.00 AS Decimal(10, 2)), CAST(12.20 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1381, 1380, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(184.00 AS Decimal(10, 2)), CAST(16.40 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)), CAST(11.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1382, 1381, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(191.00 AS Decimal(10, 2)), CAST(15.70 AS Decimal(10, 2)), CAST(6.40 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1383, 1382, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(178.00 AS Decimal(10, 2)), CAST(16.60 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(11.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1384, 1383, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(182.00 AS Decimal(10, 2)), CAST(16.90 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(10.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1385, 1384, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(87.00 AS Decimal(10, 2)), CAST(16.70 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1386, 1385, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(84.00 AS Decimal(10, 2)), CAST(16.60 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1387, 1386, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(89.00 AS Decimal(10, 2)), CAST(16.70 AS Decimal(10, 2)), CAST(5.20 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1388, 1387, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(379.00 AS Decimal(10, 2)), CAST(17.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(33.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1389, 1388, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(376.00 AS Decimal(10, 2)), CAST(16.60 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(33.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1390, 1389, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(382.00 AS Decimal(10, 2)), CAST(17.40 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(33.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1391, 1390, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(288.00 AS Decimal(10, 2)), CAST(26.60 AS Decimal(10, 2)), CAST(5.90 AS Decimal(10, 2)), CAST(17.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1392, 1391, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(147.00 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(10.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1393, 1392, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(162.00 AS Decimal(10, 2)), CAST(14.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(11.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1394, 1393, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(192.00 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1395, 1394, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(161.00 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)), CAST(4.90 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1396, 1395, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(215.00 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)), CAST(16.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1397, 1396, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(64.00 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1398, 1397, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(32.00 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1399, 1398, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(82.00 AS Decimal(10, 2)), CAST(6.40 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1400, 1399, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(80.00 AS Decimal(10, 2)), CAST(5.80 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1401, 1400, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(187.00 AS Decimal(10, 2)), CAST(13.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(14.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1402, 1401, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(198.00 AS Decimal(10, 2)), CAST(13.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1403, 1402, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(47.00 AS Decimal(10, 2)), CAST(10.80 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1404, 1403, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(347.00 AS Decimal(10, 2)), CAST(15.80 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(30.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1405, 1404, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(164.00 AS Decimal(10, 2)), CAST(12.80 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1406, 1405, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(185.00 AS Decimal(10, 2)), CAST(13.30 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(14.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1407, 1406, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(178.00 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(14.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1408, 1407, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(183.00 AS Decimal(10, 2)), CAST(13.70 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(13.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1409, 1408, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(194.00 AS Decimal(10, 2)), CAST(13.70 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(13.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1410, 1409, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(528.00 AS Decimal(10, 2)), CAST(23.60 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(47.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1411, 1410, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(172.00 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1412, 1411, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(163.00 AS Decimal(10, 2)), CAST(12.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1413, 1412, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(160.00 AS Decimal(10, 2)), CAST(13.80 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(10.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1414, 1413, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(173.00 AS Decimal(10, 2)), CAST(13.70 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(12.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1415, 1414, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(238.00 AS Decimal(10, 2)), CAST(16.20 AS Decimal(10, 2)), CAST(11.10 AS Decimal(10, 2)), CAST(14.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1416, 1415, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(439.00 AS Decimal(10, 2)), CAST(28.80 AS Decimal(10, 2)), CAST(20.40 AS Decimal(10, 2)), CAST(26.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1417, 1416, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(96.00 AS Decimal(10, 2)), CAST(10.20 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(5.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1418, 1417, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(179.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1419, 1418, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(73.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1420, 1419, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(63.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1421, 1420, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(62.00 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1422, 1421, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(62.00 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1423, 1422, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(63.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1424, 1423, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(64.00 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1425, 1424, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(64.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1426, 1425, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(62.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1427, 1426, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(64.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(5.20 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1428, 1427, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(65.00 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1429, 1428, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(48.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1430, 1429, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(43.00 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1431, 1430, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(68.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(5.20 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1432, 1431, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(69.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1433, 1432, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(59.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1434, 1433, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(41.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1435, 1434, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(46.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(5.50 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1436, 1435, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(6.30 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1437, 1436, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(5.20 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1438, 1437, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(41.00 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(5.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1439, 1438, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(61.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1440, 1439, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(65.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1441, 1440, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(54.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(8.40 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1442, 1441, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(68.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(8.90 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1443, 1442, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(60.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1444, 1443, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(65.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(9.30 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1445, 1444, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(61.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(10.50 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1446, 1445, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(71.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1447, 1446, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(62.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1448, 1447, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(48.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1449, 1448, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(46.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1450, 1449, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(59.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(9.30 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1451, 1450, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(61.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(9.80 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1452, 1451, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(504.00 AS Decimal(10, 2)), CAST(26.40 AS Decimal(10, 2)), CAST(37.00 AS Decimal(10, 2)), CAST(28.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1453, 1452, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(420.00 AS Decimal(10, 2)), CAST(32.80 AS Decimal(10, 2)), CAST(46.10 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1454, 1453, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(445.00 AS Decimal(10, 2)), CAST(23.70 AS Decimal(10, 2)), CAST(51.60 AS Decimal(10, 2)), CAST(16.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1455, 1454, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(416.00 AS Decimal(10, 2)), CAST(34.60 AS Decimal(10, 2)), CAST(45.60 AS Decimal(10, 2)), CAST(10.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1456, 1455, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(361.00 AS Decimal(10, 2)), CAST(36.20 AS Decimal(10, 2)), CAST(51.20 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1457, 1456, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(360.00 AS Decimal(10, 2)), CAST(38.00 AS Decimal(10, 2)), CAST(48.80 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1458, 1457, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(494.00 AS Decimal(10, 2)), CAST(25.60 AS Decimal(10, 2)), CAST(39.50 AS Decimal(10, 2)), CAST(27.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1459, 1458, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(408.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), CAST(51.00 AS Decimal(10, 2)), CAST(11.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1460, 1459, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(466.00 AS Decimal(10, 2)), CAST(23.20 AS Decimal(10, 2)), CAST(47.30 AS Decimal(10, 2)), CAST(22.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1461, 1460, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(373.00 AS Decimal(10, 2)), CAST(35.90 AS Decimal(10, 2)), CAST(48.90 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1462, 1461, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(481.00 AS Decimal(10, 2)), CAST(22.70 AS Decimal(10, 2)), CAST(45.90 AS Decimal(10, 2)), CAST(23.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1463, 1462, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(365.00 AS Decimal(10, 2)), CAST(32.30 AS Decimal(10, 2)), CAST(56.60 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1464, 1463, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(360.00 AS Decimal(10, 2)), CAST(38.00 AS Decimal(10, 2)), CAST(48.80 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1465, 1464, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(360.00 AS Decimal(10, 2)), CAST(32.80 AS Decimal(10, 2)), CAST(55.40 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1466, 1465, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(360.00 AS Decimal(10, 2)), CAST(35.60 AS Decimal(10, 2)), CAST(52.30 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1467, 1466, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(391.00 AS Decimal(10, 2)), CAST(14.10 AS Decimal(10, 2)), CAST(71.90 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1468, 1467, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(435.00 AS Decimal(10, 2)), CAST(19.80 AS Decimal(10, 2)), CAST(61.40 AS Decimal(10, 2)), CAST(12.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1469, 1468, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(68.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(15.80 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1470, 1469, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(72.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(16.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1471, 1470, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(90.00 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1472, 1471, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(80.00 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(12.60 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1473, 1472, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(73.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(10.40 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1474, 1473, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(88.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1475, 1474, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(73.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(13.60 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1476, 1475, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(63.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(12.10 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1477, 1476, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(37.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1478, 1477, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(68.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(13.80 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1479, 1478, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(34.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(6.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1480, 1479, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(91.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1481, 1480, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(97.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(13.60 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1482, 1481, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(102.00 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)), CAST(15.70 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1483, 1482, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(89.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(15.10 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1484, 1483, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(84.00 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(15.90 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1485, 1484, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(46.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1486, 1485, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(68.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(13.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1487, 1486, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(137.00 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)), CAST(9.10 AS Decimal(10, 2)), CAST(8.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1488, 1487, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(325.00 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)), CAST(56.20 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1489, 1488, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(309.00 AS Decimal(10, 2)), CAST(18.30 AS Decimal(10, 2)), CAST(5.90 AS Decimal(10, 2)), CAST(23.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1490, 1489, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(241.00 AS Decimal(10, 2)), CAST(21.70 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1491, 1490, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(323.00 AS Decimal(10, 2)), CAST(25.10 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(22.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1492, 1491, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(480.00 AS Decimal(10, 2)), CAST(40.40 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(34.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1493, 1492, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(77.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1494, 1493, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(41.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(7.70 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1495, 1494, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(65.00 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1496, 1495, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(48.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1497, 1496, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(59.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1498, 1497, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(59.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(10.30 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1499, 1498, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(75.00 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1500, 1499, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(510.00 AS Decimal(10, 2)), CAST(26.70 AS Decimal(10, 2)), CAST(34.80 AS Decimal(10, 2)), CAST(29.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1501, 1500, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(517.00 AS Decimal(10, 2)), CAST(25.90 AS Decimal(10, 2)), CAST(35.10 AS Decimal(10, 2)), CAST(30.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1502, 1501, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(642.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(71.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1503, 1502, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(885.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(99.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1504, 1503, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(890.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1505, 1504, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(892.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1506, 1505, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(893.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1507, 1506, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(891.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1508, 1507, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(733.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(82.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1509, 1508, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(699.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)), CAST(77.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1510, 1509, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(340.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(39.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1511, 1510, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(725.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(82.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1512, 1511, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(722.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(81.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1513, 1512, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(674.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(76.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1514, 1513, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(94.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(29.60 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1515, 1514, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(884.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1516, 1515, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(880.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1517, 1516, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1518, 1517, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(99.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1519, 1518, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1520, 1519, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1521, 1520, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(820.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(92.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1522, 1521, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(884.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1523, 1522, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(881.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(99.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1524, 1523, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(884.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1525, 1524, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1526, 1525, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(884.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1527, 1526, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1528, 1527, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1529, 1528, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1530, 1529, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(884.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1531, 1530, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(880.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(99.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1532, 1531, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1533, 1532, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1534, 1533, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1535, 1534, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1536, 1535, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1537, 1536, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(884.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1538, 1537, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1539, 1538, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1540, 1539, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(884.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1541, 1540, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(884.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1542, 1541, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1543, 1542, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(887.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(100.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1544, 1543, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1545, 1544, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(385.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1546, 1545, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(387.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1547, 1546, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(384.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.30 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1548, 1547, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(369.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(95.30 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1549, 1548, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(325.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(84.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1550, 1549, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(297.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(76.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1551, 1550, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(300.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(77.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1552, 1551, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(258.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(66.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1553, 1552, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(315.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(81.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1554, 1553, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(308.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(79.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1555, 1554, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(280.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(72.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1556, 1555, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(360.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(93.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1557, 1556, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1558, 1557, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(45.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1559, 1558, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(50.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(12.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1560, 1559, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(47.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(10.70 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1561, 1560, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(57.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(13.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1562, 1561, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(46.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1563, 1562, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(48.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1564, 1563, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(40.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1565, 1564, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(47.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1566, 1565, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(45.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1567, 1566, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1568, 1567, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(47.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(10.90 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1569, 1568, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(51.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(12.20 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1570, 1569, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(22.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1571, 1570, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(35.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1572, 1571, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(28.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1573, 1572, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(43.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1574, 1573, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1575, 1574, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1576, 1575, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(18.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1577, 1576, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(52.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(12.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1578, 1577, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(37.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(9.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1579, 1578, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(51.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(12.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1580, 1579, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(1.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1581, 1580, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(37.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1582, 1581, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(41.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(9.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1583, 1582, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(43.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1584, 1583, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1585, 1584, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(46.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(11.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1586, 1585, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(2.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1587, 1586, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(4.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1588, 1587, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(43.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1589, 1588, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(39.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(8.20 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1590, 1589, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1591, 1590, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(34.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1592, 1591, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(37.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1593, 1592, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1594, 1593, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1595, 1594, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(16.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1596, 1595, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(21.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(5.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1597, 1596, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(36.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1598, 1597, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1599, 1598, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(22.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(5.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1600, 1599, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(27.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1601, 1600, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1602, 1601, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(59.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1603, 1602, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(62.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(9.60 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1604, 1603, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(75.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(12.30 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1605, 1604, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(75.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1606, 1605, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(84.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(14.50 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1607, 1606, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(94.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(17.90 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1608, 1607, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(452.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(82.30 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1609, 1608, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1610, 1609, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(28.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1611, 1610, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1612, 1611, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(49.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1613, 1612, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(33.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1614, 1613, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(45.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1615, 1614, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(39.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(9.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1616, 1615, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(54.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(13.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1617, 1616, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(57.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(14.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1618, 1617, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(28.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1619, 1618, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(52.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1620, 1619, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(318.00 AS Decimal(10, 2)), CAST(16.60 AS Decimal(10, 2)), CAST(71.20 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1621, 1620, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(478.00 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)), CAST(63.60 AS Decimal(10, 2)), CAST(23.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1622, 1621, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(437.00 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(83.00 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1623, 1622, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(397.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1624, 1623, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(399.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(98.70 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1625, 1624, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(295.00 AS Decimal(10, 2)), CAST(23.40 AS Decimal(10, 2)), CAST(63.00 AS Decimal(10, 2)), CAST(6.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1626, 1625, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(415.00 AS Decimal(10, 2)), CAST(20.80 AS Decimal(10, 2)), CAST(43.80 AS Decimal(10, 2)), CAST(22.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1627, 1626, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(297.00 AS Decimal(10, 2)), CAST(34.00 AS Decimal(10, 2)), CAST(41.90 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1628, 1627, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(49.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1629, 1628, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(244.00 AS Decimal(10, 2)), CAST(4.90 AS Decimal(10, 2)), CAST(76.20 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1630, 1629, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(342.00 AS Decimal(10, 2)), CAST(19.50 AS Decimal(10, 2)), CAST(37.00 AS Decimal(10, 2)), CAST(25.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1631, 1630, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(360.00 AS Decimal(10, 2)), CAST(10.10 AS Decimal(10, 2)), CAST(72.90 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1632, 1631, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(268.00 AS Decimal(10, 2)), CAST(8.70 AS Decimal(10, 2)), CAST(68.10 AS Decimal(10, 2)), CAST(8.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1633, 1632, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(265.00 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)), CAST(73.40 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1634, 1633, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(241.00 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(78.80 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1635, 1634, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(271.00 AS Decimal(10, 2)), CAST(24.40 AS Decimal(10, 2)), CAST(49.90 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1636, 1635, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(271.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(63.20 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1637, 1636, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(265.00 AS Decimal(10, 2)), CAST(24.40 AS Decimal(10, 2)), CAST(47.70 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1638, 1637, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(355.00 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)), CAST(82.10 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1639, 1638, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(288.00 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)), CAST(78.80 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1640, 1639, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(320.00 AS Decimal(10, 2)), CAST(5.90 AS Decimal(10, 2)), CAST(59.30 AS Decimal(10, 2)), CAST(13.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1641, 1640, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(325.00 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(67.70 AS Decimal(10, 2)), CAST(6.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1642, 1641, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(302.00 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)), CAST(68.40 AS Decimal(10, 2)), CAST(7.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1643, 1642, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(342.00 AS Decimal(10, 2)), CAST(5.90 AS Decimal(10, 2)), CAST(59.80 AS Decimal(10, 2)), CAST(21.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1644, 1643, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(409.00 AS Decimal(10, 2)), CAST(6.70 AS Decimal(10, 2)), CAST(50.60 AS Decimal(10, 2)), CAST(26.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1645, 1644, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(300.00 AS Decimal(10, 2)), CAST(18.10 AS Decimal(10, 2)), CAST(71.90 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1646, 1645, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(307.00 AS Decimal(10, 2)), CAST(14.70 AS Decimal(10, 2)), CAST(59.10 AS Decimal(10, 2)), CAST(14.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1647, 1646, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(329.00 AS Decimal(10, 2)), CAST(14.60 AS Decimal(10, 2)), CAST(69.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1648, 1647, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(295.00 AS Decimal(10, 2)), CAST(10.40 AS Decimal(10, 2)), CAST(70.50 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1649, 1648, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(222.00 AS Decimal(10, 2)), CAST(23.30 AS Decimal(10, 2)), CAST(46.10 AS Decimal(10, 2)), CAST(5.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1650, 1649, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(264.00 AS Decimal(10, 2)), CAST(10.30 AS Decimal(10, 2)), CAST(53.60 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1651, 1650, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(370.00 AS Decimal(10, 2)), CAST(15.80 AS Decimal(10, 2)), CAST(45.80 AS Decimal(10, 2)), CAST(24.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1652, 1651, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(477.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(47.00 AS Decimal(10, 2)), CAST(28.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1653, 1652, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(513.00 AS Decimal(10, 2)), CAST(30.10 AS Decimal(10, 2)), CAST(19.20 AS Decimal(10, 2)), CAST(38.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1654, 1653, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(344.00 AS Decimal(10, 2)), CAST(13.90 AS Decimal(10, 2)), CAST(58.50 AS Decimal(10, 2)), CAST(14.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1655, 1654, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(505.00 AS Decimal(10, 2)), CAST(5.60 AS Decimal(10, 2)), CAST(45.40 AS Decimal(10, 2)), CAST(34.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1656, 1655, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(489.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(57.10 AS Decimal(10, 2)), CAST(28.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1657, 1656, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(268.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(60.80 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1658, 1657, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(606.00 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(27.80 AS Decimal(10, 2)), CAST(60.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1659, 1658, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(436.00 AS Decimal(10, 2)), CAST(11.70 AS Decimal(10, 2)), CAST(61.20 AS Decimal(10, 2)), CAST(17.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1660, 1659, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(399.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1661, 1660, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(207.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(23.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1662, 1661, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1663, 1662, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(258.00 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)), CAST(68.70 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1664, 1663, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(270.00 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(74.80 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1665, 1664, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(272.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(78.70 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1666, 1665, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(2.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1667, 1666, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(11.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1668, 1667, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(251.00 AS Decimal(10, 2)), CAST(44.50 AS Decimal(10, 2)), CAST(18.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1669, 1668, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(269.00 AS Decimal(10, 2)), CAST(45.00 AS Decimal(10, 2)), CAST(22.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1670, 1669, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(261.00 AS Decimal(10, 2)), CAST(10.80 AS Decimal(10, 2)), CAST(33.30 AS Decimal(10, 2)), CAST(10.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1671, 1670, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(240.00 AS Decimal(10, 2)), CAST(21.90 AS Decimal(10, 2)), CAST(35.80 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1672, 1671, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(362.00 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(24.50 AS Decimal(10, 2)), CAST(23.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1673, 1672, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(339.00 AS Decimal(10, 2)), CAST(14.70 AS Decimal(10, 2)), CAST(14.50 AS Decimal(10, 2)), CAST(24.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1674, 1673, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(49.00 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(6.60 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1675, 1674, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(2.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1676, 1675, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1677, 1676, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(10.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1678, 1677, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(17.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1679, 1678, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(27.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1680, 1679, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(13.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1681, 1680, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(4.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1682, 1681, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(3.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1683, 1682, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(37.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(8.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1684, 1683, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(10.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1685, 1684, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(181.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(45.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1686, 1685, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(90.00 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)), CAST(14.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1687, 1686, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(83.00 AS Decimal(10, 2)), CAST(9.30 AS Decimal(10, 2)), CAST(11.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1688, 1687, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(113.00 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)), CAST(20.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1689, 1688, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(77.00 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)), CAST(11.50 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1690, 1689, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(77.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1691, 1690, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(56.00 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1692, 1691, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(103.00 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1693, 1692, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(146.00 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)), CAST(28.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1694, 1693, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(124.00 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)), CAST(23.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1695, 1694, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(220.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(54.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1696, 1695, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(74.00 AS Decimal(10, 2)), CAST(20.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1697, 1696, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(156.00 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)), CAST(32.20 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1698, 1697, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(64.00 AS Decimal(10, 2)), CAST(10.20 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1699, 1698, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(899.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(99.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1700, 1699, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(883.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1701, 1700, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(55.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(6.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1702, 1701, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(555.00 AS Decimal(10, 2)), CAST(16.70 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)), CAST(51.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1703, 1702, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(505.00 AS Decimal(10, 2)), CAST(17.00 AS Decimal(10, 2)), CAST(22.20 AS Decimal(10, 2)), CAST(38.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1704, 1703, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(397.00 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(38.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1705, 1704, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(477.00 AS Decimal(10, 2)), CAST(12.40 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(42.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1706, 1705, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(209.00 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(17.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1707, 1706, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(386.00 AS Decimal(10, 2)), CAST(14.60 AS Decimal(10, 2)), CAST(6.70 AS Decimal(10, 2)), CAST(34.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1708, 1707, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(382.00 AS Decimal(10, 2)), CAST(13.90 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(35.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1709, 1708, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(218.00 AS Decimal(10, 2)), CAST(6.40 AS Decimal(10, 2)), CAST(49.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1710, 1709, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(620.00 AS Decimal(10, 2)), CAST(20.80 AS Decimal(10, 2)), CAST(21.30 AS Decimal(10, 2)), CAST(52.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1711, 1710, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(667.00 AS Decimal(10, 2)), CAST(13.20 AS Decimal(10, 2)), CAST(11.80 AS Decimal(10, 2)), CAST(64.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1712, 1711, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(59.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1713, 1712, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(79.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(7.70 AS Decimal(10, 2)), CAST(5.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1714, 1713, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(67.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(8.90 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1715, 1714, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(138.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(31.90 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1716, 1715, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(128.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(30.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1717, 1716, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(128.00 AS Decimal(10, 2)), CAST(7.30 AS Decimal(10, 2)), CAST(8.90 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1718, 1717, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(721.00 AS Decimal(10, 2)), CAST(10.20 AS Decimal(10, 2)), CAST(10.40 AS Decimal(10, 2)), CAST(71.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1719, 1718, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(665.00 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)), CAST(66.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1720, 1719, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(64.00 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(6.20 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1721, 1720, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(328.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(70.20 AS Decimal(10, 2)), CAST(5.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1722, 1721, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(80.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(19.50 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1723, 1722, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(226.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(50.30 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1724, 1723, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(155.00 AS Decimal(10, 2)), CAST(5.20 AS Decimal(10, 2)), CAST(32.10 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1725, 1724, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(218.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(43.10 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1726, 1725, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(115.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(28.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1727, 1726, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(212.00 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(44.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1728, 1727, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(102.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(19.70 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1729, 1728, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(114.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1730, 1729, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(227.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(52.60 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1731, 1730, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(279.00 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(21.20 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1732, 1731, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(69.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1733, 1732, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(73.00 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(11.50 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1734, 1733, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(145.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(19.50 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1735, 1734, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(129.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(25.10 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1736, 1735, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(111.00 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(26.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1737, 1736, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(61.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(9.40 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1738, 1737, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(56.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(7.70 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1739, 1738, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(123.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(17.90 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1740, 1739, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(264.00 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)), CAST(19.70 AS Decimal(10, 2)), CAST(17.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1741, 1740, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(660.00 AS Decimal(10, 2)), CAST(12.20 AS Decimal(10, 2)), CAST(10.40 AS Decimal(10, 2)), CAST(64.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1742, 1741, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(170.00 AS Decimal(10, 2)), CAST(14.20 AS Decimal(10, 2)), CAST(12.20 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1743, 1742, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(90.00 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(13.10 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1744, 1743, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(161.00 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)), CAST(35.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1745, 1744, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(24.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1746, 1745, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(497.00 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(51.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1747, 1746, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(185.00 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(23.10 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1748, 1747, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(99.00 AS Decimal(10, 2)), CAST(19.60 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1749, 1748, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(644.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)), CAST(65.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1750, 1749, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(630.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(16.80 AS Decimal(10, 2)), CAST(61.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1751, 1750, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(479.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(44.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1752, 1751, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(631.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(22.90 AS Decimal(10, 2)), CAST(59.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1753, 1752, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(514.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(16.70 AS Decimal(10, 2)), CAST(49.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1754, 1753, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(128.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(26.30 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1755, 1754, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(336.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(17.30 AS Decimal(10, 2)), CAST(29.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1756, 1755, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(206.00 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)), CAST(33.10 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1757, 1756, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(596.00 AS Decimal(10, 2)), CAST(6.70 AS Decimal(10, 2)), CAST(37.60 AS Decimal(10, 2)), CAST(46.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1758, 1757, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(272.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(65.40 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1759, 1758, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(269.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(65.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1760, 1759, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(258.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(60.90 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1761, 1760, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(263.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(64.50 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1762, 1761, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(225.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(54.90 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1763, 1762, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(665.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(15.30 AS Decimal(10, 2)), CAST(60.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1764, 1763, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(653.00 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)), CAST(27.00 AS Decimal(10, 2)), CAST(57.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1765, 1764, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(635.00 AS Decimal(10, 2)), CAST(24.00 AS Decimal(10, 2)), CAST(17.90 AS Decimal(10, 2)), CAST(54.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1766, 1765, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(273.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)), CAST(26.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1767, 1766, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(790.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(85.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1768, 1767, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(586.00 AS Decimal(10, 2)), CAST(20.70 AS Decimal(10, 2)), CAST(17.70 AS Decimal(10, 2)), CAST(56.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1769, 1768, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(262.00 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(26.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1770, 1769, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(242.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(24.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1771, 1770, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(544.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(59.50 AS Decimal(10, 2)), CAST(33.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1772, 1771, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(550.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(57.60 AS Decimal(10, 2)), CAST(34.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1773, 1772, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(450.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(75.20 AS Decimal(10, 2)), CAST(15.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1774, 1773, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(340.00 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)), CAST(70.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1775, 1774, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(320.00 AS Decimal(10, 2)), CAST(8.30 AS Decimal(10, 2)), CAST(71.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1776, 1775, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(345.00 AS Decimal(10, 2)), CAST(10.30 AS Decimal(10, 2)), CAST(74.80 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1777, 1776, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(352.00 AS Decimal(10, 2)), CAST(8.40 AS Decimal(10, 2)), CAST(78.40 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1778, 1777, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(365.00 AS Decimal(10, 2)), CAST(14.40 AS Decimal(10, 2)), CAST(74.60 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1779, 1778, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(304.00 AS Decimal(10, 2)), CAST(46.30 AS Decimal(10, 2)), CAST(40.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1780, 1779, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(218.00 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)), CAST(49.70 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1781, 1780, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(241.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(57.20 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1782, 1781, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(107.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(21.50 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1783, 1782, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(109.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(20.40 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1784, 1783, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(325.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(65.70 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1785, 1784, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(245.00 AS Decimal(10, 2)), CAST(8.70 AS Decimal(10, 2)), CAST(43.20 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1786, 1785, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(347.00 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)), CAST(56.60 AS Decimal(10, 2)), CAST(12.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1787, 1786, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(413.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(57.90 AS Decimal(10, 2)), CAST(18.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1788, 1787, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(386.00 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(55.80 AS Decimal(10, 2)), CAST(15.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1789, 1788, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(327.00 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)), CAST(54.90 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1790, 1789, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(174.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(42.30 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1791, 1790, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(176.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(31.60 AS Decimal(10, 2)), CAST(5.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1792, 1791, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(459.00 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)), CAST(63.60 AS Decimal(10, 2)), CAST(20.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1793, 1792, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(411.00 AS Decimal(10, 2)), CAST(5.70 AS Decimal(10, 2)), CAST(67.40 AS Decimal(10, 2)), CAST(13.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1794, 1793, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(212.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(44.20 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1795, 1794, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(457.00 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)), CAST(44.50 AS Decimal(10, 2)), CAST(26.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1796, 1795, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(481.00 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(62.00 AS Decimal(10, 2)), CAST(24.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1797, 1796, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(421.00 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)), CAST(52.30 AS Decimal(10, 2)), CAST(20.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1798, 1797, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(377.00 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(89.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1799, 1798, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(441.00 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(76.90 AS Decimal(10, 2)), CAST(13.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1800, 1799, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(448.00 AS Decimal(10, 2)), CAST(7.30 AS Decimal(10, 2)), CAST(47.10 AS Decimal(10, 2)), CAST(26.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1801, 1800, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(585.00 AS Decimal(10, 2)), CAST(10.30 AS Decimal(10, 2)), CAST(46.20 AS Decimal(10, 2)), CAST(40.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1802, 1801, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(373.00 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(41.10 AS Decimal(10, 2)), CAST(21.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1803, 1802, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(373.00 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)), CAST(31.90 AS Decimal(10, 2)), CAST(25.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1804, 1803, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(254.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(55.10 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1805, 1804, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(317.00 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)), CAST(44.00 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1806, 1805, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(328.00 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(57.20 AS Decimal(10, 2)), CAST(9.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1807, 1806, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(186.00 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(40.10 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1808, 1807, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(294.00 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(19.10 AS Decimal(10, 2)), CAST(21.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1809, 1808, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(339.00 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)), CAST(40.20 AS Decimal(10, 2)), CAST(18.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1810, 1809, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(327.00 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(21.10 AS Decimal(10, 2)), CAST(25.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1811, 1810, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(345.00 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)), CAST(47.40 AS Decimal(10, 2)), CAST(14.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1812, 1811, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(338.00 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(43.10 AS Decimal(10, 2)), CAST(15.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1813, 1812, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(351.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(39.90 AS Decimal(10, 2)), CAST(18.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1814, 1813, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(274.00 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), CAST(17.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1815, 1814, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(283.00 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)), CAST(48.60 AS Decimal(10, 2)), CAST(6.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1816, 1815, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(283.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(49.20 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1817, 1816, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(313.00 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)), CAST(47.70 AS Decimal(10, 2)), CAST(10.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1818, 1817, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(374.00 AS Decimal(10, 2)), CAST(9.10 AS Decimal(10, 2)), CAST(49.80 AS Decimal(10, 2)), CAST(15.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1819, 1818, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(423.00 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)), CAST(47.60 AS Decimal(10, 2)), CAST(22.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1820, 1819, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(395.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(50.60 AS Decimal(10, 2)), CAST(20.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1821, 1820, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(397.00 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)), CAST(50.30 AS Decimal(10, 2)), CAST(19.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1822, 1821, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(376.00 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)), CAST(51.50 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1823, 1822, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(299.00 AS Decimal(10, 2)), CAST(8.40 AS Decimal(10, 2)), CAST(50.40 AS Decimal(10, 2)), CAST(7.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1824, 1823, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(316.00 AS Decimal(10, 2)), CAST(9.10 AS Decimal(10, 2)), CAST(54.90 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1825, 1824, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(361.00 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(50.50 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1826, 1825, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(340.00 AS Decimal(10, 2)), CAST(8.40 AS Decimal(10, 2)), CAST(59.60 AS Decimal(10, 2)), CAST(7.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1827, 1826, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1828, 1827, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1829, 1828, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(74.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(18.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1830, 1829, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(91.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(22.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1831, 1830, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(1.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1832, 1831, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(52.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(13.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1833, 1832, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(64.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1834, 1833, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(110.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(13.10 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1835, 1834, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(138.00 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)), CAST(13.80 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1836, 1835, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(110.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(17.30 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1837, 1836, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(59.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(10.90 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1838, 1837, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(37.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1839, 1838, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(282.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(67.60 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1840, 1839, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(192.00 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(19.90 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1841, 1840, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(182.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(22.60 AS Decimal(10, 2)), CAST(9.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1842, 1841, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(152.00 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(24.30 AS Decimal(10, 2)), CAST(4.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1843, 1842, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(105.00 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1844, 1843, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(508.00 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)), CAST(66.10 AS Decimal(10, 2)), CAST(24.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1845, 1844, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(514.00 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(62.80 AS Decimal(10, 2)), CAST(27.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1846, 1845, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(487.00 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)), CAST(71.70 AS Decimal(10, 2)), CAST(19.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1847, 1846, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(547.00 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)), CAST(55.50 AS Decimal(10, 2)), CAST(33.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1848, 1847, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(435.00 AS Decimal(10, 2)), CAST(6.30 AS Decimal(10, 2)), CAST(78.30 AS Decimal(10, 2)), CAST(11.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1849, 1848, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(419.00 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)), CAST(79.70 AS Decimal(10, 2)), CAST(8.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1850, 1849, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(506.00 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)), CAST(64.50 AS Decimal(10, 2)), CAST(24.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1851, 1850, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(494.00 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)), CAST(63.80 AS Decimal(10, 2)), CAST(24.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1852, 1851, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(549.00 AS Decimal(10, 2)), CAST(5.20 AS Decimal(10, 2)), CAST(55.80 AS Decimal(10, 2)), CAST(34.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1853, 1852, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(564.00 AS Decimal(10, 2)), CAST(8.30 AS Decimal(10, 2)), CAST(50.30 AS Decimal(10, 2)), CAST(36.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1854, 1853, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(477.00 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)), CAST(61.30 AS Decimal(10, 2)), CAST(21.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1855, 1854, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(485.00 AS Decimal(10, 2)), CAST(5.80 AS Decimal(10, 2)), CAST(72.30 AS Decimal(10, 2)), CAST(19.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1856, 1855, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(484.00 AS Decimal(10, 2)), CAST(5.60 AS Decimal(10, 2)), CAST(60.20 AS Decimal(10, 2)), CAST(24.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1857, 1856, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(546.00 AS Decimal(10, 2)), CAST(9.40 AS Decimal(10, 2)), CAST(54.00 AS Decimal(10, 2)), CAST(32.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1858, 1857, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(486.00 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), CAST(56.90 AS Decimal(10, 2)), CAST(23.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1859, 1858, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(581.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(47.50 AS Decimal(10, 2)), CAST(40.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1860, 1859, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(479.00 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(73.60 AS Decimal(10, 2)), CAST(18.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1861, 1860, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(562.00 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)), CAST(53.80 AS Decimal(10, 2)), CAST(34.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1862, 1861, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(585.00 AS Decimal(10, 2)), CAST(10.90 AS Decimal(10, 2)), CAST(38.70 AS Decimal(10, 2)), CAST(46.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1863, 1862, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(512.00 AS Decimal(10, 2)), CAST(8.40 AS Decimal(10, 2)), CAST(62.90 AS Decimal(10, 2)), CAST(26.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1864, 1863, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(516.00 AS Decimal(10, 2)), CAST(8.50 AS Decimal(10, 2)), CAST(57.00 AS Decimal(10, 2)), CAST(30.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1865, 1864, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(556.00 AS Decimal(10, 2)), CAST(17.90 AS Decimal(10, 2)), CAST(43.30 AS Decimal(10, 2)), CAST(35.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1866, 1865, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(504.00 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)), CAST(55.00 AS Decimal(10, 2)), CAST(26.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1867, 1866, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(470.00 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)), CAST(60.80 AS Decimal(10, 2)), CAST(21.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1868, 1867, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(422.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(71.10 AS Decimal(10, 2)), CAST(14.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1869, 1868, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(411.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(82.60 AS Decimal(10, 2)), CAST(8.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1870, 1869, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(342.00 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)), CAST(78.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1871, 1870, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(424.00 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), CAST(11.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1872, 1871, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(422.00 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(76.70 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1873, 1872, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(438.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(75.60 AS Decimal(10, 2)), CAST(13.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1874, 1873, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(395.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(97.80 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1875, 1874, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(394.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(98.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1876, 1875, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(396.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(98.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1877, 1876, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(357.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(84.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1878, 1877, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(403.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)), CAST(93.70 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1879, 1878, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(399.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(98.30 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1880, 1879, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(372.00 AS Decimal(10, 2)), CAST(23.60 AS Decimal(10, 2)), CAST(61.40 AS Decimal(10, 2)), CAST(5.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1881, 1880, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(451.00 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)), CAST(66.10 AS Decimal(10, 2)), CAST(21.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1882, 1881, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(410.00 AS Decimal(10, 2)), CAST(23.40 AS Decimal(10, 2)), CAST(56.60 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1883, 1882, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(338.00 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)), CAST(78.40 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1884, 1883, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(333.00 AS Decimal(10, 2)), CAST(6.20 AS Decimal(10, 2)), CAST(77.90 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1885, 1884, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(331.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(78.90 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1886, 1885, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(339.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(84.30 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1887, 1886, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(217.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(54.20 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1888, 1887, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(329.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(85.20 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1889, 1888, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(342.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(84.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1890, 1889, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(327.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(84.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1891, 1890, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(377.00 AS Decimal(10, 2)), CAST(35.40 AS Decimal(10, 2)), CAST(19.60 AS Decimal(10, 2)), CAST(18.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1892, 1891, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(454.00 AS Decimal(10, 2)), CAST(16.20 AS Decimal(10, 2)), CAST(36.40 AS Decimal(10, 2)), CAST(28.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1893, 1892, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(419.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(86.10 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1894, 1893, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(430.00 AS Decimal(10, 2)), CAST(15.90 AS Decimal(10, 2)), CAST(65.30 AS Decimal(10, 2)), CAST(11.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1895, 1894, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(401.00 AS Decimal(10, 2)), CAST(6.70 AS Decimal(10, 2)), CAST(33.80 AS Decimal(10, 2)), CAST(26.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1896, 1895, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(81.00 AS Decimal(10, 2)), CAST(4.90 AS Decimal(10, 2)), CAST(9.10 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1897, 1896, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(185.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(29.70 AS Decimal(10, 2)), CAST(5.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1898, 1897, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(143.00 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)), CAST(24.60 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1899, 1898, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(215.00 AS Decimal(10, 2)), CAST(5.80 AS Decimal(10, 2)), CAST(36.60 AS Decimal(10, 2)), CAST(5.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1900, 1899, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(333.00 AS Decimal(10, 2)), CAST(5.90 AS Decimal(10, 2)), CAST(38.30 AS Decimal(10, 2)), CAST(17.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1901, 1900, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(193.00 AS Decimal(10, 2)), CAST(6.30 AS Decimal(10, 2)), CAST(31.70 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1902, 1901, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(234.00 AS Decimal(10, 2)), CAST(8.20 AS Decimal(10, 2)), CAST(30.70 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1903, 1902, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(130.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(26.80 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1904, 1903, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(211.00 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)), CAST(33.60 AS Decimal(10, 2)), CAST(5.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1905, 1904, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(244.00 AS Decimal(10, 2)), CAST(6.60 AS Decimal(10, 2)), CAST(35.50 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1906, 1905, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(192.00 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)), CAST(37.80 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1907, 1906, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(190.00 AS Decimal(10, 2)), CAST(6.70 AS Decimal(10, 2)), CAST(39.10 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1908, 1907, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(135.00 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(27.30 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1909, 1908, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(149.00 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)), CAST(16.70 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1910, 1909, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(162.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(34.80 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1911, 1910, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(153.00 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(33.60 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1912, 1911, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(351.00 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(46.70 AS Decimal(10, 2)), CAST(16.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1913, 1912, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(349.00 AS Decimal(10, 2)), CAST(5.20 AS Decimal(10, 2)), CAST(47.10 AS Decimal(10, 2)), CAST(15.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1914, 1913, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(281.00 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)), CAST(36.60 AS Decimal(10, 2)), CAST(12.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1915, 1914, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(167.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(37.10 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1916, 1915, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(355.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(87.70 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1917, 1916, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(353.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(87.20 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1918, 1917, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(357.00 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)), CAST(81.10 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1919, 1918, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(127.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(29.20 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1920, 1919, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(121.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(29.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1921, 1920, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(193.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(45.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1922, 1921, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(60.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(13.70 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1923, 1922, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(61.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1924, 1923, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(69.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1925, 1924, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(66.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1926, 1925, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(51.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(10.20 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1927, 1926, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(50.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1928, 1927, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(440.00 AS Decimal(10, 2)), CAST(9.10 AS Decimal(10, 2)), CAST(74.30 AS Decimal(10, 2)), CAST(12.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1929, 1928, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(42.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1930, 1929, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(83.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(16.90 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1931, 1930, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(62.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(14.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1932, 1931, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(639.00 AS Decimal(10, 2)), CAST(42.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(53.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1933, 1932, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(137.00 AS Decimal(10, 2)), CAST(20.60 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1934, 1933, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(261.00 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)), CAST(57.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1935, 1934, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(237.00 AS Decimal(10, 2)), CAST(8.30 AS Decimal(10, 2)), CAST(50.40 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1936, 1935, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(268.00 AS Decimal(10, 2)), CAST(8.30 AS Decimal(10, 2)), CAST(58.20 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1937, 1936, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(306.00 AS Decimal(10, 2)), CAST(10.70 AS Decimal(10, 2)), CAST(64.30 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1938, 1937, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(303.00 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)), CAST(62.30 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1939, 1938, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(345.00 AS Decimal(10, 2)), CAST(11.70 AS Decimal(10, 2)), CAST(72.40 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1940, 1939, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(461.00 AS Decimal(10, 2)), CAST(9.40 AS Decimal(10, 2)), CAST(55.00 AS Decimal(10, 2)), CAST(22.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1941, 1940, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(347.00 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(72.50 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1942, 1941, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(359.00 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)), CAST(76.30 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1943, 1942, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(347.00 AS Decimal(10, 2)), CAST(12.10 AS Decimal(10, 2)), CAST(73.80 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1944, 1943, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(355.00 AS Decimal(10, 2)), CAST(13.80 AS Decimal(10, 2)), CAST(72.60 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1945, 1944, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(351.00 AS Decimal(10, 2)), CAST(11.80 AS Decimal(10, 2)), CAST(74.40 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1946, 1945, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(473.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(58.50 AS Decimal(10, 2)), CAST(22.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1947, 1946, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(352.00 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(74.80 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1948, 1947, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(265.00 AS Decimal(10, 2)), CAST(8.40 AS Decimal(10, 2)), CAST(56.20 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1949, 1948, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(290.00 AS Decimal(10, 2)), CAST(9.10 AS Decimal(10, 2)), CAST(62.10 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1950, 1949, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(281.00 AS Decimal(10, 2)), CAST(10.10 AS Decimal(10, 2)), CAST(60.10 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1951, 1950, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(162.00 AS Decimal(10, 2)), CAST(5.50 AS Decimal(10, 2)), CAST(31.20 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1952, 1951, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(153.00 AS Decimal(10, 2)), CAST(6.40 AS Decimal(10, 2)), CAST(31.90 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1953, 1952, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(126.00 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)), CAST(28.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1954, 1953, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(119.00 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(24.60 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1955, 1954, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(341.00 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)), CAST(70.60 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1956, 1955, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(148.00 AS Decimal(10, 2)), CAST(6.30 AS Decimal(10, 2)), CAST(28.60 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1957, 1956, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(147.00 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(23.70 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1958, 1957, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(470.00 AS Decimal(10, 2)), CAST(9.60 AS Decimal(10, 2)), CAST(53.60 AS Decimal(10, 2)), CAST(24.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1959, 1958, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(471.00 AS Decimal(10, 2)), CAST(9.60 AS Decimal(10, 2)), CAST(55.50 AS Decimal(10, 2)), CAST(23.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1960, 1959, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(119.00 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1961, 1960, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(213.00 AS Decimal(10, 2)), CAST(8.90 AS Decimal(10, 2)), CAST(23.10 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1962, 1961, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(206.00 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)), CAST(22.10 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1963, 1962, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(225.00 AS Decimal(10, 2)), CAST(8.40 AS Decimal(10, 2)), CAST(23.00 AS Decimal(10, 2)), CAST(11.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1964, 1963, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(221.00 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)), CAST(26.00 AS Decimal(10, 2)), CAST(9.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1965, 1964, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(216.00 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)), CAST(22.70 AS Decimal(10, 2)), CAST(10.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1966, 1965, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(169.00 AS Decimal(10, 2)), CAST(8.70 AS Decimal(10, 2)), CAST(25.80 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1967, 1966, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(193.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(20.80 AS Decimal(10, 2)), CAST(8.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1968, 1967, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(231.00 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(28.90 AS Decimal(10, 2)), CAST(10.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1969, 1968, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(204.00 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(32.90 AS Decimal(10, 2)), CAST(5.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1970, 1969, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(186.00 AS Decimal(10, 2)), CAST(9.10 AS Decimal(10, 2)), CAST(24.50 AS Decimal(10, 2)), CAST(6.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1971, 1970, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(234.00 AS Decimal(10, 2)), CAST(11.10 AS Decimal(10, 2)), CAST(20.50 AS Decimal(10, 2)), CAST(12.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1972, 1971, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(228.00 AS Decimal(10, 2)), CAST(9.10 AS Decimal(10, 2)), CAST(13.30 AS Decimal(10, 2)), CAST(16.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1973, 1972, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(144.00 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)), CAST(7.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1974, 1973, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(235.00 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)), CAST(26.20 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1975, 1974, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(196.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(19.70 AS Decimal(10, 2)), CAST(10.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1976, 1975, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(264.00 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)), CAST(47.00 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1977, 1976, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(297.00 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)), CAST(37.20 AS Decimal(10, 2)), CAST(13.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1978, 1977, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(258.00 AS Decimal(10, 2)), CAST(6.60 AS Decimal(10, 2)), CAST(51.10 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1979, 1978, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(243.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(51.80 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1980, 1979, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(340.00 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(51.70 AS Decimal(10, 2)), CAST(11.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1981, 1980, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(288.00 AS Decimal(10, 2)), CAST(7.90 AS Decimal(10, 2)), CAST(52.80 AS Decimal(10, 2)), CAST(5.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1982, 1981, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(262.00 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)), CAST(46.00 AS Decimal(10, 2)), CAST(6.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1983, 1982, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(265.00 AS Decimal(10, 2)), CAST(10.80 AS Decimal(10, 2)), CAST(46.10 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1984, 1983, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(263.00 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)), CAST(38.20 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1985, 1984, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(229.00 AS Decimal(10, 2)), CAST(10.10 AS Decimal(10, 2)), CAST(16.30 AS Decimal(10, 2)), CAST(14.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1986, 1985, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(239.00 AS Decimal(10, 2)), CAST(9.60 AS Decimal(10, 2)), CAST(15.90 AS Decimal(10, 2)), CAST(15.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1987, 1986, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(232.00 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)), CAST(41.40 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1988, 1987, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(203.00 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(32.90 AS Decimal(10, 2)), CAST(5.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1989, 1988, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(274.00 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(57.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1990, 1989, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(246.00 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)), CAST(51.30 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1991, 1990, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(150.00 AS Decimal(10, 2)), CAST(5.70 AS Decimal(10, 2)), CAST(31.50 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1992, 1991, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(224.00 AS Decimal(10, 2)), CAST(5.70 AS Decimal(10, 2)), CAST(47.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1993, 1992, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(296.00 AS Decimal(10, 2)), CAST(9.60 AS Decimal(10, 2)), CAST(47.30 AS Decimal(10, 2)), CAST(8.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1994, 1993, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(230.00 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1995, 1994, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(279.00 AS Decimal(10, 2)), CAST(8.90 AS Decimal(10, 2)), CAST(54.50 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1996, 1995, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(272.00 AS Decimal(10, 2)), CAST(10.90 AS Decimal(10, 2)), CAST(28.20 AS Decimal(10, 2)), CAST(13.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1997, 1996, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(266.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(35.90 AS Decimal(10, 2)), CAST(8.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1998, 1997, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(206.00 AS Decimal(10, 2)), CAST(9.30 AS Decimal(10, 2)), CAST(27.70 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (1999, 1998, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(300.00 AS Decimal(10, 2)), CAST(8.30 AS Decimal(10, 2)), CAST(46.90 AS Decimal(10, 2)), CAST(9.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2000, 1999, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(255.00 AS Decimal(10, 2)), CAST(9.10 AS Decimal(10, 2)), CAST(48.50 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2001, 2000, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(228.00 AS Decimal(10, 2)), CAST(5.70 AS Decimal(10, 2)), CAST(43.70 AS Decimal(10, 2)), CAST(3.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2002, 2001, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(320.00 AS Decimal(10, 2)), CAST(9.10 AS Decimal(10, 2)), CAST(51.10 AS Decimal(10, 2)), CAST(9.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2003, 2002, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(214.00 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)), CAST(19.50 AS Decimal(10, 2)), CAST(12.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2004, 2003, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(375.00 AS Decimal(10, 2)), CAST(8.30 AS Decimal(10, 2)), CAST(48.50 AS Decimal(10, 2)), CAST(16.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2005, 2004, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(163.00 AS Decimal(10, 2)), CAST(4.30 AS Decimal(10, 2)), CAST(25.20 AS Decimal(10, 2)), CAST(5.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2006, 2005, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(223.00 AS Decimal(10, 2)), CAST(9.60 AS Decimal(10, 2)), CAST(23.30 AS Decimal(10, 2)), CAST(10.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2007, 2006, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(324.00 AS Decimal(10, 2)), CAST(6.20 AS Decimal(10, 2)), CAST(23.10 AS Decimal(10, 2)), CAST(23.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2008, 2007, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(183.00 AS Decimal(10, 2)), CAST(9.90 AS Decimal(10, 2)), CAST(15.30 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2009, 2008, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(208.00 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(30.40 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2010, 2009, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(189.00 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)), CAST(36.80 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2011, 2010, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(548.00 AS Decimal(10, 2)), CAST(10.10 AS Decimal(10, 2)), CAST(37.30 AS Decimal(10, 2)), CAST(40.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2012, 2011, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(266.00 AS Decimal(10, 2)), CAST(5.10 AS Decimal(10, 2)), CAST(31.50 AS Decimal(10, 2)), CAST(13.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2013, 2012, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(191.00 AS Decimal(10, 2)), CAST(4.90 AS Decimal(10, 2)), CAST(19.70 AS Decimal(10, 2)), CAST(10.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2014, 2013, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(261.00 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(19.70 AS Decimal(10, 2)), CAST(17.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2015, 2014, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(143.00 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(15.70 AS Decimal(10, 2)), CAST(6.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2016, 2015, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(112.00 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(19.80 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2017, 2016, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(212.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(52.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2018, 2017, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(345.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(86.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2019, 2018, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(175.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(29.00 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2020, 2019, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(144.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), CAST(25.50 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2021, 2020, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(360.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(89.70 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2022, 2021, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(57.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(13.10 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2023, 2022, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(108.00 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(5.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2024, 2023, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(30.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(5.80 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2025, 2024, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(87.00 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(18.80 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2026, 2025, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(276.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(41.40 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2027, 2026, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(52.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2028, 2027, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2029, 2028, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(400.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2030, 2029, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(8.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2031, 2030, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(188.00 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(38.90 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2032, 2031, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(18.00 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2033, 2032, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(90.00 AS Decimal(10, 2)), CAST(5.50 AS Decimal(10, 2)), CAST(20.80 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2034, 2033, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(21.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2035, 2034, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(14.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2036, 2035, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(24.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2037, 2036, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(85.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(18.10 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2038, 2037, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(15.00 AS Decimal(10, 2)), CAST(1.10 AS Decimal(10, 2)), CAST(3.10 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2039, 2038, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(46.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2040, 2039, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(29.00 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), CAST(5.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2041, 2040, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(47.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2042, 2041, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2043, 2042, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(19.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(4.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2044, 2043, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(25.00 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(4.30 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2045, 2044, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(27.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2046, 2045, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(356.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(90.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2047, 2046, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(349.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(87.50 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2048, 2047, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(347.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(86.90 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2049, 2048, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(257.00 AS Decimal(10, 2)), CAST(10.50 AS Decimal(10, 2)), CAST(43.50 AS Decimal(10, 2)), CAST(6.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2050, 2049, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(165.00 AS Decimal(10, 2)), CAST(18.30 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2051, 2050, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(192.00 AS Decimal(10, 2)), CAST(19.30 AS Decimal(10, 2)), CAST(6.20 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2052, 2051, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(155.00 AS Decimal(10, 2)), CAST(17.40 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2053, 2052, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(197.00 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2054, 2053, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(208.00 AS Decimal(10, 2)), CAST(25.30 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2055, 2054, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(383.00 AS Decimal(10, 2)), CAST(19.20 AS Decimal(10, 2)), CAST(4.90 AS Decimal(10, 2)), CAST(32.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2056, 2055, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(215.00 AS Decimal(10, 2)), CAST(20.40 AS Decimal(10, 2)), CAST(12.80 AS Decimal(10, 2)), CAST(11.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2057, 2056, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(419.00 AS Decimal(10, 2)), CAST(11.70 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), CAST(19.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2058, 2057, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(195.00 AS Decimal(10, 2)), CAST(13.40 AS Decimal(10, 2)), CAST(6.30 AS Decimal(10, 2)), CAST(13.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2059, 2058, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(87.00 AS Decimal(10, 2)), CAST(8.50 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(3.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2060, 2059, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(93.00 AS Decimal(10, 2)), CAST(9.60 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(5.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2061, 2060, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(127.00 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(3.90 AS Decimal(10, 2)), CAST(7.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2062, 2061, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(158.00 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(13.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2063, 2062, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(51.00 AS Decimal(10, 2)), CAST(4.90 AS Decimal(10, 2)), CAST(1.60 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2064, 2063, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(79.00 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2065, 2064, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(106.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(4.80 AS Decimal(10, 2)), CAST(5.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2066, 2065, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(199.00 AS Decimal(10, 2)), CAST(23.90 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(10.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2067, 2066, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(203.00 AS Decimal(10, 2)), CAST(14.20 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(8.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2068, 2067, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(204.00 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(15.50 AS Decimal(10, 2)), CAST(11.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2069, 2068, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(191.00 AS Decimal(10, 2)), CAST(10.70 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2070, 2069, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(191.00 AS Decimal(10, 2)), CAST(7.60 AS Decimal(10, 2)), CAST(43.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2071, 2070, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(222.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)), CAST(49.50 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2072, 2071, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(318.00 AS Decimal(10, 2)), CAST(6.60 AS Decimal(10, 2)), CAST(74.50 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2073, 2072, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(114.00 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(22.10 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2074, 2073, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(434.00 AS Decimal(10, 2)), CAST(26.90 AS Decimal(10, 2)), CAST(46.30 AS Decimal(10, 2)), CAST(20.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2075, 2074, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(56.00 AS Decimal(10, 2)), CAST(3.20 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2076, 2075, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(55.00 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2077, 2076, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(37.00 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2078, 2077, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(68.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2079, 2078, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(43.00 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2080, 2079, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(409.00 AS Decimal(10, 2)), CAST(37.40 AS Decimal(10, 2)), CAST(32.50 AS Decimal(10, 2)), CAST(17.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2081, 2080, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(253.00 AS Decimal(10, 2)), CAST(17.20 AS Decimal(10, 2)), CAST(16.50 AS Decimal(10, 2)), CAST(13.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2082, 2081, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(121.00 AS Decimal(10, 2)), CAST(15.90 AS Decimal(10, 2)), CAST(9.40 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2083, 2082, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(147.00 AS Decimal(10, 2)), CAST(16.50 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(4.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2084, 2083, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(148.00 AS Decimal(10, 2)), CAST(15.30 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2085, 2084, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(113.00 AS Decimal(10, 2)), CAST(18.90 AS Decimal(10, 2)), CAST(4.10 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2086, 2085, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(145.00 AS Decimal(10, 2)), CAST(16.20 AS Decimal(10, 2)), CAST(11.50 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2087, 2086, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(134.00 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(6.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2088, 2087, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(372.00 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(35.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2089, 2088, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(525.00 AS Decimal(10, 2)), CAST(18.50 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)), CAST(49.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2090, 2089, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(377.00 AS Decimal(10, 2)), CAST(26.70 AS Decimal(10, 2)), CAST(6.40 AS Decimal(10, 2)), CAST(27.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2091, 2090, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(119.00 AS Decimal(10, 2)), CAST(21.10 AS Decimal(10, 2)), CAST(2.60 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2092, 2091, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(237.00 AS Decimal(10, 2)), CAST(28.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(15.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2093, 2092, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(167.00 AS Decimal(10, 2)), CAST(26.80 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2094, 2093, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(252.00 AS Decimal(10, 2)), CAST(31.20 AS Decimal(10, 2)), CAST(13.90 AS Decimal(10, 2)), CAST(7.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2095, 2094, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(335.00 AS Decimal(10, 2)), CAST(30.30 AS Decimal(10, 2)), CAST(41.80 AS Decimal(10, 2)), CAST(5.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2096, 2095, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(335.00 AS Decimal(10, 2)), CAST(38.00 AS Decimal(10, 2)), CAST(29.90 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2097, 2096, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(329.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), CAST(41.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2098, 2097, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(345.00 AS Decimal(10, 2)), CAST(43.20 AS Decimal(10, 2)), CAST(25.10 AS Decimal(10, 2)), CAST(7.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2099, 2098, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(298.00 AS Decimal(10, 2)), CAST(20.70 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)), CAST(20.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2100, 2099, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(354.00 AS Decimal(10, 2)), CAST(17.00 AS Decimal(10, 2)), CAST(12.30 AS Decimal(10, 2)), CAST(26.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2101, 2100, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(387.00 AS Decimal(10, 2)), CAST(16.60 AS Decimal(10, 2)), CAST(17.70 AS Decimal(10, 2)), CAST(27.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2102, 2101, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(289.00 AS Decimal(10, 2)), CAST(19.40 AS Decimal(10, 2)), CAST(19.30 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2103, 2102, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(362.00 AS Decimal(10, 2)), CAST(15.10 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)), CAST(28.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2104, 2103, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(283.00 AS Decimal(10, 2)), CAST(22.40 AS Decimal(10, 2)), CAST(11.80 AS Decimal(10, 2)), CAST(16.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2105, 2104, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(459.00 AS Decimal(10, 2)), CAST(13.90 AS Decimal(10, 2)), CAST(15.90 AS Decimal(10, 2)), CAST(37.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2106, 2105, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(257.00 AS Decimal(10, 2)), CAST(13.30 AS Decimal(10, 2)), CAST(10.20 AS Decimal(10, 2)), CAST(18.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2107, 2106, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(272.00 AS Decimal(10, 2)), CAST(15.90 AS Decimal(10, 2)), CAST(4.60 AS Decimal(10, 2)), CAST(21.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2108, 2107, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(248.00 AS Decimal(10, 2)), CAST(14.80 AS Decimal(10, 2)), CAST(7.40 AS Decimal(10, 2)), CAST(17.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2109, 2108, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(223.00 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)), CAST(20.90 AS Decimal(10, 2)), CAST(11.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2110, 2109, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(244.00 AS Decimal(10, 2)), CAST(16.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(20.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2111, 2110, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(202.00 AS Decimal(10, 2)), CAST(10.50 AS Decimal(10, 2)), CAST(12.30 AS Decimal(10, 2)), CAST(12.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2112, 2111, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(246.00 AS Decimal(10, 2)), CAST(14.40 AS Decimal(10, 2)), CAST(6.30 AS Decimal(10, 2)), CAST(18.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2113, 2112, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(228.00 AS Decimal(10, 2)), CAST(15.30 AS Decimal(10, 2)), CAST(12.60 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2114, 2113, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(441.00 AS Decimal(10, 2)), CAST(33.40 AS Decimal(10, 2)), CAST(20.30 AS Decimal(10, 2)), CAST(25.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2115, 2114, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(513.00 AS Decimal(10, 2)), CAST(33.00 AS Decimal(10, 2)), CAST(31.60 AS Decimal(10, 2)), CAST(28.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2116, 2115, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(442.00 AS Decimal(10, 2)), CAST(26.70 AS Decimal(10, 2)), CAST(53.20 AS Decimal(10, 2)), CAST(14.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2117, 2116, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(245.00 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)), CAST(18.90 AS Decimal(10, 2)), CAST(14.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2118, 2117, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(181.00 AS Decimal(10, 2)), CAST(6.40 AS Decimal(10, 2)), CAST(18.30 AS Decimal(10, 2)), CAST(9.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2119, 2118, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(145.00 AS Decimal(10, 2)), CAST(16.60 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2120, 2119, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(162.00 AS Decimal(10, 2)), CAST(12.70 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2121, 2120, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(203.00 AS Decimal(10, 2)), CAST(13.70 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(11.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2122, 2121, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(211.00 AS Decimal(10, 2)), CAST(16.20 AS Decimal(10, 2)), CAST(15.80 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2123, 2122, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(158.00 AS Decimal(10, 2)), CAST(12.80 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(6.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2124, 2123, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(99.00 AS Decimal(10, 2)), CAST(8.50 AS Decimal(10, 2)), CAST(10.70 AS Decimal(10, 2)), CAST(2.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2125, 2124, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(123.00 AS Decimal(10, 2)), CAST(10.80 AS Decimal(10, 2)), CAST(14.70 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2126, 2125, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(185.00 AS Decimal(10, 2)), CAST(5.50 AS Decimal(10, 2)), CAST(24.90 AS Decimal(10, 2)), CAST(7.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2127, 2126, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(143.00 AS Decimal(10, 2)), CAST(13.40 AS Decimal(10, 2)), CAST(20.40 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2128, 2127, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(123.00 AS Decimal(10, 2)), CAST(9.60 AS Decimal(10, 2)), CAST(17.30 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2129, 2128, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(144.00 AS Decimal(10, 2)), CAST(8.30 AS Decimal(10, 2)), CAST(27.70 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2130, 2129, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(179.00 AS Decimal(10, 2)), CAST(11.30 AS Decimal(10, 2)), CAST(17.00 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2131, 2130, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(178.00 AS Decimal(10, 2)), CAST(15.30 AS Decimal(10, 2)), CAST(14.70 AS Decimal(10, 2)), CAST(6.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2132, 2131, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(209.00 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(17.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2133, 2132, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(125.00 AS Decimal(10, 2)), CAST(13.80 AS Decimal(10, 2)), CAST(17.10 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2134, 2133, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(153.00 AS Decimal(10, 2)), CAST(10.30 AS Decimal(10, 2)), CAST(16.00 AS Decimal(10, 2)), CAST(5.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2135, 2134, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(143.00 AS Decimal(10, 2)), CAST(15.70 AS Decimal(10, 2)), CAST(19.20 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2136, 2135, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(177.00 AS Decimal(10, 2)), CAST(12.40 AS Decimal(10, 2)), CAST(19.20 AS Decimal(10, 2)), CAST(5.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2137, 2136, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(231.00 AS Decimal(10, 2)), CAST(12.30 AS Decimal(10, 2)), CAST(11.50 AS Decimal(10, 2)), CAST(15.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2138, 2137, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(182.00 AS Decimal(10, 2)), CAST(12.10 AS Decimal(10, 2)), CAST(2.10 AS Decimal(10, 2)), CAST(14.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2139, 2138, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(201.00 AS Decimal(10, 2)), CAST(11.60 AS Decimal(10, 2)), CAST(16.70 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2140, 2139, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(277.00 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(19.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2141, 2140, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(273.00 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)), CAST(19.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2142, 2141, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(321.00 AS Decimal(10, 2)), CAST(12.80 AS Decimal(10, 2)), CAST(14.50 AS Decimal(10, 2)), CAST(23.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2143, 2142, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(118.00 AS Decimal(10, 2)), CAST(9.30 AS Decimal(10, 2)), CAST(18.60 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2144, 2143, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(115.00 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(15.50 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2145, 2144, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(125.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(17.60 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2146, 2145, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(175.00 AS Decimal(10, 2)), CAST(12.40 AS Decimal(10, 2)), CAST(21.00 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2147, 2146, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(223.00 AS Decimal(10, 2)), CAST(11.20 AS Decimal(10, 2)), CAST(17.10 AS Decimal(10, 2)), CAST(12.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2148, 2147, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(126.00 AS Decimal(10, 2)), CAST(11.40 AS Decimal(10, 2)), CAST(9.40 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2149, 2148, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(104.00 AS Decimal(10, 2)), CAST(21.90 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(1.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2150, 2149, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(685.00 AS Decimal(10, 2)), CAST(33.80 AS Decimal(10, 2)), CAST(1.50 AS Decimal(10, 2)), CAST(60.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2151, 2150, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(470.00 AS Decimal(10, 2)), CAST(28.20 AS Decimal(10, 2)), CAST(43.80 AS Decimal(10, 2)), CAST(20.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2152, 2151, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(481.00 AS Decimal(10, 2)), CAST(31.30 AS Decimal(10, 2)), CAST(37.40 AS Decimal(10, 2)), CAST(22.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2153, 2152, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(452.00 AS Decimal(10, 2)), CAST(29.00 AS Decimal(10, 2)), CAST(35.30 AS Decimal(10, 2)), CAST(21.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2154, 2153, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(258.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(24.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2155, 2154, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(115.00 AS Decimal(10, 2)), CAST(17.60 AS Decimal(10, 2)), CAST(2.80 AS Decimal(10, 2)), CAST(3.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2156, 2155, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(630.00 AS Decimal(10, 2)), CAST(23.30 AS Decimal(10, 2)), CAST(18.00 AS Decimal(10, 2)), CAST(53.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2157, 2156, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(545.00 AS Decimal(10, 2)), CAST(9.70 AS Decimal(10, 2)), CAST(47.10 AS Decimal(10, 2)), CAST(36.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2158, 2157, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(689.00 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(62.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2159, 2158, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(762.00 AS Decimal(10, 2)), CAST(9.40 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(76.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2160, 2159, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(711.00 AS Decimal(10, 2)), CAST(14.40 AS Decimal(10, 2)), CAST(14.70 AS Decimal(10, 2)), CAST(67.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2161, 2160, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(198.00 AS Decimal(10, 2)), CAST(4.20 AS Decimal(10, 2)), CAST(46.30 AS Decimal(10, 2)), CAST(0.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2162, 2161, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(596.00 AS Decimal(10, 2)), CAST(17.60 AS Decimal(10, 2)), CAST(34.30 AS Decimal(10, 2)), CAST(43.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2163, 2162, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(496.00 AS Decimal(10, 2)), CAST(31.10 AS Decimal(10, 2)), CAST(23.80 AS Decimal(10, 2)), CAST(34.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2164, 2163, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(525.00 AS Decimal(10, 2)), CAST(29.50 AS Decimal(10, 2)), CAST(22.50 AS Decimal(10, 2)), CAST(37.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2165, 2164, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(550.00 AS Decimal(10, 2)), CAST(28.20 AS Decimal(10, 2)), CAST(28.10 AS Decimal(10, 2)), CAST(38.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2166, 2165, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(288.00 AS Decimal(10, 2)), CAST(10.60 AS Decimal(10, 2)), CAST(2.90 AS Decimal(10, 2)), CAST(26.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2167, 2166, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(373.00 AS Decimal(10, 2)), CAST(14.20 AS Decimal(10, 2)), CAST(28.80 AS Decimal(10, 2)), CAST(23.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2168, 2167, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(609.00 AS Decimal(10, 2)), CAST(28.90 AS Decimal(10, 2)), CAST(18.00 AS Decimal(10, 2)), CAST(48.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2169, 2168, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(592.00 AS Decimal(10, 2)), CAST(21.10 AS Decimal(10, 2)), CAST(31.80 AS Decimal(10, 2)), CAST(43.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2170, 2169, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(537.00 AS Decimal(10, 2)), CAST(28.80 AS Decimal(10, 2)), CAST(29.60 AS Decimal(10, 2)), CAST(35.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2171, 2170, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(590.00 AS Decimal(10, 2)), CAST(30.40 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)), CAST(47.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2172, 2171, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(594.00 AS Decimal(10, 2)), CAST(25.90 AS Decimal(10, 2)), CAST(19.50 AS Decimal(10, 2)), CAST(47.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2173, 2172, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(524.00 AS Decimal(10, 2)), CAST(26.80 AS Decimal(10, 2)), CAST(25.80 AS Decimal(10, 2)), CAST(39.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2174, 2173, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(602.00 AS Decimal(10, 2)), CAST(25.90 AS Decimal(10, 2)), CAST(17.80 AS Decimal(10, 2)), CAST(49.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2175, 2174, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(223.00 AS Decimal(10, 2)), CAST(5.70 AS Decimal(10, 2)), CAST(51.40 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2176, 2175, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(233.00 AS Decimal(10, 2)), CAST(22.80 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(14.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2177, 2176, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(217.00 AS Decimal(10, 2)), CAST(18.80 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(14.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2178, 2177, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(304.00 AS Decimal(10, 2)), CAST(31.10 AS Decimal(10, 2)), CAST(5.30 AS Decimal(10, 2)), CAST(17.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2179, 2178, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(352.00 AS Decimal(10, 2)), CAST(15.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(32.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2180, 2179, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(285.00 AS Decimal(10, 2)), CAST(18.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(23.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2181, 2180, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(68.00 AS Decimal(10, 2)), CAST(22.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2182, 2181, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(272.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), CAST(18.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2183, 2182, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(224.00 AS Decimal(10, 2)), CAST(17.40 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(17.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2184, 2183, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(281.00 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)), CAST(24.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2185, 2184, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(296.00 AS Decimal(10, 2)), CAST(17.00 AS Decimal(10, 2)), CAST(9.80 AS Decimal(10, 2)), CAST(21.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2186, 2185, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(170.00 AS Decimal(10, 2)), CAST(12.90 AS Decimal(10, 2)), CAST(19.00 AS Decimal(10, 2)), CAST(4.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2187, 2186, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(416.00 AS Decimal(10, 2)), CAST(46.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(27.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2188, 2187, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(84.00 AS Decimal(10, 2)), CAST(11.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2189, 2188, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(297.00 AS Decimal(10, 2)), CAST(36.60 AS Decimal(10, 2)), CAST(18.70 AS Decimal(10, 2)), CAST(8.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2190, 2189, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(431.00 AS Decimal(10, 2)), CAST(38.90 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(28.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2191, 2190, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(218.00 AS Decimal(10, 2)), CAST(24.90 AS Decimal(10, 2)), CAST(6.70 AS Decimal(10, 2)), CAST(10.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2192, 2191, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(307.00 AS Decimal(10, 2)), CAST(36.10 AS Decimal(10, 2)), CAST(39.10 AS Decimal(10, 2)), CAST(0.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2193, 2192, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(64.00 AS Decimal(10, 2)), CAST(6.70 AS Decimal(10, 2)), CAST(5.20 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2194, 2193, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(105.00 AS Decimal(10, 2)), CAST(14.80 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2195, 2194, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(100.00 AS Decimal(10, 2)), CAST(20.10 AS Decimal(10, 2)), CAST(1.90 AS Decimal(10, 2)), CAST(1.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2196, 2195, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(345.00 AS Decimal(10, 2)), CAST(11.20 AS Decimal(10, 2)), CAST(62.00 AS Decimal(10, 2)), CAST(6.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2197, 2196, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(364.00 AS Decimal(10, 2)), CAST(4.40 AS Decimal(10, 2)), CAST(74.70 AS Decimal(10, 2)), CAST(5.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2198, 2197, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(405.00 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(74.30 AS Decimal(10, 2)), CAST(7.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2199, 2198, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(388.00 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)), CAST(72.70 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2200, 2199, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(381.00 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)), CAST(81.40 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2201, 2200, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(418.00 AS Decimal(10, 2)), CAST(7.20 AS Decimal(10, 2)), CAST(82.90 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2202, 2201, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(430.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(67.50 AS Decimal(10, 2)), CAST(13.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2203, 2202, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(398.00 AS Decimal(10, 2)), CAST(3.50 AS Decimal(10, 2)), CAST(84.70 AS Decimal(10, 2)), CAST(5.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2204, 2203, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(450.00 AS Decimal(10, 2)), CAST(9.30 AS Decimal(10, 2)), CAST(70.70 AS Decimal(10, 2)), CAST(15.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2205, 2204, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(436.00 AS Decimal(10, 2)), CAST(13.30 AS Decimal(10, 2)), CAST(65.40 AS Decimal(10, 2)), CAST(15.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2206, 2205, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(8.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2207, 2206, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(50.00 AS Decimal(10, 2)), CAST(0.40 AS Decimal(10, 2)), CAST(8.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2208, 2207, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(49.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(8.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2209, 2208, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(133.00 AS Decimal(10, 2)), CAST(1.80 AS Decimal(10, 2)), CAST(19.10 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2210, 2209, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(90.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(14.20 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2211, 2210, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(93.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(14.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NutrientReferenceValues] ([Id], [FoodId], [Measure], [BaseAmount], [WeightInGrams], [Kcal], [ProteinGram], [CarbGram], [FatGram]) VALUES (2212, 2211, N'克', CAST(100.00 AS Decimal(10, 2)), 100, CAST(34.00 AS Decimal(10, 2)), CAST(8.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[NutrientReferenceValues] OFF
GO
