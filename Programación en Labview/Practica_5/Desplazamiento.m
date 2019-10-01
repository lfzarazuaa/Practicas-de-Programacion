clc, clear all, close all
Ruta='Halo_2_150X150.jpg';
Posicion_x=500;
Posicion_y=500;
Posicion_y=-Posicion_y;
Imagen_Original=imread(Ruta);
[Alto,Ancho,Color]=size(Imagen_Original);
x=Ancho;
y=Alto;
Marco_150X150=imread('Marco_150X150.jpg');
Marco_1150X1150(1150,1150,:)=Marco_150X150(1,1,:);
Imagen_Modificada1=Marco_1150X1150;
Centro_Ancho=round(1150/2);
Centro_Alto=round(1150/2);
Inicio_Ancho=Centro_Ancho-round(x/2)+1+Posicion_x;
Inicio_Alto=Centro_Alto-round(y/2)+1+Posicion_y;
Final_Ancho=Inicio_Ancho+x-1;
Final_Alto=Inicio_Alto+y-1;
for i=Inicio_Ancho:1:Final_Ancho
 for j=Inicio_Alto:1:Final_Alto
     nXAux=i-Inicio_Ancho+1;
     nYAux=j-Inicio_Alto+1;
     Imagen_Modificada1(j,i,:)=Imagen_Original(nYAux,nXAux,:);
 end
end
figure,imshow(Imagen_Original)
figure,imshow(Imagen_Modificada1)