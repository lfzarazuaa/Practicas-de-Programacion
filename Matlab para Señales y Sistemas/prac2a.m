clc
clear all
close all 

t=-10:0.001:10;

a = 1;
b = 2;
% c = 1;
d = 1;
e = 2;

tm = (a*t+b);

for i=1:length(t)
   if tm(i)>=-pi&&tm(i)<0
        xt(i)=cos(tm(i));
    elseif tm(i)>=0&&tm(i)<2
        xt(i)=(-tm(i)+2).^2;
    else
        xt(i)=0;
    end
end
for i=1:length(t)
    if t(i)>=-pi&&t(i)<0
        xto(i)=cos(t(i));
    elseif t(i)>=0&&t(i)<2
        xto(i)=(-t(i)+2).^2;
    else
        xto(i)=0;
    end
end
hold off
plot(t,xto,'b*')
plot (t,d.*xt+e,'k*','linewidth',3)