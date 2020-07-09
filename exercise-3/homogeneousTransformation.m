%% load & display model
[V,F] = openOFF('model.off', '');

%% Below is an example to rotation
% V = rotate(V, pi/2, 0, 0);
%% Rotate the model first 45 degrees around the x-axis and then 120 degrees
% around the z- axis. Now start again by doing the same rotation around the
% z-axis first followed by the x-axis rotation. What do you observe?

% The two approaches resulted in different transformations. This is
% observed since matrix multiplication is not commutative.
%V_ = rotate(V, pi/2, 0, 0);
%V_ = rotate(V_, 0, 0, pi*4/3);

%V_ = rotate(V, pi*4/3, 0, 0);
%V_ = rotate(V_, 0, 0, pi/2);
%% Translate the model by the vector (0.5 0.2 0.1)T
V_ = transform(V, 0, 0, 0, [0.5;0.2;0.1]);
%% close figure
close all;

%% display model again (possibly with changed vertex positions V)
P = patch('Vertices', V, 'Faces', F, 'FaceVertexCData',0.3*ones(size(V,1),3));
axis equal;
shading interp;
camlight right;
camlight left;