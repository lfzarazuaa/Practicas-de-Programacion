clc, clear all, close all
f=1:1:100000;
w=f*2*pi;
s=1j*w;
R=978;
L=18e-3;
H1=s./(s+(R/L));
G1=w./sqrt(w.^2+(R/L)^2);
L1=G1.*R./sqrt(w.^2-G1.^2.*w.^2);
Magnitud1=abs(H1);
H2=(R/L)./(s+(R/L));
G2=(R/L)./sqrt(w.^2+(R/L)^2);
L2=sqrt(R^2-(G2*R).^2)./(G2.*w);
Magnitud2=abs(H2);
Eve=[f' w' Magnitud1' G1' L1' Magnitud2' G2' L2'];
Angulo=angle(H1)*180/pi;
subplot(3,1,1),plot(f,Magnitud1);
subplot(3,1,2),plot(f,Angulo);
subplot(3,1,3),semilogx(w,20*log10(Magnitud1));