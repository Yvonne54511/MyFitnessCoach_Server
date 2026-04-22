using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.EfModels;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace MyFitnessCoach_Server.Controllers
{
    [Route("api/Payment")]
    [ApiController]
    public class PaymentApiController : ControllerBase
    {
        private readonly string _merchantID = "3002607";
        private readonly string _hashKey    = "pwFHCqoQZGmho4w6";
        private readonly string _hashIV     = "EkRm7iFT261dpevs";

        // ngrok 公開網址（供綠界伺服器呼叫 ReturnURL / OrderResultURL）
        private readonly string _ngrokUrl    = "https://worshiper-episode-purse.ngrok-free.dev";
        // 前端開發位址（付款完成後跳轉）
        private readonly string _frontendUrl = "http://localhost:5173";

        private readonly MyFitnessCoachDbContext _context;

        public PaymentApiController(MyFitnessCoachDbContext context)
        {
            _context = context;
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
        [HttpPost("SendToEcPay")]
        public async Task<IActionResult> SendToEcPay(
            [FromForm] int    totalAmount,
            [FromForm] string planIds = "")
        {
            try
            {
                if (totalAmount <= 0)
                    return BadRequest(new { error = "無效的金額" });

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
                                MemberId        = 1,   // TODO: 登入後改成真實會員 ID
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
                    { "ReturnURL",         $"{_ngrokUrl}/api/Payment/Callback" },
                    { "ClientBackURL",     $"{_frontendUrl}/lesson-cart" },
                    // 瀏覽器在同一台電腦，直接走 localhost，避免 ngrok 攔截頁
                    { "OrderResultURL",    "http://localhost:5230/api/Payment/Result" },
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
        // POST /api/Payment/Callback
        // 綠界伺服器付款完成後主動通知（ReturnURL，非瀏覽器）
        // 更新訂單狀態並將點數存入錢包
        // ──────────────────────────────────────────────────────────────
        [HttpPost("Callback")]
        public async Task<ContentResult> Callback([FromForm] IFormCollection form)
        {
            try
            {
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
        // 解析結果後 302 跳轉至 Vue 前端 /lesson-result
        // ──────────────────────────────────────────────────────────────
        [HttpPost("Result")]
        public IActionResult Result([FromForm] IFormCollection form)
        {
            string rtnCode  = form["RtnCode"].ToString();
            string rtnMsg   = Uri.EscapeDataString(form["RtnMsg"].ToString());
            string tradeNo  = form["MerchantTradeNo"].ToString();

            return Redirect(
                $"{_frontendUrl}/lesson-result" +
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
