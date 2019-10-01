clc
clear all
close all
%t=3;
j=1;
t0=-3;
dtao=0.001;
tao=-5:dtao:12;
tf=10;
% T(length(tao))=tf;
% C(length(tao))=0;
for t=t0:0.1:tf
taom=t-tao;
for i=1:length(tao)
    if tao(i)>=0 && tao(i)<1
     x1tao(i)=1;
    elseif tao(i)>=1 && tao(i)<2
     x1tao(i)=2;
    elseif tao(i)>=2 && tao(i)<3
     x1tao(i)=3;
    elseif tao(i)>=3 && tao(i)<4
     x1tao(i)=4;
    else
     x1tao(i)=0;
    end
end



for i=1:length(taom)
    if taom(i)>=0 && taom(i)<1
    x2tao(i)=5;
    elseif taom(i)>=1 && taom(i)<2
    x2tao(i)=6;
    elseif taom(i)>=2 && taom(i)<3
    x2tao(i)=7;
    elseif taom(i)>=3 && taom(i)<4
    x2tao(i)=8;
    else
    x2tao(i)=0;
    end
end

T(j)=t;
C(j)=sum(x1tao.*x2tao*dtao);
j=j+1;

end
hold on
plot(tao,x1tao,'b');
plot(tao,x2tao,'r');
plot(T,C,'k','linewidth',3);