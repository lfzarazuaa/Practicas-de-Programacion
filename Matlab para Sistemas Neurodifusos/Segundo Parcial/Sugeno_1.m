clc,clear all, close all
NB= [-0.5 -10];
NS= [2.5 1 -7.5];
C=  [5 1 0];
PS= [2.5 1 7.5];
PB= [0.5 10];
x1=-20:0.01:20;
F_NB=Sigmoidal_1(x1,NB);
F_NS= Bell_1(x1,NS);
F_C= Bell_1(x1,C);
F_PS= Bell_1(x1,PS);
F_PB=Sigmoidal_1(x1,PB);
u=x1*0;
f1=-12+u;
f2=2*x1+8;
f3=0.4*x1;
f4=2*x1-8;
f5=12+u;
% x1_eval=5;
% [x1_eval,x1_eval_ind]=find_linear(x1,x1_eval);
z(length(x1))=0;
fx=z;
for j=1:length(x1)
x1_eval_ind=j;
y1_NB=F_NB(x1_eval_ind);
y1_NS=F_NS(x1_eval_ind);
y1_C=F_C(x1_eval_ind);
y1_PS=F_PS(x1_eval_ind);
y1_PB=F_PB(x1_eval_ind);
y_f1=f1(x1_eval_ind);
y_f2=f2(x1_eval_ind);
y_f3=f3(x1_eval_ind);
y_f4=f4(x1_eval_ind);
y_f5=f5(x1_eval_ind);
w=[y1_NB y1_NS y1_C y1_PS y1_PB];
f=[y_f1 y_f2 y_f3 y_f4 y_f5];
sum1=0;
sum2=0;
for i=1:length(w)
    sum1=sum1+w(i)*f(i);
    sum2=sum2+w(i);
end
z(j)=sum1/sum2;
  if x1(j)<-10
     fx(j)=f1(x1_eval_ind);
  elseif -10<=x1(j) && x1(j)<-5
     fx(j)=f2(x1_eval_ind);
  elseif -5<=x1(j) && x1(j)<5
     fx(j)=f3(x1_eval_ind);
  elseif 5<=x1(j) && x1(j)<10
     fx(j)=f4(x1_eval_ind);
  else
     fx(j)=f5(x1_eval_ind);
  end
end
m1=3;
n1=1;
subplot(m1,n1,1), hold on
plot(x1,F_NB),plot(x1,F_NS),plot(x1,F_C),plot(x1,F_PS),plot(x1,F_PB)
title("Inputs"),legend('NS','C','PS','PB');
subplot(m1,n1,2), hold on
plot(x1,f1),plot(x1,f2),plot(x1,f3),plot(x1,f4),plot(x1,f5)
title("Output"),legend('f1','f2','f2','f3','f4');
subplot(m1,n1,3), hold on
plot(x1,z,'LineWidth',3),plot(x1,fx)
title("Surface"),legend('Result','functions');