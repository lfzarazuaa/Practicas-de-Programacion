clc
clear all
close all

t0=0;
dt=0.01;
tf=10;
a=1;
% XMIN=t0-1;
% XMAX=tf+1;
% YMIN=-10;
% YMAX=10;
% figure,plot(0,0)
% plot(10,10)
% xlim([XMIN XMAX])
% ylim([YMIN YMAX])
hold on
pause(0.1)
% e^(-i*t)=cos(t)-i*sen(t)
for m=t0:dt:tf
t=t0:dt:m;
for n=1:length(t)
%     if t(n)>=0
%     xt(n)=exp(-t(n));
%     else
%     xt(n)=exp(t(n));    
%     end
      xt(n)=exp(-2*t(n))*sin(2*t(n));
end
E_s=sum((xt.^2).*dt);
E(a)=E_s;
a=a+1;
% plot(t,xt,'b')
% hold on
% plot(t,E,'k','linewidth',3)
% pause(dt/100)
end
P=E/pi;
plot(t,xt,'b')
hold on
plot(t,E,'k','linewidth',2)
% plot(t,P,'r','linewidth',3)
