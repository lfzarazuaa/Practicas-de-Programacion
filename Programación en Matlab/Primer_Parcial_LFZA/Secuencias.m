clc, clear all
fprintf('\tEjemplo 1: tabulador.');
fprintf('\nEjemplo 2: Salto de l�nea.');
fprintf('\nEjemplo 3: ');
pause(0.5)
fprintf('\rRetorno de Carro. ');
fprintf('\nEjemplo 4: Borrado a la izquierda. @');
pause(0.5)
fprintf('\b ');
fprintf('\n Ejemplo 5: Comilla simple ''.');
fprintf('\n Ejemplo 6: Comillas dobles \".');
fprintf('\n Ejemplo 7: Diagonal invertida \\.');
fprintf('\n Ejemplo 8: Simbolo de porcentaje %%.');
fprintf('\n Ejemplo 9: Salto de p�gina \f.');
fprintf('\n Ejemplo 10: Digitos Signitficativos %0.5g',(1+sqrt(5))/2);
fprintf('\n Ejemplo 11: N�mero flotante %f',sqrt(28)^3);
fprintf('\n Ejemplo 12: N�mero Entero %d', round(exp(1)) );
fprintf('\n Ejemplo 13: Caracter %c', 'D' );
fprintf('\n Ejemplo 14: Cadena de caracteres %s', 'Matlab' );
fprintf('\n Ejemplo 15: N�mero con notaci�n cient�fcia %e', (sqrt(7))^13 );
fprintf('\n Ejemplo 16: N�mero Entero positivo %u', 15);
fprintf('\n Ejemplo 17: N�mero en Octal %o', 64);
fprintf('\n Ejemplo 18: N�mero en Hexadecimal %X', 26);
fprintf('\n Ejemplo 19: N�mero en Octal(ASCII) \75.');
fprintf('\n Ejemplo 20: N�mero en Hexadecimal(ASCII) \x7B.');