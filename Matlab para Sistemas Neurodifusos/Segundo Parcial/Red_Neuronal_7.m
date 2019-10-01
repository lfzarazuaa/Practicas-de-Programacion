clc,clear all, close all
%P=[1 1 -1;1 -1 -1]';
P=[1,1;...
   1,-1;...
   -1,-1];
t=[1 -1];
hold on
%t = 0:pi/50:10*pi;
%plot3(sin(t),cos(t),t);
E=length(t);
R=(1/E)*(P(:,1)*P(:,1)');
for i=2:E
    R=R+(1/E)*(P(:,i)*P(:,i)');
end
Z=eig(R);
Zmax=max(Z);
alpha=0.2;
if 1/Zmax<alpha
   aplha=1/(2*Zmax);
end
%%epochs=200;
epochs=input('Introduce epochs: ');
%w=[0 0 0];
w=rand(1,3);
p=P;
%b=0;
b=rand(1);
Error(E*epochs)=0;
count=1;
for i=1:epochs
   for j=1:E
       a=purelin(w*p(:,j)+b);
       e=t(j)-a;
       Error(count)=e;
       count=count+1;
       w=w+2*alpha*e*p(:,j)';
       b=b+2*alpha*e;
   end
end
ph=-b/w(1);
pv=-b/w(2);
m=pv/-ph;
br=pv;
x=-5:0.01:5;
y=m*x+br;
texto=strcat(num2str(m),'x + ',num2str(br));
hold on
text(0,3,texto);
plot3(P(1,1),P(2,1),P(3,1),'*r');
plot3(P(1,2),P(2,2),P(3,2),'*b');
plot(x,y);
grid on
Apple=imread('Apple_image.jpg');
Orange=imread('Orange_image.jpg');
pause(0.750)
opc=1;
while(opc==1)
xo=input('Introduce x value: ');
yo=input('Introduce y value: ');
zo=input('Introduce z value: ');
po=[xo yo zo]';
valor=w*po+b;
res=hardlim(valor);
figure(2);
if res==1
   color='*r';
   imshow(Apple);
else
   color='*b';
   imshow(Orange);
end
figure(1);
hold on
plot3(xo,yo,zo,color);
opc=input('Do you repeat it? (YES=1,NO=Other)');
%%cla();
end