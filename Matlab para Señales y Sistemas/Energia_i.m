clc
clear all
close all

t0=-2;
dt=0.01;
tf=5;
a=1;
XMIN=t0-1;
XMAX=tf+1;
YMIN=-10;
YMAX=10;
figure,plot(0,0)
plot(10,10)
xlim([XMIN XMAX])
ylim([YMIN YMAX])
hold on
pause(0.1)
% e^(-i*t)=cos(t)-i*sen(t)
for m=t0:dt:tf
t=t0:dt:m;
for n=1:length(t)
    xt(n)=sqrt(cos(t(n))^2+(-sin(t(n)))^2);
end
E_s=sum((xt.^2).*dt);
E(a)=E_s;
a=a+1;
plot(t,xt,'r')
hold on
plot(t,E,'g')
pause(dt)
end