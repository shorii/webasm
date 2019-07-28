package main

import (
	"syscall/js"
	"time"
)

const (
	TIME_FORMAT = "2006/01/02 15:04:05"
)

func main() {
	ticker := time.NewTicker(1 * time.Second)
	body := js.Global().Get("document").Call("querySelector", "body")
	for {
		<-ticker.C
		currentTime := time.Now().Format(TIME_FORMAT)
		body.Set("innerText", currentTime)
	}
}
