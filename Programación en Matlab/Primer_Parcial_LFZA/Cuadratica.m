function [ p ] = Cuadratica(x1,y1,x2,y2,x3,y3 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
A=[x1^2 x1 1;x2^2 x2 1;x3^2 x3 1];
b=[y1;y2;y3];
p=inv(A)*b;
p=p'
roots(p)
%fprintf('f(x)=%.0dx^2 %.0dx %.0d', p(1),p(2),p(3));
x=-100:0.1:100;
y=polyval(p,x);
subplot(2,1,1);
plot(x,y)
subplot(2,1,2);
plot(y,x)
end

