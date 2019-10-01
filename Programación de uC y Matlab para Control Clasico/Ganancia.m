clc,clear all, close all
Mp=15/100;
ts=0.8;
z=-log(Mp)/sqrt(log(Mp)^2+pi^2);
wn=4/(z*ts);
sx=roots([1,2*z*wn,wn^2])';%Raiz del plano de Laplace deseada.
sx1=sx(2);
k1=110000;
polo1=0;
polo2=3;
polo3=35;
polo4=40;
s=sx1;
k=abs((s+polo1)*(s+polo2)*(s+polo3)*(s+polo4)/110e3);