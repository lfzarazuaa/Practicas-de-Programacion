clc
clear all
close all
%t=3;
j=1;
t0=-2;
dtao=0.0001;
tao=-4:dtao:4;
tf=8;
T(length(tao))=tf;
C(length(tao))=0;
for t=t0:0.1:tf
taom=t-tao;
for i=1:length(tao)
    if tao(i)>=-1&&tao(i)<=1
    %%if tao(i)>=0
    x1tao(i)=tao(i);
    %%x1tao(i)=1;
    else
    x1tao(i)=0;
    end
end

for i=1:length(taom)
    if taom(i)>=0 && taom(i)<=1 
    x2tao(i)=exp(-taom(i));
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
pause(0.1);
if t~=tf
cla()
end
end