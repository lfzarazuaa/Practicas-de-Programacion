function [ Vector_R ] = Difference_Set(Vector_A)
%Difference_Set This function does the Difference of two horizontal vectors of the
%same length.
% This function returns a Vector with the Difference of Vector_A and Vector_B,
% by doing the 1-max of them.
Vector_R=1-max([Vector_A;Vector_B]);
end

