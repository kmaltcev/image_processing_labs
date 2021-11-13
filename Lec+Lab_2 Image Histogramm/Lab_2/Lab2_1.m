clear all
clc

im = imread('pout.jpg');
gray_image = rgb2gray(im);

figure
subplot(2,3,1)
imshow(gray_image);
subplot(2,3,4)
imhist(gray_image),axis tight

%imshow(p),figure,imhist(p),axis tight

imrows=size(im,1); % rows number
imcols=size(im,2); % cols number

new_im1 = gray_image;

for i=1:imrows 
   for  j=1:imcols
    if new_im1(i,j) < 128
       new_im1(i,j)= new_im1(i,j) - 50 ;
    end
    end
end
subplot(2,3,2)
imshow(new_im1);

new_im2(:,:)= gray_image;

for i=1:imrows 
   for  j=1:imcols
    if new_im2(i,j) > 128
        new_im2(i,j)= new_im2(i,j) * 2 - 50;
    end
    end
end

subplot(2,3,3)
imshow(new_im2);

subplot(2,3,5)
imhist(new_im1),axis tight
subplot(2,3,6)
imhist(new_im2),axis tight