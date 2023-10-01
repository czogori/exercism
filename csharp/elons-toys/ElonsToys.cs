using System;

class RemoteControlCar
{
    private int _distance = 0;
    private int _distanceStep = 20;
    private int _battery = 100;
    private const int MaxDistance = 2000;
    private const int MinBattery = 0;
    public static RemoteControlCar Buy()
    {
        return new RemoteControlCar();
    }

    public string DistanceDisplay()
    {
        return $"Driven {_distance} meters";
    }

    public string BatteryDisplay()
    {
        if (_battery > 0)
        {
            return $"Battery at {_battery}%";
        }
        else
        {
            return "Battery empty";
        }
    }

    public void Drive()
    {
        if (_distance < MaxDistance)
        {
            _distance += _distanceStep;
        }
        if (_battery > MinBattery)
        {
            _battery -= 1;
        }
    }
}
