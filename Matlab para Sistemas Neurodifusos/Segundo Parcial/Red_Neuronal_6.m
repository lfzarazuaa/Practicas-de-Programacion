clc,clear all,close all
P=[1 1 2 2 3 3 4 4 -2 -3 -2 -3 -2 -1 -2 -1;...
   4 5 4 5 1 2 1 2  4  4  3  3 -4 -4 -3 -3];
t1=[0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1];
t2=[0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1];
t=[t1;t2];
p1=[P(:,1)',t1(1)];
p2=[P(:,2)',t1(2)];
p3=[P(:,3)',t1(3)];
p4=[P(:,4)',t1(4)];
p5=[P(:,5)',t1(5)];
p6=[P(:,6)',t1(6)];
p7=[P(:,7)',t1(7)];
p8=[P(:,8)',t1(8)];
p9=[P(:,9)',t1(1)];
p10=[P(:,10)',t1(2)];
p11=[P(:,11)',t1(3)];
p12=[P(:,12)',t1(4)];
p13=[P(:,13)',t1(5)];
p14=[P(:,14)',t1(6)];
p15=[P(:,15)',t1(7)];
p16=[P(:,16)',t1(8)];
%e=[1 1 1 1 1 1 1 1 1 1];
w=rand(2,2)*5;
b=rand(2,1)*5;
% % w=[-1 0];
% % b=0.5;
% iteration=1e3;
iteration=input('Introduce number of epochs: ');
E(iteration*16,2)=0;
E=E';
count=1;
er(2,16)=0;
for j=1:iteration
 for i=1:16
  p=P(:,i);
  a=hardlim(w*p+b);
  e=t(:,i)-a;
%   E(count)=e;
%   count=count+1;
  w=w+e*p';
  b=b+e;
  er(:,i)=e;
 end
%  if sum(sum(abs(er)))==0
%      j
%      break;
%      %%j=iteration; 
%  end
end
 ph1=-b(1)/w(1,1);
 pv1=-b(1)/w(1,2);
 m1=pv1/-ph1;
 br1=pv1;
 ph2=-b(2)/w(2,1);
 pv2=-b(2)/w(2,2);
 m2=pv2/-ph2;
 br2=pv2;
 x=-5:0.01:5;
 y1=m1*x+br1;
 y2=m2*x+br2;
 hold on
plot(p1(1),p1(2),'or');
plot(p2(1),p2(2),'or');
plot(p3(1),p3(2),'or');
plot(p4(1),p4(2),'or');
plot(p5(1),p5(2),'ob');
plot(p6(1),p6(2),'ob');
plot(p7(1),p7(2),'ob');
plot(p8(1),p8(2),'ob');
plot(p9(1),p9(2),'og');
plot(p10(1),p10(2),'og');
plot(p11(1),p11(2),'og');
plot(p12(1),p12(2),'og');
plot(p13(1),p13(2),'ok');
plot(p14(1),p14(2),'ok');
plot(p15(1),p15(2),'ok');
plot(p16(1),p16(2),'ok');
plot(x,y1);
plot(x,y2);
texto=strcat(num2str(m1),'x + ',num2str(br1));
text(0,4,texto);
texto=strcat(num2str(m2),'x + ',num2str(br2));
text(-1,-1,texto);
% hold on
% plot(p1(1),p1(2),'or');
% plot(p2(1),p2(2),'or');
% plot(p3(1),p3(2),'or');
% plot(p4(1),p4(2),'or');
% plot(p5(1),p5(2),'ob');
% plot(p6(1),p6(2),'ob');
% plot(p7(1),p7(2),'ob');
% plot(p8(1),p8(2),'ob');
% text(0,3,texto);
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
Bob=imread('Bob_peluche.jpg');
Mario=imread('Mario_peluche.jpg');
pause(0.750)
opc=1;
while(opc==1)
xo=input('Introduce x value: ');
yo=input('Introduce y value: ');
po=[xo yo]';
valor=w*po+b;
res=hardlim(valor);
val=res(1)+res(2)*2
figure(2);
if val==0
   color='*r';
   imshow(Conejo);
elseif val==1
   color='*b';
   imshow(Oso);
elseif val==3
   color='*k';
   imshow(Bob);
else
   color='*g';
   imshow(Mario);
end
figure(1);
hold on
plot(xo,yo,color);
pause(0.50)
opc=input('Do you repeat it? (YES=1,NO=Other)');
%%cla();
end