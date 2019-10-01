clc, clear all, close all
Ruta='Halo_2_150X150.jpg';
Imagen_Original=imread(Ruta);
[Alto,Ancho,Color]=size(Imagen_Original);
x=Ancho;
y=Alto;
Marco_150X150=imread('Marco_150X150.jpg');
Imagen_Modificada=Marco_150X150;
%%Calcular el inicio para centrar la imagen en 150X150. 
Centro_Ancho=150/2;
Centro_Alto=150/2;
Inicio_Ancho=Centro_Ancho-round(x/2)+1;
Inicio_Alto=Centro_Alto-round(y/2)+1;
Final_Ancho=Inicio_Ancho+x-1;
Final_Alto=Inicio_Alto+y-1;
%%Centrar la imagen en 150X150.
for i=Inicio_Ancho:1:Final_Ancho
 for j=Inicio_Alto:1:Final_Alto
     nXAux=i-Inicio_Ancho+1;
     nYAux=j-Inicio_Alto+1;
     Imagen_Modificada(j,i,:)=Imagen_Original(nYAux,nXAux,:);
 end
end
%%Crear Imagen de 213X213 en negro.
Marco_213X213(213,213,:)=Marco_150X150(1,1,:);
Imagen_Modificada2=Marco_213X213;
Angulo=45;
%Método_1
Angulo=-Angulo;
Matriz_Rotacion=[cosd(Angulo),-sind(Angulo);sind(Angulo),cosd(Angulo)];
%%Asignar donde deben quedar la imagen en la imagen rotada.
for i=-74:1:75
 for j=-74:1:75
     XY=(Matriz_Rotacion*[i;j]);
     Coordenada_x(i+75,j+75)=round(XY(1)+107);
     Coordenada_y(i+75,j+75)=round(XY(2)+107);
 end
end
%%Rellenar la imagen con los puntos Asignados.
for i=1:1:150
 for j=1:1:150
     nXAux=Coordenada_x(i,j);
     nYAux=Coordenada_y(i,j);
     Imagen_Modificada2(nYAux,nXAux,:)=Imagen_Modificada(j,i,:);
 end
end

 figure,imshow(Imagen_Original)
% figure,imshow(Imagen_Modificada)
 figure,imshow(Imagen_Modificada2)