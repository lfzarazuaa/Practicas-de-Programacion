clc, clear all
prestamo=input('Ingrese la cantidad del prestamo: ');
if prestamo>5000
    cuota=3;
elseif prestamo<1000
    cuota=1;
elseif prestamo>=2000 && prestamo<=3000
    cuota=2;
else
    cuota=5;
end
if prestamo<4000 
    interes=1.12;
else 
    interes=1.10;
end
fprintf('\n Valor total de la deuda %.2f Euros', prestamo*interes);
if cuota==1
fprintf('\n\n La deuda se paga en 1 cuota de %.2f Euros', prestamo*interes);
else
fprintf('\n\n La deuda se paga en %d cuotas de %.2f Euros', cuota, prestamo*interes/cuota);
end



