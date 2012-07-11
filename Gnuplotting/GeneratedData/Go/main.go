package main

import (
	"fmt"
	"math"
	"io/ioutil"
	"os"
	"syscall"
)

// frequency, Hz
const F = 5
// Sampling rate
const SR = 8000
// Seconds count
const SECS = 3
// Overall samples count
const NSAMPLES = SR*SECS
// Sine wave coefficient
const COEF = 2*math.Pi*F

func main() {
	f, err := ioutil.TempFile(os.TempDir(), "plottingData")

	if err != nil {
		panic(err)
		return
	}
	for i := range make([]int, NSAMPLES) {
		x := float64(i)/SR
		fmt.Fprintln(f, x,math.Sin(x*COEF))
	}

	defer f.Close()

	syscall.Exec("../../plotter.gp", []string{" ", f.Name(), "./result"}, []string{})
	defer os.Remove(f.Name())
}
