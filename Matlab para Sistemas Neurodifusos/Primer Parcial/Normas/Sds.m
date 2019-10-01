function [ Vector_R ] = Sds(Vector_A,Vector_B)
%Sdp, this function does the Norm S Drastic Sum of two horizontal vectors of the
%same length.
% This function returns a Vector with the Drastic Sum of Vector_A and Vector_B,
% by doing A if B=0, B if A=0 and in other case 1.
Vector_R(length(Vector_A))=0;
for i=1:length(Vector_A)
    if (Vector_B(i)==0)
     Vector_R(i)=Vector_A(i);
    elseif (Vector_A(i)==0)
     Vector_R(i)=Vector_B(i);
    else
     Vector_R(i)=1;
    end
end
end