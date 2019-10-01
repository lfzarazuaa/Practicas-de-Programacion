clc
clear all
close all
x1n=[1 2 3 4];
x2n=[5 6 7 8];
% x1n=[0 0 1 1 1 1 1];
% x2n=[1 -2 3];
x1=x1n;
x2=x2n;
t1=0:1:length(x1)-1;
t2=0:1:length(x2)-1;
tf=length(x1n)+length(x2n)-1;
x1na=zeros(1,length(x2n)-1);
x1nb=x1n;
x1nc=zeros(1,length(x2n));
x1n=[x1na,x1nb,x1nc];
x2n=fliplr(x2n);
x2n(length(x1n))=0;
for j=1:tf
    x2nr=circshift(x2n,[0 j-1]);
    t(j)=j-1;
    S(j,:)=x2nr;
    R(j,:)=x1n.*x2nr;
    C(j)=sum(x1n.*x2nr);
end
C
C2=conv(x1,x2)
% subplot(1,3,1)
% stem(t1,x1), title('Señal x1')
% subplot(1,3,2)
% stem(t2,x2),  title('Señal x2')
% subplot(1,3,3)
% Texto=strcat('Resultado de Convolución:','  x(n)=[',num2str(x2),'],  h(n)=[',num2str(x1),'],  C(n)=[',num2str(C),']');
stem(t,C,'r','linewidth',3),title('Resultado de Convolución','fontsize',18)
% title(Texto,'fontsize',18)