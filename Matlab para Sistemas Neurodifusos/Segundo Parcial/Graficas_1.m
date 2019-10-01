clc, clear all, close all
%disp('Introduce x value:');
x_eval=input('Introduce x value:')
%disp('Introduce y value:');
y_eval=input('Introduce y value:')
x=1:0.1:10;
y=1:0.1:10;
z=1:0.1:10;
A1=1./(1+exp(3*(x-5)));
A2=1./(1+exp(-3*(x-5)));
B1=exp(-(1/2)*((y-2.5)/2).^2);
B2=exp(-(1/2)*((y-7.5)/2).^2);
C1=1./(1+exp(2*(z-5)));
C2=exp(-(1/2)*((z-7.5)/2).^2);
m1=3;
n1=1;
subplot(m1,n1,1),hold on,plot(x,A1),plot(x,A2),ylim([0 1]),title('A1 & A2');
subplot(m1,n1,2),hold on,plot(y,B1),plot(y,B2),title('B1 & B2');
subplot(m1,n1,3),hold on,plot(z,C1),plot(z,C2),title('C1 & C2');
m2=4;
n2=3;
[x_point,x_ind] = find_linear(x,x_eval);
% x_ind=round(length(x)*x_eval/(max(x)-min(x)))+1;
% x_point=x(x_ind)
A1_x=A1(x_ind);
A2_x=A2(x_ind);
[y_point,y_ind] = find_linear(y,y_eval);
% y_ind=round(length(y)*y_eval/(max(y)-min(y)));
% y_point=y(y_ind)
B1_y=B1(y_ind);
B2_y=B2(y_ind);
[C1_a_y,C1_ind_a]=find_nonlinear(C1,min([A1_x B1_y]));
[C1_b_y,C1_ind_b]=find_nonlinear(C1,min([A1_x B2_y]));
[C2_a_y,C2_ind_a]=find_nonlinear(C2,min([A2_x B1_y]));
[C2_b_y,C2_ind_b]=find_nonlinear(C2,min([A2_x B2_y]));
% C1_ind_a=find(C1>=min([A1_x B1_y]),1,'last');
% C2_ind_a=find(C2>=min([A1_x B2_y]),1,'last');
% C1_ind_b=find(C1>=max([A2_x B1_y]),1,'last');
% C2_ind_b=find(C2>=max([A2_x B2_y]),1,'last');
% C1_a=x(C1_ind_a);
% C2_a=x(C2_ind_b);
% C1_b=x(C1_ind_a);
% C2_b=x(C2_ind_b);
C1_a_x=x(C1_ind_a);
C1_b_x=x(C1_ind_b);
C2_a_x=x(C2_ind_a);
C2_b_x=x(C2_ind_b);
figure()
subplot(m2,n2,1),hold on,plot(x,A1,'r'),plot(x_point,A1_x,'r*'),ylim([0 1]),title('A1');
subplot(m2,n2,2),hold on,plot(y,B1,'k'),plot(y_point,B1_y,'r*'),title('B1');
subplot(m2,n2,3),hold on,plot(z,C1,'g'),plot(C1_a_x,C1_a_y,'r*'),title('C1');
subplot(m2,n2,4),hold on,plot(x,A1,'r'),plot(x_point,A1_x,'r*'),ylim([0 1]),title('A1');
subplot(m2,n2,5),hold on,plot(y,B2,'k'),plot(y_point,B2_y,'r*'),title('B2');
subplot(m2,n2,6),hold on,plot(z,C1,'g'),plot(C1_b_x,C1_b_y,'r*'),title('C1');
subplot(m2,n2,7),hold on,plot(x,A2,'r'),plot(x_point,A2_x,'r*'),ylim([0 1]),title('A2');
subplot(m2,n2,8),hold on,plot(y,B1,'k'),plot(y_point,B1_y,'r*'),title('B1');
subplot(m2,n2,9),hold on,plot(z,C2,'g'),plot(C2_a_x,C2_a_y,'r*'),title('C2');
subplot(m2,n2,10),hold on,plot(x,A2,'r'),plot(x_point,A2_x,'r*'),ylim([0 1]),title('A2');
subplot(m2,n2,11),hold on,plot(y,B2,'k'),plot(y_point,B2_y,'r*'),title('B2');
subplot(m2,n2,12),hold on,plot(z,C2,'g'),plot(C2_b_x,C2_b_y,'r*'),title('C2');
C1_max=max([C1_a_y,C1_b_y])
C2_max=max([C2_a_y,C2_b_y])

Cutline_1=min([C1; C1_max*ones(1,length(C1))]);
Cutline_2=min([C2; C2_max*ones(1,length(C2))]);
Cutline_R=max([Cutline_1;Cutline_2]);
out = defuzz(z,Cutline_R,'centroid')
figure()
hold on
plot(z,C1,'r');
plot(z,C2,'b');
plot(z,Cutline_1,':r');
plot(z,Cutline_2,':b');
plot(z,Cutline_R,'g');

plot(out,0.4,'or');
legend('C1','C2','Cutline C1','Cutline C2','Cutline','Z'),title('B2')
% [Cutline_1_y,Cutline_1_ind]=find_nonlinear(C1,Cutline_1);
% [Cutline_2_y,Cutline_2_ind]=find_nonlinear(C2,Cutline_2);
% for i=1:length(z)
%     if i<=Cutline_1_ind
%        FCutilne(i)=Cutline_1_y;
%     elseif i>Cutline_1_ind && i<Cutline_2_ind
%        FCutline(i)=;
%     else
%        FCultine(i)=Cutline_2_y;
%     end
% end
% % [Cutline_1_y,Cutline_1_ind]=find_nonlinear(C1,Cutline_1);
% Cutline_1_x=z(1:Cutline_1_ind);
% plot(Cutline_1_x,Cutline_1_y*Cutline_1_x./Cutline_1_x);
% [Cutline_2_y,Cutline_2_ind]=find_nonlinear(C2,Cutline_2);
% Cutline_2_x=z(Cutline_2_ind:length(z));
% hold on,plot(z,C1),plot(z,C2);
% plot(Cutline_2_x,Cutline_2_y*Cutline_2_x./Cutline_2_x);