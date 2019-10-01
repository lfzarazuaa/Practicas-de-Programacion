clc,clear all, close all
Vref=3;%3Volts
Vp=3.420;
Vmin=2;
tp=150e-3;
pi=3.141592654;
Mp=(Vp-Vref)/(Vref-Vmin);
zeta=-log(Mp)/sqrt(log(Mp)^2+pi^2);
wn=pi/(tp*sqrt(1-zeta^2));
dt=0.001;
Tiempo=0:dt:5;
NUM=wn^2;
DEN=[1,2*zeta*wn,wn^2];
SYS=tf(NUM,DEN);
Entrada(length(Tiempo))=0;
f=0.5;
w=2*pi*f;
for i=1:length(Tiempo)
    if sin(w*Tiempo(i))>0
    Entrada(i)=1;
    else
    Entrada(i)=0;
    end
end
Resultado=step(SYS,Tiempo);
plot(Tiempo,Resultado);
plot(Tiempo,Entrada);
Resultado2=lsimplot(SYS,Entrada,Tiempo);
%%plot(Tiempo,Resultado2);