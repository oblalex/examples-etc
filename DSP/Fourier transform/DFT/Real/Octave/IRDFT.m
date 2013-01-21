#! /usr/bin/octave -qf

% Inverse Real DFT

% Time domain length
td_length = 16;

% Frequency domain length
fd_length = (td_length/2)+1;

% Prepare empty result buffer
X = zeros(1, td_length);

% Prepare frequency domain (randomly taken data)
ReX = [0,   1, 0,   2, 0, 0, 0, 0,   3];
ImX = [0, 0.3, 0, 0.6, 0, 0, 0, 0, 0.9];

% Calculus
% Finding the cosine and sine wave amplitudes

ReX_ = ReX;
ImX_ = ImX;

t = td_length/2;

for k=1:length(fd_length),
	ReX_(k) = ReX_(k)/t;
	ImX_(k) = ImX_(k)/t;
end;

ReX(1) = ReX(1)/2;
ReX(fd_length) = ReX(fd_length)/2;

t = 2*pi/td_length

for k=1:fd_length,
    for i=1:td_length,       
        X(i) = X(i) + ReX_(k)*cos(t*k*i);
    	X(i) = X(i) + ImX_(k)*sin(t*k*i);
    end;
end;

% Displaying

y_range_amplifier = 1.3;

td = 0:fd_length-1;

subplot(2, 2, 1);
plot(td, ReX(1:length(ReX)), 'o');
grid on
y_range = max(abs(min(ReX)), abs(max(ReX)))*y_range_amplifier;
axis([0 length(td)-1 -y_range y_range]);
title('Re X - Cosine waves amplitudes');
ylabel('Value');

subplot(2, 2, 2);
plot(td, ImX(1:length(ImX)), 'o');
grid on
y_range = max(abs(min(ImX)), abs(max(ImX)))*y_range_amplifier;
axis([0 length(td)-1 -y_range y_range]);
title('Im X - Sine waves amplitudes');
ylabel('Value');

td = 0:td_length-1;

subplot(2, 2, 3:4);
plot(td, X(1:length(X)), 'o');
grid on
y_range = max(abs(min(X)), abs(max(X)))*y_range_amplifier;
axis([0 length(td)-1 -y_range y_range]);
title('X - Synthesized signal');
ylabel('Value');

printf("Press any key to exit..");
pause