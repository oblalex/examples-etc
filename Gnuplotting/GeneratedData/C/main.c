#include <stdio.h>
#include <math.h>
#include "gnuplot_i.h"

// frequency, Hz
#define F 5
// Sampling rate
#define SR 8000
// Seconds count
#define SECS 3
// Overall samples count
#define NSAMPLES SR*SECS

int main ()
{
	gnuplot_ctrl* h;
	h = gnuplot_init();

	gnuplot_resetplot(h);
	gnuplot_setstyle(h, "lines");
	gnuplot_cmd(h, "set terminal png");
	gnuplot_cmd(h, "set output \"wave.png\"");

	double x[NSAMPLES];
	double y[NSAMPLES];
	int i;

	for (i=0 ; i<NSAMPLES; i++)
	{
		x[i] = (double)i/SR;
		y[i] = (double) sin((double)(x[i]*2*M_PI*F));
	}

	gnuplot_plot_xy(h, x, y, NSAMPLES, "Sine wave");

	gnuplot_close(h);
	return 0;		
}
