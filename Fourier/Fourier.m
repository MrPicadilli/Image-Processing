pkg load image

x_size = 300;
y_size = 300;

x_rapport = x_size/100;
y_rapport = y_size/100;







%%%%%%%%%%%%%%%%%%% display result %%%%%%%%%%%%%%%%%%%%%
%{
1. Générez une image comportant un rectangle blanc sur un fond noir.
2. Calculez la transformée de Fourier et affichez le résultat (on affichera l'amplitude en rehaussant
les hautes fréquences). Expliquez le résultat obtenu.
3. Modifiez la taille du rectangle, sa position, son orientation et refaites la même chose.
%}


rect_vers_1 = zeros(x_size,y_size);
rect_vers_1(30*x_rapport:40*x_rapport,30*y_rapport:40*y_rapport) = 255;
rect_vers_2 = zeros(x_size,y_size);
rect_vers_2(15*x_rapport:25*x_rapport,15*y_rapport:25*y_rapport) = 255;
rect_vers_2(54*x_rapport:60*x_rapport,30*y_rapport:50*y_rapport) = 255;
rect_vers_3 = zeros(x_size,y_size);
rect_vers_3(39*x_rapport:41*x_rapport,30*y_rapport:50*y_rapport) = 255;
rect_vers_4 = imrotate(rect_vers_1, 45);

f_rect1 = log(1+0.1 * abs(fft2(rect_vers_1 )));
f_rect2 = log(1 + 0.1*abs(fft2(rect_vers_2 )));
f_rect3 = log(1+0.1 * abs(fft2(rect_vers_3 )));
f_rect4 = log(1+0.1 * abs(fft2(rect_vers_4 )));


figure(1);
subplot(2,4,1)
imshow(rect_vers_1,[])
title('carré blanc dans un fond noir')
subplot(2,4,2)
imshow(f_rect1,[])
title('fourier de ce carré')
subplot(2,4,3)
imshow(rect_vers_2,[])
title('2 rectangle blanc dans un fond noir')
subplot(2,4,4)
imshow(f_rect2,[])
title('fourrier de ces 2 rectangles')
subplot(2,4,5)
imshow(rect_vers_3,[])
title('rectangle blanc fin dans un fond noir')
subplot(2,4,6)
imshow(f_rect3,[])
title('fourier du rectangle fin image')
subplot(2,4,7)
imshow(rect_vers_4,[])
title('carré blanc tourne a 45 degree dans un fond noir')
subplot(2,4,8)
imshow(f_rect4,[])
title('fourier du carré tourné image')
waitforbuttonpress;


%{
4. Calculez la transformée de Fourier d’une grille d’impulsions (points blancs régulièrement espacés
dans une image de fond noir).
%}

grid = zeros(x_size,y_size);
grid(5:10:x_size-5,5:10:y_size-5) = 255;
fourier_grid = log(1+0.1*abs(fft2(grid )));

figure(2)
subplot(1,2,1)
imshow(grid,[])
title('grille d impulsion tout les 5 pixel')
subplot(1,2,2)
imshow(fourier_grid,[])
title('fourier de cette grille')

waitforbuttonpress;
%{
5. Calculez la transformée de Fourier d’une Gaussienne en 2D et faites varier la largeur.
Commentez.
Attention aux images de nature complexe et au « shift » nécessaire (fonctions à utiliser : fft2, abs,
angle, fftshift…)
%}

# il faut une taille de fenetre impaire
gauss = fspecial('gaussian',101,20);
gauss_f = log(abs(fft2(gauss)));

figure(3)
subplot(1,2,1)
imshow(gauss,[])
title('image d une fonction gaussienne')
subplot(1,2,2)
imshow(gauss_f,[])
title('fourier de cette image')



