clc, clear all
a=input('Ingrese el año: '); 
if (mod(a,4)==0 && mod(a,100)~=0) || mod(a,400)==0
    fprintf(' El año es bisiesto\n');
else
    fprintf(' El año no es bisiesto\n');
end