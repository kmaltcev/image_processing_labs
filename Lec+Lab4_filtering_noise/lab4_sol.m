clear all
clc
% read image
zebra = imread("zebra.jpg");
% apply filters
zebra_avg = avg_filter(zebra);
zebra_weight = weighted_avg_filter(zebra);
% get size
imrows=size(zebra,1);
imcols=size(zebra,2);
% show figure
figure
subplot(2,2,1)
imshow(zebra)
title(['Original ',num2str(imrows),'*',num2str(imcols)]);
subplot(2,2,2)
imshow(zebra_avg)
title(['Average Filtering ',num2str(imrows),'*',num2str(imcols)]);
subplot(2,2,3)
imshow(zebra_weight)
title(['Weighted Average Filtering ',num2str(imrows),'*',num2str(imcols)]);

% read image
plane = imread("plane_noise2.png");
% apply filters
plane_median = median_filter(plane);
plane_median_double = median_filter(plane_median);
plane_median_cross = median_filter_cross(plane_median);
% get size
imrows=size(plane,1);
imcols=size(plane,2);
% show figure
figure
subplot(2,2,1)
imshow(plane)
title(['Original ',num2str(imrows),'*',num2str(imcols)]);
subplot(2,2,2)
imshow(plane_median)
title('Median Filtering 3*3');
subplot(2,2,3)
imshow(plane_median_double)
title('Double Median Filtering 3*3');
subplot(2,2,4)
imshow(plane_median_cross)
title('Median Filtering 3*3 - Cross Window ');

function [B] = avg_filter(A)
    imrows=size(A,1);
    imcols=size(A,2);
    B = double(zeros(imrows,imcols,3));
    A = double(A);
    for i=2:imrows-1
        for j=2:imcols-1
            avg = double(zeros(1,3));
            for l=1:3
                avg(l) = (A(i-1,j-1,l) + A(i-1,j,l) + A(i-1,j+1,l) + ...
                            A(i,j-1,l) + A(i,j,l) + A(i,j+1,l) + ...
                            A(i+1,j-1,l) + A(i+1,j,l) + A(i+1,j+1,l)) / 9;
            end
            B(i,j,:) = avg;
        end
    end
    B = uint8(B);
end

function [B] = weighted_avg_filter(A)
    imrows=size(A,1);
    imcols=size(A,2);
    B = double(zeros(imrows,imcols,3));
    A = double(A);
    for i=2:imrows-1
        for j=2:imcols-1
            weight = double(zeros(1,3));
            for l=1:3
                weight(l) = (A(i-1,j-1,l) + 2*A(i-1,j,l) + A(i-1,j+1,l) + ...
                            2*A(i,j-1,l) + 4*A(i,j,l) + 2*A(i,j+1,l) + ...
                            A(i+1,j-1,l) + 2*A(i+1,j,l) + A(i+1,j+1,l)) / 16;
            end
            B(i,j,:) = weight;
        end
    end
    B = uint8(B);
end

function [B] = median_filter(A)
    imrows=size(A,1);
    imcols=size(A,2);
    B = double(zeros(imrows,imcols,3));
    A = double(A);
    for i=2:imrows-1
        for j=2:imcols-1
            for l=1:3
                median = sort(reshape(A(i-1:i+1, j-1:j+1,l), 1, 9));
                B(i, j, l) = median(5);
            end
        end
    end
    B = uint8(B);
end

function [B] = median_filter_cross(A)
    imrows=size(A,1);
    imcols=size(A,2);
    B = double(zeros(imrows,imcols,3));
    A = double(A);
    for i=2:imrows-1
        for j=2:imcols-1
            for l=1:3
                median = sort([A(i-1, j, l), A(i, j-1, l), A(i, j, l), ...
                    A(i, j+1, l), A(i+1, j, l)]);
                B(i, j, l) = median(3);
            end
        end
    end
    B = uint8(B);
end