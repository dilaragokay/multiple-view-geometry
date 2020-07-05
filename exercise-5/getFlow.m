function [vx, vy] = getFlow(I1, I2, sigma)

[M11, M12, M22, q1, q2] = getMq(I1, I2, sigma);

detM = (M12.^2 - M11 .* M22);

vx = (M22 .* q1 - M12 .* q2) ./ -detM;
vy = (M11 .* q2 - M12 .* q1) ./ -detM;

end

