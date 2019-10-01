clc, clear all
X=-5:0.01:5;
Y=-3:0.01:3;
[x,y]=meshgrid(X,Y);
z=(25.*x-3.*y.^(3/2)-64).^5;
contour(x,y,z,20)

