clc, clear all, close all
% Ruta='C:\Users\LuisFernando\Dropbox\7mo seemestre\Sistemas Neurodifusos\Imagenes\';
% Nombre_Blanco='50X50_Blanco.bmp';
% Nombre_Negro='50X50_Negro.bmp';
% Cuadro_Blanco=imread(strcat(Ruta,Nombre_Blanco));
% Cuadro_Negro=imread(strcat(Ruta,Nombre_Negro));
Patron_1=[0,1,1,1,0,1,0,1,0,1,1,0,1,1,1,1,0,0,0,1,1,0,0,0,1,0,1,1,1,0];
Patron_2=[0,0,0,0,0,0,1,1,1,0,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,0,1,1,1,0];
Imagen_1=Create_Image(Patron_1);
Imagen_2=Create_Image(Patron_2);
subplot(1,2,1),imshow(Imagen_1);
subplot(1,2,2),imshow(Imagen_2);
% Blanco=true;
% Negro=false;