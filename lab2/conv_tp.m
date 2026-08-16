function [y,H] = conv_tp(h,x)

Nx = length(x);
H = toeplitz([h;zeros(Nx-1,1)],[h(1);zeros(Nx-1,1)]);

y = H*x;

end