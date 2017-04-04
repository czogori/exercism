package leap

import "math"

const testVersion = 3

func IsLeapYear(i int) bool {
	return (math.Mod(float64(i), 4) == 0 && math.Mod(float64(i), 100) != 0) || math.Mod(float64(i), 400) == 0
}
