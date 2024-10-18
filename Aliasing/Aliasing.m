pkg load image

function I = imzoneplate(N);

if nargin < 1
    N = 501;
end

if rem(N,2) == 1
    x2 = (N-1)/2;
    x1 = -x2;
else
    x2 = N/2;
    x1 = -x2 + 1;
end

[x,y] = meshgrid(x1:x2);
r = hypot(x,y);
km = 0.7*pi;
rm = x2;
w = rm/10;
term1 = sin( (km * r.^2) / (2 * rm) );
term2 = 0.5*tanh((rm - r)/w) + 0.5;
g = term1 .* term2;

I = (g + 1)/2;

endfunction;



im_classique=imread('lena.pgm');

x = size(im_classique,1);

im_deci = im_classique;
im_deci(1:2:x,:) = 0;

im_decime_2 = im_classique;
im_decime_2(1:2:x-1 ,:) =  im_classique(2:2:x,:);

im_decime_4 = im_classique;
im_decime_4(1:4:x ,:) =  im_classique(4:4:x,:);
im_decime_4(2:4:x ,:) =  im_classique(4:4:x,:);
im_decime_4(3:4:x ,:) =  im_classique(4:4:x,:);

im_decime_8 = im_classique;
im_decime_8(1:8:x ,:) =  im_classique(8:8:x,:);
im_decime_8(2:8:x ,:) =  im_classique(8:8:x,:);
im_decime_8(3:8:x ,:) =  im_classique(8:8:x,:);
im_decime_8(4:8:x ,:) =  im_classique(8:8:x,:);
im_decime_8(5:8:x ,:) =  im_classique(8:8:x,:);
im_decime_8(6:8:x ,:) =  im_classique(8:8:x,:);
im_decime_8(7:8:x ,:) =  im_classique(8:8:x,:);


figure(1);
subplot(2,2,1);
imshow(im_classique,[ ]);
title('image normal');
subplot(2,2,2);
imshow(im_decime_2,[ ])
title('decimation de 2');
subplot(2,2,3);
imshow(im_decime_4,[])
title('decimation de 4');
subplot(2,2,4);
imshow(im_decime_8, [] )
title('decimation de 8');
waitforbuttonpress;



fourier = fft2(im_classique);
module = abs(fourier);

argument = arg(fourier);


argument2 = ones(512,512) * 255;
mat_aleatoire = argument2 .* rand(512,512);




Z = imzoneplate(501);



fourier_Z = fft2(Z);
module_Z = abs(fourier);
argument_Z = arg(fourier);

affichage_module_Z = log(1+0.1*fftshift(module_Z));
affichage_argument_Z = log(1+0.1*fftshift(argument_Z));
affichage_fourier_Z = log(1+0.1*fftshift(fourier_Z));

%Effectuez une décimation simple (prendre un point sur 2, 4, 8…) sur différentes images.

size_Z = size(Z,1);
im_decime_2_Z = Z;
im_decime_2_Z(1:2:size_Z-1 ,:) =  Z(2:2:size_Z,:);

im_decime_4_Z = Z;
im_decime_4_Z(1:4:size_Z-1 ,:) =  Z(4:4:size_Z,:);
im_decime_4_Z(2:4:size_Z-1 ,:) =  Z(4:4:size_Z,:);
im_decime_4_Z(3:4:size_Z-1 ,:) =  Z(4:4:size_Z,:);

im_decime_8_Z = Z;
im_decime_8_Z(1:8:size_Z-8 ,:) =  Z(8:8:size_Z,:);
im_decime_8_Z(2:8:size_Z-8 ,:) =  Z(8:8:size_Z,:);
im_decime_8_Z(3:8:size_Z-8 ,:) =  Z(8:8:size_Z,:);
im_decime_8_Z(4:8:size_Z-8 ,:) =  Z(8:8:size_Z,:);
im_decime_8_Z(5:8:size_Z-8 ,:) =  Z(8:8:size_Z,:);
im_decime_8_Z(6:8:size_Z-6 ,:) =  Z(8:8:size_Z,:);
im_decime_8_Z(7:8:size_Z-4 ,:) =  Z(8:8:size_Z,:);

figure(2);
subplot(2,2,1);
imshow(Z,[ ]);
title('cercle circoncentrique');
subplot(2,2,2);
imshow(im_decime_2_Z);
title('decimation 2');
subplot(2,2,3);
imshow(im_decime_4_Z)
title('decimation 4')
subplot(2,2,4);
imshow(im_decime_8_Z)
title('decimation 8')

waitforbuttonpress;




figure(3);
subplot(2,2,1);
imshow(log(1+0.1*fftshift(fft2(im_classique))),[ ]);
title('fourier de image de base');
subplot(2,2,2);
imshow(log(1+0.1*fftshift(fft2(im_decime_2))),[ ])
title('fourier sur la decimation 2');
subplot(2,2,3);
imshow(log(1+0.1*fftshift(fft2(im_decime_4))),[])
title('fourier sur la decimation 4');
subplot(2,2,4);
imshow(log(1+0.1*abs(fft2(im_decime_8))), [] )
title('fourier sur la decimation 8');

waitforbuttonpress;


figure(4);
subplot(2,2,1);
imshow(log(1+0.1*fftshift(fft2(Z))),[ ]);
title('fourier de image de base');
subplot(2,2,2);
imshow(log(1+0.1*fftshift(fft2(im_decime_2_Z))),[ ])
title('fourier sur la decimation 2');
subplot(2,2,3);
imshow(log(1+0.1*fftshift(fft2(im_decime_4_Z))),[])
title('fourier sur la decimation 4');
subplot(2,2,4);
imshow(log(1+0.1*abs(fft2(im_decime_8_Z))), [] )
title('fourier sur la decimation 8');


