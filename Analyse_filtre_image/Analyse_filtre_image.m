
im_classique=imread('automne.jpg');

%%%%%%%%%%%%%%%%%%% display result %%%%%%%%%%%%%%%%%%%%%
%%%%%%% question 1 mettre en niveau de gris

im_gray = rgb2gray(im_classique);

im_gray_red =im_classique(:,:,1);
im_gray_green =im_classique(:,:,2);
im_gray_blue =im_classique(:,:,3);

im_additivity = (im_gray_red*0.298936 + im_gray_green*0.587043 + im_gray_blue*0.114021);


figure(1);
subplot(2,2,1)
imshow(im_gray_red,[])
title('image en nuance de gris avec juste la couleur rouge')
subplot(2,2,2)
imshow(im_gray_green,[])
title('image en nuance de gris avec juste la couleur verte')
subplot(2,2,3)
imshow(im_gray_blue,[])
title('image en nuance de gris avec juste la couleur bleu')
subplot(2,2,4)
imshow(im_additivity,[])
title('image en nuance l addition des couleurs')


waitforbuttonpress;
im_gray = rgb2gray(im_classique);


figure(2);
imshow(im_gray,[])
title('image en gris')





im_red_filter = im_classique;
im_red_filter(:,:,2:3) = 0;

im_green_filter = im_classique;
im_green_filter(:,:,1:2:3) = 0;

im_blue_filter = im_classique;
im_blue_filter(:,:,1:2) = 0;

im_additivity_filter = im_red_filter+ im_green_filter + im_blue_filter;
waitforbuttonpress;

figure(3);
subplot(2,2,1)
imshow(im_red_filter,[])
title('image filtrer en rouge')
subplot(2,2,2)
imshow(im_green_filter,[])
title('image filtrer en vert')
subplot(2,2,3)
imshow(im_blue_filter,[])
title('image filtrer en bleu')
subplot(2,2,4)
imshow(im_additivity_filter,[])
title('addition des couleur')


waitforbuttonpress;
%%%%%question 3
%fontion pour pour mettre une image en binaire
% allocate space for thresholded image
image_binaire = zeros(size(im_gray));
% loop over all rows and columns


for ii=1:size(im_gray,1)
    for jj=1:size(im_gray,2)
        % get pixel value
        pixel=im_gray(ii,jj);
          % check pixel value and assign new value
          if pixel<128
              new_pixel=0;
          elseif pixel>128
              new_pixel=256;
          else
              new_pixel = pixel;
          end
          % save new pixel value in thresholded image
          image_binaire(ii,jj)=new_pixel;
      end
  end

    image_grey = zeros(size(im_classique,1),size(im_classique,2));

  for ii=1:size(im_classique,1)
    for jj=1:size(im_classique,2)
        % get pixel value
          temp = (double(im_classique(ii,jj,1)) + double(im_classique(ii,jj,2) + double(im_classique(ii,jj,3)))) /3.0;
          image_grey(ii,jj)=uint8(temp);
      end
  end

  

  %fontion pour pour mettre une image en binaire

% allocate space for thresholded image
% loop over all rows and columns

figure(4);
subplot(2,2,1)
imshow(im_classique)
title('image originel')
subplot(2,2,2)
imshow(image_binaire,[])
title('image binaire fait maison')
subplot(2,2,3)
imshow(uint8(image_grey))
title('image en nuance de gris fait maison')

%%%%question 4
#manipuler des pixels
x=50;
y=10;
pixel_r = im_classique(x,y,1)
pixel_g = im_classique(x,y,2)
pixel_b = im_classique(x,y,3)
pixel = im_classique(x,y,:)



%%%%%%%question 5
waitforbuttonpress;

ligne = im_classique(10,:,:);

figure(5);
plot(ligne)
title('ligne ou x est a 10')

waitforbuttonpress;
%%%%%question 6
n=2;
im_q6 = im_classique(1:n^2  :size(im_classique,1),1:n^2:size(im_classique,1),:);

figure(6)
imshow(im_q6,[])
title('compression question 6')

