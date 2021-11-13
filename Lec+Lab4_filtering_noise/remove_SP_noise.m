clear all
clc

%Im = imread('zebra.jpg');
Im = imread('cameraman_noise.jpg');
%Im = imread('plane_noise2.png');
A=rgb2gray(Im);
% rows=size(A,1);
% cols=size(A,2);

add_noise=imnoise(A,'salt & pepper',0.2);


filter=1/16*([1, 2, 1; 2, 4, 2; 1, 2, 1]);


a3=fspecial('average');
a5=fspecial('average',[5,5]);

A_af3=uint8(filter2(a3,A));
A_waf3=uint8(filter2(filter,A,'same'));

A_mf3=medfilt2(A, [3,3]);
A_mf5=medfilt2(A,[5,5]);
A_mf3_2=medfilt2(A_mf3, [3,3]);


figure
subplot(1,2,1)
imshow(A_mf3_2)
title('Median 3*3');
subplot(1,2,2)
imshow(A_mf3)
title('Median Cross Window');

figure
subplot(1,2,1)
imshow(A_mf3)
title('Average 3*3');
subplot(1,2,2)
imshow(A_waf3)
title('Weighted Average 3*3');

% figure
% subplot(1,3,1)
% imshow(A)
% title('Original');
% subplot(1,3,2)
% imshow(A_mf3)
% title('Median 3*3');
% subplot(1,3,3)
% imshow(A_mf3_2)
% title('Double Median 3*3');
% 
% figure
% subplot(2,2,1)
% imshow(A)
% title('Original');
% subplot(2,2,2)
% imshow(A_af3)
% title('Average 3*3');
% subplot(2,2,3)
% imshow(A_mf3)
% title('Median 3*3');
% subplot(2,2,4)
% imshow(A_mf5)
% title('Median 5*5');