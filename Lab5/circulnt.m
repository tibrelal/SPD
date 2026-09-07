function [C] = circulnt(x, N)
    x = [x(:); zeros(N - length(x), 1)];
    c = x;
    r = [x(1); flipud(x(2:end))];
    C = toeplitz(c, r);
end