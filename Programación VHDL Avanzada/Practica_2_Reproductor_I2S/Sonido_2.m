clc, clear all, close all
%==Frecuencia de Muestreo==
fm=50e6/2^(10);
f=8192;
for octava=1:8
   for n=1:12
       freq(n+(octava-1)*12)=440*(2^(1/12))^((octava-4)*12+(n-10));
   end   
end
for octava=1:8 
    Do(octava)=freq(1+(octava-1)*12);
    Dos(octava)=freq(2+(octava-1)*12);
    Re(octava)=freq(3+(octava-1)*12);
    Res(octava)=freq(4+(octava-1)*12);
    Mi(octava)=freq(5+(octava-1)*12);
    Fa(octava)=freq(6+(octava-1)*12);
    Fas(octava)=freq(7+(octava-1)*12);
    Sol(octava)=freq(8+(octava-1)*12);
    Sols(octava)=freq(9+(octava-1)*12);
    La(octava)=freq(10+(octava-1)*12);
    Sib(octava)=freq(11+(octava-1)*12);
    Si(octava)=freq(12+(octava-1)*12);
end
do=Do;
dos=Dos;
re=Re;
res=Res;
mi=Mi;
fa=Fa;
fas=Fas;
sol=Sol;
sols=Sols;
la=La;
sib=Sib;
si=Si;
%%Octava base=4
freq=freq';
%El Silencio, su frecuencia es cero
s=0;
% ==Parte para Duracion==
% Definimos la duración en segundos de la negra.
% tomada como 1 tiempo.
n=0.5;
np=n/8;%%pausa entre cada nota.
base=4;
b0=base;
b1=base+1;
% Hacemos un vector N = [ nota , duracion ]
NOTAS=[mi(b0),sol(b0),la(b0),la(b0),la(b0),si(b0),do(b1),do(b1),...
       do(b1),re(b1),si(b0),si(b0),la(b0),sol(b0),sol(b0),la(b0),s...%%1
       mi(b0),sol(b0),la(b0),la(b0),la(b0),si(b0),do(b1),do(b1),...
       do(b1),re(b1),si(b0),si(b0),la(b0),sol(b0),sol(b0),la(b0),s...%%2
       mi(b0),sol(b0),la(b0),la(b0),la(b0),do(b1),re(b1),re(b1),...
       re(b1),mi(b1),fa(b1),fa(b1),mi(b1),re(b1),mi(b1),la(b0),s,...%%3
       la(b0),si(b0),do(b1),do(b1),re(b1),mi(b1),la(b0),s,...
       la(b0),do(b1),si(b0),si(b0),do(b1),la(b0),si(b0),s,...
       mi(b0),sol(b0),la(b0),la(b0),la(b0),si(b0),do(b1),do(b1),...
       do(b1),re(b1),si(b0),si(b0),la(b0),sol(b0),sol(b0),la(b0),s,...%6
       s];
DURACION=[n/2,n/2,n,n,n/2,n/2,n,n,...
          n/2,n/2,n,n,n/2,n/2,n/2,n/2,n/4,...%%1
          n/2,n/2,n,n,n/2,n/2,n,n,...
          n/2,n/2,n,n,n/2,n/2,n/2,n/2,n/4,...%%2
          n/2,n/2,n,n,n/2,n/2,n,n,...
          n/2,n/2,n,n,n/2,n/2,n/2,n/2,n/4,...%%3
          n/2,n/2,n,n,n,n/2,n/2,n/4,...%%4
          n/2,n/2,n,n,n/2,n/2,n,n/4,...%%5
          n/2,n/2,n,n,n/2,n/2,n,n,...
          n/2,n/2,n,n,n/2,n/2,n/2,n/2,n/4,...%%6
          n/4];
%%Agregar silencios
for i=1:length(NOTAS)
   indice1=1+2*(i-1);
   indice2=indice1+1;
   NOTAS2(indice1)=NOTAS(i);
   NOTAS2(indice2)=s;
   DURACION2(indice1)=DURACION(i);
   DURACION2(indice2)=np;
end
N=[NOTAS2',DURACION2'];
y=[];

%==Armamos la señal==
for i=1:length(N)
fr=N(i,1);
t=N(i,2);
x=(0:(1/fm):t);
y=[y sin(fr*2*pi.*x)];
end
t=(0:1:length(y)-1)/fm;
subplot(2,1,1),plot(t,y)
t=(0:1:length(NOTAS2)-1)*sum(DURACION2)/(length(NOTAS2)-1);
subplot(2,1,2),stem(t,NOTAS2)
freq_base=50e6/2^(26);
freq_trabajo=50e6/2^(20);
NOTAS_NEXYS=round(NOTAS2/freq_base);
ParteA=dec2hex(NOTAS_NEXYS,4);
DURACION_NEXYS=round(DURACION2*freq_trabajo);
ParteB=dec2hex(DURACION_NEXYS,2);
for i=1:length(NOTAS_NEXYS)
    Palabra(i,:)=strcat(ParteB(i,:),ParteA(i,:));
end
%%Duracion Guardada de (23-16) y NOTAS (15,0)
% Hacemos el sonido
% en este comando
% esta toda la magia
sound(y,fm,16)
outfile='Frecuencias.coe';
s = fopen(outfile,'w+');  %opens the output file
fprintf(s,'%s\n','; VGA Memory Map ');
fprintf(s,'%s\n','; .COE file with hex coefficients ');
fprintf(s,'%s\n','memory_initialization_radix=16;'); 
fprintf(s,'%s\n','memory_initialization_vector=');
for i=1:length(NOTAS_NEXYS)
    fprintf(s,'%c',Palabra(i,:));
    if i~=length(NOTAS_NEXYS)
     fprintf(s,'%c',',');
    else
     fprintf(s,'%c',';');
    end
end
