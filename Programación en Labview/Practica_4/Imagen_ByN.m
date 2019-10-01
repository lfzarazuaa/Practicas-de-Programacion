clc, clear all, close all
Imagen=imread('Logo_UPIITA_4.png');
[Filas,Columnas,Colores]=size(Imagen);
Rojo=Imagen(:,:,1);
Verde=Imagen(:,:,2);
Azul=Imagen(:,:,3);
Rojo2(Filas,Columnas)=0;
Verde2(Filas,Columnas)=0;
Azul2(Filas,Columnas)=0;
n=254;
for i=1:Filas
    for j=1:Columnas
        if (Rojo(i,j)>n || Verde(i,j)>n || Azul(i,j)>n)
           Rojo2(i,j)=0;
           Verde2(i,j)=0;
           Azul2(i,j)=0;
        else
           Rojo2(i,j)=255;
           Verde2(i,j)=255;
           Azul2(i,j)=255; 
        end
    end
end
Imagen2(:,:,1)=Rojo2(:,:);
Imagen2(:,:,2)=Verde2(:,:);
Imagen2(:,:,3)=Azul2(:,:);
imshow(Imagen)
figure(2)
imshow(Imagen2)
% imwrite(Logo_Upiita_s.bmp)