function [r1, r2, t1, t2] = eightPoints(x1, y1, x2, y2, m)

% Intrinsic camera parameter matrices
K1 = [844.310547 0 243.413315; 0 1202.508301 281.529236; 0 0 1];
K2 = [852.721008 0 252.021805; 0 1215.657349 288.587189; 0 0 1];

pts1 = K1\[x1 y1 ones(m, 1)]';
pts2 = K2\[x2 y2 ones(m, 1)]';

% Compute an approximation of essential matrix
chi = zeros(m, 9);
for n=1:m
    chi(n, :) = kron(pts1(:, n), pts2(:, n));
end

[U,S,V] = svd(chi);

Es = V(m, :);
E = reshape(Es,[3,3]);  % unstack Es

% Project onto essential space
[U,S,V] = svd(E);

S(1,1) = 1;
S(2,2) = 1;
S(3,3) = 0;

E = U * S * V';

% Recover the displacement from the essential matrix

if det(U) < 0
    U = -1 .* U;
end

if det(V) < 0
    V = -1 .* V;
end

R_z_plus = [0 1 0 ; 1 0 0 ; 0 0 1];
R_z_minus = [0 -1 0 ; -1 0 0 ; 0 0 1];

r1 = U * R_z_plus' * V';
r2 = U * R_z_minus' * V';

t1 = U * R_z_plus * S * U';
t2 = U * R_z_minus * S * U';
end