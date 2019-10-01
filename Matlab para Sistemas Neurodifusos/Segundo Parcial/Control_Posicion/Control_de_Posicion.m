clc, clear all, close all
m1=2;
n1=1;
Factor_Angulo=1;
Factor_Fuerza=1;
%%Ángulo
AHN=[-180 -180 -90 -70]*Factor_Angulo;
AMN=[-90 -70 -30 -20]*Factor_Angulo;
ALN=[-20 -10 -5 5]*Factor_Angulo;
ALP=[-5 5 10 20]*Factor_Angulo;
AMP=[20 30 70 90]*Factor_Angulo;
AHP=[70 90 180 180]*Factor_Angulo;
%%Fuerza
FHN=[-100 -100 -50 -40]*Factor_Fuerza;
FMN=[-50 -40 -20 -10]*Factor_Fuerza;
FLN=[-20 -10 -2 0]*Factor_Fuerza;
FLP=[0 2 10 20]*Factor_Fuerza;
FMP=[10 20 40 50]*Factor_Fuerza;
FHP=[40 50 100 100]*Factor_Fuerza;
%%Vectores en x
x1=(-180:1:180)*Factor_Angulo;%%Error de Posición.
x2=(-100:0.5:100)*Factor_Fuerza;%%Fuerza.
%%%Funciones de Membresia para Posición
F_AHN=Trapezoidal_1(x1,AHN);
F_AMN=Trapezoidal_1(x1,AMN);
F_ALN=Trapezoidal_1(x1,ALN);
F_ALP=Trapezoidal_1(x1,ALP);
F_AMP=Trapezoidal_1(x1,AMP);
F_AHP=Trapezoidal_1(x1,AHP);
%%%Funciones de Membresia para Fuerza
F_FHN=Trapezoidal_1(x2,FHN);
F_FMN=Trapezoidal_1(x2,FMN);
F_FLN=Trapezoidal_1(x2,FLN);
F_FLP=Trapezoidal_1(x2,FLP);
F_FMP=Trapezoidal_1(x2,FMP);
F_FHP=Trapezoidal_1(x2,FHP);
figure(1)
cla()
subplot(m1,n1,1),hold on,plot(x1,F_AHN),plot(x1,F_AMN),plot(x1,F_ALN),plot(x1,F_ALP),plot(x1,F_AMP),plot(x1,F_AHP),plot(x1,F_AMP),title('Ángulo');
legend('Grande Negativo','Medio Negativo','Bajo Negativo','Bajo Positivo','Medio Positivo','Grande Positivo');
subplot(m1,n1,2),hold on,plot(x2,F_FHN),plot(x2,F_FMN),plot(x2,F_FLN),plot(x2,F_FLP),plot(x2,F_FMP),plot(x2,F_FHP),title('Fuerza');
legend('Grande Negativo','Medio Negativo','Bajo Negativo','Bajo Positivo','Medio Positivo','Grande Positivo');
%%Realizar la composición max min y reglas if then
longitud=length(x2);
Comp=ones(1,length(x2));
Fuerza(length(x1))=0;
for i=1:length(x1)
angulo=x1(i);
FHN_max=F_FHN(i);
FMN_max=F_FMN(i);
FLN_max=F_FLN(i);
FLP_max=F_FLP(i);
FMP_max=F_FMP(i);
FHP_max=F_FHP(i);
Cutline_1=min([F_FHN; FHN_max*Comp]);
Cutline_2=min([F_FMN; FMN_max*Comp]);
Cutline_3=min([F_FLN; FLN_max*Comp]);
Cutline_4=min([F_FLP; FLP_max*Comp]);
Cutline_5=min([F_FMP; FMP_max*Comp]);
Cutline_6=min([F_FHP; FHP_max*Comp]);
Cutline_R=max([Cutline_1;Cutline_2;Cutline_3;Cutline_4;Cutline_5;Cutline_6]);
if sum(Cutline_R)>0
Salida = defuzz(x2,Cutline_R,'centroid');
Fuerza(i)=Salida;
end
end
figure(2),
plot(x1,Fuerza);
angulo=36;
[Angulo_Cercano,Indice]=find_nonlinear(x1,angulo);
Fuerza_Res=Fuerza(Indice);