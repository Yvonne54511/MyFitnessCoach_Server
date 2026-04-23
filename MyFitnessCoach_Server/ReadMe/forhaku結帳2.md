給你完整版,可以整份複製丟給隊友。下面整塊都是:

---

## 📋 Cart Phase 3 交接包(從這行下面開始全部複製)

```markdown
# 🛒 Cart Phase 3 交接包 — 給做結帳功能的隊友

## 概覽
購物車的 DB、後端 API、前端整合都已完成。混合模式:未登入用 localStorage、登入用 DB。你要做的結帳(Checkout)會從購物車讀資料、轉成訂單、清空購物車。

---

## 1. 已完成的資料表

### `Carts`
- `Id` (PK, IDENTITY)
- `MemberId` (FK → `Members.Id`, UNIQUE — 一人一張購物車)
- `CreatedAt` / `UpdatedAt` (datetime2(0))

### `CartItems`
- `Id` (PK, IDENTITY)
- `CartId` (FK → `Carts.Id`, ON DELETE CASCADE)
- `ProductId` (FK → `Products.Id`)
- `Qty` (CHECK `>= 1`)
- `CreatedAt` / `UpdatedAt`
- UNIQUE `(CartId, ProductId)` — 同商品不會重複列,只會累加 qty

**特別設計**:`CartItems` 故意**不存價格快照**,以 `Products.UnitPrice` 當下價為準。價格快照要到訂單層(`ProductOrderDetails.UnitPriceSnapshot`)才存。

---

## 2. 結帳會用到的 API(已完成)

| Method | Endpoint | 用途 |
|---|---|---|
| `GET` | `/api/CartApi` | 撈使用者購物車(結帳主要入口) |
| `DELETE` | `/api/CartApi` | 清空購物車(訂單成立後呼叫) |

其他 `POST/PUT/DELETE /api/CartApi/items`、`/merge` 結帳不會用到,但已完成可無視。

全部 endpoint 都加了 `[Authorize]`,從 JWT 的 `ClaimTypes.NameIdentifier` 反查 MemberId。

---

## 3. 可重用的 Service(建議直接注入)

`CartService.GetCartAsync(memberId)` → 回傳完整 `CartDto`(含 items + 當下價格)
`CartService.ClearAsync(memberId)` → 清空購物車

**注入方式**:
```csharp
public class CheckoutApiController : ControllerBase
{
    private readonly CartService _cartService;
    private readonly MyFitnessCoachDbContext _db;

    public CheckoutApiController(CartService cartService, MyFitnessCoachDbContext db)
    {
        _cartService = cartService;
        _db = db;
    }
}
```

DI 已在 `Program.cs` 註冊好(`Scoped`),不用再 `AddScoped`。

---

## 4. DTO 結構

```csharp
CartDto {
    int Id;
    int MemberId;
    List<CartItemDto> Items;
    int ItemCount;          // = Σ Qty
    decimal Subtotal;       // = Σ UnitPrice × Qty
}

CartItemDto {
    int Id;                 // CartItem.Id(DB PK,不是 ProductId!)
    int ProductId;
    int Qty;
    string Name;
    decimal UnitPrice;      // 當下價
    decimal OriginalPrice;
    string? ImageUrl;
    string? CategoryName;
}
```

位置:`Models/DTOs/CartDto.cs`、`Models/DTOs/CartItemDto.cs`

---

## 5. 結帳流程建議骨架

```csharp
public async Task<OrderDto> PlaceOrderAsync(int memberId, int addressId, ...)
{
    // 1. 讀購物車
    var cart = await _cartService.GetCartAsync(memberId);
    if (!cart.Items.Any())
        throw new InvalidOperationException("購物車是空的");

    // 2. ⚠️ 重新 query Products,驗證還在賣、抓當下最新價
    //    不要信前端傳來的金額!
    var productIds = cart.Items.Select(i => i.ProductId).ToList();
    var products = await _db.Products
        .Where(p => productIds.Contains(p.Id) && p.IsActive)
        .ToDictionaryAsync(p => p.Id);

    // 3. 算 subtotal(以 DB 當下價為準)
    decimal subtotal = 0;
    foreach (var item in cart.Items)
    {
        if (!products.ContainsKey(item.ProductId))
            throw new InvalidOperationException($"商品「{item.Name}」已下架");
        subtotal += products[item.ProductId].UnitPrice * item.Qty;
    }

    // 4. 計算運費 / (未來)折扣
    decimal shippingFee = subtotal >= 1000 ? 0 : 60;
    decimal discount = 0;  // TODO: 等優惠券功能好了接上

    // 5. 建立訂單(每個 OrderDetail 都要存 UnitPriceSnapshot!)
    var order = new ProductOrder
    {
        MemberId = memberId,
        Subtotal = subtotal,
        ShippingFee = shippingFee,
        DiscountAmount = discount,
        TotalAmount = subtotal + shippingFee - discount,
        // CouponId = null,       ← 等優惠券接上再填
        CreatedAt = DateTime.Now,
        // ... 收件資訊、付款方式等
    };
    foreach (var item in cart.Items)
    {
        order.ProductOrderDetails.Add(new ProductOrderDetail
        {
            ProductId = item.ProductId,
            Qty = item.Qty,
            UnitPriceSnapshot = products[item.ProductId].UnitPrice,  // ⚠️ 一定要存
        });
    }
    _db.ProductOrders.Add(order);
    await _db.SaveChangesAsync();

    // 6. 清空購物車
    await _cartService.ClearAsync(memberId);

    return OrderDto.FromEntity(order);
}
```

---

## 6. 三個重要提醒 ⚠️

### 🔒 金額絕對不要信前端
前端 `subtotal` 只是顯示用,使用者可以竄改 localStorage 隨便丟金額給後端。後端**一定要重新 query Products + 重算**。

### 💾 價格快照存在 `ProductOrderDetails`
`CartItems` 故意不存價格(跟現價跑)。但訂單成立後,每個 detail row 必須存 `UnitPriceSnapshot`。否則商家日後改價,歷史訂單金額會跟著變(錯誤)。

### 🔐 結帳 controller 也要 `[Authorize]`
跟 `CartApiController` 一樣,用 `User.FindFirst(ClaimTypes.NameIdentifier)?.Value` 反查 MemberId。**不要用** `User.FindFirst("MemberId")` — 目前 JWT 沒有這個 claim。範例請看 `CartApiController.GetCurrentMemberIdAsync()`。

---

## 7. 跟優惠券(另一位在做)的交接點

### 你要在 `ProductOrders` 加兩個欄位(SQL)

```sql
ALTER TABLE [dbo].[ProductOrders] ADD
    [CouponId] INT NULL,
    [DiscountAmount] DECIMAL(10,2) NOT NULL DEFAULT 0;
```

- 先加欄位 + 允許 NULL
- **FK 約束先不加**,等優惠券那邊 `Coupons` 表建好再補
- 結帳 service 暫時把 `CouponId = null`、`DiscountAmount = 0`

### 之後優惠券會給你一個 Service 方法

```csharp
Task ConsumeAsync(int memberCouponId, int orderId);
```

你在訂單存檔後呼叫它即可(標記優惠券已使用、減少剩餘次數)。

---

## 8. 前端要做的事

我已經改好購物車頁(`src/views/Cart.vue`),「去結帳」按鈕目前只顯示 `ElMessage`。你要改成:

```ts
async function handleCheckout() {
  router.push('/checkout')
}
```

建議新增 `src/views/Checkout.vue`,流程:
- 顯示購物車內容(再次確認)
- 選擇收件地址 / 付款方式(模擬即可)
- 送出 → 後端建立訂單 → 清空購物車 → 跳訂單成功頁

**API 呼叫一律用 `fetchWithAuth()`**(`src/data/fetchWithAuth.ts`),會自動帶 token + 401 自動導登入頁。

---

## 9. 測試資料

DB 目前有這筆:
```
Carts:     Id=1, MemberId=7
CartItems: Id=7, CartId=1, ProductId=9, Qty=2
```
可以用這個帳號測結帳流程。

---

有問題直接問 ✌️
```

---

## 📋 結束複製

上面 ` ```markdown ` 到最後那行 ` ``` ` 之間就是完整交接包,丟 Discord / Notion / 共用文件都可以。

---

丟給隊友後,我們就可以專心設計優惠券。為了讓我設計計畫書,先幫我對齊幾個範圍問題 👇