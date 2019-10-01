clc, clear all, close all
% Archivo_texto=fopen('Blanco.txt','w+');
% for i=1:256
%   fprintf(Archivo_texto,'function togglebutton%d_Callback(hObject, eventdata, handles)\nCambiar_Valor(hObject);\n\n',i);
% end
% Archivo_texto=fopen('colorB.txt','w+');
% for i=1:64
%   fprintf(Archivo_texto,'set(handles.togglebutton%d,%cBackgroundColor%c,colorB);\n',i,39,39);
% end
% Archivo_texto=fopen('Apagar.txt','w+');
% for i=1:64
%   fprintf(Archivo_texto,'set(handles.togglebutton%d,%cValue%c,0);\n',i,39,39);
% end
% Archivo_texto=fopen('Invertir_Color.txt','w+');
% for i=1:64
%   fprintf(Archivo_texto,'Invertir_Color(handles.togglebutton%d);\n',i);
% end
% Archivo_texto=fopen('Obtener_Valor.txt','w+');
% for i=1:64
%   fprintf(Archivo_texto,' M(%d)=Obtener_Valor(handles.togglebutton%d);\n',i,i);
% end
Archivo_texto=fopen('Seno.txt','w+');
for i=3:362
  fprintf(Archivo_texto,'F%d,',i);
end