x1 = [1, 3, 2, -1];
x2 = [2, 1, 0, -1];

x3 = conv(x1, x2);
n3 = 0:(length(x3)-1);

figure;
stem(n3, x3, 'filled', 'DisplayName', 'x_3(n)');
xlabel('n'); grid on;
ylabel('Amplitude'); 
title('Linear Convolution x_3(n)');
legend('show');

N = 4;
x4 = zeros(1, N);
for k = 1:length(x3)
    idx = mod(k-1, N) + 1;
    x4(idx) = x4(idx) + x3(k);
end
n4 = 0:(N-1);

figure;
stem(n4, x4, 'filled', 'DisplayName', 'x_4(n)');
xlabel('n'); grid on;
ylabel('Amplitude'); 
title('Circular Convolution x_4(n) derived from x_3(n)');
legend('show');