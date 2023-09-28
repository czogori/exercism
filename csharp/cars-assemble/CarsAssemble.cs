using System;

static class AssemblyLine
{
    private static readonly int ProductionRate = 221;

    public static double SuccessRate(int speed)
        => speed switch
    {
        0 => 0.0,
        (>= 1) and( <= 4) => 1.0,
        (>= 5) and( <= 8) => 0.90,
        9 => 0.80,
        10 => 0.77
    };

    public static double ProductionRatePerHour(int speed)
        => ProductionRate * speed * SuccessRate(speed);

    public static int WorkingItemsPerMinute(int speed)
        => (int) ProductionRatePerHour(speed) / 60;
}
