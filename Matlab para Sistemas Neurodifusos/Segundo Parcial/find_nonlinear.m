function [Y,ind] = find_nonlinear(X,point)
%found_linear Encuentra el valor del vector y el indice
%   Detailed explanation goes here
Error=abs(X-point);
ind=find(Error==min(Error),1,'first');
Y=X(ind);
end



