clc, clear all, close all
syms G1 G2 G3 G4 G5 G6 G7 G8
A=G1*G7*(G3+G4)/(1+G6*G7-G3*G7*G8-G4*G7*G8);
B=G5/G7+G2*(1+G6*G7)/((G3+G4)*G7);
Res3=simplify(A/(1+A*B),'Steps', 1000);
pretty(Res3)