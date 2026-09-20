x = [2, 1, 2, 1, 1, 2, 1, 2];
X = fft(x);
x_rec = ifft(X);

disp('FFT of sequence:');
disp(X);
disp('IFFT of sequence:');
disp(x_rec);


figure;
title('Conceptual Framework for N=8 Butterfly Diagram');
xlabel('Stages'); ylabel('Nodes');
hold on;
N = length(x);
stages = log2(N);


for s = 1:stages
    for k = 0:(N-1)
        plot(s-1, k, 'ko', 'MarkerFaceColor', 'k'); 
        plot([s-1, s], [k, k], 'b-'); % Horizontal paths
       

        step = 2^(s-1);
        if mod(k, 2*step) < step
            plot([s-1, s], [k, k+step], 'r-'); % Diagonal down
        else
            plot([s-1, s], [k, k-step], 'r-'); % Diagonal up
        end
    end
end
set(gca, 'YDir','reverse'); 
hold off;
