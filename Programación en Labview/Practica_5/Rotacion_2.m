clc, clear all, close all
Ruta='Halo_2_149X150.jpg';
Imagen_Original=imread(Ruta);
[Alto,Ancho,Color]=size(Imagen_Original);
x=Ancho;
y=Alto;
Marco_150X150=imread('Marco_150X150.jpg');
%%Crear Imagen de 301X301 en negro.
Marco_301X301(301,301,:)=Marco_150X150(1,1,:);
%%Crear Imagen de 213X213 en negro.
Marco_213X213(213,213,:)=Marco_150X150(1,1,:);
Imagen_Modificada1=Marco_301X301;
Imagen_Modificada2=Marco_213X213;
%%Calcular el inicio para centrar la imagen en 301X301. 
Centro_Ancho=round(301/2);
Centro_Alto=round(301/2);
Inicio_Ancho=Centro_Ancho-round(x/2)+1;
Inicio_Alto=Centro_Alto-round(y/2)+1;
Final_Ancho=Inicio_Ancho+x-1;
Final_Alto=Inicio_Alto+y-1;
%%Centrar la imagen en 301X301.
for i=Inicio_Ancho:1:Final_Ancho
 for j=Inicio_Alto:1:Final_Alto
     nXAux=i-Inicio_Ancho+1;
     nYAux=j-Inicio_Alto+1;
     Imagen_Modificada1(j,i,:)=Imagen_Original(nYAux,nXAux,:);
 end
end
%%% Proponer Angulo y su Matriz de Rotación.
Angulo=45;
Matriz_Rotacion=[cosd(Angulo),-sind(Angulo);sind(Angulo),cosd(Angulo)];
%%Obtener las coordenadas pixeles que requiere la matriz
%%para realizar la rotación.
%%Calcula las coordenadas donde iran los pixeles
%%de la matriz de 301X301 en la matriz de 213X213.
for i=-106:1:106
  for j=-106:1:106
      XY=(Matriz_Rotacion*[i;j]);
      Coordenada_x(i+107,j+107)=round(XY(1)+151);
      Coordenada_y(i+107,j+107)=round(XY(2)+151);
  end
end
%%Asignar las coordenadas deseadas en la matriz de 213X213.
for i=1:1:213
 for j=1:1:213
     nXAux=Coordenada_x(i,j);
     nYAux=Coordenada_y(i,j);
     Imagen_Modificada2(j,i,:)=Imagen_Modificada1(nYAux,nXAux,:);
 end
end
figure,imshow(Imagen_Original)
figure,imshow(Imagen_Modificada1)
figure,imshow(Imagen_Modificada2)

% %Método_1
% Angulo=-Angulo;
% Matriz_Rotacion=[cosd(Angulo),-sind(Angulo);sind(Angulo),cosd(Angulo)];
% for i=-74:1:75
%  for j=-74:1:75
%      XY=(Matriz_Rotacion*[i;j]);
%      Coordenada_x(i+75,j+75)=round(XY(1)+107);
%      Coordenada_y(i+75,j+75)=round(XY(2)+107);
%  end
% end
% % min(min(Coordenada_x))
% % max(max(Coordenada_x))
% % min(min(Coordenada_y))
% % max(max(Coordenada_y))
% for i=1:1:150
%  for j=1:1:150
%      nXAux=Coordenada_x(i,j);
%      nYAux=Coordenada_y(i,j);
%      Imagen_Modificada2(nYAux,nXAux,:)=Imagen_Modificada(j,i,:);
%  end
% end

 
% figure,imshow(Imagen_Modificada)
 
% figure,imshow(Imagen_Modificada3)