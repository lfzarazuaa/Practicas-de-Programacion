function [ Vector_R ] = Intersection_Set(Vector_A,Vector_B)
%Intersection_Set This function does the Intersection of two horizontal vectors of the
%same length.
% This function returns a Vector with the Intersection of Vector_A and Vector_B,
% by doing the minimus of them.
Vector_R=min([Vector_A;Vector_B]);
end

