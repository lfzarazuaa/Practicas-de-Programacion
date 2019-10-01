f1='3*x.^4+2*x-1';
f2='3.*x.^4+2.*x-1';
syms x;
x = -3:0.02:7;
y1 = eval(f1);
y2 = eval(f2);
plot(x,y1,'r');
hold on
plot(x,y2,'b');