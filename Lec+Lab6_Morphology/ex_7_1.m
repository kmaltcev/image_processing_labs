clear all

%R0=imread('text0.jpg');
R0=imread('Apple.jpg');
%R0=imread('form.png');

R=im2bw(R0);

row=size(R,1);
col=size(R,2);

H=[0 1 0; 1 1 1; 0 1 0];
S=[1 1 1; 1 1 1; 1 1 1];
HH=[0 0 1 0 0;0 1 1 1 0; 1 1 1 1 1; 0 1 1 1 0; 0 0 1 0 0 ];

G=R;
D_ref=imdilate(G,H, 2,2 );
D_sol = Delate(G, H);

E_ref=imerode(G,H, 2,2);
E_sol = Erosion(G, H);

Close_ref=imclose(G,H);
Close_sol = Closing(G, H);

Open_ref=imopen(G,H);
Open_sol = Opening(G, H);

figure
subplot(1,3,1)
imshow(R);
title('Original image');
subplot(1,3,2)
imshow(D_ref);
title('Delated Ref.');
subplot(1,3,3)
imshow(D_sol);
title('Delated Sol.');

figure
subplot(1,3,1)
imshow(R);
title('Original image');
subplot(1,3,2)
imshow(E_ref);
title('Erosion Ref.');
subplot(1,3,3)
imshow(E_sol);
title('Erosion Sol.');

figure
subplot(1,3,1)
imshow(R);
title('Original image');
subplot(1,3,2)
imshow(Close_ref);
title('Closing Ref.');
subplot(1,3,3)
imshow(Close_sol);
title('Closing Sol.');

figure
subplot(1,3,1)
imshow(R);
title('Original image');
subplot(1,3,2)
imshow(Open_ref);
title('Opening Ref.');
subplot(1,3,3)
imshow(Open_sol);
title('Opening Sol.');

function[B]=Opening(A, H)
    B = Delate(Erosion(A,H), H);
end

function[B]=Closing(A, H)
    B = Erosion(Delate(A,H), H);
end

function[B]=Erosion(A, H)
    [A_imrows, A_imcols] = size(A);
    [H_imrows, H_imcols] = size(H);
    B = zeros(A_imrows, A_imcols);
    H = logical(H);
    for i=1:A_imrows-H_imrows
        for j=1:A_imcols-H_imcols
            on=A(i:i+H_imrows-1, j:j+H_imcols-1); 
            B(i, j)=min(on(H));      
        end
    end
end

function[B]=Delate(A, H)
    [A_imrows, A_imcols] = size(A);
    [H_imrows, H_imcols] = size(H);
    B = zeros(A_imrows,A_imcols);
    for i=1:A_imrows-H_imrows
        for j=1:A_imcols-H_imcols
            if A(i,j)==1
                for k=1:H_imrows
                    for l=1:H_imcols
                        if(H(k,l)==1)
                            B(i+k,j+l)=1;
                        end
                    end
                end
            end
        end
    end
end