clc
clear all
close all

n=-10:25;
xn(length(n))=0;
yn(length(n))=0;
ypn(length(n))=0;
for l=1:length(n)
    if n(l)>=0
%           if n(l)==0
%               xn(l)=1;
%           else
%              xn(l)=0; 
%           end
%             xn(l)=1;
         xn(l)=(1/2)^n(l);
    else
        xn(l)=0;
    end
    
    if n(l)>=0
       yn(l)=yn(l-1)-0.5*yn(l-2)+xn(l-1)+xn(l); 
    else
       yn(l)=0;
    end
    
    if n(l)>=0
%      ypn(l)=sqrt(10)*(sqrt(2)/2)^n(l)*cosd(45*n(l)-atand(3));
%      ypn(l)=sqrt(10)*(sqrt(2)/2)^n(l)*-cosd(45*n(l)+atand(1/3))+4;
       ypn(l)=2*sqrt(5)*(sqrt(2)/2)^n(l)*-cosd(45*n(l)+atand(2))+3*(1/2)^n(l);
    else
       ypn(l)=0;
    end
end

figure,stem(n,xn)
figure,stem(n,yn)
figure,stem(n,ypn)
figure;
hold on
stem(n,yn)
stem(n,ypn,'r*')
