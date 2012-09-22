#! /usr/bin/octave -qf

fid = fopen('../data.in');

x = sscanf(fgets(fid), '%f');
h = sscanf(fgets(fid), '%f');

fclose(fid);

y = zeros(1, (length(x)+length(h)));

for i=1:length(x),
    for j=1:length(h),
        y(i+j) = y(i+j) + x(i)*h(j);
    end;
end;

td = 0:length(y)-2;                 % indexing trick to come from
plot(td, y(2:length(y)), 'or');     % one-indexing to zero-indexing
grid on
title('The Input Side Algorithm');
xlabel('Samples');
ylabel('Value');

printf("Press any key to exit...");
pause
