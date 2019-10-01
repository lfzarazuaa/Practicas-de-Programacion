clc, clear all
a=11.7*10^(-6);
L=7365;
T0=0;
fprintf(' Temperatura Final    Aumento de Longitud\n');
for TF=0:5:40
Aumento_de_longitud=a*L*(TF-T0);
fprintf('       %d                     %.3f       \n', TF,Aumento_de_longitud);
end