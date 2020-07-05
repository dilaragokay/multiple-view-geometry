I1 = imreadbw('img1.png');
I2 = imreadbw('img2.png');
sigma = 2;

[vx, vy] = getFlow(I1, I2, sigma);

velmin = min(min(vx(:)), min(vy(:)));
velmax = max(max(vx(:)), max(vy(:)));

figure(1)

subplot(2,2,1)
imagesc(vx)
colormap(gca, 'jet')
colorbar
caxis([velmin velmax])
title('vx, sigma = 2')

subplot(2,2,2)
imagesc(vy)
colormap(gca, 'jet')
colorbar
caxis([velmin velmax])
title('vy, sigma = 2')

subplot(2,2,3)
imagesc(I1)
colormap(gca, 'gray')
hold on;
quiver(vx,vy)
caxis([velmin velmax])
title('flow, sigma = 2')