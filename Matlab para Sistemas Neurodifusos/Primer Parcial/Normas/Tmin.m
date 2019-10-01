function [ Vector_R ] = Tmin(Vector_A,Vector_B)
%Tmin, this function does the Norm T Minimun of two horizontal vectors of the
%same length.
% This function returns a Vector with the Minimun of Vector_A and Vector_B,
% by doing the minimus of them.
Vector_R=min([Vector_A;Vector_B]);
end
