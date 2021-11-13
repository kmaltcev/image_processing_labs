clear all
clc

im = imread('pout.jpg');
%imtool(monkey)

gray_image = rgb2gray(im);
binary_image = im2bw(gray_image);

figure
subplot(4,2,1)
imshow(im)
subplot(4,2,2)
imhist(im)

subplot(4,2,3)
imshow(gray_image);
subplot(4,2,4)
imhist(gray_image)

subplot(4,2,5)
imshow(binary_image);
subplot(4,2,6)
imhist(binary_image)

f=im;
fc0 = f(1:end/2, 1:end/2, :);
subplot(4,2,7)
imshow(fc0);
subplot(4,2,8)
imhist(fc0)


