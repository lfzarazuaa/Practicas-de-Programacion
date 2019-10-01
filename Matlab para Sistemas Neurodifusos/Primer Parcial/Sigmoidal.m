function [x,y] = Sigmoidal(start,step,final,a,c)
%Sigmoidal This function returns a defined Sigmoidal signal
% Sigmoidal signal with center in c and increment a. 
x=start:step:final;
y=1./(1+exp(-a*(x-c)));
end

