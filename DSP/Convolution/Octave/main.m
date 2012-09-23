#! /usr/bin/octave -qf

% Reading input file

fid = fopen('../data.in');

x = sscanf(fgets(fid), '%f');
h = sscanf(fgets(fid), '%f');

fclose(fid);

% Input Side Algorithm

y_is = zeros(1, (length(x)+length(h)));

for i=1:length(x),
    for j=1:length(h),
        y_is(i+j) = y_is(i+j) + x(i)*h(j);
    end;
end;

td = 0:length(y_is)-2;
subplot(3, 1, 1);
plot(td, y_is(2:length(y_is)), 'or');
grid on
axis([0 length(td)-1 min(y_is)+min(y_is)*0.2 max(y_is)+max(y_is)*0.2]);
title('The Input Side Algorithm');
xlabel('Samples');
ylabel('Value');

% Output Side Algorithm

y_os = zeros(1, (length(x)+length(h)));

for i=1:length(y_os),
    for j=1:length(h),
        if ((i-j) < 1) || ((i-j) > length(x))
          continue;
        end;
        y_os(i) = y_os(i) + h(j)*x(i-j);
    end;
end;

subplot(3, 1, 2);
plot(td, y_os(2:length(y_os)), 'ob');
grid on
axis([0 length(td)-1 min(y_os)+min(y_os)*0.2 max(y_os)+max(y_os)*0.2]);
title('The Output Side Algorithm');
xlabel('Samples');
ylabel('Value');

% Display difference

subplot(3, 1, 3);
diff = y_is-y_os;
plot(td, diff(2:length(diff)), 'om');
grid on
axis([0 length(td)-1 min(diff)+min(diff)*0.2 max(diff)+max(diff)*0.2]);
title('Difference');
xlabel('Samples');
ylabel('Value');

% Footer

printf("Press any key to exit..");
pause
