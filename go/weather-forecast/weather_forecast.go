// Package weather forecast.
package weather

// CurrentCondition current condition.
var CurrentCondition string

// CurrentLocation current location.
var CurrentLocation string

// Forecast is a forecast for a given current location and weather conditions.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
