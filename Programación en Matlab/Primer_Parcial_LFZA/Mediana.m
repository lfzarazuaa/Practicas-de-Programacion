clc, clear all
A=[-2 1];
B=[4 7];
C=[6 -3];
for(i=1:2)
   a(i)=(A(i)+B(i))/2;
   b(i)=(A(i)+C(i))/2;
   c(i)=(B(i)+C(i))/2;
end
m(1)=(A(2)-c(2))/(A(1)-c(1));
m(2)=(B(2)-b(2))/(B(1)-b(1));
m(3)=(C(2)-a(2))/(C(1)-a(1));
m(4)=(A(2)-B(2))/(A(1)-B(1));
m(5)=(A(2)-C(2))/(A(1)-C(1));
m(6)=(C(2)-B(2))/(C(1)-B(1));

syms x y

E1=x*m(1)-y==m(1)*c(1)-c(2)
E2=x*m(2)-y==m(2)*b(1)-b(2)
E3=x*m(3)-y==m(3)*a(1)-a(2)
E4=x*m(4)-y==m(4)*B(1)-B(2)
E5=x*m(5)-y==m(5)*C(1)-C(2)
E6=x*m(6)-y==m(6)*B(1)-B(2)
hold on
h=ezplot(E1, [-15 15]);
set(h,'Color', 'black');
h=ezplot(E2, [-15 15]);
set(h,'Color', 'black');
h=ezplot(E3, [-15 15]);
set(h,'Color', 'black');
h=ezplot(E4, [-15 15]);
set(h,'Color', 'blue');
h=ezplot(E5, [-15 15]);
set(h,'Color', 'blue');
h=ezplot(E6, [-15 15]);
set(h,'Color', 'blue');

