function pseudoinverse(D, b)
    %% Find the coefficients x solving the system Dx = b.
    % Compute the SVD for the matrix D. (Hint: Use svd)
    [U,S,V] = svd(D, 'econ');

    % Compute the Moore-Penrose pseudo-inverse using the result from (a),
    % and compare it to the output of the MATLAB function pinv.
    svdpinv = V * inv(S) * U.';
    assert(isequal(svdpinv, pinv(D)));

    % Compute the coefficients x, and compare it to the true solution x.
    % x* = [4, −3, 2, −1]T ∈ R4
    x = pinv(D) * b;
    xActual = [4;-3;2;-1];
    disp(['Difference between computed x and the true x is ',...
        num2str(norm(x - xActual))])
end