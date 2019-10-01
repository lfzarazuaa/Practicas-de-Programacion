x1=3;
y1=0;
x2=0;
y2=0;
x3=3;
y3=3;
for i=0:120
    x1=x1+i;
    y1=y1-i;
    x2=x2-i*(1+2*cos(45));
    y2=y2-i;
    x3=x3+i;
    y3=y3+i*(1+2*cos(45));
 Triangle(x1,y1,x2,y2,x3,y3)
end