package greeting

import "fmt"

const testVersion = 3

func HelloWorld(name string) string {
	if name == "" {
        return "Hello, World!"
    } else {
        return fmt.Sprintf("Hello, %s!", name)
    }
}
