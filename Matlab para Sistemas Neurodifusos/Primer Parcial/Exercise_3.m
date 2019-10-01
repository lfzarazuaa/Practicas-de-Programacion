clc,clear all, close all
R1=[0.5 0.1 0.7;...
    0.3 0.5 0.8];
R2=[1.0 0.6 0.1;...
    0.4 0.3 0.8;...
    0.8 0.8 0.2];
R1A=R1(1,:);
R2A=R1(2,:);
C1B=R2(:,1)';
C2B=R2(:,2)';
C3B=R2(:,3)';
X1oZ1=max(min([R1A;C1B]));
X1oZ2=max(min([R1A;C2B]));
X1oZ3=max(min([R1A;C3B]));

X2oZ1=max(min([R2A;C1B]));
X2oZ2=max(min([R2A;C2B]));
X2oZ3=max(min([R2A;C3B]));

XX1oZ1=max(R1A.*C1B);
XX1oZ2=max(R1A.*C2B);
XX1oZ3=max(R1A.*C3B);

XX2oZ1=max(R2A.*C1B);
XX2oZ2=max(R2A.*C2B);
XX2oZ3=max(R2A.*C3B);

s1=R1A.*C1B
s2=R1A.*C2B
s3=R1A.*C3B

s4=R2A.*C1B
s5=R2A.*C2B
s6=R2A.*C3B
