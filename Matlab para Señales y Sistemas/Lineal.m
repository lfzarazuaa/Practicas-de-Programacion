clc
clear all
close all
to=-5;
dt=0.001;
tf=5;
t=to:dt:tf;
a1=2;
a2=4;
td=t(1:length(t)-1);
% xt=(t).^2/100+t+t.^3+5;
% xt=t.*sin(2*t).^2/1000;
xt=(t.^2+2.*t)./100;
% dxt=diff(xt/dt);
% xtd=xt(1:length(t)-1);
% xtm=fliplr(xt);

xts=a1*xt+a2*xt;
% dxts=diff(xts/dt);
% xtds=xts(1:length(t)-1);
% xtsm=a1*xtm+a2*xtm;
% yt=(xtd+(dxt));
yt=exp(2.*xt);
yt1=a1*yt+a2*yt;
% yt2=(xtsd+(dxts));
yt2=exp(2.*xts);
figure(1)
hold on
plot(t,xt,'g')
% plot(td,dxt,'k')
figure(2)
hold on
plot(t,yt2,'r*','linewidth',2)
plot(t,yt1,'b','linewidth',3)