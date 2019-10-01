clc,clear all, close all
opc=1;
while(opc==1)
xo=input('Introduce x value: ');
yo=input('Introduce y value: ');
p1=[1 2 1];
p2=[-1 2 0];
p3=[0 -1 0];
hold on
plot3(p1(1),p1(2),p1(3),'*r');
plot3(p2(1),p2(2),p2(3),'*b');
plot3(p3(1),p3(2),p3(3),'*b');
plot3([0.1 -1],[-1 2.1],[0 0]);
grid on
x=-2:0.01:2;
y=-31*x/11-79/110;
plot3(x,y,x*0);
p=[xo yo]';
w=[0.31 0.11];
b=0.079;
res=hardlim(w*p+b);
if res>=0
 plot3(p(1),p(2),0,'*r');
else
 plot3(p(1),p(2),0,'*b'); 
end
opc=input('Do you repeat it? (YES=1,NO=Other)');
cla();
end