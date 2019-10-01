function [  ] = Matriz_1(  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
A=magic(5);
for i=1:5
    for j=1:5
      fprintf('%d ', A(i,j));
    end
    fprintf('\n');
end

end

