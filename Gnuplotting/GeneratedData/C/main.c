#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// frequency, Hz
#define F 5
// Sampling rate
#define SR 8000
// Seconds count
#define SECS 3
// Overall samples count
#define NSAMPLES SR*SECS
// Sine wave coefficient
#define COEF 2*M_PI*F

int main ()
{  
  char fname[64];
  tmpnam(fname);
  
  FILE *f = fopen(fname, "w");

  double x, y;
  int i;  
  
  for (i=0 ; i<NSAMPLES; i++)
  {
    x = (double)i/SR;
    y = (double) sin((double)(x*COEF));
    fprintf (f, "%f\t%f\n", x, y);
  }

  fclose(f);  

  char cmd[100];
  sprintf(cmd, "../../plotter.gp %s ./result", fname);
  system(cmd);
  
  return 0;
}
