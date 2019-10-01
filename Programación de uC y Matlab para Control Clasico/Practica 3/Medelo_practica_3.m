clc, clear all, close all
syms M m l th F thp B1 B2 x xp g
A=M+m;
B=m*l*cos(th);
C=m*l*cos(th);
D=m*l^2;
E=F+m*l*thp^2*sin(th)-B1*xp;
F=m*g*l*sin(th)-B2*thp;
X=det([E F;C D])/det([A B;C D]);
Y=det([A B;E F])/det([A B;C D]);
X=simplify(X,'full');
Y=simplify(Y,'full');
disp(X)
disp(Y)
% P1=diff(X,th);
% P2=diff(Y,th);
% P1=simplify(P1,'full');
% P2=simplify(P2,'full');
% disp(P1)
% disp(P2)