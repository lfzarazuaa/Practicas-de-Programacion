clc
clear all
close all
%t=3;
j=1;
t0=-8;
dtao=0.0001;
tao=-10:dtao:40;
tf=30;
T(length(tao))=tf;
C(length(tao))=0;
for t=t0:0.1:tf
taom=t-tao;
for i=1:length(tao)
    if tao(i)>=-1&&tao(i)<=1 || tao(i)>=3&&tao(i)<=5 || tao(i)>=7&&tao(i)<=9 || tao(i)>=11&&tao(i)<=13 || tao(i)>=15&&tao(i)<=17
    %%if tao(i)>=0
    x1tao(i)=exp(2*cos(tao(i)))-1;
    %%x1tao(i)=1;
    else
    x1tao(i)=0;
    end
end

for i=1:length(taom)
    if taom(i)>=0 && taom(i)<=3 || taom(i)>=6 && taom(i)<=9
    x2tao(i)=exp(sin(4*(t-taom(i))))-1;
    %%x2tao(i)=taom(i).^2;
    else
    x2tao(i)=0;
    end
end

hold on
plot(tao,x1tao,'b');
plot(tao,x2tao,'g');

T(j)=t;
C(j)=sum(x1tao.*x2tao*dtao);
j=j+1;
plot(T,C,'k');
pause(0.00001);
if t~=tf
cla()
end
end