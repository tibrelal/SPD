function [X] = dtft(x, n, w)
    X = x * exp(-1j * n' * w);
end