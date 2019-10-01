clc
clear all
close all
tho=-5;
thf=-tho;
dt=(thf-tho)/10099;
t=tho:dt:thf;
for l=1:length(t)
   if t(l)>=0 && t(l)<=0.25
       xt(l)=4*t(l);
   elseif t(l)>=0.25 && t(l)<=0.5
       xt(l)=-4*t(l)+2;
   elseif t(l)>=0.5 && t(l)<=1
       xt(l)=sin(pi/0.25*(t(l)-0.75));
   elseif t(l)>=1 && t(l)<=2
       xt(l)=4*t(l)*sin(pi/0.1*(t(l)-1.5));
   else
       xt(l)=0;
   end
end
plot(t,xt)
axis([tho*1.05,thf*1.05,-5,5])
T=2;
wo=2*pi/T;
figure
for kf=0:2:100
ko=-kf;
k=ko:1:kf;
ck(length(k))=0;
xf(length(k))=0;
for l=1:length(k)
   ck(l)=(1/T)*sum(xt.*exp(-1i*k(l)*wo.*t)*dt);
end
for l=1:length(t)
   xf(l)=sum(ck.*exp(-1i.*k*wo*t(l)));
end
texto=strcat('Sintesis Fourier Compleja con k=',num2str(kf));
xf=fliplr(xf);
% subplot(1,3,1),
plot(t,real(xf),'r'),title(texto);
% subplot(1,3,2),stem(k,abs(ck)),title('Espectro de Magnitud');
% subplot(1,3,3),stem(k,angle(ck)),title('Espectro de Fase');
pause(0.1);
end
figure,plot(t,real(xf),'r'),title(texto);
figure,stem(k,abs(ck)),title('Espectro de Magnitud');
figure,stem(k,angle(ck)),title('Espectro de Fase');
