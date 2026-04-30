# 🤝 交接包(給結帳隊友)

> 給結帳 / 付款流程的隊友,讀完這份就能把優惠券折扣串進建單流程。
> 蛙蛙 已經把 schema、EF model、`CouponService` 全部準備好了,你只要在三個地方各加幾行程式即可。

## 你只要做三件事

### ① 後端建單 API:接 `memberCouponId` + 呼叫 helper

在你「建立 ProductOrder」的 endpoint(Cart → 訂單那段)加幾行:

```csharp
// 1. Request DTO 多加一個欄位
public class CreateOrderRequest
{
    // ... 原本欄位 ...
    public int? MemberCouponId { get; set; }   // ← 新增,前端會帶
}

// 2. 建單流程
public async Task<IActionResult> CreateOrder([FromBody] CreateOrderRequest req)
{
    var memberId = await GetCurrentMemberIdAsync();   // 你原本拿 memberId 的方式

    // 算小計(原本就有)
    decimal subtotal = items.Sum(i => i.UnitPrice * i.Qty);

    var order = new ProductOrder
    {
        MemberId       = memberId,
        OriginalAmount = subtotal,
        DiscountAmount = 0,            // 預設 0,helper 會覆蓋
        // ... 其他欄位 ...
    };

    // 3. ★ 一行套用優惠券(有效就寫 CouponId/DiscountAmount,無效直接拋例外)
    try
    {
        await _couponService.ApplyCouponToOrderAsync(
            memberId, req.MemberCouponId, order, subtotal);
    }
    catch (InvalidOperationException ex)
    {
        return BadRequest(new { message = ex.Message });
    }

    // 4. FinalAmount = 小計 - 折扣 + 運費(運費用你原本的邏輯)
    order.FinalAmount = subtotal - order.DiscountAmount + shippingFee;

    _db.ProductOrders.Add(order);
    await _db.SaveChangesAsync();
    return Ok(new { orderId = order.Id });
}
```

> `_couponService` 從建構子注入(已在 `Program.cs` 註冊):
> ```csharp
> public YourController(..., CouponService couponService) { _couponService = couponService; }
> ```

### ② 付款成功 callback:呼叫 `ConsumeAsync`

`PaymentController.Callback`(綠界付款成功時)裡 `productOrder.Status = 1` 那行下面加:

```csharp
productOrder.Status = 1;   // 已付款 (原本就有的)

// ★ 新增:標記優惠券已使用
if (productOrder.CouponId != null)
{
    // 反查當初的 MemberCoupon.Id
    var memberCoupon = await _db.MemberCoupons
        .FirstOrDefaultAsync(mc =>
            mc.MemberId == productOrder.MemberId &&
            mc.CouponId == productOrder.CouponId &&
            mc.UsedAt   == null);

    if (memberCoupon != null)
    {
        await _couponService.ConsumeAsync(memberCoupon.Id, productOrder.Id);
    }
}

await _db.SaveChangesAsync();
```

> **備註**:若你想在 `ProductOrder` 直接存 `MemberCouponId` 而不只是 `CouponId`,可以再加一欄。但通常一個會員當下對某張券只有一筆未使用的紀錄,反查也夠精準。

### ③ 前端 Checkout.vue:送出時帶 `memberCouponId`

```ts
// 1. import 拿選擇的券 id
import { useCoupon } from '@/composables/useCoupon'
const { selectedMemberCouponId, discountPreview } = useCoupon()

// 2. 建單 request 多帶一個欄位
const orderRequest = {
  // ... 原本的欄位 ...
  memberCouponId: selectedMemberCouponId.value,   // ← 新增
}
```

並把 Cart 三行金額(小計 / 折扣 / 應付)的顯示複製過來,讓使用者結帳前再次確認。

## API 速查

蛙蛙 提供給你的兩個 method,在 `MyFitnessCoach_Server.Models.Services.CouponService`:

| Method | 何時呼叫 | 做什麼 |
|---|---|---|
| `ApplyCouponToOrderAsync(memberId, memberCouponId, order, subtotal)` | **建單時** | 驗證優惠券、寫 `order.CouponId` / `order.DiscountAmount`。`memberCouponId` 為 null 不做事。驗證失敗丟 `InvalidOperationException` |
| `ConsumeAsync(memberCouponId, orderId)` | **付款成功時** | 標記 `MemberCoupon.UsedAt` = now,寫入 `OrderId` |

## 已就緒的東西(不用你動)

- ✅ DB:`ProductOrders.CouponId` 已加(FK 到 Coupons.Id)
- ✅ EF model:`ProductOrder.CouponId` 已生成、`Coupon` 反向導航也有
- ✅ Coupon 主檔:已有 `WELCOME100`(首購)和 `DAY22`(每月 22 日)兩張券
- ✅ `CouponService.PreviewDiscountAsync` / `ConsumeAsync` 都做完
- ✅ 前端 `Cart.vue` 已能選券、即時試算
- ✅ DI 已在 `Program.cs` 註冊

## 驗證腳本

完成後可以這樣測:

1. 訪客 → 登入 → 去 `/coupons` 領 WELCOME100
2. 加商品到購物車(小計 ≥ NT$500)
3. 在 Cart 選 WELCOME100 → 看到「折扣 −NT$100、應付 = 小計 − 100」
4. 按「去結帳」→ Checkout 應該也顯示同樣三行
5. 完成付款 → DB 看 `ProductOrders` 那筆 `CouponId` / `DiscountAmount` / `FinalAmount` 都對
6. DB 看 `MemberCoupons` 那筆 `UsedAt` 有時間、`OrderId` 對應到剛建的訂單
7. 再進 `/coupons` → WELCOME100 從「未使用」移到「已使用」

## 有問題?

直接問 蛙蛙。整個 coupon 領域邏輯都在:
- `Repositories/CouponRepository.cs`
- `Models/Services/CouponService.cs`
- `Controllers/CouponApiController.cs`
