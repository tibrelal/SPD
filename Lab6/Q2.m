M_values = [10, 25, 50, 101];
beta = 5.658; 

N_fft = 1024; 
omega = linspace(-pi, pi, N_fft);

for idx = 1:length(M_values)
    M = M_values(idx);
    n = 0:M-1;

    W_rect = ones(1, M);
    W_hann = 0.5 * (1 - cos(2*pi*n/(M-1)));
    W_tri = 1 - abs(M - 1 - 2*n)/(M-1);
    W_hamm = 0.54 - 0.46 * cos(2*pi*n/(M-1));
    W_black = 0.42 - 0.5 * cos(2*pi*n/(M-1)) + 0.08 * cos(4*pi*n/(M-1));
    

    arg = beta * sqrt(1 - (1 - 2*n/(M-1)).^2);
    W_kaiser = besseli(0, arg) / besseli(0, beta);
    
    windows = {W_rect, W_hann, W_tri, W_hamm, W_black, W_kaiser};
    names = {'Rectangular', 'Hanning', 'Triangular', 'Hamming', 'Blackmann', 'Kaiser'};
    
    figure('Name', sprintf('Windows for M = %d', M));
    
    for w = 1:length(windows)
        win = windows{w};
        

        subplot(6, 2, 2*w - 1);
        stem(n, win, 'filled');
        title([names{w}, ' Time Domain (M=', num2str(M), ')']);
        xlabel('n'); ylabel('Amplitude');
        

        W_f = fftshift(fft(win, N_fft)); 
        W_f_mag = abs(W_f) / max(abs(W_f)); 
        
        subplot(6, 2, 2*w);
        plot(omega, W_f_mag);
        title([names{w}, ' Normalized DFT']);
        xlabel('\omega (rad/sample)'); ylabel('|W(\omega)|');
        axis([-pi pi 0 1]);
    end
end

% --- Behavior Comments ---
% As M increases, the main lobe of the DFT becomes narrower for all window types.
% Increasing M improves frequency resolution but does not decrease the relative 
% height of the side lobes, which is controlled entirely by the window shape.
