function [slope intercept]=barParameters(xcoords,ycoords)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here    
    A=[xcoords ones(length(xcoords),1)]
    vertex = pinv(A)*ycoords;
    slope= vertex(1);
    intercept = vertex(2);

end