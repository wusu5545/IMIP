function [ I ] = barphantom(slope, intercept)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    imageSizeX = 256;
    imageSizeY = 256;
    img = zeros(imageSizeX,imageSizeY);
    %[Y, X] = ndgrid(1:imageSizeY,1:imageSizeX);
    [X, Y] = meshgrid(1:imageSizeX,1:imageSizeY);
    
    img(X*slope+intercept - Y == 0) = 200;
    
    I = im2bw(img,0.5);
    %I = imnoise(img,'gaussian');
    imagesc(I);
    %title('image');
end

