
A = imread('C:\Users\Rajkumar Palanisamy\Desktop\DIP\Anbumask.jpg');
Red = A(:,:,1);
Green = A(:,:,2); 
Blue = A(:,:,3); 
Black = zeros(size(A, 1), size(A, 2), 'uint8');
just_red = cat(3, Red, Black, Black);
just_green = cat(3, Black, Green, Black);
just_blue = cat(3, Black, Black, Blue);
recombinedA = cat(3, Red, Green, Blue);
figure(1)
imshow(A);
figure(2)
imshow(just_red);
figure(3)
imshow(just_green)
figure(4)
imshow(just_blue);
figure(5)
imshow(recombinedA);
