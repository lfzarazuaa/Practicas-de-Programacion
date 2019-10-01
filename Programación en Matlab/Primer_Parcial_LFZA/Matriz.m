function [  ] = Matriz( n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
A= magic(n)
diagonal_1 = 0;
diagonal_2 = 0;
perimetro = 0;
 for i=1:n
   m=n-i+1;
      for j=1:n
        l=n-j+1;
          if i==j
          diagonal_1= diagonal_1 + A(i,j);
          end
          if m==l
          diagonal_2= diagonal_2 + A(m,j);
          end
          if i==1 || j==1 || i==n || j==n
          perimetro=perimetro + A(i,j);
          end
      end
 end
diagonal_1 = 0+ diagonal_1
diagonal_2 = 0+ diagonal_2
perimetro = 0+ perimetro
end

