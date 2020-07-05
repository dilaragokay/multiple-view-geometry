%% Calculates the structure tensor for image I and the given sigma value.
function [M11, M12, M22] = getM(I, sigma)
    % Compute the image gradients Ix and Iy using central differences.
    % Ix = (I(y, x + 1) - I(y, x - 1)) / 2
    % Iy = (I(y + 1, x) - I(y - 1, x)) / 2
    Ix = (I(:, [2:end end]) - I(:,[1 1:end-1])) ./ 2;
    Iy = (I([2:end end], :) - I([1 1:end-1], :)) ./ 2;
    
    % As weighting function use a two-dimensional Gaussian Kernel with a
    % standard deviation sigma. Use a kernel size k = 2 * 2sigma + 1.
    G = fspecial('gaussian',2*ceil(2 * sigma)+1,sigma);
     
    % Use Matlab function conv2 to compute M11, M12 and M22. It isn't
    % nessary to compute M21 as it is equal to M12.
    M11 = conv2(G, Ix .* Ix, 'same');
    M12 = conv2(G, Ix .* Iy, 'same');
    M22 = conv2(G, Iy .* Iy, 'same');
end