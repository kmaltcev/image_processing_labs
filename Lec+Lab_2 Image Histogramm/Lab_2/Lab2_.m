clear all
clc

im = imread('pout.jpg');

gray_image = rgb2gray(im);
binary_image = im2bw(gray_image);

figure
subplot(2,2,1)
imshow(im)
subplot(2,2,2)
imshow(gray_image);
subplot(2,2,3)
imshow(binary_image);

imrows=size(im,1);
imcols=size(im,2);

imcol=uint8(zeros(imrows, imcols,3));
imcol(:,:,1)= gray_image; %RED level
imcol(:,:,2)= gray_image; %GREEN level
imcol(:,:,3)= gray_image; %BLUE level

for i=1:imrows 
   for  j=1:imcols
    if i < imrows/2 && j<imcols/2
       imcol(i,j,1)= imcol(i,j,1)+ 100;
    end
 %imcol(:,:,2)= imcol(:,:,2)+100;
%imcol(:,:,3)= imcol(:,:,3)+100;
    end
end

subplot(2,2,4)
imshow(imcol);


