clc
clear all
close all
t0=0;
dt=0.1;
tfinal=25;
t=t0:dt:tfinal;
for b=15:-dt:-15
    sys=tf([1],[1,b,1]);
    y=impulse(sys,t);
    figure(1)
    plot(t,y);
    pause(dt/100);
    figure(2)
    bode(sys)
    pause(dt/100);
end