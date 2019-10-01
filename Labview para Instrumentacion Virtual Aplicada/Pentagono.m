clc,clear all, close all
lado=5;
l=lado;
n=5;
for i=0:n
    X(i+1)=sind(i*360/n);
    Y(i+1)=cosd(i*360/n);
end
plot(X,Y)

for i=0:n
    X2(i+1)=1.5*sind(i*360/n+72/2);
    Y2(i+1)=1.5*cosd(i*360/n+72/2);
end
% plot(X,Y)
% hold on
% plot(X2,Y2)
for i=1:length(X)
    X3(2*i-1)=X(i);
    X3(2*i)=X2(i);
    Y3(2*i-1)=Y(i);
    Y3(2*i)=Y2(i);
end
% hold on
plot(1.5*X3+5,1.5*Y3+5)
X=1.5*X3+5;
Y=1.5*Y3+5;
R=[X',Y']