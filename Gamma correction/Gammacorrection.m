I = imread('C:\Users\Rajkumar Palanisamy\Desktop\DIP\Anbumask.jpg');
Gammavalue = 0.5;
Maxint = 255;
% Gamma correction
gamma = Maxint.*(([0: Maxint ]./Maxint).^ Gammavalue );
gamma = floor(gamma);
K = double(I)+1;
J = zeros(size(I));
[m,n,p]= size (K);
for i = 1:m
for j =1: n
for k = 1:p
J(i,j,k)= gamma(K(i,j,k));
end
end
end
figure (1)
title('original image');
imshow(I);
figure (2)
title('Gamma Corrected Image');
imshow(uint8 (J));