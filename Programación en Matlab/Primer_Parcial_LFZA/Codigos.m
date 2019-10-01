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
    r=DAC(v);
    figure(1);
    plot(m,r,'*');
    hold on
    fprintf('\n%d  %d   %X',m,r,r);
end
if (i==n)
   a=1;
   b=n/4-1;
else
   c=0; 
end
end
fprintf('\n');
for(i=1:n)
    v=2.5+2.5*sind(i*360/n);
    r=DAC(v);
    figure(1)
    plot(i,r,'*')
    hold on
    fprintf('\n%d  %d   %X',i,r,r)
end