function [ Vector_R ] = Smax(Vector_A,Vector_B)
%Smax, this function does the Norm S Max of two horizontal vectors of the
%same length.
% This function returns a Vector with the Maximun of Vector_A and Vector_B,
% by doing the maximum of them.
Vector_R=max([Vector_A;Vector_B]);
end

