video = VideoReader('C:\Users\Rajkumar Palanisamy\Downloads\h.mp4');
frames = video.NumberOfFrames;
mov(1).cdata = read(video,1);
Background = mov(1).cdata;
Background = rgb2gray(Background);
imshow(Background);


Background = double(Background);
display(frames);
threshold = 20;

for f = 51:25:400
     I = read(video,f);
     G = I; 
     I = rgb2gray(I);  
%      imshow(I);
     I = double(I);
    [h,w] = size(I);
     
     
     Fg = (I-Background);
     if(Fg < 0)
          Fg = Fg * -1;
     end
     
     
     Fg(Fg>threshold) = 255;
     Fg(Fg<=threshold) = 0;
    
     b = bwmorph(Fg,'close');
     dif = bwmorph(b,'open');
     dif = bwmorph(dif,'erode',2);
     dif = bwconvhull(dif,'objects');
     dif = bwareaopen(dif,2500);
     dif = imfill(dif,'holes');
     imshow(dif);
%       imshow(G);
%     
    stats = regionprops(dif,'Centroid','BoundingBox','Area');
    cen = stats.Centroid;
    area = stats.Area;
    display(cen);
%   
    %speed = sqrt((X(i)-X(i-1))^2+(Y(i)-Y(i-1))^2);
    speed = pdist2(cen(1,1),cen(1,2),'euclidean');
    speed = speed*5/18;
%     display(box);
    display(area);
    display(speed);
    if(speed>30&&speed<60)
        display('MEDIUM SPEED');
    elseif(speed<30)
        display('SLOW SPEED');
    else
        display('FAST SPEED');
    end
  
  hold on
     for ind= 1:length(stats);
         box = stats.BoundingBox;
         plot(stats(ind).Centroid(1),stats(ind).Centroid(2),'b*');
         rectangle('position',box,'Edgecolor','red','LineWidth',2);
     end
  movegui(gcf);
  %F(x) = getframe(figure(1));
  
  hold off;
 end

