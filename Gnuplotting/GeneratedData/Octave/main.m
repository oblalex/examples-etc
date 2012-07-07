#! /usr/bin/octave -qf

% frequency, Hz
f = 5;
% Sampling rate
sr = 8000;
% Seconds count
secs = 3;
% Overall samples count
samples = sr*secs;
% Time domain
td = linspace(0, secs, samples);
% Resulting wave
wave = sin(td*2*pi*f);
% Wave output
plot(td, wave);
printf("Press <return> to exit.\n");
pause
