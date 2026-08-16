clc;
clear;
close all;

T1 = 0.5;
T2 = 0.1;

t1 = 0:T1:2;
t2 = 0:T2:2;

f1 = exp(-t1);
f2 = exp(-t2);

A1 = T1*(sum(f1)-0.5*f1(1)-0.5*f1(end));
A2 = T2*(sum(f2)-0.5*f2(1)-0.5*f2(end));

A_exact = 1-exp(-2);

disp(['Area for T = 0.5: ',num2str(A1)]);
disp(['Area for T = 0.1: ',num2str(A2)]);
disp(['Exact area: ',num2str(A_exact)]);

figure;

plot(t1,f1,'o-');
xlabel('t');
ylabel('f(t)');
title('f(t) = exp(-t), T = 0.5');
legend('T = 0.5');
grid on;

figure;

plot(t2,f2,'o-');
xlabel('t');
ylabel('f(t)');
title('f(t) = exp(-t), T = 0.1');
legend('T = 0.1');
grid on;