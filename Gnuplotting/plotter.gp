#! /bin/bash
# Usage: run script with 2 parameters:
# 1st: input *.data file name
# 2nd: output *.png file name without extension
# Example: ./plotter.gp ~/somedata ~/result

gnuplot << EOF

set term png
set output "$2.png"
set style data lines

plot "$1"

EOF