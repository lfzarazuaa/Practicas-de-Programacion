clc, clear all, close all
% H=tf([1 3], [1 5 9 5]);
H=tf([1 5], [1 6 11 6]);
dt=0.01;
t=0:dt:10;
y=step(H,t);
dy=(diff(y)/dt)';
dy(length(t))=dy(length(t)-1);
[pendiente, punto]=max(dy);
tiempo_inflexion=t(punto);
subplot(1,3,1),plot(t,y)
subplot(1,3,2),plot(t,dy)
m=pendiente;
x1=tiempo_inflexion;
y1=y(punto);
yr=m*t-m*x1+y1;
L=x1-y1/m;%%Valor de L
Tau=x1+(y(length(t))-y1)/m;
T=Tau-L;
subplot(1,2,1),plot(t,y,'r','LineWidth',3)
hold on, grid on
plot(t,yr,'m','LineWidth',2)
plot([L L],[0,y(length(t))*1.5],'b','LineWidth',3)
plot([Tau Tau],[0,y(length(t))*1.5],'k','LineWidth',3)
plot([0,L],[0.6 0.6],'b','LineWidth',3)
plot([L,Tau],[0.6 0.6],'k','LineWidth',3)
plot(x1,y1,'xk','LineWidth',3)
legend('Respuesta al Escalón','Recta','L(Valor en x)','Tau','L','T','Punto de Inflexión')
subplot(1,2,2),plot(t,dy)
Maximo=y(length(t));
Minimo=0;
T=Tau-L;
Hn=tf(1);
%%%P
Kd=T/L;
P=tf(Kd);
H2=feedback(series(P,H),Hn);
yP=step(H2,t);
Const_P=[Kd,0,0];
%%%PI
Kd=0.9*T/L;
Ti=L/0.3;
Td=0;
PI=tf([Kd*Td*Ti,Ti*Kd,Kd],[Ti,0]);
H3=feedback(series(PI,H),Hn);
yPI=step(H3,t);
Const_PI=[Kd,Ti,Td];
%%%PID
Kd=1.2*T/L;
Ti=2*L;
Td=0.5*L;
PID=tf([Kd*Td*Ti,Ti*Kd,Kd],[Ti,0]);
H4=feedback(series(PID,H),Hn);
yPID=step(H4,t);
Const_PID=[Kd,Ti,Td];
subplot(1,3,3),hold on
plot(t,yP,'b','LineWidth',2),
plot(t,yPI,'g','LineWidth',2),
plot(t,yPID,'k','LineWidth',2),
plot(t,y,'m','LineWidth',2)
legend('P','PI','PID','Original')
pendiente
x1
y1
L
T
Const_P
Const_PI
Const_PID