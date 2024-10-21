%Ibar = barphantom(0.5,1.5);
%Iparabola = parabolaphantom(0.03,-10,1200);

I = imread('bar.png');
B = im2bw(I,graythresh(I));
B2 = B(6:1019,6:1019);
imshow(B2);

[xcoords,ycoords]=find(B2==0);
[slope intercept] = barParameters(xcoords,ycoords);
Ibar = barphantom(slope,intercept);
clear;

I = imread('parabel.png');
B = im2bw(I,graythresh(I));
B2 = B(6:1019,6:1019);
imshow(B2);
[xcoords,ycoords] = find(B2==0);
[vertex] = parabolaParameters(xcoords,ycoords);
Iparabola = parabolaphantom(vertex');
