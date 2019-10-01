clc,clear all, close all
P=[1 1 2 2 3 3 4 4;...
   4 5 4 5 1 2 1 2];
tA=[1 1 1 1 -1 -1 -1 -1];
t=[0 0 0 0 1 1 1 1];
p1=[P(:,1)',t(1)];
p2=[P(:,2)',t(2)];
p3=[P(:,3)',t(3)];
p4=[P(:,4)',t(4)];
p5=[P(:,5)',t(5)];
p6=[P(:,6)',t(6)];
p7=[P(:,7)',t(7)];
p8=[P(:,8)',t(8)];
% p9=[P(:,9)',t(9)];
% p10=[P(:,10)',t(10)];
wo=rand(1,2);
bo=rand(1);
E=length(t);
R=(1/2)*(P*P.');
% R=(1/E)*(P(:,1)*P(:,1)');
% for i=2:E
%     R=R+(1/E)*(P(:,i)*P(:,i)');
% end
Z=eig(R);
Zmax=max(Z);
alpha=0.02;
% if alpha>(1/Zmax)
%    alpha=1/(2*Zmax);
% end
epochs=input('Introduce number of epochs: ');
ErrorP(epochs*E)=0;
ErrorA(epochs*E)=0;
count=1;
wA=wo;
bA=bo;
wP=wo;
bP=bo;
WAc(epochs*E,2)=0;
WPc(epochs*E,2)=0;
for i=1:epochs
   for j=1:E
       %%%Adaline Neural Network
       p=P(:,j);
       aA=purelin(wA*p+bA);
       eA=tA(j)-aA;
       ErrorA(count)=eA;
       wA=wA+2*alpha*eA*p';
       bA=bA+2*alpha*eA;
       WAc(count,:)=wA;
       %%%Perceptron Neural Network
       aP=hardlim(wP*p+bP);
       eP=t(j)-aP;
       ErrorP(count)=eP;
       wP=wP+eP*p';
       bP=bP+eP;
       WPc(count,:)=wP;
       count=count+1;
   end
end
%%%Adaline Neural Network
phA=-bA/wA(1);
pvA=-bA/wA(2);
mA=pvA/-phA;
brA=pvA;
x=-5:0.01:5;
yA=mA*x+brA;
textoA=strcat('A=',num2str(mA),'x + ',num2str(brA));
%%%%Perceptron Neural Network
phP=-bP/wP(1);
pvP=-bP/wP(2);
mP=pvP/-phP;
brP=pvP;
x=-5:0.01:5;
yP=mP*x+brP;
textoP=strcat('P=',num2str(mP),'x + ',num2str(brP));
hold on
text(0,3,textoA);
plot(x,yA);
text(0,0,textoP);
plot(x,yP);
plot(p1(1),p1(2),'or');
plot(p2(1),p2(2),'or');
plot(p3(1),p3(2),'or');
plot(p4(1),p4(2),'or');
plot(p5(1),p5(2),'ob');
plot(p6(1),p6(2),'ob');
plot(p7(1),p7(2),'ob');
plot(p8(1),p8(2),'ob');
% plot(p9(1),p9(2),'ob');
% plot(p10(1),p10(2),'ob');
figure(2)
hold on
s=length(ErrorA);
spo(s)=0;
for i=1:s
   spo(i)=i; 
end
subplot(2,1,1),plot(spo,ErrorA),title('Adaline Network Error');
subplot(2,1,2),plot(spo,ErrorP),title('Perceptron Error');
figure(3)
subplot(2,1,1),plot(spo,WAc),title('Adaline Network Weigth');
legend('X Weight','Y Weight')
subplot(2,1,2),plot(spo,WPc),title('Perceptron Weight');
legend('X Weight','Y Weight')
%%%Cálculo del punto
Oso=imread('Oso_peluche.jpg');
Conejo=imread('Conejo_peluche.jpg');
pause(0.750)
opc=1;
w=wA;
b=bA;
while(opc==1)
xo=input('Introduce x value: ');
yo=input('Introduce y value: ');
po=[xo yo]';
valor=w*po+b;
res=hardlim(valor);
figure(4);
if res==1
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