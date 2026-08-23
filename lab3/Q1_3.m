n = -50:50;
c = 7;
d = 9;
x = sin(0.12 * c * pi * n);

[y, m] = dnsample(x, n, d);

figure;
subplot(2,1,1);
stem(n, x);
xlabel('n');
ylabel('x(n)');
title('Original Signal x(n)');
legend('x(n)');

subplot(2,1,2);
stem(m, y);
xlabel('m');
ylabel('y(m)');
title('Downsampled Signal y(m) by factor 9');
legend('y(m)');