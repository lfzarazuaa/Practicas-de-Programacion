clc, clear all, close all
% s=-1+1i*2;
% k=(s^4+12*s^3+64*s^2+128*s);
syms s
R=diff((s^2+2*s+2)/(s^2+4*s));
% R=(2*s+2)*(s^2+4*s)-(2*s+4)*(s^2+2*s+2);
R=simplify(R,'full')
roots([2,-4,-8]);