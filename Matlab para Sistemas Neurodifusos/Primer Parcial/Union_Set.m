function [ Vector_R ] = Union_Set( Vector_A,Vector_B)
%Union_Set This function does the Union of two horizontal vectors of the
%same length.
% This function returns a Vector with the Union of Vector_A and Vector_B,
% by doing the max of them.
Vector_R=max([Vector_A;Vector_B]);
end

