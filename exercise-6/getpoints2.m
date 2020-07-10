function [x_n,y_n] = getpoints2(I, m)
    x_n = zeros(m,1);
    y_n = zeros(m,1);
    % Show the  image and mark m points.
    imagesc(I);
    for n=1:m
       [x, y] = ginput(1);
       x_n(n) = x(1);
       y_n(n) = y(1);
       hold on
       h = plot(x(1), y(1), 'o');
       set(h, 'MarkerFaceColor', get(h,'Color'),'MarkerSize',9);
       drawnow
    end
end