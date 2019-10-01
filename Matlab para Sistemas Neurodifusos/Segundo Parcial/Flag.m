clc, clear all%, close all
opcion=1;
while(opcion==1)
%disp('Introduce x value:');
x1_eval=input('Introduce humidity:');
%disp('Introduce y value:');
x2_eval=input('Introduce temperature:');
m1=3;
n1=1;
%%Humidity Trapezoid
HVL=[20 25 40 45];
HL=[40 45 55 65];
HM=[55 70 75 80];
HH=[70 75 80 85];
HVH=[80 82 90 90];
%%Temperature Trapezoid
TL=[0 0 10 35];
TM=[15 40 60 85];
TH=[65 90 100 100];
%%Speed   Triangle
SL=[0 20 25];
SM=[22 35 50];
SH=[45 68 90];
SVH=[88 94 100];
%%Vectores en x
x1=20:1:90;%%Humidity percent.
x2=0:1:150;%%Temperature in C°.
x3=0:0.5:100;%%Motor Speed.
%%%Membership's functions of Humidity
F_HVL=Trapezoidal_1(x1,HVL);
F_HL=Trapezoidal_1(x1,HL);
F_HM=Trapezoidal_1(x1,HM);
F_HH=Trapezoidal_1(x1,HH);
F_HVH=Trapezoidal_1(x1,HVH);
%%%Member's functions of Temperature
F_TL=Trapezoidal_1(x2,TL);
F_TM=Trapezoidal_1(x2,TM);
F_TH=Trapezoidal_1(x2,TH);
%%%Member's functions of Speed
F_SL=Triangular_1(x3,SL);
F_SM=Triangular_1(x3,SM);
F_SH=Triangular_1(x3,SH);
F_SVH=Triangular_1(x3,SVH);
figure(1)
 subplot(m1,n1,1),hold on,plot(x1,F_EN),plot(x1,F_N),plot(x1,F_W),plot(x1,F_S),plot(x1,F_SE),title('Flag Position');
 legend('Very Slow','Slow','Medium','High','Very High');
 subplot(m1,n1,2),hold on,plot(x1,F_EN),plot(x2,F_N),plot(x2,F_W),plot(x2,F_S),plot(x2,F_SE),title('Current Position');
 legend('Low','Medium','High');
 subplot(m1,n1,3),hold on,plot(x3,F_Slow),plot(x3,F_Medium),plot(x3,F_High),title('Speed');
 legend('Low','Medium','High','Very High');
% %%Flag position
% [x1_eval,x1_eval_ind]=find_linear(x1,x1_eval);
% y1_EN=F_EN(x1_eval_ind);
% y1_N=F_N(x1_eval_ind);
% y1_W=F_W(x1_eval_ind);
% y1_S=F_S(x1_eval_ind);
% y1_SE=F_SE(x1_eval_ind);
% %%%Current position
% [x2_eval,x2_eval_ind]=find_linear(x2,x2_eval);
% x1_eval
% x2_eval
% y2_EN=F_EN(x2_eval_ind);
% y2_N=F_N(x2_eval_ind);
% y2_W=F_W(x2_eval_ind);
% y2_S=F_S(x2_eval_ind);
% y2_SE=F_SE(x2_eval_ind);
% %%Creacion de minimos
% y1(5)=y1_SE;
% y1(4)=y1_S;
% y1(3)=y1_W;
% y1(2)=y1_N;
% y1(1)=y1_EN;
% y2(5)=y2_SE;
% y2(4)=y2_S;
% y2(3)=y2_W;
% y2(2)=y2_N;
% y2(1)=y2_EN;
% Y_min(5,5)=0;
% for j=1:5
%  for i=1:5
%     Y_min(i,j)=min([y1(i),y2(j)]);
%  end
% end
% %%%Resultados de min
% Y_Slow(9)=0;
% Y_Medium(6)=0;
% Y_High(10)=0;
% %%%%% Puntos resultantes en Slow
% Y_Slow(1)=Y_min(1,1);
% Y_Slow(2)=Y_min(2,1);
% Y_Slow(3)=Y_min(1,2);
% Y_Slow(4)=Y_min(2,2);
% Y_Slow(5)=Y_min(3,3);
% Y_Slow(6)=Y_min(4,4);
% Y_Slow(7)=Y_min(5,4);
% Y_Slow(8)=Y_min(4,5);
% Y_Slow(9)=Y_min(5,5);
% %%%%% Puntos resultantes en Medium
% Y_Medium(1)=Y_min(5,1);
% Y_Medium(2)=Y_min(3,2);
% Y_Medium(3)=Y_min(2,3);
% Y_Medium(4)=Y_min(4,3);
% Y_Medium(5)=Y_min(3,4);
% Y_Medium(6)=Y_min(1,5);
% %%%%% Puntos resultantes en High
% Y_High(1)=Y_min(2,1);
% Y_High(2)=Y_min(3,1);
% Y_High(3)=Y_min(4,2);
% Y_High(4)=Y_min(5,2);
% Y_High(5)=Y_min(1,3);
% Y_High(6)=Y_min(5,3);
% Y_High(7)=Y_min(1,4);
% Y_High(8)=Y_min(5,4);
% Y_High(9)=Y_min(2,5);
% Y_High(10)=Y_min(3,5);
% 
% Y_Slow_max=max(Y_Slow);
% Y_Medium_max=max(Y_Medium);
% Y_High_max=max(Y_High);
% 
% Cutline_Slow=min([F_Slow; Y_Slow_max*ones(1,length(F_Slow))]);
% Cutline_Medium=min([F_Medium; Y_Medium_max*ones(1,length(F_Medium))]);
% Cutline_High=min([F_High; Y_High_max*ones(1,length(F_High))]);
% Cutline_R_Speed=max([Cutline_Slow;Cutline_Medium;Cutline_High]);
% out_Speed=defuzz(x3,Cutline_R_Speed,'centroid')
% figure(2)
% subplot(m1,n1,1),
% hold on
% plot(x3,Cutline_Slow,'r');
% plot(x3,Cutline_Medium,'b');
% plot(x3,Cutline_High,'g');
% plot(x3,Cutline_R_Speed,'k');
% plot(out_Speed,0.4,'or');
% legend('Cutline Slow','Cutline Medium','Cutline High','Cutline Speed Result','out Speed'),title('Speed Result');
% %%%%Motion
% %%%Resultados de min
% Y_DM(5)=0;
% Y_CW(10)=0;
% Y_ACW(10)=0;
% %%%%% Puntos resultantes en Don´t Move
% Y_DM(1)=Y_min(1,1);
% Y_DM(2)=Y_min(2,2);
% Y_DM(3)=Y_min(3,3);
% Y_DM(4)=Y_min(4,5);
% Y_DM(5)=Y_min(5,5);
% %%%%% Puntos resultantes en Clock Wise
% Y_CW(1)=Y_min(4,1);
% Y_CW(2)=Y_min(5,1);
% Y_CW(3)=Y_min(1,2);
% Y_CW(4)=Y_min(5,2);
% Y_CW(5)=Y_min(1,3);
% Y_CW(6)=Y_min(2,3);
% Y_CW(7)=Y_min(2,4);
% Y_CW(8)=Y_min(3,4);
% Y_CW(9)=Y_min(3,5);
% Y_CW(10)=Y_min(4,5);
% %%%%% Puntos resultantes en Anti-Clock Wise
% Y_ACW(1)=Y_min(2,1);
% Y_ACW(2)=Y_min(3,1);
% Y_ACW(3)=Y_min(3,2);
% Y_ACW(4)=Y_min(4,2);
% Y_ACW(5)=Y_min(4,3);
% Y_ACW(6)=Y_min(5,3);
% Y_ACW(7)=Y_min(1,4);
% Y_ACW(8)=Y_min(5,4);
% Y_ACW(9)=Y_min(1,5);
% Y_ACW(10)=Y_min(2,5);
% 
% Y_CW_max=max(Y_CW);
% Y_DM_max=max(Y_DM);
% Y_ACW_max=max(Y_ACW);
% 
% Cutline_CW=min([F_CW; Y_CW_max*ones(1,length(F_CW))]);
% Cutline_DM=min([F_DM; Y_DM_max*ones(1,length(F_DM))]);
% Cutline_ACW=min([F_ACW; Y_ACW_max*ones(1,length(F_ACW))]);
% Cutline_R_Direction=max([Cutline_CW;Cutline_DM;Cutline_ACW]);
% out_Direction=defuzz(x4,Cutline_R_Direction,'centroid')
% %%figure()
% subplot(m1,n1,2),
% hold on
% plot(x4,Cutline_CW,'r');
% plot(x4,Cutline_DM,'b');
% plot(x4,Cutline_ACW,'g');
% plot(x4,Cutline_R_Direction,'k');
% plot(out_Direction,0.4,'or');
% legend('Cutline Clockwise','Cutline Clockwise','Cutline Anticlockwise','Cutline Direction Result','out Direction Result'),title('Direction Result');
opcion=input('Repeat it (1/0)');
clc
end
%close all