function [x,y] = Bell(start,step,final,a,b,c)
%Bell This function returns a defined Bell signal
% Bell signal with center in c large a and increment b. 
x=start:step:final;
y=1./(1+abs((x-c)/a).^(2*b));
end