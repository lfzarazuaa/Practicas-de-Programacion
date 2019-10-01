clc,clear all, close all
k=0.1;
ess_deseado=2/100;
MF_deseado=40;
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
sys=k1./((s+polo1).*(s+polo2).*(s+polo3));
sys1=1./(s+polo1);
sys2=1./(s+polo2);
sys3=1./(s+polo3);
Magnitud1=20*log10(abs(sys));
Fase1=atand(imag(sys1)./real(sys1))...
      +atand(imag(sys2)./real(sys2))...
      +atand(imag(sys3)./real(sys3));
subplot(2,1,1),semilogx(w,Magnitud1,'k'),grid on;
subplot(2,1,2),semilogx(w,Fase1,'k'),grid on;
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
subplot(2,1,2),hold on
semilogx([w(Indiceb) w(Indiceb)],[min(Fase1),max(Fase1)],'b');
%%Determinacion de Ganancia
kc=(k1/Beta)/k
syms s
polinomio_polo=(s+polo1)*(s+polo2)*(s+polo3)+k;
Raices=solve(polinomio_polo,s);
Raiz=eval(Raices(2));
s=Raiz;
%%k_comp=1/Beta;
k_comp=abs((s+polo1)*(s+polo2)*(s+polo3)*(s+Polo_Comp)/(k*(s+Cero_Comp)));