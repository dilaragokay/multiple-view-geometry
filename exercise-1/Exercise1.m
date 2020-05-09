%% 1. Basic image processing
% Load the image into the workspace
I = imread('lena.png');
% Determine the size of the image
J = imresize(I, 2);
% Show the image
imshow(J)
% Convert the image to grayscale
gray = rgb2gray(I);
% Determine the min and max value of the image 
min(gray(:))
max(gray(:))
% Apply a gaussian smoothing filter
gaussianFiltered = imgaussfilt(I, 2);
% Save the output image
imwrite(gaussianFiltered, "gaussianFiltered.png");
% Show 1) the original image
%      2) the gray scale image and
%      3) the filtered image
% in one figure and give the figures appropriate titles.
subplot(1,3,1), imshow(I), title('the original image')
subplot(1,3,2), imshow(gray), title('the gray scale image')
subplot(1,3,3), imshow(gaussianFiltered), title('the filtered image')
% Compare the gray scale image and the filtered image for different values 
% of the smoothing.
filteredOriginal1 = gaussianFiltered;
filteredGray1 = imgaussfilt(gray, 2);
filteredOriginal2 = imgaussfilt(I, 10);
filteredGray2 = imgaussfilt(gray, 10);

subplot(2,2,1), imshow(filteredOriginal1), title('filtered original - sigma: 2')
subplot(2,2,2), imshow(filteredGray1), title('filtered gray - sigma: 2')
subplot(2,2,3), imshow(filteredOriginal2), title('filtered original - sigma: 10')
subplot(2,2,4), imshow(filteredGray2), title('filtered gray - sigma: 10')

%% 2. Basic Operations
A = [2 2 0 ; 0 8 3];
b = [5 ; 15];
x = A \ b;
% Define a matrix B equal to A
B = A;
% Change the second element in the first row of A to 4
B(1, 2) = 4;
% Compute the following: c = 0;
% for i ∈ {−4,0,4}
% c = c + i ∗ A⊤ ∗ b
% end
% print c
c = [0 ; 0 ; 0];
for i = [-4, 0, 4]
    c = c + i * transpose(A) * b;
end
disp(c)
% Compare A .* B and A’ * B and explain the difference
A .* B; % .* performs elementwise multiplication
A' * B; % * performs matrix multiplication
%% 3. Write a function approxequal(x,y,ε) checking if two vectors x and y 
% are almost equal, i.e. if
% ∀i: |xi−yi|≤ε.
% The output should be logical 1 or 0.

% If the input consists of two matrices, your function should compare the 
% columns of the matrices if they are almost equal. In this case, the 
% output should be a vector with logical values 1 or 0.

function equals = approxequal(x, y, epsilon)
if size(x) == size(y)
    equals = all(abs(x - y) <= epsilon);
end
end

%% 4. Write a function addprimes(s, e) returning the sum of all prime 
% numbers between and including s and e. Use the Matlab-function isprime.

function sumPrimes = addprimes(s, e)
    allNum = [s:e];
    if s > e
        allNum = [e:s];
    end
    sumPrimes = dot(isprime(allNum), allNum);
end
