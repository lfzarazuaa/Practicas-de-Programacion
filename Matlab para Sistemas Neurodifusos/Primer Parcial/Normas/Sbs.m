function [ Vector_R ] = Sbs(Vector_A,Vector_B)
%Sbs, this function does the Norm S United Sum of two horizontal vectors of the
%same length.
% This function returns a Vector with the United Sum of Vector_A and Vector_B,
% by doing the min of 1 and the sum of Vectors.
Vector_R=min([ones(1,length(Vector_A));Vector_A+Vector_B]);
end

