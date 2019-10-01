function [ byte] = DAC( voltaje)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
v=voltaje;
bit=' ';
  if(v<=5)
   for i=1:8
       if(v>=(5/2^i))
         v=v-5/2^i;
         bit=strcat(bit,'1');
       else
         bit=strcat(bit,'0');
       end
   end
   byte=bin2dec(bit);
   %byte=dec2hex(byte);
  else
    fprintf('Error');
  end
end

