clc,clear all, close all
ess=5/100;
MF_deseado=35;
kv=1/ess;
k1=110e3;
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
subplot(2,1,1),semilogx(w,Magnitud1,'k')%%,grid on;
subplot(2,1,2),semilogx(w,Fase1,'k')%%,grid on;
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
subplot(2,1,2),hold on
semilogx([w(Indice) w(Indice)],[min(Fase1),max(Fase1)],'b');
Fase_en_Magnitud0=Fase1(Indice);