%% Write a function that rotates the model around its center (i.e. the mean
% of its vertices) for given rotation angles α, β and γ around the x-, y- 
% and z-axis. Use homogeneous coordinates and describe the overall 
% transformation by a single matrix.
function V_ = rotate(V, alpha, beta, gamma)
    centerOfMass = mean(V);
    % Translate to center
    V_ = V - centerOfMass;
    % Since matrix multiplication does not commute, the order of the axes 
    % affect the result. Here, rotation is done first about the x-axis, 
    % then the y-axis, and finally the z-axis.
    transformation = [cos(beta)*cos(gamma),...
        sin(alpha)*sin(beta)*cos(gamma) - cos(alpha)*sin(gamma),...
        cos(alpha)*sin(beta)*cos(gamma) + sin(alpha) * sin(gamma);
        cos(beta)*sin(gamma),...
        sin(alpha)*sin(beta)*sin(gamma) + cos(alpha)*cos(gamma),...
        sin(beta)*sin(gamma)*cos(alpha) - sin(alpha)*cos(gamma);
        -sin(beta),...
        sin(alpha) * cos(beta),...
        cos(alpha)*cos(beta)];
    V_ = V_ * transformation;
    % Translate back
    V_ = V_ + centerOfMass;
end