function [  ] = Graph_pause(  )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
x=[-5:0.005:5];
y= x.^2./sin(x.^3);
plot(x,y);
pause(5)
y=(x.^2+x.^3)./(x.^2.*tan(x));
plot(x,y);
pause(5)
y=(x.^2+x.^x)./sqrt(x+2);
plot(x,y);
pause(5)
y=(x.^3+x)./(x.^3);
plot(x,y);
pause(5)
y=log((x.^2)./(x.^3.*sin(x)));
plot(x,y);
pause(5)
y=(sin(x))./(sqrt(tan(x.^2)));
plot(x,y);
pause(5)
y=(x+x.^2+x.^3)./(x-(x.^5).*x.^x);
plot(x,y);
pause(5)
y=log((x-x.^2)./(x+x.^2))./x.^4;
plot(x,y);
pause(5)
end

