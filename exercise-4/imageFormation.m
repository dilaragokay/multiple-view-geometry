addpath('../exercise-3');
[V,F] = openOFF('model.off', '');
%% Translate the model vertices by the vector T = (−0.5 −0.5 1)^T using
% homogeneous coordinates and a 3 × 4 rigid body transformation matrix.
T = [-0.5 ; -0.5 ; 1];
transformation = [eye(3) T];
s = size(V, 1);
V_hom = [V'; ones(1, s)];
V_translated = transformation * V_hom;
%% Perspective projection
x = projection(V_translated);
% Visualize the projection
figure(1)
subplot(121)
patch('Vertices', x', 'Faces', F)
axis equal, axis([0 640 0 480]-0.5)
title('Perspective projection')
%% Parallel projection
% Compute the parallel projection of the translated model using the same
% camera intrinsics
V_parallel = [V_translated(1:2,:) ; ones(1, s)];
x_parallel = projection(V_parallel);
figure(1)
subplot(122)
patch('Vertices', x_parallel', 'Faces', F)
axis equal, axis([0 640 0 480]-0.5)
title('Parallel projection')
%% Helper functions
function x = projection(X)
    % f = 540, o_x = 320, o_y = 240 and s_x = s_y = 1, s_θ = 0
    K = [540 0 320 ; 0 540 240 ; 0 0 1];
    scaled_x = K * X;
    x = scaled_x(1:2, :) ./ scaled_x(3, :);
end