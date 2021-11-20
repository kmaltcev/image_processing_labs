clear all

%R0=imread('text0.jpg');
R0=imread('Apple.jpg');
%R0=imread('form.png');

R=im2bw(R0);

%R=rgb2gray(R0);
%L=double(R)./255;
row=size(R,1);
col=size(R,2);
G=R;
% figure 
% subplot(1,2,1)
% imshow(R);
% title('Original');
%H=ones(3);
H=[0 1 0; 1 1 1; 0 1 0];
S=[1 1 1; 1 1 1; 1 1 1];
HH=[0 0 1 0 0;0 1 1 1 0; 1 1 1 1 1; 0 1 1 1 0; 0 0 1 0 0 ];

GD=imdilate(G,H, 2,2 );
figure
imshow(GD);
title('Delated');
GE=imerode(G,H, 2,2 );

% MGR=GD-GE;
% figure, imshow(MGR);

GDH=GD-imclose(G,H);
GEH=G-GE;
%GEH=G-imopen(G,H);

% GDH=imerode(GD,HH,2,2);
% GEH=imdilate(GE,HH,2,2);

figure
subplot(2,3,1)
imshow(G);
title('Original');

subplot(2,3,2)
imshow(GD);
title('Delated');

GE=medfilt2(medfilt2(GD));
subplot(2,3,3)
imshow(GE);
title('MedFilt2');

MGR=GD-GE;
MG=imerode(GE,H, 2,2 );
subplot(2,3,4)
imshow(MG);
title('Gradient');

subplot(2,3,5)
imshow(GDH);
title('Closed');

subplot(2,3,6)
imshow(GEH);
title('Opened');


% 
% sobel = edge(L, 'sobel');
% figure
% subplot(221);
% imshow(sobel);
% title('Sobel');
% 
% 
% canny = edge(L, 'canny');
% subplot(222)
% imshow(canny);
% title('Canny');
% 
% roberts = edge(L, 'roberts')
% subplot(223)
% imshow(roberts);
% title('Roberts');
% 
% prewitt = edge(L, 'prewitt')
% subplot(224)
% imshow(prewitt);
% title('Prewitt'); 
% % 
