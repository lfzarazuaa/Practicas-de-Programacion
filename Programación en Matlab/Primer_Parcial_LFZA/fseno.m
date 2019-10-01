clc, clear all
seno_matlab= sin(30*pi/180);
error=10^(-6);
x=30*pi/180;
seno=0;
i=0;
while (abs(seno_matlab-seno)>error)|| i==0
    seno=seno+((-1)^(i)*x^(1+2*i)/factorial(1+2*i));
    i=i+1;
end
seno
i
r=seno_matlab-seno