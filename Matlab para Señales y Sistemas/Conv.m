clc
clear all
close all
j=1;
t0=-5;
dt=0.01;
tf=9;
tao=-10:dt:15;
x1(length(tao))=0;
x1(length(tao))=0;
x2(length(tao))=0;
x2(length(tao))=0;
for t=t0:dt:tf

 taom=tao-t;   
for i=1:1:length(tao)
%     if tao(i)>=-2 && tao(i)<=0
%        x1(i)=(tao(i)+2)/2; 
%     elseif tao(i)>0 && tao(i)<=2
%        x1(i)=(2-tao(i))/2;
%     else
% %        x1(i)=0;
%     end
%        if tao(i)>=-2 && tao(i)<=2 %%Señal 1) x1(t)
%        x1(i)=tao(i); 
%        else
%        x1(i)=0;
%        end
        if tao(i)==0 %%Señal 2) x1(t)
        x1(i)=1/dt; 
        else
        x1(i)=0;
        end
%     if tao(i)>=0 && tao(i)<=1 %%Señal 3) x1(t)
%        x1(i)=tao(i); 
%     elseif tao(i)>1 && tao(i)<=3
%        x1(i)=1;
%     else
%        x1(i)=0;
%     end
end

for i=1:1:length(tao)
%     if taom(i)>=-1 && taom(i)<=1
%        x2(i)=1; 
%     else 
%        x2(i)=0;
%     end
      if taom(i)>=-1 && taom(i)<=1 %%Señal 1) x2(t)
       x2(i)=2; 
      else 
       x2(i)=0;
      end
      if taom(i)>=0 && taom(i)<=2 %%Señal 2) x2(t)
       x2(i)=10*(taom(i)); 
      else 
       x2(i)=0;
      end
%     if taom(i)>=-2 && taom(i)<=1 %%Señal 3) x2(t)
%        x2(i)=2; 
%     else
%        x2(i)=0;
%     end
end

T(j)=t;
C(j)=sum(x1.*x2.*dt);
j=j+1;
hold on
plot(tao,x1,'b','LineWidth',2);
plot(tao,x2,'g','LineWidth',2);
plot(T,C,'k','LineWidth',3);
pause(0.0001)
 if t<tf
 cla
 end

end