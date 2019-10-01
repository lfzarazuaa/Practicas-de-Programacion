function [ R ] = Norma(A,B)
%Norma Calcula la norma entre A y B
%   Detailed explanation goes here
l=length(A);
R=0;
for i=1:l
    R=R+(A(i)-B(i))^2;
end
R=sqrt(R);
end

