clc, clear all, close all
R=978;
Vi=2.4;
Vl=[0.4 0.28 0.2 0.12 0.08 0.04];
Vr=[2 2.12 2.2 2.28 2.32 2.36];
f=[10 12 14 20 23 32];
w=2*pi*f;
G1=Vl/Vi;
G2=Vr/Vi;
L1=G1*R./sqrt(w.^2-G1.^2.*w.^2);
L2=sqrt(R^2-(G2*R).^2)./(G2.*w);
Eve=[f' w' G1' L1' G2' L2'];