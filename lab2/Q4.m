clc;
clear;
close all;

a = 5;
b = 4;

x = [3 11 a 0 -1 b 2];

rng(1);
w = randn(1,9);

y = [0 0 x] + w;

Nx = length(x);
Ny = length(y);

lags_yx = -(Nx-1):(Ny-1);
r_yx = zeros(1,length(lags_yx));

for k = 1:length(lags_yx)
    lag = lags_yx(k);
    
    for n = 1:Ny
        m = n-lag;
        
        if m >= 1 && m <= Nx
            r_yx(k) = r_yx(k) + y(n)*x(m);
        end
    end
end

lags_xx = -(Nx-1):(Nx-1);
r_xx = zeros(1,length(lags_xx));

for k = 1:length(lags_xx)
    lag = lags_xx(k);
    
    for n = 1:Nx
        m = n-lag;
        
        if m >= 1 && m <= Nx
            r_xx(k) = r_xx(k) + x(n)*x(m);
        end
    end
end

[r_yx_builtin,lags_yx_builtin] = xcorr(y,x);
[r_xx_builtin,lags_xx_builtin] = xcorr(x,x);

disp('x(n):');
disp(x);

disp('y(n):');
disp(y);

disp('Manual Cross-Correlation:');
disp(r_yx);

disp('MATLAB Cross-Correlation:');
disp(r_yx_builtin);

disp('Manual Autocorrelation:');
disp(r_xx);

disp('MATLAB Autocorrelation:');
disp(r_xx_builtin);

figure;
stem(lags_yx,r_yx,'filled');
xlabel('Lag');
ylabel('r_{yx}(l)');
title('Cross-Correlation of y(n) and x(n)');
legend('Manual');
grid on;

figure;
stem(lags_xx,r_xx,'filled');
xlabel('Lag');
ylabel('r_{xx}(l)');
title('Autocorrelation of x(n)');
legend('Manual');
grid on;

figure;
stem(lags_yx,r_yx,'filled');
hold on;
stem(lags_yx_builtin,r_yx_builtin);
xlabel('Lag');
ylabel('Correlation');
title('Manual and MATLAB Cross-Correlation');
legend('Manual','xcorr');
grid on;

figure;
stem(lags_xx,r_xx,'filled');
hold on;
stem(lags_xx_builtin,r_xx_builtin);
xlabel('Lag');
ylabel('Correlation');
title('Manual and MATLAB Autocorrelation');
legend('Manual','xcorr');
grid on;