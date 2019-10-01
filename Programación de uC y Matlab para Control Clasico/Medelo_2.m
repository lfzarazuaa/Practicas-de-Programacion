clc, clear all, close all
syms m1 m2 l th thp y yp K B1 B2 g
A=m1+m2;
B=-m2*l*sin(th);
C=-m2*l*sin(th);
D=m2*l^2;
E=m2*l*thp^2*cos(th)-B1*yp-K*y-m2*g;
F=m2*g*l*sin(th)-B2*thp;
X=det([E F;C D])/det([A B;C D]);
Y=det([A B;E F])/det([A B;C D]);
X=simplify(X,'full');
Y=simplify(Y,'full');
disp(X)
disp(Y)
P1=diff(X,th);
P2=diff(Y,th);
P1=simplify(P1,'full');
P2=simplify(P2,'full');
disp(P1)
disp(P2)