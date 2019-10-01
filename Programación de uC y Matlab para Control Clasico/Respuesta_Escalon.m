clc, clear all, close all
sys=tf(1);
sys1=tf(100e3,[1,78,1625,4200,0]);
sys1r=feedback(sys1,sys);
t=0:0.001:10;
F1t=step(sys1r,t);
F2t=step(feedback(sys1*0.838376332081696,sys),t);
%F2t=step(feedback(sys1*0.025,sys),t);
%comp=tf(2.921041811558129*[1,5.22],[1,35.830494384798340]);
%%comp=tf(0.763636363636364*[1,5.290271869484021],[1,19.396439171913922]);
comp=tf(0.272744487923554*[1,5.290271869484021],[1,19.396439171913922]);
%%comp=tf(2.655492555961935*0.838376332081696*[1,5.22],[1,35.830494384798340]);
%%comp=tf(3.2*[1,5.22],[1,35.830494384798340]);
sys1compr=feedback(sys1*comp,sys);
F3t=step(sys1compr,t);
subplot(3,1,1),plot(t,F1t);
subplot(3,1,2),plot(t,F2t);
subplot(3,1,3),plot(t,F3t);