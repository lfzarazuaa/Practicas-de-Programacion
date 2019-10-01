clc,clear all, close all
ess=10/100;
MF_deseado=35;
kv=1/ess;
k1=150e3;...110e3;
polo1=0;
polo2=3;
polo3=35;
polo4=40;
s=0;
k=kv*(s+polo2)*(s+polo3)*(s+polo4);
fk=k/k1;
t=-5:0.0001:5;
w=10.^t;
s=1i*w;
sys=k1./((s+polo1).*(s+polo2).*(s+polo3));
sys1=1./(s+polo1);
sys2=1./(s+polo2);
sys3=1./(s+polo3);
sys4=1./(s+polo4);
Magnitud1=20*log10(abs(sys));
Fase1=atand(imag(sys1)./real(sys1))...
      +atand(imag(sys2)./real(sys2))...
      +atand(imag(sys3)./real(sys3))...
      +atand(imag(sys4)./real(sys4));
subplot(2,1,1),semilogx(w,Magnitud1,'k'),grid on;
title('Gráfica de Magnitud del Sistema Original (w[rad/s] vs Ganancia[dB])')
subplot(2,1,2),semilogx(w,Fase1,'k'),grid on;
title('Gráfica de Fase del Sistema Original (w[rad/s] vs Angulo[Grados])')
%%Graficar Diagrama de Bode con K calculada
sys=k./((s+polo1).*(s+polo2).*(s+polo3).*(s+polo4));
sys1=1./(s+polo1);
sys2=1./(s+polo2);
sys3=1./(s+polo3);
sys4=1./(s+polo4);
Magnitud1=20*log10(abs(sys));
Fase1=atand(imag(sys1)./real(sys1))...
      +atand(imag(sys2)./real(sys2))...
      +atand(imag(sys3)./real(sys3))...
      +atand(imag(sys4)./real(sys4));
figure()
subplot(2,1,1),semilogx(w,Magnitud1,'k'),grid on;
title('Gráfica de Magnitud del Sistema con K ajustada (w[rad/s] vs Ganancia[dB])')
subplot(2,1,2),semilogx(w,Fase1,'k'),grid on;
title('Gráfica de Fase del Sistema con K ajustada (w[rad/s] vs Angulo[Grados])')
%%%%Cálculo del Cruce por Cero
Indice1=find(Magnitud1>=0,1,'last');
Indice2=find(Magnitud1<=0,1,'first');
if abs(Magnitud1(Indice1))<abs(Magnitud1(Indice2))
    Indice=Indice1;
else
    Indice=Indice2;
end
Cruce_Cero=w(Indice);
Cruce_Cero_error=Magnitud1(Indice);
Margen_Fase_Obtenido=Fase1(Indice)-(-180);
subplot(2,1,1),hold on
semilogx([w(Indice) w(Indice)],[min(Magnitud1),max(Magnitud1)],'r');
subplot(2,1,2),hold on
semilogx([w(Indice) w(Indice)],[min(Fase1),max(Fase1)],'r');
Fase_en_Magnitud0=Fase1(Indice);
Angulo_Adelanto=MF_deseado-Margen_Fase_Obtenido;
Factor_Atenuacion=(1-sind(Angulo_Adelanto))/(1+sind(Angulo_Adelanto));
Magnitud_Compesador=-20*log10(1/sqrt(Factor_Atenuacion));
%%Determinación de la frecuencia a la Magnitud de Compensación
Indice1=find(Magnitud1>=Magnitud_Compesador,1,'last');
Indice2=find(Magnitud1<=Magnitud_Compesador,1,'first');
if abs(Magnitud1(Indice1))-abs(Magnitud_Compesador)>abs(Magnitud1(Indice2))-abs(Magnitud_Compesador)
    Indice=Indice1;
else
    Indice=Indice2;
end
Cruce_Cero_Compensado=w(Indice);
wm=w(Indice);
Cruce_Cero_Compensado_error=abs(abs(Magnitud1(Indice))-abs(Magnitud_Compesador));
Cero_Comp=wm*sqrt(Factor_Atenuacion);
Polo_Comp=Cero_Comp/Factor_Atenuacion;
subplot(2,1,1),hold on
semilogx([w(Indice) w(Indice)],[min(Magnitud1),max(Magnitud1)],'b');
legend('Magnitud del Sistema','Margen de Fase','Margen de Fase Deseado');
texto=strcat('Margen de Fase en w=',num2str(Cruce_Cero),...
             ', Ganancia a Compensar=',num2str(Magnitud_Compesador));
xlabel(texto);
subplot(2,1,2),hold on
semilogx([w(Indice) w(Indice)],[min(Fase1),max(Fase1)],'b');
legend('Fase del Sistema','Margen de Fase','Margen de Fase Deseado');
texto=strcat('Margen de Fase=',num2str(Margen_Fase_Obtenido),...
             ', Ganancia deseada en w=',num2str(Cruce_Cero_Compensado));
xlabel(texto);
Fase_en_Magnitud0=Fase1(Indice);
kc=(k/k1)*Factor_Atenuacion;
%%kc=k/(Factor_Atenuacion*k1);
%%%Graficacion Diagrama de Bode ya Compensado 
sys=kc*k1*(s+Cero_Comp)./((s+polo1).*(s+polo2).*(s+polo3).*(s+polo4).*(s+Polo_Comp));
sys1=1./(s+polo1);
sys2=1./(s+polo2);
sys3=1./(s+polo3);
sys4=1./(s+polo4);
sys5=(s+Cero_Comp);
sys6=1./(s+Polo_Comp);
Magnitud1=20*log10(abs(sys));
Fase1=atand(imag(sys1)./real(sys1))...
      +atand(imag(sys2)./real(sys2))...
      +atand(imag(sys3)./real(sys3))...
      +atand(imag(sys4)./real(sys4))...
      +atand(imag(sys5)./real(sys5))...
      +atand(imag(sys6)./real(sys6));
figure()
subplot(2,1,1),semilogx(w,Magnitud1,'k'),grid on;
title('Gráfica de Magnitud del Sistema con Compensador de Adelanto (w[rad/s] vs Ganancia[dB])')
subplot(2,1,2),semilogx(w,Fase1,'k'),grid on;
title('Gráfica de Fase del Sistema con Compensador de Adelanto (w[rad/s] vs Angulo[Grados])')
%%%Respuesta en Tiempo
sys=tf(1);
sys1=tf(k1,[1,78,1625,4200,0]);
sys1r=feedback(sys1,sys);
t=0:0.001:10;
F1t=step(sys1r,t);
%F2t=step(feedback(sys1*0.025,sys),t);
%comp=tf(2.921041811558129*[1,5.22],[1,35.830494384798340]);
%%comp=tf(0.763636363636364*[1,5.290271869484021],[1,19.396439171913922]);
comp=tf(kc*[1,Cero_Comp],[1,Polo_Comp]);
%%comp=tf(2.655492555961935*0.838376332081696*[1,5.22],[1,35.830494384798340]);
%%comp=tf(3.2*[1,5.22],[1,35.830494384798340]);
sys1compr=feedback(sys1*comp,sys);
F3t=step(sys1compr,t);
figure()
subplot(2,1,1),plot(t,F1t);
title('Respuesta del Sistema Original ante el Escalon Unitario (Tiempo vs Amplitud)')
subplot(2,1,2),plot(t,F3t);
title('Respuesta del Sistema Compensado ante el Escalon Unitario (Tiempo vs Amplitud)')