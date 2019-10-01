clc, clear all, close all
syms s
G1=1/(s+7);
G2=1/(s^2+2*s+3);
G3=1/(s+4);
G4=1/s;
G5=5/(s+7);
G6=1/(s^2+5*s+10);
G7=3/(s+2);
G8=1/(s+6);
R1=G1*G3*G7;
disp('R1=');
pretty(expand(R1))
R2=G1*G4*G7;
disp('R2=');
pretty(expand(R2))
R3=G1*G2;
disp('R3=');
pretty(expand(R3))
R4=G1*G2*G6*G7;
disp('R4=');
pretty(expand(R4))
R5=G1*G3*G5;
disp('R5=');
pretty(expand(R5))
R6=-G3*G7*G8;
disp('R6=');
pretty(expand(R6))
R7=G1*G4*G5;
disp('R7=');
pretty(expand(R7))
R8=-G4*G7*G8;
disp('R8=');
pretty(expand(R8))
R9=G6*G7;
disp('R9=');
pretty(expand(R9))
R1=expand(R1)
R2=expand(R2)
R3=expand(R3)
R4=expand(R4)
R5=expand(R5)
R6=expand(R6)
R7=expand(R7)
R8=expand(R8)
R9=expand(R9)
Num=simplify(R1+R2,'Steps', 150);
Den=simplify(1+R3+R4+R5+R6+R7+R8+R9,'Steps', 150);
disp('Num=');
pretty(expand(Num))
disp('Num=');
pretty(factor(Num))
disp('Den=')
pretty((Den))
pretty(expand(Den))
expand(Den)
% Res=simplify(Num/Den,'Steps', 150);
% disp('Reducido=')
% pretty((Res))
% disp('Expandido=')
% pretty(expand(Res))
% expand(Res)
% Res2=simplify(G1*G7*(G3+G4)/(1+G2+G2*G6*G7+G3*G5-G3*G7*G8+G4*G5-G4*G7*G8+G6*G7),'Steps', 1000);
% expand(Res2)
% A=G1*G7*(G3+G4)/(1+G6*G7-G3*G7*G8-G4*G7*G8);
% B=G5/G7+G2*(1+G6*G7)/((G3+G4)*G7);
% Res3=simplify(A/(1+A*B),'Steps', 1000);
% expand(Res3)