function [ I ] = parabolaphantom(a,b,c)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    imageSizeX = 256;
    imageSizeY = 256;
    img = zeros(imageSizeX,imageSizeY);
    %[Y, X] = ndgrid(1:imageSizeY,1:imageSizeX);
    [X, Y] = meshgrid(1:imageSizeX,1:imageSizeY);
    
    img((a*X.^2 + b.*X + c) - Y== 0) = 200;
    %I = imnoise(img,'gaussian');
    I = imagesc(img);
    title('image');

end

