function [y] = Trapezoidal_1(x,V)
%Trapezoidal This function returns a defined Trapezoidal signal
% Trapezoidal signal with points in a b c d. 
a=V(1);
b=V(2);
c=V(3);
d=V(4);
y(length(x))=0;
for i=1:length(x)
   if (x(i)<a)
     y(i)=0;  
   elseif (a<=x(i) && x(i)<b)
     y(i)=(x(i)-a)/(b-a);
   elseif (b<=x(i) && x(i)<=c)
     y(i)=1;  
   elseif (c<=x(i) && x(i)<d)
     y(i)=(d-x(i))/(d-c);
   else
     y(i)=0;
   end
end
if c==d
   y(i)=1; 
end
end