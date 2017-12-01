%gaussian pyramid

img=imread('C:\Users\Rajkumar Palanisamy\Desktop\DIP\Anbumask.jpg');

figure,imshow(img);
img1=imresize(double(img),0.25);
figure,imshow(img1);
%Gaussian filter
g=[1/32 4/32 1/32;4/32 12/32 4/32;1/32 4/32 1/32];

 I1=round(conv2(img1,g,'same'));
 g1=imresize(I1,0.5);
 figure,imshow(g1);
 
 I2=round(conv2(g1,g,'same'));
 g2=imresize(I2,0.5);

I3=round(conv2(g2,g,'same'));
g3=imresize(I3,0.5);

I4=round(conv2(g3,g,'same'));
g4=imresize(I4,0.5);
figure,imshow(g4);

%constructing laplacian pyramid  
l01=imresize(g1,2);
l0=img1-l01;
figure,imshow(l0);