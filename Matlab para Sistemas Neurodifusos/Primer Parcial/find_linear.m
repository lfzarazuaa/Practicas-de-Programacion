function [Y,ind] = find_linear(X,point)
%found_linear Encuentra el valor del vector y el indice
%   Detailed explanation goes here
res=round(length(X)*point/(max(X)-min(X)));
Error_p(1)=abs(X(res-1)-point);
Error_p(2)=abs(X(res)-point);
Error_p(3)=abs(X(res+1)-point);
Error=min(Error_p);
if Error==Error_p(1)
   ind=res-1;
elseif Error==Error_p(2)
   ind=res; 
else
   ind=res+1;  
end
Y=X(ind);
end

