clc, clear all, close all
voltaje=0; %Declara variable en la cual se van a guardar los valores
delete(instrfind({'port'},{'COM2'})); 
puerto=serial('COM2');
puerto.BaudRate=9600;
fopen(puerto);
figure('Name','Grafica voltaje')
title('GRAFICA VOLTAJE ADC-SERIAL');
xlabel('Numero de Muestras');
ylabel('Voltaje (V)');
grid off;
hold on;
muestras=700;
voltaje(muestras)=0;
contador=0;
while contador<=muestras
    ylim([0 5.1]);
    xlim([0 muestras]);
    valorADC=str2double(fscanf(puerto,'%c')');
    voltaje(contador)=valorADC*5/255;
    plot(voltaje);
    drawnow
    contador=contador+1;
end
%cierra y borra el puerto utilizado, borra todas las variables utilizadas
fclose(puerto);
delete(puerto);
fprintf('Finalizado');
clear all;