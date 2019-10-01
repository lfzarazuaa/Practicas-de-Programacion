function [ p ] = 2grado(x1,y1,x2,y2,x3,y3 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
A=[x1^2 x1 1;x2^2 x2 1;x3^2 x3 1];
b=[y1 y2 y3];
p=b*inv(A)
roots(p)
fprintf('f(x)=%dx^2 %dx %d', p(3) p(2) p(1));
end

