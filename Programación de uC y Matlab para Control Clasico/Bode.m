clc, clear all, close all
t=-5:0.0001:5;
w=10.^t;
k1=50;
k2=25;
s=1i*w;
sys=1./(s.*(s+1));
sys1=k1*sys;
Magnitud1=20*log10(abs(sys1));
Fase1=atand(imag(sys1)./real(sys1))-180;
sys2=k2*sys;
Magnitud2=20*log10(abs(sys2));
Fase2=atand(imag(sys2)./real(sys2))-180;
% for l=1:length(Fase)
%     if Fase(l)>180 
%        Fase(l)=Fase(l)-180;
%     end
% end
subplot(2,1,1),semilogx(w,Magnitud1,'b'),hold on,semilogx(w,Magnitud2,'r'),grid on;
subplot(2,1,2),semilogx(w,Fase1,'b'),hold on,semilogx(w,Fase2,'r'),grid on;
Indice1=find(Magnitud1>=0,1,'last');
Indice2=find(Magnitud1<=0,1,'first');
if abs(Magnitud1(Indice1))<abs(Magnitud1(Indice2))
    Indice=Indice1;
else
    Indice=Indice2;
end
Cruce_Cero=w(Indice);
Cruce_Cero_error=Magnitud1(Indice);
Margen_Fase=Fase1(Indice)-(-180);
%%%
MF=50;
Angulo=-180+MF;
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
Cero=1/T_Comp;
Beta=10^(Ganancia_Comp/20);
Polo=1/Beta*Cero;
%%%
sys=1./(s.*(s+1)).*(s+Cero)./(s+Polo);
sys1=k1*sys;
Magnitud1=20*log10(abs(sys1));
Fase1=atand(imag(sys1)./real(sys1))-180;
figure(2)
subplot(2,1,1),semilogx(w,Magnitud1,'b'),hold on,semilogx(w,Magnitud2,'r'),grid on;
subplot(2,1,2),semilogx(w,Fase1,'b'),hold on,semilogx(w,Fase2,'r'),grid on;