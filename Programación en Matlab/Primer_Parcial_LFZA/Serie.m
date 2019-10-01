function [  ] = Serie( n )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
if(n>=1 && n<15)
    x=0;
    for i=1:n
      f=1;
      for l=1:i
          f=f*l;
      end
    x=i/f+x;
    end
    fprintf('%f', x);
else
   fprintf('Datos incorrectos');
end
end

