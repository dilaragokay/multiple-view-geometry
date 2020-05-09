%% Question 1 & 2
m = 4;
[D, b] = createdata(m);
pseudoinverse(D, b);

%% Repeat the two previous questions, by setting m to a higher value.
% How is the precision impacted?
m = 20;
[D, b] = createdata(m);
pseudoinverse(D, b);

%% We assume in the following that m = 3, hence we have infinitely many
% solutions.
m = 3;
% Solve again the linear system using questions (1) and (2). Thus
% rank(D) = 3 and dim(kernel(D)) = 1.
[D, b] = createdata(m);
pseudoinverse(D, b);
kernel = null(D);
disp('Null space')
disp(kernel)

%% Let λ ∈ R, xλ = x + λv one possible solution, and eλ =||Dxλ − b||^2 the
% associated error. Using the function plot, display both graphs of ||xλ||
% and eλ according to λ ∈ {−100, . . . , 100}, and observe that the
% statement indeed holds. 
all_x = zeros(1, 201);
all_errors = zeros(1, 201);
x_min = pinv(D) * b;
for i=-100:100
    x = x_min + i .* kernel;
    all_x(i + 101) = norm(x);
    all_errors(i + 101) = norm((D * x) - b).^2;
end
plot(all_x, all_errors)