clc, clear all, close all
sys=tf(1);
sys1=tf(0.1,[1,1.5,0.5,0]);
sys1r=feedback(sys1,sys);
t=0:0.01:80;
F1t=step(sys1r,t);
F2t=step(feedback(sys1*0.838376332081696,sys),t);
%%comp=tf(0.909827237950359*[1,0.045],[1,9e-05]);
%%comp=tf(0.909996012909105*[1,0.045],[1,1.8e-04]);
%%comp=tf(1.050705110552600*[1,0.024586686292897],[1,6.936995152305884e-05]);
comp=tf(1.970874330037866*[1,0.031724880873509],[1,2.501030133484315e-04]);

%%comp=tf(2.655492555961935*0.838376332081696*[1,5.22],[1,35.830494384798340]);
%%comp=tf(3.2*[1,5.22],[1,35.830494384798340]);
sys1compr=feedback(sys1*comp,sys);
F3t=step(sys1compr,t);
subplot(3,1,1),plot(t,F1t);
subplot(3,1,2),plot(t,F2t);
subplot(3,1,3),plot(t,F3t);
Entrada=t;
figure()
R1t=lsimplot(sys1r,Entrada,t);
figure()
R2t=lsimplot(sys1compr,Entrada,t);
% R2t=lsimplot(feedback(sys1*0.838376332081696,sys),Entrada,t);
% R3t=lsimplot(sys1compr,Entrada,t);
% subplot(3,1,1),plot(t,R1t);
% subplot(3,1,2),plot(t,R2t);
% subplot(3,1,3),plot(t,R3t);
