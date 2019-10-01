clc,clear all, close all
C1=-1j/(2*pi);
L1=2*pi*1j;
A=1+1/C1;
B=-1;
C=-1
D=1/L1+1;
U1=1;
U2=0;
y=[A B;C D]\[U1;U2];
y1_mag=abs(y(1));
y1_ang=angle(y(1))*180/(pi);
y2_mag=abs(y(2));
y2_ang=angle(y(2))*180/(pi);
% A=1;
% B=1;
% C=1;
% D=-1;
% U1=3;
% U2=-1;
% y=[A B;C D]\[U1;U2];
