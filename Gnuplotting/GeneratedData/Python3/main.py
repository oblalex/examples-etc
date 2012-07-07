import numpy
from numpy import pi 

import tempfile, os, subprocess

# frequency, Hz
F=5
# Sampling rate
SR=8000
# Seconds count
SECS=3
# Overall samples count
NSAMPLES=SR*SECS

def main():
  x = numpy.arange(NSAMPLES)/SR
  y = numpy.sin(x*2*pi*F)  
  plotData(x,y)


def plotData(x, y):
  path = saveDataAndGetPath(x, y)
  os.system("../../plotter.gp "+path+" ./result")
  os.remove(path)
  
def saveDataAndGetPath(x, y):
  fd, path = tempfile.mkstemp()
  for i in range(NSAMPLES):
    os.write(fd, bytes(str(x[i]) + "\t" + str(y[i]) + "\n", "UTF-8"))
  os.close(fd)
  return path
  
main()