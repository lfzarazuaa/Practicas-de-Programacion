function [x,y] = Guassian(start,step,final,c,sigma)
%Guassian This function returns a defined Guassian signal
% Guassian signal with center in c and increment sigma. 
x=start:step:final;
y=exp(-(1/2)*((x-c)/sigma).^2);
end
