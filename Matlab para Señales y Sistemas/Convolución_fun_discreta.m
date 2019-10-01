clc
clear all
close all

for t=-15:1:30
    if t>=0
    x1(t)=(1/2)^(t);
    x2=t;
    C2(t)=2*(2.^(-t)+t-1);
    else
    x1(t)=0;
    x2(t)=0;
    C2(t)=0;
    end
    n(t)=t;
end
C1=conv(x1,x2);
hold on
subplot(1,2,1)
stem(n,C1,'r','linewidth',3), title('Convolucion Matlab','fontsize',18)
stem(n,C2,'r','linewidth',3), title('Convolucion Formula','fontsize',18)
