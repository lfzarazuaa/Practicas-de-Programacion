function [  ] = Graph_nombre(  )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
x=[-5:0.005:5];
y= x.^2./sin(x.^3);
plot(x,y,'-.');
title('Gr�fica 1')
xlabel('Eje X')
ylabel('Eje Y')
pause(2)
y=(x.^2+x.^3)./(x.^2.*tan(x));
plot(x,y,'--');
title('Gr�fica 2')
xlabel('Eje X')
ylabel('Eje Y')
pause(2)
y=(x.^2+x.^x)./sqrt(x+2);
plot(x,y,'s');
title('Gr�fica 3')
xlabel('Eje X')
ylabel('Eje Y')
pause(2)
y=(x.^3+x)./(x.^3);
plot(x,y,'d');
title('Gr�fica 4')
xlabel('Eje X')
ylabel('Eje Y')
pause(2)
y=log((x.^2)./(x.^3.*sin(x)));
plot(x,y,':');
title('Gr�fica 5')
xlabel('Eje X')
ylabel('Eje Y')
pause(2)
y=(sin(x))./(sqrt(tan(x.^2)));
plot(x,y,'^');
title('Gr�fica 6')
xlabel('Eje X')
ylabel('Eje Y')
pause(2)
y=(x+x.^2+x.^3)./(x-(x.^5).*x.^x);
plot(x,y,'*');
title('Gr�fica 7')
xlabel('Eje X')
ylabel('Eje Y')
pause(2)
y=log((x-x.^2)./(x+x.^2))./x.^4;
plot(x,y,'>');
title('Gr�fica 8')
xlabel('Eje X')
ylabel('Eje Y')
pause(2)
end

