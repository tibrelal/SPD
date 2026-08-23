n = -20:20;
a = 7;
b = 9;

u1 = (n + a) >= 0;
u2 = (n - b) >= 0;
x = (0.6 .^ abs(n)) .* (u1 - u2);

w = linspace(-pi, pi, 1000);
X = dtft(x, n, w);

figure;
subplot(2,1,1);
plot(w, abs(X));
xlabel('\omega');
ylabel('|X(e^{j\omega})|');
title('Magnitude Spectrum');
legend('|X(e^{j\omega})|');

subplot(2,1,2);
plot(w, angle(X));
xlabel('\omega');
ylabel('\angle X(e^{j\omega})');
title('Phase Spectrum');
legend('\angle X(e^{j\omega})');