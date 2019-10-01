function [  ] = Triangle( x1,y1,x2,y2,x3,y3 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
A= [x1 y1]
B= [x2 y2]
C= [x3 y3]
D= det([x1 y1 1; x2 y2 1; x3 y3 1]);
a1=[x1 x2];
a2=[y1 y2];
b1=[x2 x3];
b2=[y2 y3];
c1=[x3 x1];
c2=[y3 y1];

if (D<=0.00001 && D>=-0.00001)
    fprintf('Coordenadas Incorrectas ');
else
    fprintf('Coordenadas Correctas');
    a=sqrt((x2-x1)^2+(y2-y1)^2);
    b=sqrt((x3-x2)^2+(y3-y2)^2);
    c=sqrt((x3-x1)^2+(y3-y1)^2);
    s=(a+b+c)/2;
    Perimetro=s*2
    Area=sqrt(s*(s-a)*(s-b)*(s-c))
    axis equal
    plot(a1,a2)
    hold on
    plot(b1,b2)
    plot(c1,c2)
end

end

