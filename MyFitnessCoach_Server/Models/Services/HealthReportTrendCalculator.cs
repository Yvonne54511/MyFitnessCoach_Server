namespace MyFitnessCoach_Server.Models.Services;

public sealed class HealthReportTrendCalculator
{
    /// <summary>
    /// 計算線性迴歸斜率與方向。x = 距 fromDate 的天數，y = 指標值。
    /// </summary>
    public TrendResult Calculate(IEnumerable<(int x, double y)> points, double epsilon = 0.005)
    {
        var pts = points.ToList();
        if (pts.Count < 2) return new TrendResult(null, "unknown");

        var n     = (double)pts.Count;
        var sumX  = pts.Sum(p => (double)p.x);
        var sumY  = pts.Sum(p => p.y);
        var sumXY = pts.Sum(p => (double)p.x * p.y);
        var sumX2 = pts.Sum(p => (double)p.x * p.x);
        var denom = n * sumX2 - sumX * sumX;

        if (Math.Abs(denom) < 1e-10) return new TrendResult(null, "unknown");

        var slope = (n * sumXY - sumX * sumY) / denom;
        var direction = Math.Abs(slope) < epsilon ? "flat"
                      : slope > 0               ? "up"
                      :                           "down";

        return new TrendResult(Math.Round(slope, 6), direction);
    }
}

public sealed record TrendResult(double? Slope, string Direction);
