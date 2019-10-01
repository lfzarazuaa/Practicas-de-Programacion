clc, clear all, close all
syms Kd Ti Td s H
Control_P=Kd*(1);
Control_PI=expand(Kd*(1+1/(Ti*s)));
Control_PD=expand(simplify(Kd*(1+Td*s),'full'));
Control_PID=expand(simplify(Kd*(1+1/(Ti*s)+(Td*s)),'full'));
Retro_P=simplify((H*Control_P)/(1+H*Control_P),'full');
Retro_PI=simplify((H*Control_PI)/(1+H*Control_PI),'full');
Retro_PD=simplify((H*Control_PD)/(1+H*Control_PD),'full');
Retro_PID=simplify((H*Control_PID)/(1+H*Control_PID),'full');
disp(Control_P)
disp(Retro_P)
disp(Control_PI)
disp(Retro_PI)
disp(Control_PD)
disp(Retro_PD)
disp(Control_PID)
disp(Retro_PID)