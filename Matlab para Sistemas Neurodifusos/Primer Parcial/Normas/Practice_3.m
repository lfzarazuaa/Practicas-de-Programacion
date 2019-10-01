clc,clear all,close all
x=-15:0.5:15;
mA=1./(1+((x+5)/7.5).^4);
mB=1./(1+((x-3)/5).^2);
T_min=Tmin(mA,mB);
T_ap=Tap(mA,mB);
T_bp=Tbp(mA,mB);
T_dp=Tdp(mA,mB);
S_max=Smax(mA,mB);
S_as=Sas(mA,mB);
S_bs=Sbs(mA,mB);
S_ds=Sds(mA,mB);
m=2;
n=2;
subplot(m,n,1),hold on,plot(x,mA,'b'),plot(x,mB,'g'),plot(x,T_min,'r'),title('T Minimun','FontSize',15)
subplot(m,n,2),hold on,plot(x,mA,'b'),plot(x,mB,'g'),plot(x,T_ap,'r'),title('Algebraic Product','FontSize',15)
subplot(m,n,3),hold on,plot(x,mA,'b'),plot(x,mB,'g'),plot(x,T_bp,'r'),title('Bound Product','FontSize',15)
subplot(m,n,4),hold on,plot(x,mA,'b'),plot(x,mB,'g'),plot(x,T_dp,'r'),title('Drastic Product','FontSize',15)
figure,
subplot(m,n,1),hold on,plot(x,mA),plot(x,mB),plot(x,S_max,'r'),title('S Minimun','FontSize',15)
subplot(m,n,2),hold on,plot(x,mA,'b'),plot(x,mB,'g'),plot(x,S_as,'r'),title('Algebraic Sum','FontSize',15)
subplot(m,n,3),hold on,plot(x,mA,'b'),plot(x,mB,'g'),plot(x,S_bs,'r'),title('Bound Sum','FontSize',15)
subplot(m,n,4),hold on,plot(x,mA,'b'),plot(x,mB,'g'),plot(x,S_ds,'r'),title('Drastic Sum','FontSize',15)