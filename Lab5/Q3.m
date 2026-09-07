n = 0:6;
x = [1, 2, -3, 4, -5];

x_full = zeros(1, 7);
x_full(1:length(x)) = x; 

y = zeros(1, 7);
for k = 1:length(n)
    idx = mod(-8 - n(k), 7);
    y(k) = x_full(idx + 1); 
end

figure;
stem(n, y, 'filled', 'DisplayName', 'y(n)');
xlabel('n'); 
ylabel('Amplitude'); grid on;
title('Sequence x((-8-n))_7 R_7(n)');
legend('show');