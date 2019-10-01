function [  ] = Fibonacci(  )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    a=0;
    b=1;
    c=0;
   fprintf('%d,%d,', a,b);
   while(c<=100)
       c=a+b;
       a=b;
       b=c;
       fprintf('%d,', c);
   end

end

