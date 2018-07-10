clc
clear all
close all
A = imread('Simple_RGB_color_wheel.png');
figure
imshow(A);
title('Original image');
I = rgb2gray(A);
figure
imshow(I)
title('Grayscale image');
[m,n] = size(I);
blsize = 8;
R = [4 2 1];
for k = 1:3
    for i = 1:blsize:m-blsize
       for j = 1:blsize:n-blsize
           block = I(i: i+blsize-1, j:j+blsize-1);
           trans = dct2(block);
           trans(blsize:-1:R(k)+1, :) = 0;
           itrans = idct2(trans);
           ITRANS (i:i+blsize-1 , j:j+blsize-1) = itrans;       
       end
    end
    figure
    imshow(uint8(ITRANS))
    title(['When R = ' num2str(R(k))])
end