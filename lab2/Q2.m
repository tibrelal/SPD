clc;
clear;
close all;

p = 1;
q = 2;
r = 3;
s = 4;

x = [1 2 3 4 5];
h = [p q r s];

Nx = length(x);
Nh = length(h);

y = zeros(1,Nx+Nh-1);

for i = 1:Nx
    for j = 1:Nh
        y(i+j-1) = y(i+j-1) + x(i)*h(j);
    end
end

disp('Individual convolution terms:');

for k = 1:length(y)
    terms = [];
    for i = 1:Nx
        j = k-i+1;
        if j >= 1 && j <= Nh
            terms = [terms; x(i), h(j), x(i)*h(j)];
        end
    end
    disp(['Position n = ',num2str(k-1)]);
    disp(terms);
end

disp('Linear convolution output:');
disp(y);

n = 0:length(y)-1;

stem(n,y,'filled');
xlabel('n');
ylabel('y(n)');
title('Linear Convolution using Arithmetic Multiplication');
legend('y(n)');
grid on;