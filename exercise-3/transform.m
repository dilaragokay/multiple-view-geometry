%% Extend the function such that it can perform a translation in addition 
% to the rotation. Find a suitable matrix from SE(3) for this purpose.
function V_ = transform(V, alpha, beta, gamma, translation)
    centerOfMass = mean(V);
    % Translate to center
    V_ = V - centerOfMass;
    s = size(V);
    newCol = ones(s(1,1), 1);
    V_ = [V_ newCol];
    transformation = [cos(beta)*cos(gamma),...
        sin(alpha)*sin(beta)*cos(gamma) - cos(alpha)*sin(gamma),...
        cos(alpha)*sin(beta)*cos(gamma) + sin(alpha) * sin(gamma),...
        0;
        cos(beta)*sin(gamma),...
        sin(alpha)*sin(beta)*sin(gamma) + cos(alpha)*cos(gamma),...
        sin(beta)*sin(gamma)*cos(alpha) - sin(alpha)*cos(gamma),...
        0;
        -sin(beta),...
        sin(alpha) * cos(beta),...
        cos(alpha)*cos(beta),...
        0;
        translation(1, 1) translation(2, 1) translation(3, 1) 1];
    V_ = V_ * transformation;
    V_(:,4) = [];
    % Translate back
    V_ = V_ + centerOfMass;
end