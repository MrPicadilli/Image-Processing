pkg load image

%{
Générez une image comportant un couple de pixels blancs sur un fond noir. Ces points seront placés
symétriquement par rapport au centre (à une distance d du centre et avec une orientation téta).

Considérez cette image comme un spectre et calculez la transformée de Fourier inverse. Afficher le résultat
et commentez.

Modifiez la position du couple de pixels en faisant varier d et téta. Interprétez le résultat.
%}

%%%%%%%%%%%%%%%%%%% partie 1 %%%%%%%%%%%%%%%%%%%%%


x_t = 50;
x_c = x_t /2 +1;
x_g = 4;
y_g = 2;

point = zeros(x_t,x_t);
point(x_c -x_g,x_c - y_g) = 255;
point(x_c +x_g,x_c + y_g) = 255;
f_point = log(1 + 0.1*abs(ifft2(point )));



# en changeant la distance de la position des points on change aussi  la periode des sinusoide
point_var_dist = zeros(x_t,x_t);
point_var_dist(x_c -x_g*2,x_c - y_g*2) = 255;
point_var_dist(x_c +x_g*2,x_c + y_g*2) = 255;
f_point_var_dist = log(1+0.1*abs(ifft2(point_var_dist )));


# en changeant l'angle de la position des points on change aussi l'angle qu'ont nos sinusoide
point_var_theta = zeros(x_t,x_t);
point_var_theta(x_c -y_g,x_c - x_g) = 255;
point_var_theta(x_c +y_g ,x_c + x_g) = 255;
f_point_var_theta = log(1 + 0.1*abs(ifft2(point_var_theta )));



figure(1);
#point
subplot(3,2,1);
imshow(point,[]);
title('point symetrique au centre');
subplot(3,2,2);
imshow(f_point,[]);
title('inverse fourier des points');
subplot(3,2,3);
imshow(point_var_dist,[]);
title('on fait varier la distance');
subplot(3,2,4);
imshow(f_point_var_dist,[]);
title('inverse fourier apres avoir change la distance');
subplot(3,2,5);
imshow(point_var_theta,[]);
title('on fait varier theta');
subplot(3,2,6);
imshow(f_point_var_theta,[]);
title('inverse fourier apres avoir change theta');

waitforbuttonpress;

%%%%%%%%%%%%%%%%%%% partie 2 %%%%%%%%%%%%%%%%%%%%%
%{
Etudiez la transformée inverse d’autres images contenant des formes simples géométriques : cercle,
secteur angulaire, etc. Justifiez.
%}

#cercle
circle = fspecial('disk',200); # h = cercle
f_circle = log(abs(ifft2(circle )));
demi_circle = circle; #h2 = quart de cercle
p = length(circle) / 2;
demi_circle(1:p,:) = 0;
demi_circle(:,1:p) = 0;
f_demi_circle = log(abs(ifft2(demi_circle )));


#cerle
figure(2);
subplot(2,2,1);
imshow(circle,[]);
title('simple cercle');
subplot(2,2,2);
imshow(f_circle,[]);
title('fourier du cercle');
figure(2);
subplot(2,2,3);
imshow(demi_circle,[]);
title('simple demi cercle');
subplot(2,2,4);
imshow(f_demi_circle,[]);
title('fourier du demi cercle');


waitforbuttonpress;
%%%%%%%%%%%%%%%%%%% partie 3 %%%%%%%%%%%%%%%%%%%%%

%Calculez le module et la phase de la transformée de Fourier d’une image.



#fourier image
im_classique=imread('lena.pgm');

im_180 = im_classique(end:-1 : 1, end:-1 : 1);


fourier = fft2(im_classique);
module = abs(fourier);
phase = arg(fourier);


figure(3);
subplot(2,2,1);
imshow(im_classique,[ ]);
title('fourier de mon image');
subplot(2,2,2);
imshow(log(1+0.1*abs(fourier )),[ ])
title('fourier de mon image');
subplot(2,2,3);
imshow(log(1+0.1*abs(module )),[])
title('module de mon image');
subplot(2,2,4);
imshow(phase, [] )
title('phase de mon image');

waitforbuttonpress;


%2

%Modifiez la phase pour la rendre aléatoire. Calculez la transformée inverse et commentez.


argument2 = ones(512,512) * 255;
mat_aleatoire = argument2 .* rand(512,512);


image = module .* exp(sqrt(-1) * phase);
image_inverse = ifft2(image);
image1 = module .* exp(sqrt(-1) * mat_aleatoire);
image_inverse1 = ifft2(image1);
image2 = mat_aleatoire .* exp(sqrt(-1) * phase);
image_inverse2 = ifft2(image2);


figure(4);
subplot(2,2,1);
imshow(mat_aleatoire,[ ]);
title('matrice aleatoire');
subplot(2,2,2);
imshow(image_inverse1,[ ])
title('phase aleatoire');
subplot(2,2,3);
imshow(image_inverse2,[])
title('module aleatoire');
subplot(2,2,4);
imshow(image_inverse, [] )
title('image origine');

waitforbuttonpress;

%3

%Essayez ensuite avec une phase constante puis un module constant. Commentez.
mat_simple = ones(512,512)*127;


image = module .* exp(sqrt(-1) * phase);
image_inverse = ifft2(image);
image1 = module .* exp(sqrt(-1) * mat_simple);
image_inverse1 = ifft2(image1);
image2 = mat_simple .* exp(sqrt(-1) * phase);
image_inverse2 = ifft2(image2);


figure(5);
subplot(2,2,1);
imshow(log(1+0.1*abs(mat_simple )),[ ]);
title('matrice constante');
subplot(2,2,2);
imshow(image_inverse1,[ ])
title('phase constante');
subplot(2,2,3);
imshow(image_inverse2,[])
title('module constant');
subplot(2,2,4);
imshow(image_inverse, [] )
title('image de base');

waitforbuttonpress;

%4

%Prenez deux images dont vous échangez la phase de la transformée de Fourier. Commentez. 


grue=imread('grue.gif');

fourier_grue = fft2(grue);

module_grue = abs(fourier_grue);
argument_grue = arg(fourier_grue);


image = module .* exp(sqrt(-1) * argument_grue);
image_inverse = ifft2(image);
image1 = module_grue .* exp(sqrt(-1) * phase);
image_inverse1 = ifft2(image1);



phase = cos(phase) + sqrt(-1) * (sin(angle(fourier)));

affichage_module = log(1+0.1*fftshift(module));
affichage_phase = log(1+0.1*fftshift(phase));




figure(6);
subplot(2,2,1);
imshow(abs(image_inverse),[ ]);
title('module lena + phase grue');
subplot(2,2,2);
imshow(abs(image_inverse1),[ ])
title('module grue + phase lena');
subplot(2,2,3);
imshow(grue,[])
title('grue');
subplot(2,2,4);
imshow(im_classique, [] )
title('lena');

