clc, clear all
inv=input('Ingrese el monto de la inversión: ');
inv1=inv;
i=0;
fprintf('   Mes          Monto total       Dividendos Obtenidos\n');
while  4*inv1/3>=inv || i==0
    inv_a=inv;
    inv=inv*1.005;
    div=inv-inv_a;
    i=i+1;
    if i<10
fprintf('   0%d            $ %.2f             $ %.2f \n', i,inv,div);
    else
fprintf('   %d            $ %.2f             $ %.2f \n', i,inv,div);
    end
end
