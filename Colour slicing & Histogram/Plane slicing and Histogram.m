 RGB = imread('C:\Users\Rajkumar Palanisamy\Desktop\DIP\Anbumask.jpg');
 a = RGB;
 b = RGB;
 c = RGB;
 a(:,:,1)=0;
 b(:,:,2)=0;
 c(:,:,3)=0;
 imshow(RGB);
 figure,imshow(a);
 figure,imshow(b);
 figure,imshow(c);
 
imhist(a)
figure,imhist(b)
figure,imhist(c)
figure,imshow(RGB);