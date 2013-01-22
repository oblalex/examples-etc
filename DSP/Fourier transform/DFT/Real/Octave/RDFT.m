#! /usr/bin/octave -qf

% Real DFT
% Pulse signal analysis

% Time domain length
td_length = 32;

% Frequency domain length
fd_length = (td_length/2)+1;

% Prepare impulse
X = zeros(1, td_length);
X(1) = 1;

% Prepare buffers for frequency domain result
ReX = zeros(1, fd_length);
ImX = zeros(1, fd_length);

% Calculus

t = 2*pi/td_length;

for k=1:fd_length,
    for i=1:td_length,
        ReX(k) = ReX(k) + X(i)*cos(t*(k-1)*(i-1));
    	ImX(k) = ImX(k) - X(i)*sin(t*(k-1)*(i-1));
    end;
end;

% Displaying

y_range_amplifier = 1.3;

td = 0:td_length-1;

subplot(2, 2, 1:2);
plot(td, X, 'o');
grid on;
y_range = max(abs(min(X)), abs(max(X)))*y_range_amplifier;
axis([0 length(td)-1 -y_range y_range]);
title('X - Analysed signal');
ylabel('Value');

td = 0:fd_length-1;

subplot(2, 2, 3);
plot(td, ReX, 'o');
grid on;
axis([0 length(td)-1 -0.5 1.5]);
title('Re X - Cosine waves amplitudes');
ylabel('Value');

subplot(2, 2, 4);
plot(td, ImX, 'o');
grid on;
axis([0 length(td)-1 -0.5 1.5]);
title('Im X - Sine waves amplitudes');
ylabel('Value');

printf("Press any key to exit..");
pause