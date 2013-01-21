#! /usr/bin/octave -qf

% Inverse Real DFT

% Time domain length
td_length = 32;

% Frequency domain length
fd_length = (td_length/2)+1;

% Prepare empty result buffer
X = zeros(1, td_length);

% Prepare frequency domain (randomly taken data)
ReX = ones(1, fd_length);
ImX = zeros(1, fd_length);

% Calculus
% Finding the cosine and sine wave amplitudes

t = double(td_length)/2;

ReX_ = double(ReX)/t;
ImX_ = double(ImX)/t;

ReX_(1) = ReX_(1)/2;
ReX_(length(ReX_)) = ReX_(length(ReX_))/2;

t = 2*pi/td_length;

for k=1:fd_length,
    for i=1:td_length,
        X(i) = X(i) + ReX_(k)*cos(t*(k-1)*(i-1));
    	X(i) = X(i) + ImX_(k)*sin(t*(k-1)*(i-1));
    end;
end;

% Displaying
y_range_amplifier = 1.3;

td = 0:fd_length-1;

subplot(2, 2, 1);
plot(td, ReX, 'o');
grid on;
axis([0 length(td)-1 -0.5 1.5]);
title('Re X - Cosine waves amplitudes');
ylabel('Value');

subplot(2, 2, 2);
plot(td, ImX, 'o');
grid on;
axis([0 length(td)-1 -0.5 1.5]);
title('Im X - Sine waves amplitudes');
ylabel('Value');

td = 0:td_length-1;

subplot(2, 2, 3:4);
plot(td, X, 'o');
grid on;
y_range = max(abs(min(X)), abs(max(X)))*y_range_amplifier;
axis([0 length(td)-1 -y_range y_range]);
title('X - Synthesized signal');
ylabel('Value');

printf("Press any key to exit..");
pause