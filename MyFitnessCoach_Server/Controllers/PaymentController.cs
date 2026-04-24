using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.EfModels;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace MyFitnessCoach_Server.Controllers
{
    [Route("api/Payment")]
    [ApiController]
    public class PaymentApiController : ControllerBase
    {
        private readonly string _merchantID;
        private readonly string _hashKey;
        private readonly string _hashIV;
        private readonly string _ngrokUrl;
        private readonly string _frontendUrl;

        private readonly MyFitnessCoachDbContext _context;

        public PaymentApiController(MyFitnessCoachDbContext context, IConfiguration config)
        {
            _context     = context;
            _merchantID  = config["ECPay:MerchantID"] ?? throw new InvalidOperationException("ECPay:MerchantID 未設定");
            _hashKey     = config["ECPay:HashKey"]     ?? throw new InvalidOperationException("ECPay:HashKey 未設定");
            _hashIV      = config["ECPay:HashIV"]      ?? throw new InvalidOperationException("ECPay:HashIV 未設定");
            _ngrokUrl    = config["ECPay:NgrokUrl"]    ?? throw new InvalidOperationException("ECPay:NgrokUrl 未設定");
            _frontendUrl = config["FrontEnd:BaseUrl"]  ?? throw new InvalidOperationException("FrontEnd:BaseUrl 未設定");
        }

        // ──────────────────────────────────────────────────────────────
        // GET /api/Payment/Test
        // ──────────────────────────────────────────────────────────────
        [HttpGet("Test")]
        public IActionResult Test() => Ok(new { message = "Payment API is working" });

        // ──────────────────────────────────────────────────────────────
        // POST /api/Payment/SendToEcPay
        // LessonPay.vue 以 application/x-www-form-urlencoded 呼叫
        // 建立待付款訂單，回傳 { action, parameters } 給前端
        // ──────────────────────────────────────────────────────────────
        [Authorize]
        [HttpPost("SendToEcPay")]
        public async Task<IActionResult> SendToEcPay(
            [FromForm] int    totalAmount,
            [FromForm] string planIds = "")
        {
            try
            {
                if (totalAmount <= 0)
                    return BadRequest(new { error = "無效的金額" });

                var userIdStr = User.FindFirstValue(ClaimTypes.NameIdentifier);
                if (!int.TryParse(userIdStr, out int userId))
                    return Unauthorized(new { error = "無法識別登入用戶" });

                var member = await _context.Members.FirstOrDefaultAsync(m => m.UserId == userId);
                if (member == null)
                    return NotFound(new { error = "找不到會員資料" });

                int memberId = member.Id;

                // ── 1. 解析方案 ID，建立待付款訂單 ──────────────────
                var ids = string.IsNullOrWhiteSpace(planIds)
                    ? new List<int>()
                    : planIds.Split(',')
                             .Select(s => int.TryParse(s.Trim(), out var n) ? n : 0)
                             .Where(n => n > 0)
                             .ToList();

                string itemName   = "儲值點數";
                var    orderIds   = new List<int>();

                if (ids.Any())
                {
                    var plans = await _context.TopUpPlans
                        .Where(p => ids.Contains(p.Id) && p.IsActive)
                        .ToListAsync();

                    if (plans.Any())
                    {
                        itemName = string.Join("#", plans.Select(p => p.PlanName));

                        // 建立 Status=0 的待付款訂單
                        foreach (var plan in plans)
                        {
                            var order = new PointOrder
                            {
                                MemberId        = memberId,
                                TopUpPlanId     = plan.Id,
                                CreateAt        = DateTime.Now,
                                PointQty        = plan.Points,
                                OriginalPrice   = plan.Price,
                                DiscountedPrice = plan.Price,
                                Status          = 0
                            };
                            _context.PointOrders.Add(order);
                            await _context.SaveChangesAsync();
                            orderIds.Add(order.Id);
                        }
                    }
                }

                // ── 2. 組合綠界表單參數 ────────────────────────────
                string tradeNo = "MF" + DateTime.Now.ToString("yyyyMMddHHmmssfff");

                var parameters = new Dictionary<string, string>
                {
                    { "MerchantID",        _merchantID },
                    { "MerchantTradeNo",   tradeNo },
                    { "MerchantTradeDate", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss") },
                    { "PaymentType",       "aio" },
                    { "TotalAmount",       totalAmount.ToString() },
                    { "TradeDesc",         "MyFitnessCoach_Purchase" },
                    { "ItemName",          itemName },
                    { "ReturnURL",      $"{_ngrokUrl}/api/Payment/Callback" },
                    { "ClientBackURL",  $"{_frontendUrl}/lesson-cart" },
                    { "OrderResultURL", $"{_ngrokUrl}/api/Payment/Result" },
                    { "ChoosePayment",     "ALL" },
                    { "EncryptType",       "1" },
                    // 將訂單 ID 帶回 Callback，用以更新付款狀態
                    { "CustomField1",      string.Join(",", orderIds) },
                };

                parameters["CheckMacValue"] = GenerateCheckMacValue(parameters);

                return Ok(new
                {
                    action     = "https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5",
                    parameters
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = ex.Message });
            }
        }

        // ──────────────────────────────────────────────────────────────
        // POST /api/Payment/ProductSendToEcPay
        // 商品結帳：從 DB 讀 ProductOrder.FinalAmount，傳給綠界
        // ──────────────────────────────────────────────────────────────
        [Authorize]
        [HttpPost("ProductSendToEcPay")]
        public async Task<IActionResult> ProductSendToEcPay([FromForm] int productOrderId)
        {
            try
            {
                var userIdStr = User.FindFirstValue(ClaimTypes.NameIdentifier);
                if (!int.TryParse(userIdStr, out int userId))
                    return Unauthorized(new { error = "無法識別登入用戶" });

                var member = await _context.Members.FirstOrDefaultAsync(m => m.UserId == userId);
                if (member == null)
                    return NotFound(new { error = "找不到會員資料" });

                // TODO: 測試完成後將下方改回加上 && o.MemberId == member.Id
                var order = await _context.ProductOrders
                    .Include(o => o.ProductOrderDetails)
                    .FirstOrDefaultAsync(o => o.Id == productOrderId);

                if (order == null)
                    return NotFound(new { error = "找不到訂單" });

                if (order.FinalAmount == null || order.FinalAmount <= 0)
                    return BadRequest(new { error = "訂單金額無效" });

                int totalAmount = (int)order.FinalAmount.Value;

                string itemName = order.ProductOrderDetails.Any()
                    ? string.Join("#", order.ProductOrderDetails.Select(d => $"{d.ProductName} x{d.Qty}"))
                    : "商品訂單";

                string tradeNo = "MFP" + DateTime.Now.ToString("yyyyMMddHHmmssfff");

                var parameters = new Dictionary<string, string>
                {
                    { "MerchantID",        _merchantID },
                    { "MerchantTradeNo",   tradeNo },
                    { "MerchantTradeDate", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss") },
                    { "PaymentType",       "aio" },
                    { "TotalAmount",       totalAmount.ToString() },
                    { "TradeDesc",         "MyFitnessCoach_Product" },
                    { "ItemName",          itemName },
                    { "ReturnURL",      $"{_ngrokUrl}/api/Payment/Callback" },
                    { "ClientBackURL",  $"{_frontendUrl}/checkout" },
                    { "OrderResultURL", $"{_ngrokUrl}/api/Payment/Result" },
                    { "ChoosePayment",     "ALL" },
                    { "EncryptType",       "1" },
                    { "CustomField1",      "" },
                    { "CustomField2",      productOrderId.ToString() },
                };

                parameters["CheckMacValue"] = GenerateCheckMacValue(parameters);

                return Ok(new
                {
                    action     = "https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5",
                    parameters
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = ex.Message });
            }
        }

        // ──────────────────────────────────────────────────────────────
        // POST /api/Payment/Callback
        // 綠界伺服器付款完成後主動通知（ReturnURL，非瀏覽器）
        // 更新訂單狀態並將點數存入錢包
        // ──────────────────────────────────────────────────────────────
        [HttpPost("Callback")]
        public async Task<ContentResult> Callback([FromForm] IFormCollection form)
        {
            try
            {
                // ── 驗證綠界簽章，防止偽造付款通知 ──────────────────
                string receivedMac = form["CheckMacValue"].ToString();
                var formParams = form
                    .Where(kv => !kv.Key.Equals("CheckMacValue", StringComparison.OrdinalIgnoreCase))
                    .ToDictionary(kv => kv.Key, kv => kv.Value.ToString());

                if (GenerateCheckMacValue(formParams) != receivedMac)
                    return Content("0|CheckMacValue Error");

                string rtnCode     = form["RtnCode"].ToString();
                string customField = form["CustomField1"].ToString();

                if (rtnCode == "1" && !string.IsNullOrEmpty(customField))
                {
                    var orderIds = customField.Split(',')
                        .Select(s => int.TryParse(s.Trim(), out var n) ? n : 0)
                        .Where(n => n > 0)
                        .ToList();

                    if (orderIds.Any())
                    {
                        var orders = await _context.PointOrders
                            .Where(o => orderIds.Contains(o.Id) && o.Status == 0)
                            .ToListAsync();

                        foreach (var order in orders)
                        {
                            // 更新訂單為「已付款」
                            order.Status = 1;

                            // 找或建立錢包
                            var wallet = await _context.UserWallets
                                .FirstOrDefaultAsync(w => w.MemberId == order.MemberId);

                            if (wallet == null)
                            {
                                wallet = new UserWallet
                                {
                                    MemberId       = order.MemberId,
                                    CurrentBalance = 0,
                                    LastUpdated    = DateTime.Now
                                };
                                _context.UserWallets.Add(wallet);
                                await _context.SaveChangesAsync(); // 取得 wallet.Id
                            }

                            // 點數入帳
                            wallet.CurrentBalance += order.PointQty;
                            wallet.LastUpdated     = DateTime.Now;

                            // 記錄明細
                            _context.PointsRecordDetails.Add(new PointsRecordDetail
                            {
                                PointOrderId        = order.Id,
                                UserWalletId        = wallet.Id,
                                CreateAt            = DateTime.Now,
                                PointAmount         = order.PointQty,
                                MerchandiseCategory = "Recharge"
                            });
                        }

                        await _context.SaveChangesAsync();
                    }
                }

                // ── 處理商品訂單（CustomField2）────────────────────
                string customField2 = form["CustomField2"].ToString();
                if (rtnCode == "1" && int.TryParse(customField2, out int productOrderId))
                {
                    var productOrder = await _context.ProductOrders
                        .FirstOrDefaultAsync(o => o.Id == productOrderId && o.Status == 0);

                    if (productOrder != null)
                    {
                        productOrder.Status = 1;
                        await _context.SaveChangesAsync();
                    }
                }

                // 綠界規定：必須回傳純文字 "1|OK"
                return Content("1|OK");
            }
            catch (Exception ex)
            {
                return Content($"0|{ex.Message}");
            }
        }

        // ──────────────────────────────────────────────────────────────
        // POST /api/Payment/Result
        // 綠界付款完成後，瀏覽器被導向此端點
        // 驗證簽章並入帳（Callback 的可靠備援），再 302 跳轉至前端
        // ──────────────────────────────────────────────────────────────
        [HttpPost("Result")]
        public async Task<IActionResult> Result([FromForm] IFormCollection form)
        {
            string rtnCode    = form["RtnCode"].ToString();
            string rtnMsg     = Uri.EscapeDataString(form["RtnMsg"].ToString());
            string tradeNo    = form["MerchantTradeNo"].ToString();
            string customField = form["CustomField1"].ToString();

            // 驗證簽章後執行入帳（與 Callback 相同邏輯，Status==0 防止重複處理）
            try
            {
                string receivedMac = form["CheckMacValue"].ToString();
                var formParams = form
                    .Where(kv => !kv.Key.Equals("CheckMacValue", StringComparison.OrdinalIgnoreCase))
                    .ToDictionary(kv => kv.Key, kv => kv.Value.ToString());

                bool macValid = GenerateCheckMacValue(formParams) == receivedMac;

                if (macValid && rtnCode == "1" && !string.IsNullOrEmpty(customField))
                {
                    var orderIds = customField.Split(',')
                        .Select(s => int.TryParse(s.Trim(), out var n) ? n : 0)
                        .Where(n => n > 0)
                        .ToList();

                    if (orderIds.Any())
                    {
                        var orders = await _context.PointOrders
                            .Where(o => orderIds.Contains(o.Id) && o.Status == 0)
                            .ToListAsync();

                        foreach (var order in orders)
                        {
                            order.Status = 1;

                            var wallet = await _context.UserWallets
                                .FirstOrDefaultAsync(w => w.MemberId == order.MemberId);

                            if (wallet == null)
                            {
                                wallet = new UserWallet
                                {
                                    MemberId       = order.MemberId,
                                    CurrentBalance = 0,
                                    LastUpdated    = DateTime.Now
                                };
                                _context.UserWallets.Add(wallet);
                                await _context.SaveChangesAsync();
                            }

                            wallet.CurrentBalance += order.PointQty;
                            wallet.LastUpdated     = DateTime.Now;

                            _context.PointsRecordDetails.Add(new PointsRecordDetail
                            {
                                PointOrderId        = order.Id,
                                UserWalletId        = wallet.Id,
                                CreateAt            = DateTime.Now,
                                PointAmount         = order.PointQty,
                                MerchandiseCategory = "Recharge"
                            });
                        }

                        await _context.SaveChangesAsync();
                    }
                }

                // ── 處理商品訂單（CustomField2）────────────────────
                string resultCustomField2 = form["CustomField2"].ToString();
                if (macValid && rtnCode == "1" && int.TryParse(resultCustomField2, out int resultProductOrderId))
                {
                    var productOrder = await _context.ProductOrders
                        .FirstOrDefaultAsync(o => o.Id == resultProductOrderId && o.Status == 0);

                    if (productOrder != null)
                    {
                        productOrder.Status = 1;
                        await _context.SaveChangesAsync();
                    }
                }
            }
            catch { /* 入帳失敗不影響頁面跳轉，錯誤由 Callback 補救 */ }

            // 依訂單類型跳轉不同頁面
            string resultCustomField2Check = form["CustomField2"].ToString();
            bool isProductOrder = int.TryParse(resultCustomField2Check, out _);
            string resultPage = isProductOrder ? "checkout-result" : "lesson-result";

            return Redirect(
                $"{_frontendUrl}/{resultPage}" +
                $"?RtnCode={rtnCode}" +
                $"&RtnMsg={rtnMsg}" +
                $"&MerchantTradeNo={tradeNo}");
        }

        // ──────────────────────────────────────────────────────────────
        // 計算綠界 CheckMacValue（SHA256）
        // ──────────────────────────────────────────────────────────────
        private string GenerateCheckMacValue(Dictionary<string, string> parameters)
        {
            var sortedPairs = parameters
                .OrderBy(p => p.Key, StringComparer.OrdinalIgnoreCase)
                .Select(p => $"{p.Key}={p.Value}");

            string raw     = $"HashKey={_hashKey}&{string.Join("&", sortedPairs)}&HashIV={_hashIV}";
            string encoded = HttpUtility.UrlEncode(raw).ToLower();

            using var sha256 = SHA256.Create();
            byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(encoded));
            return BitConverter.ToString(bytes).Replace("-", "").ToUpper();
        }
    }
}
