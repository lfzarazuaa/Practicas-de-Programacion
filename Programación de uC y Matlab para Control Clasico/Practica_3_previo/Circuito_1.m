clc, clear all, close all
syms R L C s
HR=simplify(R/(R+s*L+1/(s*C)),'full')
HL=simplify(s*L/(R+s*L+1/(s*C)),'full')
HC=simplify((1/(s*C))/(R+s*L+1/(s*C)),'full')