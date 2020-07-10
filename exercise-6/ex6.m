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
[r1, r2, t1, t2, pts1, pts2] = eightPoints(x1, y1, x2, y2, m);

X1 = zeros(m,3);
r = eye(3);
t = zeros(3,1);
[isPosDepth, X1_] = reconstruction(r1, t1, pts1, pts2, m);
if isPosDepth == 1
    X1 = X1_;
    r = r1;
    t = t1;
end
[isPosDepth, X1_] = reconstruction(r1, t2, pts1, pts2, m);
if isPosDepth == 1
    X1 = X1_;
    r = r1;
    t = t2;
end
[isPosDepth, X1_] = reconstruction(r2, t1, pts1, pts2, m);
if isPosDepth == 1
    X1 = X1_;
    r = r2;
    t = t1;
end
[isPosDepth, X1_] = reconstruction(r2, t2, pts1, pts2, m);
if isPosDepth == 1
    X1 = X1_;
    r = r2;
    t = t2;
end

visualizeReconstruction(X1, r, t);