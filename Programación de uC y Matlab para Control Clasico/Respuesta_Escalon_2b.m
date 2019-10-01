clc, clear all, close all
sys=tf(1);
sys1=tf(1,[1,1,0]);
sys1r=feedback(sys1,sys);
t=0:0.01:50;
F1t=step(sys1r,t);
F2t=step(feedback(sys1*0.838376332081696,sys),t);
%%comp=tf(0.936914931592562*[1,0.125],[1,0.00125]);
%%comp=tf(1.694*[1,0.069011],[1,1.16886e-3]);
%%comp=tf(0.164297782643108*[1,0.083907348991014],[1,0.013785791386685]);
%%comp=tf(1.033620123828090*[1,0.070016435937298],[1,0.001196896689098]);
comp=tf(0.854725517712847*[1,0.070016435937298],[1,0.001196896689098]);
sys1compr=feedback(sys1*comp,sys);
F3t=step(sys1compr,t);
subplot(3,1,1),plot(t,F1t);
subplot(3,1,2),plot(t,F2t);
subplot(3,1,3),plot(t,F3t);
Entrada=t;
figure('name',' Gráfica sin compensador')
R1t=lsimplot(sys1r,Entrada,t);
figure()
R2t=lsimplot(sys1compr,Entrada,t);
% R2t=lsimplot(feedback(sys1*0.838376332081696,sys),Entrada,t);
% R3t=lsimplot(sys1compr,Entrada,t);
% subplot(3,1,1),plot(t,R1t);
% subplot(3,1,2),plot(t,R2t);
% subplot(3,1,3),plot(t,R3t);
