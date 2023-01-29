class Lasagna
{
	public int ExpectedMinutesInOven() => 40;
	public int RemainingMinutesInOven(int minutesInOven) => ExpectedMinutesInOven() - minutesInOven;
	public int PreparationTimeInMinutes(int numberLayers) => numberLayers * 2;
	public int ElapsedTimeInMinutes(int numberLayers, int minutesInOven) =>
		PreparationTimeInMinutes(numberLayers) + RemainingMinutesInOven(minutesInOven);
}
