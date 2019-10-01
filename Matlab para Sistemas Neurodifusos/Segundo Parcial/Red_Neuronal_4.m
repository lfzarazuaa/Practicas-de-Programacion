clc,clear all,close all
P=[1 -1 2;...
   2 3 2];
t=[1 0 0];
p1=[P(:,1)',t(1)];
p2=[P(:,2)',t(2)];
p3=[P(:,3)',t(3)];
e=[1 1 1];
hold on
plot(p1(1),p1(2),'ob');
plot(p2(1),p2(2),'or');
plot(p3(1),p3(2),'or');
w=rand(1,2);
b=rand(1);
% w=[-1 0];
% b=0.5;
iteration=1e4;
E(iteration*3)=0;
E=E';
count=1;
er(3)=0;
for j=1:iteration
 for i=1:3
  p=P(:,i)
  a=hardlim(w*p+b)
  e=t(i)-a;
  E(count)=e;
  count=count+1;
  w=w+e*p';
  b=b+e;
  er(i)=e;
 end
 if sum(abs(er))==0
     j
     break;
     %%j=iteration; 
 end
end
r=w(1);
wn=w/r;
m=-1/wn(2);
br=b/wn(2);
x=-5:0.01:5;
y=m*x+br;
texto=strcat(num2str(m),'x + ',num2str(br));
text(0,3,texto);
plot(x,y);
grid on