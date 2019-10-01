clc, clear all, close all
%8 bits
bits=8;
Voltaje=5;
n=360/1+1;%Número de muestras
n=n-1;
t=0:360/n:360;
Vec_l=0:1:n;
%%%Señal Rampa
y1=(t/360*Voltaje)*3/5+1;
Valor1(length(t))=0;
for i=1:length(t)
    x=y1(i);
    for j=1:1:bits
     if(x>=Voltaje/(2^j))
       x=x-Voltaje/(2^j);
       Valor1(i)=Valor1(i)+2^(bits-j);
     end
    end
end
%%%Señal Seno
y2=((Voltaje+sind(t)*Voltaje)/2)*3/5+1;%Señal Seno
Valor2(length(t))=0;
for i=1:length(t)
    x=y2(i);
    for j=1:1:bits
     if(x>=Voltaje/(2^j))
       x=x-Voltaje/(2^j);
       Valor2(i)=Valor2(i)+2^(bits-j);
     end
    end
end
%%Señal Triangular
 for i=1:length(t) %Triangular-Seno
   if i<length(t)/2
     y3(i)=Voltaje*(t(i)/180)*3/5+1;
   else
     y3(i)=Voltaje*(1-((t(i)-180)/180))*3/5+1; 
   end
end
 Valor3(length(t))=0;
for i=1:length(t)
    x=y3(i);
    for j=1:1:bits
     if(x>=Voltaje/(2^j))
       x=x-Voltaje/(2^j);
       Valor3(i)=Valor3(i)+2^(bits-j);
     end
    end
end
%%Señal Circular
 for i=1:length(t) %Circulo
   if i<=length(t)/2
     y4(i)=(Voltaje*(1+sqrt(90^2-(t(i)-90)^2)/90)/2)*3/5+1;
   else
     y4(i)=(Voltaje*(1-sqrt(90^2-(t(i)-270)^2)/90)/2)*3/5+1; 
   end
 end
% for i=1:length(t) %Triangular-Seno
%    if i<length(t)/2;
%      y4(i)=Voltaje*(t(i)/180);
%    else
%      y4(i)=Voltaje*(1+sind(t(i)-90))/2; 
%    end
% end
Valor4(length(t))=0;
for i=1:length(t)
    x=y4(i);
    for j=1:1:bits
     if(x>=Voltaje/(2^j))
       x=x-Voltaje/(2^j);
       Valor4(i)=Valor4(i)+2^(bits-j);
     end
    end
end
%%%Señal Cuadrada
 for i=1:length(t) %Cuadrada
   if i<=length(t)/2
     y5(i)=0*Voltaje*3/5+1;
   else
     y5(i)=1*Voltaje*3/5+1; 
   end
 end
% for i=1:length(t) %Triangular-Seno
%    if i<length(t)/2;
%      y4(i)=Voltaje*(t(i)/180);
%    else
%      y4(i)=Voltaje*(1+sind(t(i)-90))/2; 
%    end
% end
Valor5(length(t))=0;
for i=1:length(t)
    x=y5(i);
    for j=1:1:bits
     if(x>=Voltaje/(2^j))
       x=x-Voltaje/(2^j);
       Valor5(i)=Valor5(i)+2^(bits-j);
     end
    end
end
figure(1)
axis equal, subplot(2,2,1),plot(t,y1)
subplot(2,2,2),stem(t,Valor1)
subplot(2,2,3),plot(Vec_l,y1)
subplot(2,2,4),stem(Vec_l,Valor1)
figure(2)
axis equal, subplot(2,2,1),plot(t,y2)
subplot(2,2,2),stem(t,Valor2)
subplot(2,2,3),plot(Vec_l,y2)
subplot(2,2,4),stem(Vec_l,Valor2)
figure(3)
axis equal, subplot(2,2,1),plot(t,y3)
subplot(2,2,2),stem(t,Valor3)
subplot(2,2,3),plot(Vec_l,y3)
subplot(2,2,4),stem(Vec_l,Valor3)
figure(4)
axis equal, subplot(2,2,1),plot(t,y4)
subplot(2,2,2),stem(t,Valor4)
subplot(2,2,3),plot(Vec_l,y4)
for i=1:1:length(t)
   Valor4b(2*i-1)=Valor4(i);
   Angulo(2*i-1)=t(i);
   if i<length(t)
   Angulo(2*i)=t(i+1);
   Valor4b(2*i)=Valor4(i);
   end
end
subplot(2,2,4),plot(Angulo,Valor4b)
figure(5)
axis equal, subplot(2,2,1),plot(t,y5)
subplot(2,2,2),stem(t,Valor5)
subplot(2,2,3),plot(Vec_l,y5)
for i=1:1:length(t)
   Valor5b(2*i-1)=Valor5(i);
   Angulo(2*i-1)=t(i);
   if i<length(t)
   Angulo(2*i)=t(i+1);
   Valor5b(2*i)=Valor5(i);
   end
end
subplot(2,2,4),plot(Angulo,Valor5b)
%%Generacion del punto coe.
Senales=[Valor1,Valor2,Valor3,Valor4];
outfile='Vectores.txt';
s = fopen(outfile,'w+');  %opens the output file
fprintf(s,'%s\n','Vectores de señales');
fprintf(s,'%s','const uint8_t Senal_Rampa[');
fprintf(s,'%d',length(Valor1));
fprintf(s,'%s',']={');
for i=1:length(Valor1)-1
    fprintf(s,'%d',Valor1(i));
    fprintf(s,'%c',','); 
end
fprintf(s,'%d',Valor1(i+1));
fprintf(s,'%s\n','};');
%%%%
fprintf(s,'%s','const uint8_t Senal_Seno[');
fprintf(s,'%d',length(Valor2));
fprintf(s,'%s',']={');
for i=1:length(Valor2)-1
    fprintf(s,'%d',Valor2(i));
    fprintf(s,'%c',','); 
end
fprintf(s,'%d',Valor2(i+1));
fprintf(s,'%s\n','};');
%%%%
fprintf(s,'%s','const uint8_t Senal_Triangular[');
fprintf(s,'%d',length(Valor3));
fprintf(s,'%s',']={');
for i=1:length(Valor3)-1
    fprintf(s,'%d',Valor3(i));
    fprintf(s,'%c',','); 
end
fprintf(s,'%d',Valor3(i+1));
fprintf(s,'%s\n','};');
%%%%
fprintf(s,'%s','const uint8_t Senal_Circular[');
fprintf(s,'%d',length(Valor4));
fprintf(s,'%s',']={');
for i=1:length(Valor4)-1
    fprintf(s,'%d',Valor4(i));
    fprintf(s,'%c',','); 
end
fprintf(s,'%d',Valor4(i+1));
fprintf(s,'%s\n','};');
%%%%
fprintf(s,'%s','const uint8_t Senal_Cuadrada[');
fprintf(s,'%d',length(Valor5));
fprintf(s,'%s',']={');
for i=1:length(Valor5)-1
    fprintf(s,'%d',Valor5(i));
    fprintf(s,'%c',','); 
end
fprintf(s,'%d',Valor5(i+1));
fprintf(s,'%s\n','};');
%%%%Muestras
fprintf(s,'%s','const uint8_t Muestras=');
fprintf(s,'%d',length(Valor1));
fprintf(s,'%c\n',';');
