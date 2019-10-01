clc, clear all, close all
Ruta='Dragon_Ball_150X112.jpg';
FactorEscalar=0.75;
Imagen_Original=imread(Ruta);
[Alto,Ancho,Color]=size(Imagen_Original);
x=Ancho;
y=Alto;
if FactorEscalar>=0
xm=round(x*FactorEscalar);
ym=round(y*FactorEscalar);
for i=1:1:xm
 for j=1:1:ym
   nXAux=round(i/FactorEscalar)-1;
   if nXAux<=1
      nXAux=1; 
   end
   nYAux=round(j/FactorEscalar)-1;
   if nYAux<=1
      nYAux=1; 
   end
   Imagen_Modificada(j,i,:)=Imagen_Original(nYAux,nXAux,:);
 end
end
else
for i=0:1:x
 for j=0:1:y
   nXAux=round(i*FactorEscalar);
   nYAux=round(j*FactorEscalar);
   if ((nXAux>0 &&  i<x) && (nYAux>0 && j<y))
       Imagen_Modificada(nYAux,nXAux,:)=Imagen_Original(j,i,:);
   end
  end
 end
end
figure,imshow(Imagen_Original)
figure,imshow(Imagen_Modificada)