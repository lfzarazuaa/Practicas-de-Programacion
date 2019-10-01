function [y] = Sigmoidal_1(x,M)
%Sigmoidal This function returns a defined Sigmoidal signal
% Sigmoidal signal with center in c and increment a. 
a=M(1);
c=M(2);
y=1./(1+exp(-a*(x-c)));
end

