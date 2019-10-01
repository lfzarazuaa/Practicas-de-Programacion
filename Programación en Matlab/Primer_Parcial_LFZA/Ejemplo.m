clc, clear all 
X=[-5:0.1:5];
Y=[-5:0.1:5];
[x y]=meshgrid(X,Y);
z=(x.^2-y.^2)./(x.^2+y.^2);
mesh(x,y,z)