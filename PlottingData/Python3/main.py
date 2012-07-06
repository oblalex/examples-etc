import numpy
from numpy import pi 

import Gnuplot, Gnuplot.funcutils

# frequency, Hz
F=5
# Sampling rate
SR=8000
# Seconds count
SECS=3
# Overall samples count
NSAMPLES=SR*SECS

x = numpy.arange(NSAMPLES)
x = x/SR
y = numpy.sin(x*2*pi*F)

g = Gnuplot.Gnuplot(debug=0)
g.clear()
g('set style data lines')
g.title('Sine wave')
g.plot(Gnuplot.Data(x, y, inline=0))

input("Press <return> to exit.")
