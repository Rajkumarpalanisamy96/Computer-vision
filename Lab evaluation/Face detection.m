img = imread('C:\Users\Rajkumar Palanisamy\Desktop\Computer Vision\images1.jpg');
a=rgb2gray(img);
[m,n]=size(a);
smin=min(m,n);
smax=smin/15;
integ=zeros(m,n);
t=50;
o=zeros(m,n);
for k=1:m
    for l=1:n
        b=zeros(k,l);
        for x=1:k
        for y=1:l
        b(x,y)=a(x,y);
        end
        end
        integ(k,l)=sum(sum(b));
    end 
end
for x = 2:(min(m,n)-23)
    for y= 2:(min(m,n)-23)
        sum1 = integ(x-1,y-1) + integ (x+3,y);
        sum2 = integ(x-1,y) + integ (x+3,y-1);
        sumx = sum1-sum2;
        sum3 = integ(x-1,y) + integ (x+3,y+2);
        sum4 = integ(x-1,y+2) + integ (x+3,y);
        sumy = sum3-sum4;
        sum5 = integ(x-1,y+2) + integ (x+3,y+3);
        sum6 = integ(x-1,y+3) + integ (x+3,y+2);
        sumz = sum5-sum6;
        if (abs((sumz+sumx)-sumy) > t)
            c(x+2,y+2) = 1;
                      
        end
    end
end
imshow(c);
