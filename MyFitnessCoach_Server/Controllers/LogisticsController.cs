using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyFitnessCoach_Server.Models.EfModels;
using System.Net.Http.Headers;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace MyFitnessCoach_Server.Controllers
{
    [Route("api/Logistics")]
    [ApiController]
    public class LogisticsController : ControllerBase
    {
        private readonly string _merchantID;
        private readonly string _hashKey;
        private readonly string _hashIV;
        private readonly string _apiUrl;
        private readonly string _mapUrl;
        private readonly string _ngrokUrl;
        private readonly string _frontendUrl;

        private readonly MyFitnessCoachDbContext _context;
        private readonly IHttpClientFactory _httpClientFactory;

        public LogisticsController(
            MyFitnessCoachDbContext context,
            IHttpClientFactory httpClientFactory,
            IConfiguration config)
        {
            _context          = context;
            _httpClientFactory = httpClientFactory;
            _merchantID       = config["ECPayLogistics:MerchantID"]  ?? throw new InvalidOperationException("ECPayLogistics:MerchantID 未設定");
            _hashKey          = config["ECPayLogistics:HashKey"]      ?? throw new InvalidOperationException("ECPayLogistics:HashKey 未設定");
            _hashIV           = config["ECPayLogistics:HashIV"]       ?? throw new InvalidOperationException("ECPayLogistics:HashIV 未設定");
            _apiUrl           = config["ECPayLogistics:ApiUrl"]       ?? throw new InvalidOperationException("ECPayLogistics:ApiUrl 未設定");
            _mapUrl           = config["ECPayLogistics:MapUrl"]       ?? throw new InvalidOperationException("ECPayLogistics:MapUrl 未設定");
            _ngrokUrl         = config["ECPay:NgrokUrl"]              ?? throw new InvalidOperationException("ECPay:NgrokUrl 未設定");
            _frontendUrl      = config["FrontEnd:BaseUrl"]            ?? throw new InvalidOperationException("FrontEnd:BaseUrl 未設定");
        }

        // ──────────────────────────────────────────────────────────────
        // POST /api/Logistics/MapForm
        // 產生綠界門市選擇地圖的表單參數，前端負責開 popup 送出
        // ──────────────────────────────────────────────────────────────
        [Authorize]
        [HttpPost("MapForm")]
        public IActionResult MapForm([FromBody] MapFormRequest req)
        {
            var validSubTypes = new[] { "FAMI", "UNIMART", "HILIFE", "OKMART" };
            if (!validSubTypes.Contains(req.LogisticsSubType))
                return BadRequest(new { error = "無效的超商類型" });

            var parameters = new Dictionary<string, string>
            {
                { "MerchantID",       _merchantID },
                { "LogisticsType",    "CVS" },
                { "LogisticsSubType", req.LogisticsSubType },
                { "IsCollection",     "Y" },
                { "ServerReplyURL",   $"{_ngrokUrl}/api/Logistics/StoreCallback" },
                { "Device",           "0" },
            };

            parameters["CheckMacValue"] = GenerateCheckMacValue(parameters);

            return Ok(new { action = _mapUrl, parameters });
        }

        // ──────────────────────────────────────────────────────────────
        // POST /api/Logistics/StoreCallback
        // 綠界門市選擇後，瀏覽器被導向此端點（form POST）
        // 回傳 HTML：把門市資訊 postMessage 給父視窗後關閉 popup
        // ──────────────────────────────────────────────────────────────
        [HttpPost("StoreCallback")]
        public ContentResult StoreCallback([FromForm] IFormCollection form)
        {
            string storeId   = form["CVSStoreID"].ToString();
            string storeName = form["CVSStoreName"].ToString();
            string address   = form["CVSAddress"].ToString();

            string html = $@"<!DOCTYPE html>
<html><head><meta charset=""utf-8""></head>
<body>
<p style=""font-family:sans-serif;text-align:center;padding:40px"">門市已選擇，視窗即將關閉…</p>
<script>
(function() {{
  var data = {{
    type: 'STORE_SELECTED',
    storeId: {System.Text.Json.JsonSerializer.Serialize(storeId)},
    storeName: {System.Text.Json.JsonSerializer.Serialize(storeName)},
    address: {System.Text.Json.JsonSerializer.Serialize(address)}
  }};
  if (window.opener) {{
    window.opener.postMessage(data, '*');
    window.close();
  }}
}})();
</script>
</body></html>";

            return Content(html, "text/html");
        }

        // ──────────────────────────────────────────────────────────────
        // POST /api/Logistics/CreateOrder
        // 建立綠界超商取貨物流單（IsCollection=Y 代收貨款）
        // ──────────────────────────────────────────────────────────────
        [Authorize]
        [HttpPost("CreateOrder")]
        public async Task<IActionResult> CreateOrder([FromBody] CreateOrderRequest req)
        {
            try
            {
                var order = await _context.ProductOrders
                    .Include(o => o.ProductOrderDetails)
                    .FirstOrDefaultAsync(o => o.Id == req.ProductOrderId);

                if (order == null)
                    return NotFound(new { error = "找不到訂單" });

                if (order.FinalAmount == null || order.FinalAmount <= 0)
                    return BadRequest(new { error = "訂單金額無效" });

                int amount = (int)order.FinalAmount.Value;

                string itemName = "健身商品";

                string tradeNo = "MFL" + DateTime.Now.ToString("yyyyMMddHHmmssfff");

                var parameters = new Dictionary<string, string>
                {
                    { "MerchantID",        _merchantID },
                    { "MerchantTradeNo",   tradeNo },
                    { "MerchantTradeDate", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss") },
                    { "LogisticsType",     "CVS" },
                    { "LogisticsSubType",  req.LogisticsSubType },
                    { "GoodsAmount",       amount.ToString() },
                    { "CollectionAmount",  amount.ToString() },
                    { "IsCollection",      "Y" },
                    { "GoodsName",         itemName },
                    { "SenderName",        "MyFitCoach" },
                    { "SenderPhone",       "0800000000" },
                    { "ReceiverName",      req.ReceiverName },
                    { "ReceiverEmail",     req.ReceiverEmail ?? "" },
                    { "ReceiverCellPhone", req.ReceiverPhone },
                    { "ReceiverStoreID",   req.StoreId },
                    { "ServerReplyURL",    $"{_ngrokUrl}/api/Logistics/Callback" },
                };

                parameters["CheckMacValue"] = GenerateCheckMacValue(parameters);

                var client = _httpClientFactory.CreateClient();
                var content = new FormUrlEncodedContent(parameters);
                content.Headers.ContentType = new MediaTypeHeaderValue("application/x-www-form-urlencoded");

                var response = await client.PostAsync(_apiUrl, content);
                string responseBody = await response.Content.ReadAsStringAsync();

                // 解析綠界回應（格式：RtnCode=1&RtnMsg=OK&AllPayLogisticsID=xxx&...）
                var parsed = HttpUtility.ParseQueryString(responseBody);
                string rtnCode = parsed["RtnCode"] ?? "";
                string rtnMsg  = parsed["RtnMsg"]  ?? responseBody;

                if (rtnCode != "1" && rtnMsg != "訂單處理中(綠界已收到訂單資料)")
                    return BadRequest(new { error = $"綠界物流建單失敗：{rtnMsg}" });

                string logisticsOrderNo = parsed["AllPayLogisticsID"] ?? "";

                // 更新訂單資訊
                order.PaymentMethod    = 1;
                order.StoreId          = req.StoreId;
                order.StoreName        = req.StoreName;
                order.LogisticsOrderNo = logisticsOrderNo;
                order.Status           = 1;
                await _context.SaveChangesAsync();

                return Ok(new { logisticsOrderNo, rtnMsg });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = ex.Message });
            }
        }

        // ──────────────────────────────────────────────────────────────
        // POST /api/Logistics/Callback
        // 綠界物流狀態更新通知
        // ──────────────────────────────────────────────────────────────
        [HttpPost("Callback")]
        public async Task<ContentResult> Callback([FromForm] IFormCollection form)
        {
            try
            {
                string rtnCode        = form["RtnCode"].ToString();
                string logisticsOrderNo = form["AllPayLogisticsID"].ToString();

                if (!string.IsNullOrEmpty(logisticsOrderNo))
                {
                    var order = await _context.ProductOrders
                        .FirstOrDefaultAsync(o => o.LogisticsOrderNo == logisticsOrderNo);

                    if (order != null)
                    {
                        // RtnCode=3024 = 已取貨付款
                        if (rtnCode == "3024") order.Status = 2;
                        await _context.SaveChangesAsync();
                    }
                }

                return Content("1|OK");
            }
            catch (Exception ex)
            {
                return Content($"0|{ex.Message}");
            }
        }

        // ──────────────────────────────────────────────────────────────
        // CheckMacValue（SHA256，與金流相同演算法）
        // ──────────────────────────────────────────────────────────────
        private string GenerateCheckMacValue(Dictionary<string, string> parameters)
        {
            var sortedPairs = parameters
                .OrderBy(p => p.Key, StringComparer.OrdinalIgnoreCase)
                .Select(p => $"{p.Key}={p.Value}");

            string raw     = $"HashKey={_hashKey}&{string.Join("&", sortedPairs)}&HashIV={_hashIV}";
            string encoded = HttpUtility.UrlEncode(raw).ToLower()
                .Replace("%2d", "-").Replace("%5f", "_").Replace("%2e", ".")
                .Replace("%21", "!").Replace("%2a", "*")
                .Replace("%28", "(").Replace("%29", ")");

            using var md5 = System.Security.Cryptography.MD5.Create();
            byte[] bytes = md5.ComputeHash(Encoding.UTF8.GetBytes(encoded));
            return BitConverter.ToString(bytes).Replace("-", "").ToUpper();
        }
    }

    public class MapFormRequest
    {
        public string LogisticsSubType { get; set; } = "FAMI";
    }

    public class CreateOrderRequest
    {
        public int    ProductOrderId   { get; set; }
        public string LogisticsSubType { get; set; } = "FAMI";
        public string StoreId          { get; set; } = "";
        public string StoreName        { get; set; } = "";
        public string ReceiverName     { get; set; } = "";
        public string ReceiverPhone    { get; set; } = "";
        public string? ReceiverEmail   { get; set; }
    }
}
