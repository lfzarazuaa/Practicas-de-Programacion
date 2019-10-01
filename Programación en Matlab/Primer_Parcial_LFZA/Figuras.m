clc, clear
clear all;
figure(1);
h = ezplot('((x^2+y^2-1)^3)-(x^2*y^3)',[-2,2]);
set(h,'Color', 'red');
syms x y;

figure(2);

hold on;
axis equal
h = ezplot('((x/7)^2*sqrt(abs(abs(x)-3)/(abs(x)-3)) + (y/3)^2*sqrt(abs(y+3*sqrt(33)/7)/(y+3*sqrt(33)/7))-1)', [-8 8 -3*sqrt(33)/7 6-4*sqrt(33)/7]);
set(h,'Color', 'blue');
h = ezplot('(abs(x/2)-((3*sqrt(33)-7)/112)*x^2 -3 + sqrt(1-(abs(abs(x)-2)-1)^2) -y)', [-4 4]);
set(h,'Color', 'green');
h = ezplot('(9*sqrt(abs((abs(x)-1)*(abs(x)-0.75))/((1-abs(x))*(abs(x)-0.75))) -8*abs(x) -y)', [-1 -0.75 -5 5]);
set(h,'Color', 'red');
h = ezplot('(9*sqrt(abs((abs(x)-1)*(abs(x)-0.75))/((1-abs(x))*(abs(x)-0.75))) -8*abs(x) -y)', [0.75 1 -5 5]);
set(h,'Color', 'gray');
h = ezplot('(3*abs(x) + 0.75*sqrt(abs((abs(x)-0.75)*(abs(x)-0.5))/((0.75-abs(x))*(abs(x)-0.5))) -y)', [-0.75 0.75 2.25 5]);
set(h,'Color', 'orange');
h = ezplot('(2.25*sqrt(abs((x-0.5)*(x+0.5))/((0.5-x)*(0.5+x))) -y)', [-0.5 0.5 -5 5]);
set(h,'Color', 'purple');
h = ezplot('(6*sqrt(10)/7 + (1.5-0.5*abs(x))*sqrt(abs(abs(x)-1)/(abs(x)-1)) -6*sqrt(10)/14*sqrt(4-(abs(x)-1)^2) -y)', [-3 -1 -5 5]);
set(h,'Color', 'yellow');
h = ezplot('(6*sqrt(10)/7 + (1.5-0.5*abs(x))*sqrt(abs(abs(x)-1)/(abs(x)-1)) -6*sqrt(10)/14*sqrt(4-(abs(x)-1)^2) -y)', [1 3 -5 5]);
set(h,'Color', 'black');
%%h = ezplot('(x/8)^2 + (y/3.5)^2 -1', [-10 10 -6 6]);
%%set(h,'Color', 'black');
hold off;

figure(3);

beta= [-2*pi:0.01:2*pi];
a=2;
n=exp(1);
hold on
axis equal
for i=1:15
    r= a*sin(n*beta+(pi*i/180));
    q=-r;
    polar(beta,r);
    polar(beta,q);
end
hold off
