function [ Vector_R ] = Tbp(Vector_A,Vector_B)
%Tbp, this function does the Norm T United Product of two horizontal vectors of the
%same length.
% This function returns a Vector with the United Product of Vector_A and Vector_B,
% by doing the max of 0 and the sum of Vectors minus 1.
Vector_R=max([zeros(1,length(Vector_A));Vector_A+Vector_B-1]);
% Zeros(length(Vector_A))=0;
% Vector_R=max([Zeros;Vector_A+Vector_B-1]);
% for i=1:length(Vector_A)
%     R=Vector_A(i)+Vector_B(i)-1;
%     if R>0
%      Vector_R(i)=R;  
%     else
%      Vector_R(i)=0;  
%    end
% end
% Vector_R=max([Vector_A*0;Vector_A+Vector_B-1]);
% Vector_R=max([Vector_A-Vector_A;Vector_A+Vector_B-1]);
end

