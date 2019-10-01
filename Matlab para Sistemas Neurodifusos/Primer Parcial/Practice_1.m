clc, clear all, close all
Begin=0;
Final=200;
Step=1;
m=2;
n=1;
[x1,Trian]=Triangular(Begin,Step,Final,50,100,150);
[x2,Trap1]=Trapezoidal(Begin,Step,Final,0,0,45,80);
[x3,Trap2]=Trapezoidal(Begin,Step,Final,120,155,200,200);

[x4,Gauss]=Guassian(Begin,Step,Final,100,25);
[x5,Bel1]=Bell(Begin,Step,Final,40,10,0);
[x6,Sigmus]=Sigmoidal(Begin,Step,Final,0.1,140);
subplot(m,n,1),hold on, plot(x1,Trian),plot(x1(2:length(x1)),Trap1(2:length(x1)),'g'),plot(x1(1:length(x1)-1),Trap2(1:length(x1)-1),'r'),title('Discretes','FontSize',15);
subplot(m,n,2),hold on, plot(x1,Gauss),plot(x1,Bel1,'g'),plot(x1,Sigmus,'r'),title('Continues','FontSize',15);
% subplot(m,n,2),plot(x2,Trap,'g'),title('Trapezoidal');
% subplot(m,n,3),plot(x3,Gauss,'b'),title('Gaussian');
% subplot(m,n,4),plot(x4,Bel1,'k'),title('Bell');
% hold on
% plot([Begin Final],[1/sqrt(2) 1/sqrt(2)]);
% subplot(m,n,5),plot(x5,Sigmus,'y'),title('Sigmoidal');