clc, clear all, close all
Begin=0;
Final=10;
Step=0.01;
m=5;
n=1;
[x1,Trian]=Triangular(Begin,Step,Final,2,5,7);
[x2,Trap]=Trapezoidal(Begin,Step,Final,2,5,7,9);
[x3,Gauss]=Guassian(Begin,Step,Final,5,0.75);
[x4,Bel1]=Bell(Begin,Step,Final,2,3,7);
[x5,Sigmus]=Sigmoidal(Begin,Step,Final,5,2);
subplot(m,n,1),plot(x1,Trian,'r'),title('Triangular');
subplot(m,n,2),plot(x2,Trap,'g'),title('Trapezoidal');
subplot(m,n,3),plot(x3,Gauss,'b'),title('Gaussian');
subplot(m,n,4),plot(x4,Bel1,'k'),title('Bell');
hold on
plot([Begin Final],[1/sqrt(2) 1/sqrt(2)]);
subplot(m,n,5),plot(x5,Sigmus,'y'),title('Sigmoidal');