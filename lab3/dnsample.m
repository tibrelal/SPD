function [y, m] = dnsample(x, n, M)
    n_new = n(mod(n, M) == 0);
    m = n_new / M;
    y = x(mod(n, M) == 0);
end