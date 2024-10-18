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
fourier = fft2(im_classique);

%Afin d’éviter le phénomène de repliement spectral, effectuer un filtrage simple qui met à zéro les hautes
%fréquences dans la transformée de Fourier.

%Observez votre filtre et sa transformée de Fourier.

%Appliquez votre filtre sur une image.

%Que constatez-vous ? Quel est le nom du phénomène qui apparait ? Expliquez.

%Cherchez d’autres filtres passe-bas qui limitent ce phénomène. Utilisez-les et vérifiez qu’il apporte une
%amélioration. 
div = 16;
x = size(fourier,1);
im_coupe = zeros(x,x);
im_coupe(x/2-x/div:x/2+x/div,x/2-x/div:x/2+x/div) =1;

filtre_carre = im_coupe .* fftshift(fourier);


module_coupe = abs(filtre_carre);
argument_coupe = arg(filtre_carre);
image_coupe = module_coupe .* exp(sqrt(-1) * argument_coupe);
image_inverse_coupe = ifft2(image_coupe);


div = 32;
im_coupe2 = zeros(x,x);
im_coupe2(x/2-x/div:x/2+x/div,x/2-x/div:x/2+x/div) =1;

filtre_carre2 = im_coupe2 .* fftshift(fourier);


module_coupe = abs(filtre_carre2);
argument_coupe = arg(filtre_carre2);
image_coupe = module_coupe .* exp(sqrt(-1) * argument_coupe);
image_inverse_coupe2 = ifft2(image_coupe);

figure(1);
subplot(2,2,1);
imshow(abs(image_inverse_coupe2),[ ]);
title('filtre passe bas carre');
subplot(2,2,2);
imshow(im_coupe2,[]);
title('Z');
subplot(2,2,3);
imshow(abs(image_inverse_coupe),[ ]);
title('image obtenue avec le filtre');
subplot(2,2,4);
imshow(im_coupe,[]);
title('filtre passe bas carre');

waitforbuttonpress;



circle = fspecial('disk',40); # h = cercle
x_circle = size(circle,1);
for i=1:x_circle
  for j=1:x_circle
  pixel = circle(i,j);
    if pixel != 0
      circle(i,j) = 1;
    end


  end
end
filtre_passe_bas = zeros(x,x);
t_carre = 200;
%filtre_passe_bas(x/2-t_carre/2 : x/2+t_carre/2, x/2-t_carre/2 : x/2+t_carre/2)  = 1;
filtre_passe_bas(x/2-x_circle/2+1 : x/2+x_circle/2, x/2-x_circle/2+1 : x/2+x_circle/2) = circle(:,:) ;
im_passe_bas = filtre_passe_bas .* fftshift(fourier);

module_coupe = abs(im_passe_bas);
argument_coupe = arg(im_passe_bas);
image_coupe = module_coupe .* exp(sqrt(-1) * argument_coupe);
image_inverse_coupe = ifft2(image_coupe);


circle = fspecial('disk',20); # h = cercle
x_circle = size(circle,1);
for i=1:x_circle
  for j=1:x_circle
  pixel = circle(i,j);
    if pixel != 0
      circle(i,j) = 1;
    end


  end
end
filtre_passe_bas2 = zeros(x,x);
t_carre = 200;
%filtre_passe_bas(x/2-t_carre/2 : x/2+t_carre/2, x/2-t_carre/2 : x/2+t_carre/2)  = 1;
filtre_passe_bas2(x/2-x_circle/2+1 : x/2+x_circle/2, x/2-x_circle/2+1 : x/2+x_circle/2) = circle(:,:) ;
im_passe_bas = filtre_passe_bas2 .* fftshift(fourier);

module_coupe = abs(im_passe_bas);
argument_coupe = arg(im_passe_bas);
image_coupe = module_coupe .* exp(sqrt(-1) * argument_coupe);
image_inverse_coupe2 = ifft2(image_coupe);


figure(2);
subplot(2,2,1);
imshow(abs(image_inverse_coupe2),[ ]);
title('image obtenue avec le filtre');
subplot(2,2,2);
imshow(filtre_passe_bas2,[]);
title('filtre passe bas rond de rayon 20');
subplot(2,2,3);
imshow(abs(image_inverse_coupe),[ ]);
title('image obtenue avec le filtre');
subplot(2,2,4);
imshow(filtre_passe_bas,[]);
title('filtre passe bas rond de rayon 40');

waitforbuttonpress;


Z = imzoneplate(501);

fourier = fft2(Z);
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

circle = fspecial('disk',20); # h = cercle
x_circle = size(circle,1);
for i=1:x_circle
  for j=1:x_circle
  pixel = circle(i,j);
    if pixel != 0
      circle(i,j) = 1;
    end


  end
end
x_circo = size(Z,1);
filtre_passe_bas2 = zeros(x_circo,x_circo);
t_carre = 200;
%filtre_passe_bas(x/2-t_carre/2 : x/2+t_carre/2, x/2-t_carre/2 : x/2+t_carre/2)  = 1;
filtre_passe_bas2(x_circo/2-x_circle/2+1 : x_circo/2+x_circle/2, x_circo/2-x_circle/2+1 : x_circo/2+x_circle/2) = circle(:,:) ;
im_passe_bas = filtre_passe_bas2 .* fftshift(fourier);

module_coupe = abs(im_passe_bas);
argument_coupe = arg(im_passe_bas);
image_coupe = module_coupe .* exp(sqrt(-1) * argument_coupe);
image_inverse_coupe2 = ifft2(image_coupe);

circle = fspecial('disk',40); # h = cercle
x_circle = size(circle,1);
for i=1:x_circle
  for j=1:x_circle
  pixel = circle(i,j);
    if pixel != 0
      circle(i,j) = 1;
    end


  end
end
x_circo = size(Z,1);
filtre_passe_bas = zeros(x_circo,x_circo);
t_carre = 200;
%filtre_passe_bas(x/2-t_carre/2 : x/2+t_carre/2, x/2-t_carre/2 : x/2+t_carre/2)  = 1;
filtre_passe_bas(x_circo/2-x_circle/2+1 : x_circo/2+x_circle/2, x_circo/2-x_circle/2+1 : x_circo/2+x_circle/2) = circle(:,:) ;
im_passe_bas = filtre_passe_bas .* fftshift(fourier);

module_coupe = abs(im_passe_bas);
argument_coupe = arg(im_passe_bas);
image_coupe = module_coupe .* exp(sqrt(-1) * argument_coupe);
image_inverse_coupe = ifft2(image_coupe);


figure(3);
subplot(2,2,1);
imshow(abs(image_inverse_coupe),[ ]);
title('image obtenue avec le cercle circoncentrique');
subplot(2,2,2);
imshow(filtre_passe_bas,[]);
title('filtre passe bas rond de rayon 40');
subplot(2,2,3);
imshow(abs(image_inverse_coupe2),[ ]);
title('image obtenue avec le cercle circoncentrique');
subplot(2,2,4);
imshow(filtre_passe_bas2,[]);
title('filtre passe bas rond de rayon 20');





