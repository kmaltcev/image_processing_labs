clear all
clc

Im = imread('lena512.jpg');
A = rgb2gray(Im);

%Prewitt filters
Prewitt_titles = (["Px" "Py" "Max PA"]);
filter_Px = ([-1, 0, 1; -1, 0, 1; -1, 0, 1]);
filter_Py = ([-1, -1, -1; 0, 0, 0; 1, 1, 1]);

%Sobel Filters
Sobel_titles = (["Sx" "Sy" "Max SA"]);
filter_Sx = ([-1, 0, 1;-2, 0, 2;-1, 0, 1]);
filter_Sy = ([-1, -2, -1; 0, 0, 0; 1, 2, 1]);

%Roberts Filters
Roberts_titles = (["Rx" "Ry" "Max RA"]);
filter_Rx = ([1, 0, 0; 0, -1, 0; 0, 0, 0]);
filter_Ry = ([0, 1, 0; -1, 0, 0; 0, 0, 0]);

%Laplacian Filters
Laplacian = ([0, 1,0; 1, -4, 1; 0, 1, 0]);

Apply_filter(A, filter_Px, filter_Py, Prewitt_titles);
Apply_filter(A, filter_Sx, filter_Sy, Sobel_titles);
Apply_filter(A, filter_Rx, filter_Ry, Roberts_titles);
Laplacian_Filtering(A, Laplacian)

function Apply_filter(A, filter_x, filter_y, titles)
    imrows = size(A,1);
    imcols = size(A,2);
    Fx = double(zeros(imrows,imcols));
    Fy = double(zeros(imrows,imcols));
    FA = double(zeros(imrows,imcols));
    A = double(A);
    for i=2:imrows-1
        for j=2:imrows-1
            % Px
            Fx(i, j) = A(i-1, j-1) * filter_x(1,1) + A(i-1, j) * filter_x(1,2) + A(i-1, j+1) * filter_x(1,3)...
                    + A(i, j-1) * filter_x(2,1) + A(i, j) * filter_x(2,2) + A(i, j+1) * filter_x(2,3)...
                    + A(i+1, j-1) * filter_x(3,1) + A(i+1, j) * filter_x(3,2) + A(i+1, j+1) * filter_x(3,3);
            % Py
            Fy(i, j) = A(i-1, j-1) * filter_y(1,1) + A(i-1, j) * filter_y(1,2) + A(i-1, j+1) * filter_y(1,3)...
                    + A(i, j-1) * filter_y(2,1) + A(i, j) * filter_y(2,2) + A(i, j+1) * filter_y(2,3)...
                    + A(i+1, j-1) * filter_y(3,1) + A(i+1, j) * filter_y(3,2) + A(i+1, j+1) * filter_y(3,3);
            % Max PA
            FA(i, j) = max(Fx(i,j),Fy(i,j));
        end
    end
    Fx = uint8(Fx);
    Fy = uint8(Fy);
    FA = uint8(FA);
    figure
    subplot(1,3,1)
    imshow(Fx)
    title(titles(1))
    subplot(1,3,2)
    imshow(Fy)
    title(titles(2))
    subplot(1,3,3)
    imshow(FA)
    title(titles(3))
end

function Laplacian_Filtering(A, filter)
    imrows = size(A,1);
    imcols = size(A,2);
    A = double(A);
    LA = double(zeros(imrows,imcols));
    for i=2:imrows-1
        for j=2:imrows-1
            % LA
            LA(i, j) = A(i-1, j-1) * filter(1,1) + A(i-1, j) * filter(1,2) + A(i-1, j+1) * filter(1,3)...
                    + A(i, j-1) * filter(2,1) + A(i, j) * filter(2,2) + A(i, j+1) * filter(2,3)...
                    + A(i+1, j-1) * filter(3,1) + A(i+1, j) * filter(3,2) + A(i+1, j+1) * filter(3,3);
        end
    end
    LA = uint8(LA);
    figure
    imshow(LA)
    title("Lplacian Filtering")
end