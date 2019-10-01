clc,clear all, close all
k=0.1;
ess_deseado=2/100;
MF_deseado=37.5;
polo1=0;
polo2=1;
polo3=0.5;
s=0;
kv_deseado=1/ess_deseado;
kf=(s+polo2)*(s+polo3)*kv_deseado/k;
k1=k*kf;
%%Graficar Bode
t=-5:0.0001:5;
w=10.^t;
s=1i*w;
sys=k./((s+polo1).*(s+polo2).*(s+polo3));
sys1=1./(s+polo1);
sys2=1./(s+polo2);
sys3=1./(s+polo3);
Magnitud1=20*log10(abs(sys));
Fase1=atand(imag(sys1)./real(sys1))...
      +atand(imag(sys2)./real(sys2))...
      +atand(imag(sys3)./real(sys3));
subplot(2,1,1),semilogx(w,Magnitud1,'k'),grid on;
title('Gráfica de Magnitud del Sistema Original (w[rad/s] vs Ganancia[dB])')
subplot(2,1,2),semilogx(w,Fase1,'k'),grid on;
title('Gráfica de Fase del Sistema Original (w[rad/s] vs Angulo[Grados])')
%%Diagrama de Bode Aplicando la Ganancia Calculada
sys=k1./((s+polo1).*(s+polo2).*(s+polo3));
sys1=1./(s+polo1);
sys2=1./(s+polo2);
sys3=1./(s+polo3);
Magnitud1=20*log10(abs(sys));
Fase1=atand(imag(sys1)./real(sys1))...
      +atand(imag(sys2)./real(sys2))...
      +atand(imag(sys3)./real(sys3));
figure()
subplot(2,1,1),semilogx(w,Magnitud1,'k'),grid on;
title('Gráfica de Magnitud del Sistema con K ajustada (w[rad/s] vs Ganancia[dB])')
subplot(2,1,2),semilogx(w,Fase1,'k'),grid on;
title('Gráfica de Fase del Sistema con K ajustada (w[rad/s] vs Angulo[Grados])')
%%%%%Cálculo del Cruce por Cero
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
% wg=w(Indice);
% Cero_Comp=wg/10;
%%%%
Angulo=-180+MF_deseado;
Indice1b=find(Fase1>=Angulo,1,'last');
Indice2b=find(Fase1<=Angulo,1,'first');
if abs(Fase1(Indice1b)-Angulo)<abs(Fase1(Indice2b)-Angulo)
    Indiceb=Indice1b;
else
    Indiceb=Indice2b;
end
Cruce_Cero_Fase=w(Indiceb);
wg=Cruce_Cero_Fase;
Cruce_Cero_Fase_error=Fase1(Indiceb)-Angulo;
T_Comp=10/wg;
Ganancia_Comp=Magnitud1(Indiceb);
Cero_Comp=1/T_Comp;
Beta=10^(Ganancia_Comp/20);
Polo_Comp=1/Beta*Cero_Comp;
subplot(2,1,1),hold on
semilogx([w(Indiceb) w(Indiceb)],[min(Magnitud1),max(Magnitud1)],'b');
texto=strcat('Margen de Fase en w=',num2str(Cruce_Cero),...
             ', Ganancia a Compensar=',num2str(Ganancia_Comp));
xlabel(texto);
legend('Magnitud del Sistema','Margen de Fase','Margen de Fase Deseado');
subplot(2,1,2),hold on
semilogx([w(Indiceb) w(Indiceb)],[min(Fase1),max(Fase1)],'b');
texto=strcat('Margen de Fase',num2str(Margen_Fase_Obtenido),...
             ', Margen de Fase deseado en w=',num2str(wg));
xlabel(texto);
legend('Fase del Sistema','Margen de Fase','Margen de Fase Deseado');
%%Determinacion de Ganancia
kc=(k1/Beta)/k;
%%%Graficacion Diagrama de Bode ya Compensado 
sys=kc*k*(s+Cero_Comp)./((s+polo1).*(s+polo2).*(s+polo3).*(s+Polo_Comp));
sys1=1./(s+polo1);
sys2=1./(s+polo2);
sys3=1./(s+polo3);
sys4=(s+Cero_Comp);
sys5=1./(s+Polo_Comp);
Magnitud1=20*log10(abs(sys));
Fase1=atand(imag(sys1)./real(sys1))...
      +atand(imag(sys2)./real(sys2))...
      +atand(imag(sys3)./real(sys3))...
      +atand(imag(sys4)./real(sys4))...
      +atand(imag(sys5)./real(sys5));
figure()
subplot(2,1,1),semilogx(w,Magnitud1,'k'),grid on;
title('Gráfica de Magnitud del Sistema con Compensador de Atraso (w[rad/s] vs Ganancia[dB])')
subplot(2,1,2),semilogx(w,Fase1,'k'),grid on;
title('Gráfica de Fase del Sistema con Compensador de Atraso (w[rad/s] vs Angulo[Grados])')
%%%%Simulacion del sistema
clc
sys=tf(1);
sys1=tf(0.1,[1,1.5,0.5,0]);
sys1r=feedback(sys1,sys);
t=0:0.01:80;
F1t=step(sys1r,t);
F2t=step(feedback(sys1*0.838376332081696,sys),t);
%%comp=tf(0.909827237950359*[1,0.045],[1,9e-05]);
%%comp=tf(0.909996012909105*[1,0.045],[1,1.8e-04]);
%%comp=tf(1.050705110552600*[1,0.024586686292897],[1,6.936995152305884e-05]);
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
Entrada=t;
figure()
R1t=lsimplot(sys1r,Entrada,t);
title('Respuesta del Sistema Original Ante la Rampa Unitaria');
figure()
R2t=lsimplot(sys1compr,Entrada,t);
title('Respuesta del Sistema Compensado Ante la Rampa Unitaria');
% R2t=lsimplot(feedback(sys1*0.838376332081696,sys),Entrada,t);
% R3t=lsimplot(sys1compr,Entrada,t);
% subplot(3,1,1),plot(t,R1t);
% subplot(3,1,2),plot(t,R2t);
% subplot(3,1,3),plot(t,R3t);