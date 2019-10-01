clc,clear all, close all
% syms k
% Pol=[4,12,64,128,-k];
% R=roots(Pol);
for i=1:1:50000
k=(i-1)*0.1;
Pol=[4,12,64,128,-k];
raiz(i,:)=roots(Pol);
end
[fila columna]=size(raiz);
i=0;
 for k=1:fila
    for j=1:columna
       i=i+1;
       raiz2(i)=raiz(k,j);
       hold on
       plot(real(raiz(i)),imag(raiz(i)),'x')
    end
 end
 