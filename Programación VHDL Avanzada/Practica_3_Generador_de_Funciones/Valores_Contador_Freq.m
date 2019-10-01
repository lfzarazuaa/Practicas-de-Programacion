clc, clear, close all
nm=2^8;%%numero de muestras.
nm=nm-1;
freq_1s=1/nm;
valor_cont_1s=50e6*freq_1s;
for i=1:1:9999
     Valores_Freq(i)=round(valor_cont_1s/i);
end
Valores_Freq=[Valores_Freq(1),Valores_Freq];
t=0:1:9999;
stem(t,Valores_Freq);
Palabra=dec2hex(Valores_Freq,4);
outfile='Val_Cont.coe';
s = fopen(outfile,'w+');  %opens the output file
fprintf(s,'%s\n','; VGA Memory Map ');
fprintf(s,'%s\n','; .COE file with hex coefficients ');
fprintf(s,'%s\n','memory_initialization_radix=16;'); 
fprintf(s,'%s\n','memory_initialization_vector=');
for i=1:length(Valores_Freq)-1
    fprintf(s,'%c',Palabra(i,:));
    fprintf(s,'%c',','); 
end
fprintf(s,'%c',Palabra(i+1,:));
fprintf(s,'%c',';');