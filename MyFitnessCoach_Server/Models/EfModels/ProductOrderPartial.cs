namespace MyFitnessCoach_Server.Models.EfModels;

// 擴充 ProductOrder，新增超商取貨付款相關欄位
// 對應 SQL：
//   ALTER TABLE ProductOrders ADD
//     PaymentMethod    INT NOT NULL DEFAULT 0,   -- 0=線上付款, 1=超商貨到付款
//     StoreId          NVARCHAR(6)  NULL,
//     StoreName        NVARCHAR(60) NULL,
//     LogisticsOrderNo NVARCHAR(20) NULL;
public partial class ProductOrder
{
    public int     PaymentMethod    { get; set; } = 0;
    public string? StoreId          { get; set; }
    public string? StoreName        { get; set; }
    public string? LogisticsOrderNo { get; set; }
}
