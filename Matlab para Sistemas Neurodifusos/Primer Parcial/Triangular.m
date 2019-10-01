function [x,y] = Triangular(start,step,final,a,b,c)
%Triangular This function returns a defined Triangular signal
% Triangular signal with points in a b c. 
x=start:step:final;
y(length(x))=0;
for i=1:length(x)
   if (x(i)<a)
     y(i)=0;  
   elseif (a<=x(i) && x(i)<b)
     y(i)=(x(i)-a)/(b-a);
   elseif (b<=x(i) && x(i)<c)
     y(i)=(c-x(i))/(c-b);
   else
     y(i)=0;
   end
end
end

