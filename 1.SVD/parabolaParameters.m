function [vertex]=parabolaParameters(xcoords,ycoords)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    A = [xcoords.^2,xcoords,ones(length(xcoords),1)];
    vertex = pinv(A)* ycoords;

end

