clc
clear all
close all

dt=0.01
t=0:dt:5;

x1t=sin(3.*t);
x2t=t;
y1t=(x1t.*derivada(x1t,dt))+3.*(x1t);
y2t=(x2t.*derivada(x2t,dt))+3.*(x2t);
figure,
subplot(2,1,1),plot(t,x1t),title('x1(t)')
subplot(2,1,2),plot(t,y1t),title('y1(t)')

figure,
subplot(2,1,1),plot(t,x2t),title('x2(t)')
subplot(2,1,2),plot(t,y2t),title('y2(t)')

xts=x1t+x2t;
yts=(xts.*derivada(xts,dt))+3.*(xts);

figure,
subplot(2,1,1),plot(t,xts),title('x1(t)+x2(t)')
subplot(2,1,2),plot(t,yts),title('f{x1(t)+x2(t)}')

ytss=y1t+y2t;
figure,
subplot(2,1,1),plot(t,xts),title('x1(t)+x2(t)')
subplot(2,1,2),plot(t,ytss),title('f{x1(t)}+f{x2(t)}')
