function [D, b] = createdata(m)
    disp(['m = ', num2str(m)])
    %% Create some data
    % Generate such a matrix D using random values with m = 4 rows. (Hint: 
    % Use rand to define d1, d2, d3 and set d4 = 4d1 − 3d2 + 2d3 − 1.) In
    % general, rank(D) = 4, hence there is a unique solution.
    D = zeros(m, 4);
    D(1:m, 1:3) = rand([m 3]);
    D(1:m, 4) = (4 .* D(1:m, 1)) - (3 .* D(1:m, 2)) + (2 .* D(1:m, 3)) - 1;
    assert(rank(D) == min(4, m));

    % Introduce small additive errors into the data. (Hint: Use eps*rand 
    % with eps=1.e-4)
    eps = 1e-4;
    noise = eps * rand([m 4]);
    D = D + noise;
    
    % b ∈ Rm a vector whose components are all equal to 1.
    b = ones([m 1]);
end