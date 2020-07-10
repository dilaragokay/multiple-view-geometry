function [isPosDepth, X1] = reconstruction(r, t, pts1, pts2, m)
    M = zeros(3*m, m);
    for n=0:m-1
        M(n*3+1:n*3+3, n+1) = hat(pts2(:, n+1)) * r * pts1(:, n+1);
    end
    vec = zeros(3, m);
    for n=1:m
        vec(:, n) = hat(pts2(:, n)) * t;
    end
    M = [M vec(:)];
    [V,D] = eig(M' * M);
    % Linear least squares estimate for lambda_1 is given by the
    % eigenvector corresponding to the smallest eigenvalue of M' * M
    lambda_1 = V(1:end-1, 1);
    gamma = V(end, 1);
    if gamma < 0
        gamma = -gamma;
        lambda_1 = -lambda_1;
    end
    lambda_1 = lambda_1 / gamma;
    
    isPosDepth = true;
    X1 = zeros(m,3);
    X2 = zeros(m,3);
    for n=1:m
        X1(n, :) = lambda_1(n) .* pts1(:, n);
        X2(n, :) = r * X1(n, :)' + t;
        if (X1(n, 3) < 0 || X2(n, 3) < 0)
            isPosDepth = false;
            break;
        end
    end
end