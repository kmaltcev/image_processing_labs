clear all
clc

im = imread('pout.jpg');
%imtool(monkey)
figure

% Grayscale image
gray_img = rgb2gray(im);
imrows = size(im, 1);
imcols = size(im, 2);

subplot(2,4,1)
imshow(gray_img)
subplot(2,4,5)
imhist(gray_img),axis tight

% Image processing by formula: y = x/2
im2 = gray_img;
for i=1:imrows
    for j=1:imcols
        im2(i,j) = im2(i,j) / 2;
    end
end
subplot(2,4,2)
imshow(im2)
subplot(2,4,6)
imhist(im2),axis tight

% Histogram stretching 1
im3(:,:) = uint16(gray_img);
A = 0;
B = 255;
a = min(min(im3));
b = max(max(im3));

for i=1:imrows
    for j=1:imcols
        im3(i,j) = ((im3(i,j) - a) * (B - A)) / (b - a);
        im3(i,j) = im3(i,j) + A;
    end
end

im3 = uint8(im3);
subplot(2,4,3)
imshow(im3)
subplot(2,4,7)
imhist(im3)

% Histogram stretching (ajustment)
im4(:,:) = uint16(gray_img);
A = 0;
B = 255;
a = min(min(im4));
b = 160;

for i=1:imrows
    for j=1:imcols
        im4(i,j) = ((im4(i,j) - a) * (B - A)) / (b - a);
        im4(i,j) = im4(i,j) + A;
    end
end

im4 = uint8(im4);
subplot(2,4,4)
imshow(im4)
subplot(2,4,8)
imhist(im4)
