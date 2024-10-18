im_classique=imread('lena.pgm');
fourier = fft2(im_classique);
fourier = fftshift(fourier);


x = size(im_classique,1);
im_grand = zeros(x*4,x*4);
x_grand = size(im_grand,1);
im_grand(x_grand/2-x/2 +1:x_grand/2+x/2,x_grand/2-x/2 +1:x_grand/2+x/2) = fourier(:,:);
im_grand = fftshift(im_grand);
im_grand = ifft2(im_grand);





figure(1);
imshow(im_classique,[ ]);
title('image normale');
figure(2)
imshow(abs(im_grand),[]);
title('image aggrandi');