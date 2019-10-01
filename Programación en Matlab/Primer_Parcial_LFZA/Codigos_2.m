clc, clear all
n=80;
a=n/4+1;
b=n;
c=1;
m=0;
while(c==1)
for(i=a:b)
    m=m+1;
    if i<(n/2)
      v=10*i/n;
    else
      v=10-10*i/n;
    end
    r(m,:)=DAC2(v);
end
if (i==n)
   a=1;
   b=n/4-1;
else
   c=0; 
end
end

for i=1:n-1
    byte1(i)=bin2dec(r(i,1));
    fprintf('%d, ',byte1(i));
    plot(i,byte1(i),'*');
end
fprintf('\n');
for i=1:n-1
    byte2(i)=bin2dec(r(i,2));
    fprintf('%d, ',byte2(i));
end
fprintf('\n');

for(i=1:n)
    v=2.5+2.5*sind(i*360/n);
    s(i,:)=DAC2(v);
end

for i=1:n-1
    byte1A(i)=bin2dec(s(i,1));
    fprintf('%d, ',byte1A(i));
    plot(i,byte1A(i),'*');
end
fprintf('\n');
for i=1:n-1
    byte2A(i)=bin2dec(s(i,2));
    fprintf('%d, ',byte2A(i));
end