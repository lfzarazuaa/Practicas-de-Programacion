function [  ] = Matriz_Par(  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
A=[7 8 7 2 1];
acu=0;
for i=1:5
      if mod(A(i),2)==0
      acu=acu+A(i);
      end
end
suma=acu
end

