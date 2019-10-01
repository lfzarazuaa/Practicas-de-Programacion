clc,clear all, close all
k=0.1;
polo1=0;
polo2=1;
polo3=0.5;
ess=2/100;
syms s
polinomio_polo=(s+polo1)*(s+polo2)*(s+polo3)+k;
Raices=solve(polinomio_polo,s);
Raiz=eval(Raices(2));
s=0;
kv=k/((s+polo2)*(s+polo3));
ess_obtenido=1/kv;
kv_deseado=1/ess;
Cero_Comp=round(real(Raiz)*100)/400;
B=kv_deseado/kv;
Polo_Comp=Cero_Comp/B;
s=Raiz;
kf=abs((s+polo1)*(s+polo2)*(s+polo3)*(s+Polo_Comp)/(k*(s+Cero_Comp)));
% sx=roots([1,2*z*wn,wn^2])';%Raiz del plano de Laplace deseada.
% sx1=sx(2);