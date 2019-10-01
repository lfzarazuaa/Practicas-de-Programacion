clc, clear all
x=[ 4 6 -5 1; -3 3 -2 4; 6 -2 8 7]
for(i=1:3)
v1(i)=x(i,1);
v1(i+3)=x(i,3);
v1(i+6)=x(i,4);
end
v1=v1'
for(i=1:4)
v2(i)=x(2,i);
v2(i+4)=x(3,i);
end
v2
for(i=1:5)
if i<3
v3(i)=x(i+1,4);
else
v3(i)=x(1,i-2);
end
end
v3