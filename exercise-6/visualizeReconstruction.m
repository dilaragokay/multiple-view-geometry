function visualizeReconstruction(X1, r, t)
    figure;
    plot3(X1(:,1),X1(:,2),X1(:,3),'*');
    hold on
    grid on
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
    axis equal
    plotCamera('Size', 0.2);
    plotCamera('Orientation', r, 'Location', t, 'Color', [0,1,0], 'Size', 0.2);
    cameratoolbar('SetMode','orbit');
end