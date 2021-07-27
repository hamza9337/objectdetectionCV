% HAMZA HAFEEZ(2K18/ELE/37)
% MUHAMMAD WASEEM HAYAT(2K18/ELE/75)

clear all
clc

%Detect objects using Viola-Jones Algorithm

%To detect Face
FDetect = vision.CascadeObjectDetector; 

%Read the input image
I = imread('Hamza37.jpg');

%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);

figure,
imshow(I); hold on
for i = 1:size(BB,1)
 rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','y');
end
title('Face Detection');
hold off;

%To detect Nose
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',16);

BB=step(NoseDetect,I);

figure,
imshow(I); hold on
for i = 1:size(BB,1)
 rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','b');
end
title('Nose Detection');
hold off;

%To detect Mouth
MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',128);

BB=step(MouthDetect,I);
 
figure,
imshow(I); hold on
for i = 1:size(BB,1)
rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','g');
end
title('Mouth Detection');
hold off;

%To detect Eyes
EyeDetect = vision.CascadeObjectDetector('EyePairBig');

BB=step(EyeDetect,I);
 
figure,imshow(I);
rectangle('Position',BB,'LineWidth',4,'LineStyle','-','EdgeColor','r');
title('Eyes Detection');
Eyes=imcrop(I,BB);
figure,imshow(Eyes);
hold off;
