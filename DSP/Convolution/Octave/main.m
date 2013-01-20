#! /usr/bin/octave -qf

% Reading input file

fid = fopen('../data.in');

x = sscanf(fgets(fid), '%f');
h = sscanf(fgets(fid), '%f');

fclose(fid);

% NOTE:
% Length of the result will be equal to "length(x)+length(h)-1"

% Calculus

% Input Side Algorithm:
% Tells how each input sample affects on the output samples

y_is = zeros(1, (length(x)+length(h)));

for i=1:length(x),
    for j=1:length(h),
        y_is(i+j) = y_is(i+j) + x(i)*h(j);
    end;
end;

% Output Side Algorithm
% Tells which input samples affected on the single output sample

y_os = zeros(1, (length(x)+length(h)));

for i=1:length(y_os),
    for j=1:length(h),
        if ((i-j) < 1) || ((i-j) > length(x))
          continue;
        end;
        y_os(i) = y_os(i) + h(j)*x(i-j);
    end;
end;

% Displaying

y_range_amplifier = 1.5;

td = 0:length(x)-1;

subplot(4, 2, 1);
plot(td, x(1:length(x)), 'o');
grid on
y_range = max(abs(min(x)), abs(max(x)))*y_range_amplifier;
axis([0 length(td)-1 -y_range y_range]);
title('Input signal');
ylabel('Value');

td = 0:length(h)-1;

subplot(4, 2, 2);
plot(td, h(1:length(h)), 'o');
grid on
y_range = max(abs(min(h)), abs(max(h)))*y_range_amplifier;
axis([0 length(td)-1 -y_range y_range]);
title('Impulse response');
ylabel('Value');

td = 0:length(y_is)-2;

subplot(4, 2, 3:4);
plot(td, y_is(2:length(y_is)), 'or');
grid on
y_range = max(abs(min(y_is)), abs(max(y_is)))*y_range_amplifier;
axis([0 length(td)-1 -y_range y_range]);
title('The Input Side Algorithm');
ylabel('Value');

subplot(4, 2, 5:6);
plot(td, y_os(2:length(y_os)), 'ob');
grid on
y_range = max(abs(min(y_os)), abs(max(y_os)))*y_range_amplifier;
axis([0 length(td)-1 -y_range y_range]);
title('The Output Side Algorithm');
ylabel('Value');

subplot(4, 2, 7:8);
diff = y_is-y_os;
plot(td, diff(2:length(diff)), 'om');
grid on
y_range = max(abs(min(diff)), abs(max(diff)))*y_range_amplifier;
axis([0 length(td)-1 -y_range y_range]);
title('Difference');
ylabel('Value');


printf("Press any key to exit..");
pause
