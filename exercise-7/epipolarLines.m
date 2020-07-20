close all;
clear all;

addpath('../exercise-6');  % for hat.m
%% Select a point in the first image
I0 = imread("batinria0.pgm");
imshow(I0);
[x, y] = ginput(1);
%% Compute the epipolar line l_2 ~ F * x1 in the second image corresponding
% to the point x1 in the first image.
% First, find F = inv(K_1') * hat{T} * R * inv(K_0).
% Elements of intrinsics matrices(K_0 and K_1) are provided in
% calibration.txt. Fill in the values according to
% K = [f*s_x f*s_theta o_x ; 0 f*s_y o_y; 0 0 1]
K_0 = [844.310547 0 243.413315 ; 0 1202.508301 281.529236; 0 0 1];
K_1 = [852.721008 0 252.021805 ; 0 1215.657349 288.587189; 0 0 1];
% Extrinsics that are provided in calibration.txt are according to world
% frame. We should represent the transformation of right image (#1) based
% on the left image (#0) according to g_0to1 = g_1toworld \ g_0toworld.
g_w0 = [
    0.655133 0.031153 0.754871 -793.848328;
    0.003613 0.999009 -0.044364 269.264465;
    -0.755505 0.031792 0.654371 -744.572876;
    0 0 0 1];
g_w1 = [
    0.739514 0.034059 0.672279 -631.052917;
    -0.006453 0.999032 -0.043515 270.192749;
    -0.673111 0.027841 0.739017 -935.050842;
    0 0 0 1];
g_10 = g_w1 \ g_w0;
T = g_10(1:3, 4);
R = g_10(1:3, 1:3);
E = hat(T) * R;
F = (K_1' \ E) / K_0;

l_2 = F * [x ; y ; 1];
% Each point x_2 on l_2 satistifies l_2' * x_2 = 0. So the line formula 
% y = mx + b can be obtained by
m = - l_2(1) / l_2(2);
b = - l_2(3) / l_2(2);
[h,w,z] = size(I0);
x1 = 1;
x2 = w;
y1 = m * x1 + b;
y2 = m * x2 + b;
I1 = imread("batinria1.pgm");
imshow(I1);
hold on;
line([x1,x2],[y1,y2],'Color','r','LineWidth',1);
hold off;
