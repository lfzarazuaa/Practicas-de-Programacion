clc, clear all, close all
Begin=0;
Final=10;
Step=0.1;
x=Begin:Step:Final;
mA=x./(x+2);
mB=2.^(-x);
mC=1./(1+10*(x-2).^2);
%Complements
mAc=Complement_Set(mA);
mBc=Complement_Set(mB);
mCc=Complement_Set(mC);
%Unions
mA_U_mB=Union_Set(mA,mB);
mA_U_mC=Union_Set(mA,mC);
mB_U_mC=Union_Set(mB,mC);
%Intersections
mA_O_mB=Intersection_Set(mA,mB);
mA_O_mC=Intersection_Set(mA,mC);
mB_O_mC=Intersection_Set(mB,mC);
%Morgan's Law
ImA_O_mBcIc=Complement_Set(Union_Set(mA,Complement_Set(mC)));%(A U C')'
ImBc_O_mCcIc=Complement_Set(Intersection_Set(Complement_Set(mB),Complement_Set(mC)));%(B' O C')'
ImA_U_mCI=Complement_Set(Union_Set(mA,mC));%(A U C)'
%Plot
m=3;
n=3;
%%Complements
subplot(m,n,1),hold on, plot(x,mA),plot(x,mAc,'r'),title('A Complement');
subplot(m,n,2),hold on, plot(x,mB),plot(x,mBc,'r'),title('B Complement');
subplot(m,n,3),hold on, plot(x,mC),plot(x,mCc,'r'),title('C Complement');
%Unions
subplot(m,n,4),hold on, plot(x,mA),plot(x,mA_U_mB),plot(x,mB),plot(x,mA_U_mB,'r'),title('A U B');
subplot(m,n,5),hold on, plot(x,mB),plot(x,mA_U_mC),plot(x,mC),plot(x,mA_U_mC,'r'),title('A U C');
subplot(m,n,6),hold on, plot(x,mB),plot(x,mB_U_mC),plot(x,mC),plot(x,mB_U_mC,'r'),title('B U C');
%Intersections
subplot(m,n,7),hold on, plot(x,mA),plot(x,mA_O_mB),plot(x,mB),plot(x,mA_O_mB,'r'),title('A Int B');
subplot(m,n,8),hold on, plot(x,mB),plot(x,mA_O_mC),plot(x,mC),plot(x,mA_O_mC,'r'),title('A Int C');
subplot(m,n,9),hold on, plot(x,mB),plot(x,mB_O_mC),plot(x,mC),plot(x,mB_O_mC,'r'),title('B Int C');
figure
%%Morgan's Law
subplot(m,1,1),hold on, plot(x,mA),plot(x,ImA_O_mBcIc),plot(x,mB),plot(x,ImA_O_mBcIc,'r'),title('(A U Cc)c');
subplot(m,1,2),hold on, plot(x,mB),plot(x,ImBc_O_mCcIc),plot(x,mC),plot(x,ImBc_O_mCcIc,'r'),title('(Bc O Cc)c');
subplot(m,1,3),hold on, plot(x,mB),plot(x,ImA_U_mCI),plot(x,mC),plot(x,ImA_U_mCI,'r'),title('(A U C)c');