clear all
clc

Im = imread('lena512.jpg');
A=rgb2gray(Im);

%Prewitt filters
filter_Px = ([-1, 0, 1;-1, 0, 1;-1, 0, 1]);
filter_Py = ([-1, -1, -1; 0, 0, 0; 1, 1, 1]);

%Sobel Filters
filter_Sx = ([-1, 0, 1;-2, 0, 2;-1, 0, 1]);
filter_Sy = ([-1, -2, -1; 0, 0, 0; 1, 2, 1]);

%Roberts Filters
filter_Rx = ([1, 0, 0; 0, -1, 0; 0, 0, 0]);
filter_Ry = ([0, 1, 0; -1, 0, 0; 0, 0, 0]);

Laplacian = ([0, 1,0; 1, -4, 1; 0, 1, 0]);

function [B] = Prewitt(A)
end

function [B] = Sobel(A)
end

function [B] = Roberts(A)
end

function [B] = Laplacian_Filtering(A)
end

