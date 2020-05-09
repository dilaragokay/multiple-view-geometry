%% Create some data
% Generate such a matrix D using random values with m = 4 rows. (Hint: Use 
% rand to define d1, d2, d3 and set d4 = 4d1 − 3d2 + 2d3 − 1.) In general, 
% rank(D) = 4, hence there is a unique solution.
D = zeros(4, 4);
D(1:3, 1:4) = rand([3 4]);
D(4, 1:4) = 4 * D(1, 1:4) - 3 * D(2, 1:4) + 2 * D(3, 1:4) - 1;
assert(rank(D) == 4);

% Introduce small additive errors into the data. (Hint: Use eps*rand with
% eps=1.e-4)
eps = 1e-4;
noise = eps * rand(4);
D = D + noise;