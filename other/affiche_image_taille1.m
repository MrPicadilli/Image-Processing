clc;clear;close all;
I=imread('automne.jpg');
imshow(I,[]);

[r,c,d] = size(I);              %# Get the image size
set(gcf,'Units','pixels','Position',[0 0 c r]);  %# Modify figure size

set(gca,'Units','pixels','Position',[0 0 c r]);  %# Modify axes size

function btn_down (obj, evt)
  cp = get (gca, 'CurrentPoint');
  x = round (cp(1, 1));
  y = round (cp(1, 2));
  img = get (findobj (gca, "type", "image"), "cdata");
  img_v = NA;
  if (x > 0 && y > 0 && x <= columns (img) && y <= rows (img))
    img_v = squeeze (img(y, x, :));
  endif

  if (numel (img_v) == 3) # rgb image
    title(gca, sprintf ("(%i, %i) = %i, %i, %i", x, y, img_v(1), img_v(2), img_v(3)));
  elseif (numel (img_v) == 1) # gray image
    title(gca, sprintf ("(%i, %i) = %i", x, y, img_v));
  endif
endfunction
%set (gcf, 'WindowButtonMotionFcn', @btn_down) 
%set (gcf, 'WindowButtonDownFcn', @btn_down);

hold on;
plot(400:512,400:512,'r*');             %# Plot something over the image

figure();
I=imread('..\images\lena.pgm');
imshow(I,[]);
[r,c,d] = size(I);              %# Get the image size
set(gcf,'Units','pixels','Position',[0 0 c r]);  %# Modify figure size
set(gca,'Units','pixels','Position',[0 0 c r]);  %# Modify axes size