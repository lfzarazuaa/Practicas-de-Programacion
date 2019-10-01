clc, clear all, close all
syms M m l B1 B2 g s u
% C1=[s,0,0,0];
% C2=[0,s,-m*g/M,(M+m)*g/(M*l)];
% C3=[-1,0,-(B1/M+s),B1/(M*l)];
% C4=[0,-1,B2/(M*l),-(B2*(M+m)/(M*m*l^2)+s)];
% C5=[0,0,-u/M,u/(M*l)];
C1=[s;0;0;0];%[s,0,0,0]
C2=[0;s;-m*g/M;-(M+m)*g/(M*l)];%[0,s,-m*g/M,-(M + m)*g/(M*l)]
C3=[-1;0;-(B1/M+s);-B1/(M*l)];%[-1,0,-B1/M-s, -B1/(M*l)]
C4=[0;-1;-B2/(M*l);-(B2*(M+m)/(M*m*l^2)+s)];%[0,-1, -B2/(M*l), -(B2* (M + m))/(M*m*l^2 )-s]
C5=[0;0;-u/M;-u/(M*l)];%[0,0,-u/M,-u/(M*l)]
% Res=simplify([C1,C2,C3,C4,],'full')
xres=[C1,C2,C3,C4]\C5
x1=det([C5,C2,C3,C4])/det([C1,C2,C3,C4]);
x2=det([C1,C5,C3,C4])/det([C1,C2,C3,C4]);
x3=det([C1,C2,C5,C4])/det([C1,C2,C3,C4]);
x4=det([C1,C2,C3,C5])/det([C1,C2,C3,C4]);
x1=simplify(x1,'full');
x2=simplify(x2,'full');
x3=simplify(x3,'full');
x4=simplify(x4,'full');
disp(x1)
disp(x2)
disp(x3)
disp(x4)
% M=0.2;m=0.1;l=0.3;B1=0.01;B2=0.01;g=-9.81;
M=0.2;m=0.1;l=0.3;B1=0;B2=0;g=-9.81;
x1e=simplify(eval(x1/u),'full');
x2e=simplify(eval(x2/u),'full');
x3e=simplify(eval(x3/u),'full');
x4e=simplify(eval(x4/u),'full');
disp(simplify(x1e,'full'))
disp(x2e)
disp(x3e)
disp(x4e)
% R1=roots(10*[9/2500, 309/50000, 8839/50000, 3393047988057951/576460752303423488])
% R2=roots([9/5000, 309/100000,8839/100000,3393047988057951/1152921504606846976])
% R3=roots([1/5,1/50,0])
% R4=roots([9/1000, 1/50, 2943/5000])
% R5=roots([9/1000,1/100,-2943/10000])