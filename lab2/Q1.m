clc;
clear;
close all;

p = 1;
q = 2;
r = 3;
s = 4;

x = [1;2;3;4;5];
h = [p;q;r;s];

[y,H] = conv_tp(h,x);

disp('Toeplitz Matrix H:');
disp(H);

disp('Output y:');
disp(y);

n = 0:length(y)-1;

stem(n,y,'filled');
xlabel('n');
ylabel('y(n)');
title('Linear Convolution using Toeplitz Matrix');
legend('y(n)');
grid on;