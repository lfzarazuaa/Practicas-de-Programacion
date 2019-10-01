clc, clear all, close all
%8 bits
bits=16;
Voltaje=3.3;
n=2^8;%Número de muestras
n=n-1;
t=0:360/n:360;
Vec_l=0:1:n;
%%%Señal Rampa
y1=(t/360*Voltaje);
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
y2=(Voltaje+sind(t)*Voltaje)/2;%Señal Seno
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
%%Señal exponencial
 for i=1:length(t) %Exponencial.
     y3(i)=Voltaje*exp((t(i))/36)/22e3; 
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
%%Señal libre
 for i=1:length(t) %Circulo
   if i<=length(t)/2;
     y4(i)=Voltaje*0.1+Voltaje*0.9*(1+sqrt(90^2-(t(i)-90)^2)/90)/2-(Voltaje+sind(15*t(i))*Voltaje)/20;
   else
     y4(i)=Voltaje*0.1+Voltaje*0.9*(1-sqrt(90^2-(t(i)-270)^2)/90)/2-(Voltaje+sind(30*t(i))*Voltaje)/20; 
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
%%Generacion del punto coe.
Senales=[Valor1,Valor2,Valor3,Valor4];
Palabra=dec2hex(Senales);
outfile='Senales.coe';
s = fopen(outfile,'w+');  %opens the output file
fprintf(s,'%s\n','; VGA Memory Map ');
fprintf(s,'%s\n','; .COE file with hex coefficients ');
fprintf(s,'%s\n','memory_initialization_radix=16;'); 
fprintf(s,'%s\n','memory_initialization_vector=');
for i=1:length(Senales)-1
    fprintf(s,'%c',Palabra(i,:));
    fprintf(s,'%c',','); 
end
fprintf(s,'%c',Palabra(i+1,:));
fprintf(s,'%c',';');