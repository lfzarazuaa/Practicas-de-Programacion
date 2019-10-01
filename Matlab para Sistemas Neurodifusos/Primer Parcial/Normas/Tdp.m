function [ Vector_R ] = Tdp(Vector_A,Vector_B)
%Tdp, this function does the Norm T Drastic Product of two horizontal vectors of the
%same length.
% This function returns a Vector with the Drastic Product of Vector_A and Vector_B,
% by doing A if B=1, B if A=1 and in other case 0.
Vector_R(length(Vector_A))=0;
for i=1:length(Vector_A)
    if (Vector_B(i)==1)
     Vector_R(i)=Vector_A(i);
    elseif (Vector_A(i)==1)
     Vector_R(i)=Vector_B(i);
    else
     Vector_R(i)=0;
    end
end
end

