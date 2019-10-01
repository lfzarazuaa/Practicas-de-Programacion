clc,clear all,close all
P=[1 1 2 2 3 3 4 4;...
   4 5 4 5 1 2 1 2];
t=[0 0 0 0 1 1 1 1];
p1=[P(:,1)',t(1)];
p2=[P(:,2)',t(2)];
p3=[P(:,3)',t(3)];
p4=[P(:,4)',t(4)];
p5=[P(:,5)',t(5)];
p6=[P(:,6)',t(6)];
p7=[P(:,7)',t(7)];
p8=[P(:,8)',t(8)];

w=rand(1,2)*5;
b=rand(1)*5;
% w=[-1 0];
% b=0.5;
iteration=input('Introduce number of epochs: ');
E(iteration*8)=0;
E=E';
count=1;
er(8)=0;
for j=1:iteration
 for i=1:8
  p=P(:,i);
  a=hardlim(w*p+b);
  e=t(i)-a;
  E(count)=e;
  count=count+1;
  w=w+e*p';
  b=b+e;
  er(i)=e;
 end
%  if sum(abs(er))==0
%      j
%      break;
%      %%j=iteration; 
%  end
end
ph=-b/w(1);
pv=-b/w(2);
m=pv/-ph;
br=pv;
x=-5:0.01:5;
y=m*x+br;
texto=strcat(num2str(m),'x + ',num2str(br));
hold on
plot(p1(1),p1(2),'or');
plot(p2(1),p2(2),'or');
plot(p3(1),p3(2),'or');
plot(p4(1),p4(2),'or');
plot(p5(1),p5(2),'ob');
plot(p6(1),p6(2),'ob');
plot(p7(1),p7(2),'ob');
plot(p8(1),p8(2),'ob');
text(0,3,texto);
plot(x,y);
grid on
figure(3)
plot(E);
title('Error');
%%%%Preguntar por punto
%w=[w];
%b=[b]';
% w=[1 m];
% b=-w*[x(20);y(20)];
Oso=imread('Oso_peluche.jpg');
Conejo=imread('Conejo_peluche.jpg');
pause(0.750)
opc=1;
while(opc==1)
xo=input('Introduce x value: ');
yo=input('Introduce y value: ');
po=[xo yo]';
valor=w*po+b;
res=hardlim(valor);
figure(2);
if res==0
   color='*r';
   imshow(Conejo);
else
   color='*b';
   imshow(Oso);
end
figure(1);
hold on
plot(xo,yo,color);
opc=input('Do you repeat it? (YES=1,NO=Other)');
%%cla();
end