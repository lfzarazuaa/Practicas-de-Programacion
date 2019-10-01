clc
clear all
close all
t0=-4;
dt=0.01;
tf=15;
t=t0:dt:tf;
xt=t.*sin(2*t).^2/1000;%%Funcion x(t)
% yt=xt.^2.*(7/9)+10;%%Funcion y(x(t))
%%yt=t.*sin(t/10).*xt;%%Funcion y(x(t))
yt=derivada(xt+derivada(xt,dt),dt);%%Funcion y(x(t))
%%d=3;
df=3;

for d=0:0.01:df
 td=t-d;
 xtd=td.*sin(2*td).^2/1000;%%Función x(t-t0)
%  ytd=xtd.^2.*(7/9)+10;%%Funcion y(x(t-t0))
%  ytd=td.*sin(td/10).*xtd;%%Funcion y(x(t-t0))
 ytd=derivada(xt+derivada(xtd,dt),dt);%%Funcion y(x(t-t0))
 subplot(2,1,1)
 hold on
 plot(t,xt,'b')
 plot(t,xtd,'r')
 subplot(2,1,2)
 hold on
 plot(t,yt,'b')
 plot(t,ytd,'r')
 pause(0.01)
 if d<(df) 
  cla()
  subplot(2,1,1)
  cla()
 end
end