close all;
clear all;

I1 = imread('batinria0.tif');
I2 = imread('batinria1.tif');

m = 8;

% Show the first image and mark at least 8 points.
[x1, y1] = getpoints2(I1, m);
% Show the second image and click at the corresponding points in the same
% order
[x2, y2] = getpoints2(I2, m);
% Find camera transformation parameters
[r1, r2, t1, t2] = eightPoints(x1, y1, x2, y2, m);

