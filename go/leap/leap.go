package leap

// import "fmt"
// import "time"
// import "strconv"
import "math"

const testVersion = 3

func IsLeapYear(i int) bool {
	// t := time.Now()
	
	// i, err := strconv.Atoi(fmt.Sprintf(t.Format("2006")))
    // if err != nil {
    //     fmt.Println(err)
    // }
	return (math.Mod(float64(i), 4) == 0 && math.Mod(float64(i), 100) != 0) || math.Mod(float64(i), 400) == 0
}
