# 優惠券系統 SQL 執行順序

## TL;DR — 給新組員 / 新環境

**只要跑這一個檔：**

```
0502_99_coupons_master_setup.sql
```

它會把 4 張券 + banner 圖路徑全部建好，**重複執行也不會出錯**（內建 `IF NOT EXISTS` 防呆）。

---

## 完整檔案說明

| 檔案 | 用途 | 何時執行 |
|---|---|---|
| **`0502_99_coupons_master_setup.sql`** | **一鍵完整 setup（推薦）** | 新環境初始化、確認資料是否齊全 |
| `0429_1100_add_coupon_兩張券資料.sql` | INSERT WELCOME100 + DAY22 | 已被 master 涵蓋，單獨用於最早的部署 |
| `0430_save100_seed.sql` | INSERT SAVE100 | 已被 master 涵蓋，僅作參考 |
| `0502_flash14_seed.sql` | INSERT FLASH14 | 已被 master 涵蓋，僅作參考 |
| `0502_coupon_banners.sql` | UPDATE banner 圖路徑 | 已被 master 涵蓋，僅作參考 |
| `0430_save100_reset_這個不用執行.sql` | 測試用：清空 SAVE100 領取紀錄 | **正式環境不要跑！** 僅本機測試 |
| `0502_flash14_reset_這個不用執行.sql` | 測試用：清空 FLASH14 領取紀錄 | **正式環境不要跑！** 僅本機測試 |

---

## 為什麼要有 master 檔？

### ⚠️ 原本的順序陷阱

`0502_flash14_seed.sql` 和 `0502_coupon_banners.sql` 同一天，但**順序很重要**：

- 先 seed → 再 banner ✓
- **先 banner → 再 seed ✗** banner 的 `UPDATE WHERE Code='FLASH14'` 會找不到列、靜默更新 0 筆，**不會報錯**，組員以為成功了，實際 banner 沒設好

Master 檔強制按 `① WELCOME100/DAY22 → ② SAVE100 → ③ FLASH14 → ④ Banner` 順序，且第 ④ 步會檢查 ROWCOUNT，沒抓到就 RAISERROR 跳出。

### ✓ 重複執行安全

每筆 INSERT 前都先 `IF NOT EXISTS (SELECT 1 FROM Coupons WHERE Code = '...')`，已存在就跳過、PRINT 訊息提示。組員可以放心重跑來確認狀態。

---

## 4 張券速查

| Code | 折扣 | 門檻 | 上限 | 限制 |
|---|---|---|---|---|
| WELCOME100 | 折 NT$100 | 滿 500 | — | 限首購會員、領後 30 天有效 |
| DAY22 | 85 折（15%）| 無 | — | 每月 22 日才可見、recurring |
| SAVE100 | 9 折（10%）| 滿 1000 | NT$100 | 全年無限制 |
| FLASH14 | 88 折（12%）| 滿 500 | NT$200 | 2026/05/02 ~ 05/16 限定 |

---

## 執行步驟（SSMS）

1. 確認 DB 已建立（base schema 已跑過）
2. 確認 `Coupons` 資料表存在（`SqlCodes/Schema/0429_1058_add_coupons_membercoupons兩張表.sql` 已跑）
3. 開啟 `0502_99_coupons_master_setup.sql`
4. 確認上方 `USE [MyFitnessCoachDb]` 是您的 DB 名稱
5. 按 F5 執行
6. 看訊息視窗確認 `✓` 或 `-`（已存在跳過），底部 SELECT 應顯示 4 列
7. 完成

---

## Banner 圖檔說明

Banner URL 預設指向 `/assets/banners/flash14.svg` 和 `/assets/banners/save100.svg`。前端會去找：

```
MyFitnessCoach_Client/public/assets/banners/flash14.svg
MyFitnessCoach_Client/public/assets/banners/save100.svg
```

**如果還沒準備本機圖檔**，把 master 檔內步驟 ④ 的 URL 改成 placeholder：

```sql
UPDATE [dbo].[Coupons]
SET [BannerImageUrl] = 'https://placehold.co/1200x375/c4a882/ffffff?text=FLASH14'
WHERE [Code] = 'FLASH14';
```

---

## 疑難排解

**Q：跑完看不到 4 列？**
A：檢查 `Coupons` 表是否存在；檢查訊息視窗有沒有錯誤；確認 `USE` 的 DB 是對的。

**Q：第 ④ 步噴 RAISERROR？**
A：表示 SAVE100 或 FLASH14 INSERT 沒成功，或 Coupons 表名/Code 欄位拼字錯誤。回去看 ② ③ 步驟的訊息。

**Q：想重設某張券的領取紀錄？（例如測試流程）**
A：跑對應的 `*_reset_這個不用執行.sql` — **僅限本機測試環境，正式環境會掉資料**。
