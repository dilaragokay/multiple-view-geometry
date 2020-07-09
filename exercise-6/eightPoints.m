I1 = imread('batinria0.tif');
I2 = imread('batinria1.tif');

% Show the first image and mark at least 8 points.
[x1, y1] = getpoints2(I1, 10);
% Show the second image and click at the corresponding points in the same
% order
[x2, y2] = getpoints2(I2, 10);