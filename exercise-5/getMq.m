function [M11, M12, M22, q1, q2] = getMq(I1, I2, sigma)
    Ix = (I1(:, [2:end end]) - I1(:,[1 1:end-1])) ./ 2;
    Iy = (I1([2:end end], :) - I1([1 1:end-1], :)) ./ 2;
    
    G = fspecial('gaussian',ceil(4 * sigma)+1,sigma);
   
    M11 = conv2(Ix .* Ix, G, 'same');
    M12 = conv2(Ix .* Iy, G, 'same');
    M22 = conv2(Iy .* Iy, G, 'same');
    
    It = I2 - I1;
    q1 = conv2(Ix .* It, G, 'same');
    q2 = conv2(Iy .* It, G, 'same');
end