function [ C] = DAC2(voltaje)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
v=voltaje;
bit='00';
  if(v<=5)
   for i=1:12
       if(i==7)
          bit=strcat(bit,' 00');
       end
       if(v>=(5/2^i))
         v=v-5/2^i;
         bit=strcat(bit,'1');
       else
         bit=strcat(bit,'0');
       end
   end
   C=strsplit(bit);
  else
    fprintf('Error');
  end
end

