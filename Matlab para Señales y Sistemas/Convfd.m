clc
clear all
close all
t=-15:1:30
for i=1:length(t)
    if t(i)>=0
    x1(i)=(1/2)^(t(i));
    x2(i)=t(i);
    C2(i)=2*(2.^(-t(i))+t(i)-1);
    else
    x1(i)=0;
    x2(i)=0;
    C2(i)=0;
    end
    n(i)=t(i);
end
C1=conv(x1,x2);
C=C1(16:length(t)+15);
hold on
subplot(1,2,1)
stem(n,C,'r','linewidth',3), title('Convolución Matlab','fontsize',18)
subplot(1,2,2)
stem(n,C2,'r','linewidth',3), title('Convolución por Fórmula','fontsize',18)
