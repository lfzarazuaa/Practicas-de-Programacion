function [y] = Bell_1(x,M)
%Bell This function returns a defined Bell signal
% Bell signal with center in c large a and increment b. 
a=M(1);
b=M(2);
c=M(3);
y=1./(1+abs((x-c)/a).^(2*b));
end