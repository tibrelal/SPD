x1 = [1, 3, 5, 7, 9, -7, -5, -3, -1];
N1 = length(x1);
C1 = circulnt(x1, N1);
disp('Circulant matrix for x1:');
disp(C1);

h = [2, 1, 2, 1]';
x_seq = [1, 2, 3, 4]';
C_c = circulnt(h, 4);
y_circ = C_c * x_seq;
disp('Circular convolution of {2, 1, 2, 1} and {1, 2, 3, 4}:');
disp(y_circ);