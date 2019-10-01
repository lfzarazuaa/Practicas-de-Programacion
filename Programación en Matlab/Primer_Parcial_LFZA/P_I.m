function [ output_args ] = P_I( input_args )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
clc,clear all
pares=0;
    impares=0;
for i=1:100
    x1=pares;
    y1=impares;
    if (mod(i,2))==0
        pares=pares+i;
    else
        impares=impares+i;
    end
    x2=pares;
    y2=impares;
    x=[x1,y1];
    y=[y2,x1];
    plot(x,y)
end
   fprintf('La suma de los pares es %d', pares);
   fprintf('\nLa suma de los impares es %d', impares);

end

