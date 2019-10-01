clc,clear all,close all
A=0:0.01:1e5;
B=A.^2-A+5;
Res=Tbp(A,B);