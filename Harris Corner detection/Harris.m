
Image2=imread ('C:\Users\Rajkumar Palanisamy\Desktop\DIP\Anbumask.jpg');
Image1 = rgb2gray(Image2);
Image1  = im2double(Image1);
kl=size(Image1);
xmax=kl(1);
ymax=kl(2);

xmin=8;
ymin=8;
xmax=xmax-8;
ymax=ymax-8;

% 1) Compute x and y derivatives of image


hsize=[7 7];
sigma=0.5;
K=0.1;
Threshold=0.005;

%3)Compute the sums of the products of derivatives at each pixel

dx = [-1 0 1; -1 0 1; -1 0 1];
dy = dx';
Ix = conv2(Image1, dx, 'same');   
Iy = conv2(Image1, dy, 'same');   
 
filter_gauss = fspecial('gaussian',hsize, sigma);
disp(filter_gauss);

%4) Define at each pixel(x, y) the matrix H

Ix_new = filter2(filter_gauss, Ix.^2);
Iy_new = filter2(filter_gauss, Iy.^2);
Ixy_new = filter2(filter_gauss, Ix.*Iy);

% 5) Compute the response of the detector at each pixel

det_M= (Ix_new.*Iy_new - Ixy_new.^2);
trace_M=Ix_new + Iy_new;

R = det_M - K*(trace_M).^2;
disp(max(max(R)));

Rnew=R;
rad=4;
    ma=max(max(Rnew));
    m_size = 2*rad; 
    mask = ordfilt2(Rnew,m_size^2,ones(m_size));
    
    remove_border = zeros(size(R));
    remove_border(rad:end-rad, rad:end-rad) = 1;
    
    R2 = (Rnew==mask)&(Rnew>=Threshold)& remove_border ; 
[r,c,v]=find(R2);
inter_pt=[r,c];
inter_ptval=[r,c,v];

%6) Threshold on value of R

Threshold=0.05
 R3 = (Rnew==mask)&(Rnew>=Threshold)& remove_border ; 
    [r3,c3,v3]=find(R3);
inter_pt=[r3,c3];


figure(11);
imshow(Image1); hold on;
plot(c,r,'*g');
hold on
figure(11) ;
hold on
plot(c3,r3,'*r');
hold off;        

% Plotting the ellipse

figure
imshow(Image1)
hold on

for i=1:size(c)
    for j=1:size(r)
        
 
% 
%  i=94;
% j=417;

xloc=c(i);
yloc=r(i);

        A=[Ix_new(i,j) Ixy_new(i,j);Iy_new(i,j) Ixy_new(i,j)];
        [v d]=eig(A);
       l1=max(diag(d));
        l2=min(diag(d));
             v=real(v);
       
            
radm=11;
radn=15;
Nb=200;
co=cos(pi/4);
si=sin(pi/4);

the=linspace(0,2*pi,Nb);



f1= line(radm*cos(the)*co-si*radn*sin(the)+xloc*ones(1,Nb),radm*cos(the)*si+co*radn*sin(the)+yloc*ones(1,Nb));

plot(f1)
     hold on        
             

    end
end
