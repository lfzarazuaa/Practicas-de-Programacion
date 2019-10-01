function [ Vector_R ] = Sas(Vector_A,Vector_B)
%Sas, this function does the Norm S Algebraic Sum of two horizontal vectors of the
%same length.
% This function returns a Vector with the Algebraic Sum of Vector_A and Vector_B,
% by doing the sum of them minus his multiplication of them.
Vector_R=Vector_A+Vector_B-Vector_A.*Vector_B;
end

