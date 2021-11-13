clear all
clc

A = imread('bird.jpg');
imrows=size(A,1);
    imcols=size(A,2);
B = simple_down_samp(A);% write code function
rowsB=size(B,1);
colsB=size(B,2);

C = avg_down_samp(A);% write code function

figure
subplot(1,2,1)
imshow(B)
title(['Sipmle Down sampling  ',num2str(rowsB),'*',num2str(colsB)]);
subplot(1,2,2)
imshow(C)
title('Down sampling with filtering');

D = nearest_up_samp(A);
E = bilinear_up_samp(A);
F = bicubic_up_samp(A);

rowsD=size(D,1);
colsD=size(D,2);
figure 
imshow(D)
title(['Nearest up sampling ', num2str(rowsD),'*',num2str(colsD)]);

figure 
imshow(E);
title('Bilinear up sampling');

figure
imshow(F);
title('Bicubic up sampling');

function [B] = simple_down_samp(A)
    imrows=size(A,1);
    imcols=size(A,2);
    B=uint8(zeros(floor(imrows/2),floor(imcols/2),3));
    for i=1:2:imrows
        for j=1:2:imcols
            k = round(i/2);
            d = round(j/2);
            B(k,d,:) = A(i,j,:);
        end
    end
end

function [B] = avg_down_samp(A)
    imrows=size(A,1);
    imcols=size(A,2);
    B=double(zeros(floor(imrows/2),floor(imcols/2),3));
    A = double(A);
    for i=1:2:imrows-1
        for j=1:2:imcols-1
            k = round(i/2);
            d = round(j/2);
            B(k,d,:) = (A(i,j,:) + A(i+1,j,:) + A(i,j+1,:) + A(i+1,j+1,:))/4;
        end
    end
    B = uint8(B);
end

function [B] = nearest_up_samp(A)
    imrows=size(A,1);
    imcols=size(A,2);
    B=zeros(imrows*2,imcols*2,3);
    for i=0:imrows-1
        for j=0:imcols-1
            B(2*i+1, 2*j+1, :) = A(i+1, j+1, :);
            B(2*i+2, 2*j+1, :) = A(i+1, j+1, :);
            B(2*i+1, 2*j+2, :) = A(i+1, j+1, :);
            B(2*i+2, 2*j+2, :) = A(i+1, j+1, :);
        end
    end
    B = uint8(B);
end

function [B] = bilinear_up_samp(A)
    imrows=size(A,1);
    imcols=size(A,2);
    B=double(zeros(imrows*2,imcols*2,3));
    A = double(A);
    for i=0:imrows-2
        for j=0:imcols-2
            B(2*i+1, 2*j+1, :) = A(i+1, j+1, :);
            B(2*i+1, 2*j+2, :) = (A(i+1, j+1, :) + A(i+1, j+2, :))/2;
            B(2*i+2, 2*j+1, :) = (A(i+1, j+1, :) + A(i+2, j+1, :))/2;
            B(2*i+2, 2*j+2, :) = (A(i+1, j+1, :) + A(i+2, j+1, :) + A(i+2, j+1, :) + A(i+2, j+2, :))/4;
        end
    end
    imrows=size(B,1);
    imcols=size(B,2);
    B(imrows,:,:) = B(imrows-2,:,:);
    B(imrows-1,:,:) = B(imrows-2,:,:);
    B(:,imcols,:) = B(:,imcols-2,:);
    B(:,imcols-1,:) = B(:,imcols-2,:);
    B = uint8(B);
end

function [B] = bicubic_up_samp(A)
    imrows=size(A,1);
    imcols=size(A,2);
    B=double(zeros(imrows*2,imcols*2,3));
    A = double(A);
    for m=2:imrows-1
        for n=2:imcols-1
            B(2*m, 2*n, :) = A(m, n, :);
            B(2*m, 2*n+1, :) = -0.125*A(m, n-1, :) + 0.625*A(m, n, :) + 0.625*A(m, n+1, :) - 0.125*A(m, n+1, :);
            B(2*m+1, 2*n, :) = -0.125*A(m-1, n, :) + 0.625*A(m, n, :) + 0.625*A(m+1, n, :) - 0.125*A(m+1, n, :);
            B(2*m+1, 2*n+1, :) = -0.125*A(m-1, n-1, :) + 0.625*A(m, n, :) + 0.625*A(m+1, n+1, :) - 0.125*A(m+1, n+1, :);
        end
    end
    imrows=size(B,1);
    imcols=size(B,2);
    for i=1:3
        B(i,:,:) = B(4,:,:);
        B(:,i,:) = B(:,4,:);
    end
    B(imrows,:,:) = B(imrows-1,:,:);
    B(:,imcols,:) = B(:,imcols-1,:);
    B = uint8(B);
end