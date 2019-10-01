%Funci�n que toma datos por un puerto serial y los grafica por medio de la
%funcion plot
%
%Autor: Lic. Iv�n Cuadros Acosta
%Twitter: @IvanCuadrosA
%YouTube: youtube.com/user/Jica070186


function ADC_Serial(muestras) %la funcion recibe el # de muestras que debe tomar

close all;
clc;
voltaje=0; %Declara variable en la cual se van a guardar los valores

%Borra datos que se encuentren previos y vuelve a declarar el puerto y la
%velocidad de transmisi�n
delete(instrfind({'port'},{'COM8'})); 
puerto=serial('COM8');
puerto.BaudRate=9600;

fopen(puerto);%abre el puerto a utilizar
contador=1;

%configura la ventana donde se va a mostrar la grafica
figure('Name','Grafica voltaje')
title('GRAFICA VOLTAJE ADC-SERIAL');
xlabel('Numero de Muestras');
ylabel('Voltaje (V)');
grid off;
hold on;
muestras=700;
%Ciclo para ir realizando la grafica paso a paso
while contador<=muestras
    ylim([0 5.1]);
    xlim([0 muestras]);
    valorADC=fscanf(puerto,'%d')';
    voltaje(contador)=valorADC*5/1024;
    plot(voltaje);
    drawnow
    contador=contador+1;
end
%cierra y borra el puerto utilizado, borra todas las variables utilizadas
fclose(puerto);
delete(puerto);
fprintf('Finalizado');
clear all;
end