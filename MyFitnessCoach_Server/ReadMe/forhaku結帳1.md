👍 **這是很好的策略** — 結帳跟優惠券可以大幅平行開發,重疊面其實很小。讓我幫你把交接點整理清楚。

## 📦 你要給隊友的「Cart Phase 3 交接包」

隊友開始做結帳前,需要知道:

### 1. 已完成的 API(可直接用)
```
GET    /api/CartApi               // 撈使用者的購物車(結帳入口)
DELETE /api/CartApi               // 清空購物車(訂單成立後呼叫)
```
其他(POST/PUT items、merge)結帳用不到,但已經好了。

### 2. 可重用的 Service
`CartService.GetCartAsync(memberId)` → 回傳 `CartDto`(含 items + 當下價格),隊友在結帳 controller 直接注入就能用。

### 3. 結帳流程建議骨架(給隊友參考)
```csharp
// CheckoutService.PlaceOrderAsync(memberId, addressId, ...)
1. var cart = await _cartService.GetCartAsync(memberId)
2. if (!cart.Items.Any()) throw "購物車是空的"
3. 重新從 DB 抓 Products(驗證還在賣、抓當下最新價)
4. 計算 subtotal + 運費 + (未來)折扣
5. 建立 ProductOrder + ProductOrderDetails(含 UnitPriceSnapshot)
6. await _cartService.ClearAsync(memberId)   ← 清空購物車
7. return orderDto
```

### 4. 重要提醒給隊友
- **前端傳來的金額不可信**,要後端重算
- **一定要存 `UnitPriceSnapshot` 到 `ProductOrderDetails`**(價格快照,避免日後商品改價影響歷史訂單)
- Cart 的 `TouchCartAsync` 邏輯可以參考,結帳一樣要更新時間戳

## 🤝 你跟隊友的「對接點」只有 2 個

為了雙方平行開發時不互相卡,先**談定介面**,之後各做各的:

### 對接點 ① `ProductOrders` 資料表要加 `CouponId`
| 誰加 | 建議 |
|---|---|
| ✅ **隊友加**(結帳為主) | 因為結帳時會用到,你這邊純優惠券邏輯不需要 |

**建議提醒隊友**:做結帳 schema 時,在 `ProductOrders` 加:
```sql
[CouponId] INT NULL  -- FK → Coupons.Id(允許 NULL = 沒用優惠券)
[DiscountAmount] DECIMAL(10,2) NOT NULL DEFAULT 0  -- 折扣金額快照
```
加了但暫時不填值、不 FK 驗證,等我的 `Coupons` 表好了再補 FK 約束。

### 對接點 ② 你提供兩個 Service 方法給隊友呼叫
我會在 `CouponService` 設計好兩個純粹的方法,隊友在結帳 service 裡注入使用:

```csharp
// 試算(不改 DB) — 購物車頁、結帳頁都可以叫
Task<DiscountResult> PreviewDiscountAsync(int memberCouponId, decimal subtotal);

// 消耗(改 DB) — 只有訂單成立時隊友呼叫
Task ConsumeAsync(int memberCouponId, int orderId);
```

**在我的 Coupon 功能做完前**,隊友結帳程式先不接這兩個方法(假設 couponId 永遠 null),等我好了再補一行呼叫即可。

## 📋 建議的執行順序

```
Day 1         你:開始設計 Coupons schema + DTOs
              隊友:開始做結帳 schema(ProductOrders 加 CouponId 欄位但不接 FK)
                   Cart → Order 搬移邏輯(不含折扣)

Day 2-3       你:Coupon CRUD API + 會員領取邏輯 + 我的優惠券頁
              隊友:結帳 API + 結帳頁 UI + 付款模擬

Day 4         你:PreviewDiscountAsync + 購物車頁試算 UI
              隊友:訂單詳情頁 + 訂單列表

Day 5         ── 合併 ──
              你給隊友:ConsumeAsync 方法
              隊友改結帳程式:成立訂單時呼叫 ConsumeAsync
              補上 Coupons FK 到 ProductOrders.CouponId
              整合測試
```

## 所以現在的情況

你那邊要先做這件事:**把上面的交接包傳給隊友**(可以直接複製我整理的內容貼 Discord / Slack / LINE),讓他開始動工。

然後你就可以專心來設計優惠券了。回到先前的 **Q1–Q5 決策**,你想用我預設的組合(B+B+C+A:兩種券型、需領取、SQL seed、購物車頁試算)嗎?還是要調整?