clc, clear all
a=input('Ingrese el a�o: '); 
if (mod(a,4)==0 && mod(a,100)~=0) || mod(a,400)==0
    fprintf(' El a�o es bisiesto\n');
else
    fprintf(' El a�o no es bisiesto\n');
end