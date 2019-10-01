clc,clear all, close all
opc=1;
%%while(opc==1)
% xo=input('Introduce x value: ');
% yo=input('Introduce y value: ');
p1=[1 1 1];
p2=[1 2 1];
p3=[2 -1 3];
p4=[2 0 3];
p5=[-1 2 0];
p6=[-2 1 0];
p7=[-1 -1 2];
p8=[-2 -2 2];
hold on, axis equal
plot(p1(1),p1(2),'or');
plot(p2(1),p2(2),'or');
plot(p3(1),p3(2),'ob');
plot(p4(1),p4(2),'ob');
plot(p5(1),p5(2),'og');
plot(p6(1),p6(2),'og');
plot(p7(1),p7(2),'ok');
plot(p8(1),p8(2),'ok');
grid on
x=-5:0.01:5;
y1=-4*x+2;
y2=0.5*x+0;
m1=-4;
mw1=-1/m1;
m2=0.5;
mw2=-1/m2;
plot(x,y1,'b');
plot(x,y2,'b');
w1=[1 mw1];
b1=-w1*[x(20);y1(20)];
w2=[1 mw2];
b2=-w2*[x(20);y2(20)];
w=[w1;w2];
b=[b1 b2]';
while(opc==1)
xo=input('Introduce x value: ');
yo=input('Introduce y value: ');
p=[xo yo]';
res=w*p+b;
res2=hardlim(res);
value=res2(1)+2*res2(2);
if value==0
   plot(p(1),p(2),'*g');
elseif value==1
   plot(p(1),p(2),'*r');
elseif value==2
   plot(p(1),p(2),'*k'); 
else
   plot(p(1),p(2),'*b'); 
end
opc=input('Do you repeat it? (YES=1,NO=Other)');
%%cla();
end
% p=[xo yo]';
% w=[0.31 0.11];
% b=0.079;
% res=hardlim(w*p+b);
% if res>=0
%  plot3(p(1),p(2),0,'*r');
% else
%  plot3(p(1),p(2),0,'*b'); 
% end
%%opc=input('Do you repeat it? (YES=1,NO=Other)');
%%cla();
%%end