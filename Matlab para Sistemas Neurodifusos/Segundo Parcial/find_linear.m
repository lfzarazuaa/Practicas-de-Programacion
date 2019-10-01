function [Y,ind] = find_linear(X,point)
%found_linear Encuentra el valor del vector y el indice
%   Detailed explanation goes here
res=round(length(X)*(point-min(X))/(max(X)-min(X)));
if res<=0
   res=1;
elseif res>=length(X)
   res=length(X); 
end
Error_p(1)=abs(X(res)-point);
if (res>1)
Error_p(2)=abs(X(res-1)-point);
else
Error_p(2)=Error_p(1);
end
if (res+1<=length(X))
Error_p(3)=abs(X(res+1)-point);
end
Error=min(Error_p);
if Error==Error_p(1)
   ind=res;
elseif Error==Error_p(2) && res>2
   ind=res-1;
else
   ind=res+1;
end
Y=X(ind);
end