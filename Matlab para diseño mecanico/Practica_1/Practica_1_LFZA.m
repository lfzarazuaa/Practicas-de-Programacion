function varargout = Practica_1_LFZA(varargin)
% PRACTICA_1_LFZA MATLAB code for Practica_1_LFZA.fig
%      PRACTICA_1_LFZA, by itself, creates a new PRACTICA_1_LFZA or raises the existing
%      singleton*.
%
%      H = PRACTICA_1_LFZA returns the handle to a new PRACTICA_1_LFZA or the handle to
%      the existing singleton*.
%
%      PRACTICA_1_LFZA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRACTICA_1_LFZA.M with the given input arguments.
%
%      PRACTICA_1_LFZA('Property','Value',...) creates a new PRACTICA_1_LFZA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Practica_1_LFZA_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Practica_1_LFZA_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Practica_1_LFZA

% Last Modified by GUIDE v2.5 25-Sep-2016 23:55:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Practica_1_LFZA_OpeningFcn, ...
                   'gui_OutputFcn',  @Practica_1_LFZA_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Practica_1_LFZA is made visible.
function Practica_1_LFZA_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Practica_1_LFZA (see VARARGIN)

% Choose default command line output for Practica_1_LFZA
handles.output = hObject;
% Tabla_A1={'Apoyo Izq' 0 0 0 'Apoyo A' 0 0 0 0 0 0};
% Tabla_A2={'Apoyo Der' 8.5 0 0 'Apoyo B' 0 0 0 0 0 0};
Tabla_A1={'Apoyo Izq' 0 0 0 'Apoyo A' 0 0 0 0 0 0};
Tabla_A2={'Apoyo Der' 0 8.5 0 'Apoyo B' 0 0 0 0 0 0};
% Tabla_A1={'Apoyo Izq' 0 0 0 'Apoyo A' 0 0 0 0 0 0};
% Tabla_A2={'Apoyo Der' 0 0 8.5 'Apoyo B' 0 0 0 0 0 0};
% Tabla_P1={'Posición_1' 3 0 1.55 'Fuerza_1' 0 0 0 -532.64 -1987.74 -748.99};
% Tabla_P2={'Posición_2' 6.5 0 -2.6 'Fuerza_2' 0 0 0 685.95 -1184.99 499.43};
Tabla_P1={'Posición_1' 0 3 1.55 'Fuerza_1' 0 0 0 -1987.74 -532.64 -748.99};
Tabla_P2={'Posición_2' 0 6.5 -2.6 'Fuerza_2' 0 0 0 -1184.99 685.95 499.43};
% Tabla_P1={'Posición_1' 0 1.55 3 'Fuerza_1' 0 0 0 -1987.74 -748.99 -532.64};
% Tabla_P2={'Posición_2' 0 -2.6 6.5 'Fuerza_2' 0 0 0 -1184.99 499.43  685.95};
Tabla_Datos=[Tabla_A1;Tabla_A2;Tabla_P1;Tabla_P2];
handles.metricdata.Filas=2;
global Longitud dl
Longitud=5000;
dl=8.5;
set(handles.uitable1,'data',Tabla_Datos);
Tabla_Datos={0 2;2 2;4 2;6 2;8 2};
% Update handles structure
set(handles.uitable2,'data',Tabla_Datos);
set(handles.slider1, 'SliderStep', [1/170 , 0.1 ]);
set(handles.slider1,'Value',(4/8.5));
set(handles.slider2, 'Max', 360);
guidata(hObject, handles);

% UIWAIT makes Practica_1_LFZA wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Practica_1_LFZA_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
% clc, clear all, close all

% --- Executes on button press in BTN_Tabla.
function BTN_Tabla_Callback(hObject, eventdata, handles)
% hObject    handle to BTN_Tabla (see GCBO)
Filas=str2double(get(handles.edit1,'String'));%Obtener Filas
 if Filas>handles.metricdata.Filas
  %Agregar nuevas filas con un for.
  for i=handles.metricdata.Filas:1:Filas-1%For para generar las Filas faltantes.
  tablap=get(handles.uitable1,'Data');%Obtener los datos de la tabla.
  n=size(tablap);
  f=n(1);
  g=f+1;
  Tabla_text=strcat('Fuerza_',num2str(i+1));
  tablap(g,:)=tablap(f,:);%Copiar texto de fila anterior.
   tablap(g,1)=cellstr(strcat('Posición_',num2str(i+1)));%Agregar la posición correcta.
  tablap(g,5)=cellstr(Tabla_text);%Agregar la fuerza correcta.
  set(handles.uitable1,'data',tablap);%Actualizar Tabla.
  end
 elseif Filas<handles.metricdata.Filas
  %Quitar filas necesarias con un for.
  Diferencia=handles.metricdata.Filas-Filas;
  for i=Filas:1:handles.metricdata.Filas-1%For quitar las Filas faltantes.
  tablap=get(handles.uitable1,'Data');%Obtener los datos de la tabla.
  n=size(tablap);
  f=n(1);
  g=f-1;
  set(handles.uitable1,'data',tablap(1:g,:));%Actualizar Tabla.
  end
 else
  %No hacer nada
 end
handles.metricdata.Filas=Filas;%Guardar dato actualizado de Filas.
guidata(hObject, handles);
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Cargas = round(str2double(get(hObject, 'String')));
if isnan(Cargas)|| Cargas>100 || Cargas<1
    set(hObject, 'String', 1);
    errordlg('Se debe ingresar un numero entre 1 y 100','Error');
else
    set(hObject,'String',Cargas);
end

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BTN_Calcular.
function BTN_Calcular_Callback(hObject, eventdata, handles)
% hObject    handle to BTN_Calcular (see GCBO)
Filas=handles.metricdata.Filas;
tablap=get(handles.uitable1,'Data');
Ra=cell2mat([tablap(1,2),tablap(1,3),tablap(1,4)]);%Vector de Posición Ra
Rb=cell2mat([tablap(2,2),tablap(2,3),tablap(2,4)]);%Vector de Posición Rb
for k=1:Filas
   Rk(k,:)=cell2mat([tablap(2+k,2),tablap(2+k,3),tablap(2+k,4)]);%Vectores R posición.
   Fk(k,:)=cell2mat([tablap(2+k,9),tablap(2+k,10),tablap(2+k,11)]);%Fuerzas F.
   %%Vectores de Posición
   RkA(k,:)=Rk(k,:)-Ra;%Vectores Rk con resptecto a A posición.
   RkB(k,:)=Rk(k,:)-Rb;%Vectores Rk con resptecto a B posición.
end
tablap=get(handles.uitable2,'Data');
L1=cell2mat([tablap(1,1),tablap(1,2)]);%Segmento de Longitud 1
L2=cell2mat([tablap(2,1),tablap(2,2)]);%Segmento de Longitud 2
L3=cell2mat([tablap(3,1),tablap(3,2)]);%Segmento de Longitud 3
L4=cell2mat([tablap(4,1),tablap(4,2)]);%Segmento de Longitud 4
L5=cell2mat([tablap(5,1),tablap(5,2)]);%Segmento de Longitud 5
L=[L1;L2;L3;L4;L5];
Rab=Ra-Rb;
Rba=Rb-Ra;
Valor=get(handles.slider1,'Value');
Angulo_theta=get(handles.slider2,'Value');
if Ra(1)>0 || Rb(1)>0
 if Ra(1)>=Rb(1)
 L_Eje=Ra(1);
 else
 L_Eje=Rb(1);
 end
 set(handles.text3,'String',strcat(num2str(Valor),'*L=',strcat(num2str(Valor*L_Eje))))
 set(handles.text5,'String',L_Eje)
 Eje_X(Ra,Rb,Rab,Rba,Filas,Rk,Fk,RkA,RkB,L,L1,L2,L3,L4,L5,Valor,Angulo_theta)
elseif Ra(2)>0 || Rb(2)>0
 if Ra(2)>=Rb(2)
 L_Eje=Ra(2);
 else
 L_Eje=Rb(2);
 end
 set(handles.text3,'String',strcat(num2str(Valor),'*L=',strcat(num2str(Valor*L_Eje))))
 set(handles.text5,'String',L_Eje)
 Eje_Y(Ra,Rb,Rab,Rba,Filas,Rk,Fk,RkA,RkB,L,L1,L2,L3,L4,L5,Valor,Angulo_theta)
else
 if Ra(3)>=Rb(3)
 L_Eje=Ra(3);
 else
 L_Eje=Rb(3);
 end
 set(handles.text3,'String',strcat(num2str(Valor),'*L=',strcat(num2str(Valor*L_Eje))))
 set(handles.text5,'String',L_Eje)
 Eje_Z(Ra,Rb,Rab,Rba,Filas,Rk,Fk,RkA,RkB,L,L1,L2,L3,L4,L5,Valor,Angulo_theta)  
end

%      axis([-300 300 -300 300 -300 300]); 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function[]=Eje_X(Ra,Rb,Rab,Rba,Filas,Rk,Fk,RkA,RkB,L,L1,L2,L3,L4,L5,Valor,Angulo_theta)
k=Filas;
    %Reacciones en A
% (Z'RkB)*(X'Fk)-(X'RkB)*(Z'Fk)
RAz=sum((RkB(1:k,3)).*Fk(1:k,1)-(RkB(1:k,1)).*Fk(1:k,3))/Rab(1);
% (Y'RkB)*(X'Fk)-(X'RkB)*(Y'Fk)
RAy=sum((RkB(1:k,2)).*Fk(1:k,1)-(RkB(1:k,1)).*Fk(1:k,2))/Rab(1);
%Reacciones en B
% (Z'RkA)*(X'Fk)-(X'RkA)*(Z'Fk)
RBz=sum((RkA(1:k,3)).*Fk(1:k,1)-(RkA(1:k,1)).*Fk(1:k,3))/Rba(1);
% (Y'RkA)*(X'Fk)-(X'RkA)*(Y'Fk)
RBy=sum((RkA(1:k,2)).*Fk(1:k,1)-(RkA(1:k,1)).*Fk(1:k,2))/Rba(1);
%Reacciones
RAx=0;
RBx=RAz-sum(Fk(1:k,1));
RAr=[RAx RAy RAz]
RBr=[RBx RBy RBz]
%%------------------------------------------------------
if Ra(1)>=Rb(1)
L_Eje=Ra(1);
else
L_Eje=Rb(1);
end
 X=Abcisa(L_Eje);
% Valor=get(handles.slider1,'Value');
% set(handles.text3,'String',strcat(num2str(Valor),'*L=',strcat(num2str(Valor*L_Eje))))
% set(handles.text5,'String',L_Eje)
%Creación del vector con las longitudes deseadas

Vector_Diametro(length(X))=0;
for i=1:length(X)
    if  X(i)>=L1(1) && X(i)<L2(1) 
       Vector_Diametro(i)=L1(2);
    elseif L2(1)<X(i) &&  X(i)<=L3(1)
       Vector_Diametro(i)=L2(2);
    elseif L3(1)<X(i) &&  X(i)<=L4(1)
       Vector_Diametro(i)=L3(2);
    elseif L4(1)<X(i) &&  X(i)<=L5(1)
       Vector_Diametro(i)=L4(2);
    elseif L5(1)<X(i) &&  X(i)<=L_Eje
       Vector_Diametro(i)=L5(2);
    else
       Vector_Diametro(i)=1; 
    end
end
figure(1)
Grafica_de_Cargas(L,Ra,Rb,RAr,RBr,Rk,Fk,Filas,1);
for k=1:Filas
%%Vectores de Cargas Plano xy y yx
   if k==1
   Sum_Cargas_xy=Fk(k,2)*Heav(Rk(k,1),L_Eje);
   Sum_Cargas_xx=Fk(k,1)*Heav(Rk(k,1),L_Eje);
   Sum_Cargas_xz=Fk(k,3)*Heav(Rk(k,1),L_Eje);
   Sum_Momento_xy=(Fk(k,2)*(X-Rk(k,1))+Fk(k,1)*Rk(k,2)).*Heav(Rk(k,1),L_Eje);
   Sum_Momento_xz=(Fk(k,3)*(X-Rk(k,1))+Fk(k,1)*Rk(k,3)).*Heav(Rk(k,1),L_Eje);
   Sum_Pendiente_xy=((1/2)*Fk(k,2)*(X-Rk(k,1)).^2+Fk(k,1)*Rk(k,2)*(X-Rk(k,1))).*Heav(Rk(k,1),L_Eje);
   Sum_Pendiente_xz=((1/2)*Fk(k,3)*(X-Rk(k,1)).^2+Fk(k,1)*Rk(k,3)*(X-Rk(k,1))).*Heav(Rk(k,1),L_Eje);
   Sum_Deflexion_xy=((1/6)*Fk(k,2)*(X-Rk(k,1)).^3+(1/2)*Fk(k,1)*Rk(k,2)*(X-Rk(k,1)).^2).*Heav(Rk(k,1),L_Eje);
   Sum_Deflexion_xz=((1/6)*Fk(k,3)*(X-Rk(k,1)).^3+(1/2)*Fk(k,1)*Rk(k,3)*(X-Rk(k,1)).^2).*Heav(Rk(k,1),L_Eje);
   Angulo_Fuerza=atand(Rk(k,3)/Rk(k,2));   
   R_Normal=Rk(k,2)*cosd(Angulo_Fuerza)+Rk(k,3)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,2)*sind(Angulo_Fuerza)+Fk(k,3)*cosd(Angulo_Fuerza);
   Sum_Torques_yz=-(F_Tangencial*R_Normal)*Heav(Rk(k,1),L_Eje);
%    Sum_Torques_xz=(Fk(k,2)*Rk(k,3))*Heav(Rk(k,1),L_Eje);
   else
   Sum_Cargas_xy=Sum_Cargas_xy+Fk(k,2)*Heav(Rk(k,1),L_Eje);
   Sum_Cargas_xx=Sum_Cargas_xx+Fk(k,1)*Heav(Rk(k,1),L_Eje);
   Sum_Cargas_xz=Sum_Cargas_xz+Fk(k,3)*Heav(Rk(k,1),L_Eje);
   Sum_Momento_xy=Sum_Momento_xy+(Fk(k,2)*(X-Rk(k,1))+Fk(k,1)*Rk(k,2)).*Heav(Rk(k,1),L_Eje);
   Sum_Momento_xz=Sum_Momento_xz+(Fk(k,3)*(X-Rk(k,1))+Fk(k,1)*Rk(k,3)).*Heav(Rk(k,1),L_Eje);
   Sum_Pendiente_xy=Sum_Pendiente_xy+((1/2)*Fk(k,2)*(X-Rk(k,1)).^2+Fk(k,1)*Rk(k,2)*(X-Rk(k,1))).*Heav(Rk(k,1),L_Eje);
   Sum_Pendiente_xz=Sum_Pendiente_xz+((1/2)*Fk(k,3)*(X-Rk(k,1)).^2+Fk(k,1)*Rk(k,3)*(X-Rk(k,1))).*Heav(Rk(k,1),L_Eje);
   Sum_Deflexion_xy=Sum_Deflexion_xy+((1/6)*Fk(k,2)*(X-Rk(k,1)).^3+(1/2)*Fk(k,1)*Rk(k,2)*(X-Rk(k,1)).^2).*Heav(Rk(k,1),L_Eje);
   Sum_Deflexion_xz=Sum_Deflexion_xz+((1/6)*Fk(k,3)*(X-Rk(k,1)).^3+(1/2)*Fk(k,1)*Rk(k,3)*(X-Rk(k,1)).^2).*Heav(Rk(k,1),L_Eje);
   Angulo_Fuerza=atand(Rk(k,3)/Rk(k,2));   
   R_Normal=Rk(k,2)*cosd(Angulo_Fuerza)+Rk(k,3)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,2)*sind(Angulo_Fuerza)+Fk(k,3)*cosd(Angulo_Fuerza);
   Sum_Torques_yz=Sum_Torques_yz-(F_Tangencial*R_Normal)*Heav(Rk(k,1),L_Eje);
   end
end
%%Cálculo de Gráficas de Fuerzas Cortantes
 Esfuerzo_Vxy=RAy*Heav(Ra(1),L_Eje)+Sum_Cargas_xy+RBy*Heav(Rb(1),L_Eje);
 Esfuerzo_Vxz=RAz*Heav(Ra(1),L_Eje)+Sum_Cargas_xz+RBz*Heav(Rb(1),L_Eje);
 %%Momentos Flectores
 Momento_Mxy=RAy*(X-Ra(1)).*Heav(Ra(1),L_Eje)+Sum_Momento_xy+RBy*(X-Rb(1)).*Heav(Rb(1),L_Eje);
 Momento_Mxz=RAz*(X-Ra(1)).*Heav(Ra(1),L_Eje)+Sum_Momento_xz+RBz*(X-Rb(1)).*Heav(Rb(1),L_Eje);
 Diagrama_Cargas=RAx*Heav(Ra(1),L_Eje)+Sum_Cargas_xx+RBx*Heav(Rb(1),L_Eje);
 Diagrama_Momento=Sum_Torques_yz;
%  %%Curva pendiente
 E=29.7*10^6;
 I=pi*Vector_Diametro.^4/64;
 K0=1./(E*I);
 Curva_Pendiente_xy=K0.*(RAy*(X-Ra(1)).^2.*Heav(Ra(1),L_Eje)/2+Sum_Pendiente_xy+RBy*(X-Rb(1)).^2.*Heav(Rb(1),L_Eje)/2);
 Curva_Pendiente_xz=K0.*(RAz*(X-Ra(1)).^2.*Heav(Ra(1),L_Eje)/2+Sum_Pendiente_xz+RBz*(X-Rb(1)).^2.*Heav(Rb(1),L_Eje)/2);
%  %%Curva de Flexión
 Curva_Deflexion_xy=K0.*(RAy*(X-Ra(1)).^3.*Heav(Ra(1),L_Eje)/6+Sum_Deflexion_xy+RBx*(X-Rb(1)).^3.*Heav(Rb(1),L_Eje)/6);
 Curva_Deflexion_xz=K0.*(RAz*(X-Ra(1)).^3.*Heav(Ra(1),L_Eje)/6+Sum_Deflexion_xz+RBz*(X-Rb(1)).^3.*Heav(Rb(1),L_Eje)/6);
 a=find(X>=Ra(1),1,'first');
 b=find(X<Rb(1),1,'last');
 CA=([X(a) 1;X(b) 1])\[-Curva_Deflexion_xy(a);-Curva_Deflexion_xy(b)];
 CB=([X(a) 1;X(b) 1])\[-Curva_Deflexion_xz(a);-Curva_Deflexion_xz(b)];
 Curva_Pendiente_xy=Curva_Pendiente_xy+CA(1);
 Curva_Pendiente_xz=Curva_Pendiente_xz+CB(1);
 Curva_Deflexion_xy=Curva_Deflexion_xy+CA(1)*X+CA(2);
 Curva_Deflexion_xz=Curva_Deflexion_xz+CB(1)*X+CB(2);
 Curva_Pendiente_xy=Curva_Pendiente_xy.*(Heav(Ra(3),L_Eje)-Heav(L_Eje,L_Eje));
 Curva_Pendiente_xz=Curva_Pendiente_xz.*(Heav(Ra(3),L_Eje)-Heav(L_Eje,L_Eje));
 Curva_Deflexion_xy=Curva_Deflexion_xy.*(Heav(Ra(3),L_Eje)-Heav(L_Eje,L_Eje));
 Curva_Deflexion_xz=Curva_Deflexion_xz.*(Heav(Ra(3),L_Eje)-Heav(L_Eje,L_Eje));
 %%Curvas de Esfuerzo_Vyx Cortantes Normales
 Esfuerzos_Normales_My=32*Momento_Mxy./(pi*Vector_Diametro.^3);
 Esfuerzos_Normales_Mz=32*Momento_Mxz./(pi*Vector_Diametro.^3);
 Esfuerzos_Cortantes_Vy=16*Esfuerzo_Vxy./(3*pi*Vector_Diametro.^2);
 Esfuerzos_Cortantes_Vz=16*Esfuerzo_Vxz./(3*pi*Vector_Diametro.^2);
 Matriz_Esfuerzos=[Esfuerzos_Normales_My;Esfuerzos_Normales_Mz;Esfuerzos_Cortantes_Vy;Esfuerzos_Cortantes_Vz];
 Dimensiones_Matriz=size(Matriz_Esfuerzos)
 i=find(Matriz_Esfuerzos==max(max(abs(Matriz_Esfuerzos))));
 if isempty(i)
  i=find(Matriz_Esfuerzos==-max(max(abs(Matriz_Esfuerzos))));
 end
 col=ceil(i/Dimensiones_Matriz(1));
 ren=i-(col-1)*Dimensiones_Matriz(1);
 Esfuerzo_Maximo=Matriz_Esfuerzos(ren,col)
 Punto_Max=X(col)
 figure(2)
 subplot(2,3,1),plot(X,Esfuerzo_Vxy),title('Esfuerzo Cortante en Plano XY')
 subplot(2,3,2),plot(X,Esfuerzo_Vxz),title('Esfuerzo Cortante en Plano XZ')
 subplot(2,3,3),plot(X,Momento_Mxy),title('Momento Flector en Plano XY')
 subplot(2,3,4),plot(X,Momento_Mxz),title(strcat('Momento Flector en Plano XZ'))
 subplot(2,3,5),plot(X,Diagrama_Cargas),title('Diagrama de Cargas Fx')
 subplot(2,3,6),plot(X,Diagrama_Momento),title('Diagrama de Momento')
 figure(3)
 subplot(2,4,1),plot(X,Curva_Pendiente_xy),title('Curva Pendiente en Plano XY')
 subplot(2,4,2),plot(X,Curva_Pendiente_xz),title('Curva Pendiente en Plano XZ')
 subplot(2,4,3),plot(X,Curva_Deflexion_xy),title('Curva Deflexión en Plano XY')
 subplot(2,4,4),plot(X,Curva_Deflexion_xz),title('Curva Deflexión en Plano XZ')
 subplot(2,4,5),plot(X,Esfuerzos_Normales_My),title('Esfuerzos Normales por My')
 subplot(2,4,6),plot(X,Esfuerzos_Normales_Mz),title('Esfuerzos Normales por Mz')
 subplot(2,4,7),plot(X,Esfuerzos_Cortantes_Vy),title('Esfuerzos Cortantes por Vy')
 subplot(2,4,8),plot(X,Esfuerzos_Cortantes_Vz),title('Esfuerzos Cortantes por Vz')
 %Cálculo Individual
  Punto=Valor*L_Eje
for k=1:Filas
%%Vectores de Cargas Plano xy y yx
   if k==1
   Sum_Cargas_xy_ind=Fk(k,2)*Heav2(Rk(k,1),Punto,L_Eje);
   Sum_Cargas_xz_ind=Fk(k,3)*Heav2(Rk(k,1),Punto,L_Eje);
   Sum_Momento_xy_ind=(Fk(k,2)*(Punto-Rk(k,1))+Fk(k,1)*Rk(k,2)).*Heav2(Rk(k,1),Punto,L_Eje);
   Sum_Momento_xz_ind=(Fk(k,3)*(Punto-Rk(k,1))+Fk(k,1)*Rk(k,3)).*Heav2(Rk(k,1),Punto,L_Eje);
   Sum_Cargas_xx_ind=Fk(k,1)*Heav2(Rk(k,1),Punto,L_Eje);
   Angulo_Fuerza=atand(Rk(k,3)/Rk(k,2));   
   R_Normal=Rk(k,2)*cosd(Angulo_Fuerza)+Rk(k,3)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,2)*sind(Angulo_Fuerza)+Fk(k,3)*cosd(Angulo_Fuerza);
   Sum_Torques_yz_ind=-(F_Tangencial*R_Normal)*Heav2(Rk(k,1),Punto,L_Eje)
%    Sum_Torques_yz_ind=(Fk(k,2)*Rk(k,3))*Heav2(Rk(k,1),Punto,L_Eje);
   else
   Sum_Cargas_xy_ind=Sum_Cargas_xy_ind+Fk(k,2)*Heav2(Rk(k,1),Punto,L_Eje)
   Sum_Cargas_xz_ind=Sum_Cargas_xz_ind+Fk(k,3)*Heav2(Rk(k,1),Punto,L_Eje);
   Sum_Momento_xy_ind=Sum_Momento_xy_ind+(Fk(k,2)*(Punto-Rk(k,1))+Fk(k,1)*Rk(k,2)).*Heav2(Rk(k,1),Punto,L_Eje);
   Sum_Momento_xz_ind=Sum_Momento_xz_ind+(Fk(k,3)*(Punto-Rk(k,1))+Fk(k,1)*Rk(k,3)).*Heav2(Rk(k,1),Punto,L_Eje);
   Sum_Cargas_xx_ind=Sum_Cargas_xx_ind+Fk(k,1)*Heav2(Rk(k,1),Punto,L_Eje);
   Angulo_Fuerza=atand(Rk(k,3)/Rk(k,2));   
   R_Normal=Rk(k,2)*cosd(Angulo_Fuerza)+Rk(k,3)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,2)*sind(Angulo_Fuerza)+Fk(k,3)*cosd(Angulo_Fuerza);
   Sum_Torques_yz_ind=Sum_Torques_yz_ind-(F_Tangencial*R_Normal)*Heav2(Rk(k,1),Punto,L_Eje);
%    Sum_Torques_yz_ind=Sum_Torques_xz_ind+(Fk(k,2)*Rk(k,3))*Heav2(Rk(k,1),Punto,L_Eje);
   end
end
%%Momento Cortante
 Esfuerzo_Vxy_ind=RAy*Heav2(Ra(1),Punto,L_Eje)+Sum_Cargas_xy_ind+RBy*Heav2(Rb(1),Punto,L_Eje)
 Esfuerzo_Vxz_ind=RAz*Heav2(Ra(1),Punto,L_Eje)+Sum_Cargas_xz_ind+RBz*Heav2(Rb(1),Punto,L_Eje)
%%Momentos Flectores
 Momento_Mxy_ind=RAy*(Punto-Ra(1)).*Heav2(Ra(1),Punto,L_Eje)+Sum_Momento_xy_ind+RBy*(Punto-Rb(1)).*Heav2(Rb(1),Punto,L_Eje)
 Momento_Mxz_ind=RAz*(Punto-Ra(1)).*Heav2(Ra(1),Punto,L_Eje)+Sum_Momento_xz_ind+RBz*(Punto-Rb(1)).*Heav2(Rb(1),Punto,L_Eje)
%Gráficas de Esfuerzos Resultantes Normales
 i=find(X>=Punto,1,'first');
 d=Vector_Diametro(i)%Diametro del eje.
 Fx=Sum_Cargas_xx_ind;
 Esfuerzo_Normal_Carga_Axial_Maximo=4*Fx/(pi*d^2)
 Esfuerzo_Normal_Momento_y_Maximo=32*Momento_Mxy_ind/(pi*d^3)
 Esfuerzo_Normal_Momento_z_Maximo=32*Momento_Mxz_ind/(pi*d^3)
%Vectores de Esfuerzos Normales
Abcisa2=Abcisa2r();
Esfuerzo_Normal_Carga_Axial=Esfuerzo_Normal_Carga_Axial_Maximo*(Abcisa2*0+1);
Esfuerzo_Normal_Momento_y=-Esfuerzo_Normal_Momento_y_Maximo*sind(Abcisa2);
Esfuerzo_Normal_Momento_z=Esfuerzo_Normal_Momento_z_Maximo*cosd(Abcisa2);
Esfuerzo_Normal_Resultante=Esfuerzo_Normal_Carga_Axial+Esfuerzo_Normal_Momento_y+Esfuerzo_Normal_Momento_z;
Esfuerzo_Normal_Resultante_Maximo=max(abs(Esfuerzo_Normal_Resultante));
figure(4)
 subplot(2,2,1),plot(Abcisa2,Esfuerzo_Normal_Carga_Axial),title('Esfuerzo Normal por Carga Axial')
 subplot(2,2,2),plot(Abcisa2,Esfuerzo_Normal_Momento_y),title('Esfuerzo Normal por Momento en Y')
 subplot(2,2,3),plot(Abcisa2,Esfuerzo_Normal_Momento_z),title('Esfuerzo Normal por Momento en Z')
 subplot(2,2,4),plot(Abcisa2,Esfuerzo_Normal_Resultante),title('Esfuerzo Normal Resultante')
figure(5)
factor_escala=d/50;
Graficacion_3d(Esfuerzo_Normal_Carga_Axial_Maximo,Esfuerzo_Normal_Momento_y_Maximo,Esfuerzo_Normal_Momento_z_Maximo,0,-90,180,90,d)
% %  for i=1:length(Abcisa2)
% %      An=Abcisa2(i);%Angulo a medir
% %      cosAn=d*cosd(An);
% %      sinAn=d*sind(An);
% %      subplot(2,2,1),Vector(cosAn,cosAn,0,Esfuerzo_Normal_Carga_Axial(i),sinAn,sinAn,factor_escala);
% %      subplot(2,2,2),Vector(cosAn,cosAn,0,Esfuerzo_Normal_Momento_x(i),sinAn,sinAn,factor_escala);
% %      subplot(2,2,3),Vector(cosAn,cosAn,0,Esfuerzo_Normal_Momento_z(i),sinAn,sinAn,factor_escala);
% %      subplot(2,2,4),Vector(cosAn,cosAn,0,Esfuerzo_Normal_Resultante(i),sinAn,sinAn,factor_escala);
% % %      pause(0.1);
% %      hold on
% %  end
%Gráficas de Esfuerzos Resultantes Cortantes
 Tx=Sum_Torques_yz_ind
 Esfuerzo_Cortante_Torque_Maximo=16*Tx/(pi*d^3)
 Esfuerzo_Cortante_Momento_y_Maximo=16*Esfuerzo_Vxy_ind/(3*pi*d^2)
 Esfuerzo_Cortante_Momento_z_Maximo=16*Esfuerzo_Vxz_ind/(3*pi*d^2)
%  %%Cálculos para cada ángulo
 Esfuerzo_Cortante_Momento_y=Esfuerzo_Cortante_Momento_y_Maximo*(0*Abcisa2+1);
 Esfuerzo_Cortante_Momento_yR=Esfuerzo_Cortante_Momento_y_Maximo*sind(Abcisa2).^2;%R de Radial
 Esfuerzo_Cortante_Momento_z=Esfuerzo_Cortante_Momento_z_Maximo*(0*Abcisa2+1);
 Esfuerzo_Cortante_Momento_zR=Esfuerzo_Cortante_Momento_z_Maximo*cosd(Abcisa2).^2;
 Esfuerzo_Cortante_Torque_R=Esfuerzo_Cortante_Torque_Maximo*(0*Abcisa2+1);
 Suma_Cortantes_N=Esfuerzo_Cortante_Momento_yR.*cosd(Abcisa2)+Esfuerzo_Cortante_Momento_zR.*sind(Abcisa2);
 Suma_Cortantes_N1=Esfuerzo_Cortante_Momento_yR.*cosd(Abcisa2);
 Suma_Cortantes_N2=Esfuerzo_Cortante_Momento_zR.*sind(Abcisa2);
 Suma_Cortantes_T=-Esfuerzo_Cortante_Momento_yR.*sind(Abcisa2)+Esfuerzo_Cortante_Momento_zR.*cosd(Abcisa2)+Esfuerzo_Cortante_Torque_R;
 Suma_Cortantes_T1=-Esfuerzo_Cortante_Momento_yR.*sind(Abcisa2);
 Suma_Cortantes_T2=Esfuerzo_Cortante_Momento_zR.*cosd(Abcisa2);
 Suma_Cortante_Maximo=max(sqrt(Suma_Cortantes_N.^2+Suma_Cortantes_T.^2));
 Suma_Cortante_Maximo_1=max(sqrt(Suma_Cortantes_N1.^2+Suma_Cortantes_T1.^2));
 Suma_Cortante_Maximo_2=max(sqrt(Suma_Cortantes_N2.^2+Suma_Cortantes_T2.^2));
 figure(6)
     subplot(2,3,1),plot(Abcisa2,Esfuerzo_Cortante_Momento_yR),title('Esfuerzo Cortante por Momento en Y')
     subplot(2,3,2),plot(Abcisa2,Esfuerzo_Cortante_Momento_zR),title('Esfuerzo Cortante por Momento en Z')
     subplot(2,3,3),plot(Abcisa2,Esfuerzo_Cortante_Torque_R),title('Esfuerzo Cortante por Tangencial')
     subplot(2,3,4),plot(Abcisa2,Suma_Cortantes_N),title('Suma de Esfuerzos Cortantes Normales')
     subplot(2,3,5),plot(Abcisa2,Suma_Cortantes_T),title('Suma de Esfuerzos Cortantes Tangenciales')
     subplot(2,3,6),plot(Abcisa2,sqrt(Suma_Cortantes_N.^2+Suma_Cortantes_T.^2)),title('Magnitud Esfuerzos Cortantes Resultantes')
 figure(7)    
 factor_escala=d/50;
 for i=1:length(Abcisa2)
     An=Abcisa2(i);%Angulo a medir
     cosAn=1*cosd(An);%d*cosd(An)
     sinAn=1*sind(An);%d*sind(An)
%      subplot(2,2,1),Vector(0,Esfuerzo_Cortante_Momento_x(i)/abs(Esfuerzo_Cortante_Momento_x_Maximo),0,0,sinAn,sinAn,factor_escala);axis equal
%      subplot(2,2,2),Vector(cosAn,cosAn,0,0,0,Esfuerzo_Cortante_Momento_z(i)/abs(Esfuerzo_Cortante_Momento_z_Maximo),factor_escala);axis equal
     subplot(2,2,1),Vector(0,0,cosAn,cosAn+(Suma_Cortantes_N1(i)*cosAn+Suma_Cortantes_T1(i)*cosd(An+90))/Suma_Cortante_Maximo_1...
                           ,sinAn,sinAn+(Suma_Cortantes_N1(i)*sinAn+Suma_Cortantes_T1(i)*sind(An+90))/Suma_Cortante_Maximo_1,factor_escala);axis equal
     subplot(2,2,2),Vector(0,0,cosAn,cosAn+(Suma_Cortantes_N2(i)*cosAn+Suma_Cortantes_T2(i)*cosd(An+90))/Suma_Cortante_Maximo_2...
                           ,sinAn,sinAn+(Suma_Cortantes_N2(i)*sinAn+Suma_Cortantes_T2(i)*sind(An+90))/Suma_Cortante_Maximo_2,factor_escala);axis equal
     subplot(2,2,3),Vector(0,0,cosAn,cosAn-sind(An)*Esfuerzo_Cortante_Torque_R(i)/abs(Esfuerzo_Cortante_Torque_Maximo),sinAn,sinAn+cosd(An)*Esfuerzo_Cortante_Torque_R(i)/abs(Esfuerzo_Cortante_Torque_Maximo),factor_escala);axis equal
     subplot(2,2,4),Vector(0,0,cosAn,cosAn+(Suma_Cortantes_N(i)*cosAn+Suma_Cortantes_T(i)*cosd(An+90))/Suma_Cortante_Maximo...
                           ,sinAn,sinAn+(Suma_Cortantes_N(i)*sinAn+Suma_Cortantes_T(i)*sind(An+90))/Suma_Cortante_Maximo,factor_escala);axis equal
%      pause(0.1);
     hold on
 end
Graficacion_3d2(Suma_Cortante_Maximo_1...
              ,Suma_Cortante_Maximo_2,Esfuerzo_Cortante_Torque_Maximo,Suma_Cortante_Maximo,1)
%Esfuerzos normales para un Angulo en específico
%%-------------------------------------------------------------%%
% Angulo_theta=get(handles.slider2,'Value');
%%-------------------------------------------------------------%%
Esfuerzo_Normal_Carga_Axial_ind=Esfuerzo_Normal_Carga_Axial_Maximo;
Esfuerzo_Normal_Momento_y_ind=-Esfuerzo_Normal_Momento_y_Maximo*sind(Angulo_theta);
Esfuerzo_Normal_Momento_z_ind=Esfuerzo_Normal_Momento_z_Maximo*cosd(Angulo_theta);
Esfuerzo_Normal_Resultante_ind=Esfuerzo_Normal_Carga_Axial_ind+Esfuerzo_Normal_Momento_y_ind+Esfuerzo_Normal_Momento_z_ind;
%Esfuerzos cortantes para un Angulo en específico
%%-------------------------------------------------------------%%
Esfuerzo_Cortante_Momento_y_ind=Esfuerzo_Cortante_Momento_y_Maximo
Esfuerzo_Cortante_Momento_yR_ind=Esfuerzo_Cortante_Momento_y_Maximo*sind(Angulo_theta)^2%R de Radial
Esfuerzo_Cortante_Momento_z_ind=Esfuerzo_Cortante_Momento_z_Maximo
Esfuerzo_Cortante_Momento_zR_ind=Esfuerzo_Cortante_Momento_z_Maximo*cosd(Angulo_theta)^2
Esfuerzo_Cortante_Torque_R_ind=Esfuerzo_Cortante_Torque_Maximo
Suma_Cortantes_N_ind=Esfuerzo_Cortante_Momento_yR_ind*cosd(Angulo_theta)+Esfuerzo_Cortante_Momento_zR_ind*sind(Angulo_theta)
Suma_Cortantes_T_ind=-Esfuerzo_Cortante_Momento_yR_ind*sind(Angulo_theta)+Esfuerzo_Cortante_Momento_zR_ind*cosd(Angulo_theta)+Esfuerzo_Cortante_Torque_R_ind
Suma_Cortante_Resultante_ind=sqrt(Suma_Cortantes_N_ind^2+Suma_Cortantes_T_ind^2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Circulo_Mohr(Ox,Oy,Oz,Txy,Txz,Tyz,An,P);
figure(8)
Circulo_Mohr(Esfuerzo_Normal_Resultante_ind,0,0,Suma_Cortantes_N_ind,Suma_Cortantes_T_ind,0,Angulo_theta,1);

% %%Cálculos Esfuerzo Maximo en el Eje
 Punto=Punto_Max
% 
for k=1:Filas
%%Vectores de Cargas Plano xy y yx
   if k==1
   Sum_Cargas_xy_ind=Fk(k,2)*Heav2(Rk(k,1),Punto,L_Eje);
   Sum_Cargas_xz_ind=Fk(k,3)*Heav2(Rk(k,1),Punto,L_Eje);
   Sum_Momento_xy_ind=(Fk(k,2)*(Punto-Rk(k,1))+Fk(k,1)*Rk(k,2)).*Heav2(Rk(k,1),Punto,L_Eje);
   Sum_Momento_xz_ind=(Fk(k,3)*(Punto-Rk(k,1))+Fk(k,1)*Rk(k,3)).*Heav2(Rk(k,1),Punto,L_Eje);
   Sum_Cargas_xx_ind=Fk(k,1)*Heav2(Rk(k,1),Punto,L_Eje);
   Angulo_Fuerza=atand(Rk(k,3)/Rk(k,2));   
   R_Normal=Rk(k,2)*cosd(Angulo_Fuerza)+Rk(k,3)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,2)*sind(Angulo_Fuerza)+Fk(k,3)*cosd(Angulo_Fuerza);
   Sum_Torques_yz_ind=-(F_Tangencial*R_Normal)*Heav2(Rk(k,1),Punto,L_Eje);
%    Sum_Torques_yz_ind=(Fk(k,2)*Rk(k,3))*Heav2(Rk(k,1),Punto,L_Eje);
   else
   Sum_Cargas_xy_ind=Sum_Cargas_xy_ind+Fk(k,2)*Heav2(Rk(k,1),Punto,L_Eje)
   Sum_Cargas_xz_ind=Sum_Cargas_xz_ind+Fk(k,3)*Heav2(Rk(k,1),Punto,L_Eje);
   Sum_Momento_xy_ind=Sum_Momento_xy_ind+(Fk(k,2)*(Punto-Rk(k,1))+Fk(k,1)*Rk(k,2)).*Heav2(Rk(k,1),Punto,L_Eje);
   Sum_Momento_xz_ind=Sum_Momento_xz_ind+(Fk(k,3)*(Punto-Rk(k,1))+Fk(k,1)*Rk(k,3)).*Heav2(Rk(k,1),Punto,L_Eje);
   Sum_Cargas_xx_ind=Sum_Cargas_xx_ind+Fk(k,1)*Heav2(Rk(k,1),Punto,L_Eje);   
   Angulo_Fuerza=atand(Rk(k,3)/Rk(k,2));   
   R_Normal=Rk(k,2)*cosd(Angulo_Fuerza)+Rk(k,3)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,2)*sind(Angulo_Fuerza)+Fk(k,3)*cosd(Angulo_Fuerza);
   Sum_Torques_yz_ind=Sum_Torques_yz_ind-(F_Tangencial*R_Normal)*Heav2(Rk(k,1),Punto,L_Eje);
%    Sum_Torques_yz_ind=Sum_Torques_yz_ind+(Fk(k,2)*Rk(k,3))*Heav2(Rk(k,1),Punto,L_Eje);
   end
end
%%Momento Cortante
 Esfuerzo_Vxy_ind=RAy*Heav2(Ra(1),Punto,L_Eje)+Sum_Cargas_xy_ind+RBy*Heav2(Rb(1),Punto,L_Eje)
 Esfuerzo_Vxz_ind=RAz*Heav2(Ra(1),Punto,L_Eje)+Sum_Cargas_xz_ind+RBz*Heav2(Rb(1),Punto,L_Eje)
%%Momentos Flectores
 Momento_Mxy_ind=RAy*(Punto-Ra(1)).*Heav2(Ra(1),Punto,L_Eje)+Sum_Momento_xy_ind+RBy*(Punto-Rb(1)).*Heav2(Rb(1),Punto,L_Eje)
 Momento_Mxz_ind=RAz*(Punto-Ra(1)).*Heav2(Ra(1),Punto,L_Eje)+Sum_Momento_xz_ind+RBz*(Punto-Rb(1)).*Heav2(Rb(1),Punto,L_Eje)
%Gráficas de Esfuerzos Resultantes Normales
 i=find(X>=Punto,1,'first');
 d=Vector_Diametro(i)%Diametro del eje.
 Fx=Sum_Cargas_xx_ind;
 Esfuerzo_Normal_Carga_Axial_Maximo=4*Fx/(pi*d^2)
 Esfuerzo_Normal_Momento_y_Maximo=32*Momento_Mxy_ind/(pi*d^3)
 Esfuerzo_Normal_Momento_z_Maximo=32*Momento_Mxz_ind/(pi*d^3)
%Vectores de Esfuerzos Normales
Abcisa2=Abcisa2r();
Esfuerzo_Normal_Carga_Axial=Esfuerzo_Normal_Carga_Axial_Maximo*(Abcisa2*0+1);
Esfuerzo_Normal_Momento_y=-Esfuerzo_Normal_Momento_y_Maximo*sind(Abcisa2);
Esfuerzo_Normal_Momento_z=Esfuerzo_Normal_Momento_z_Maximo*cosd(Abcisa2);
Esfuerzo_Normal_Resultante=Esfuerzo_Normal_Carga_Axial+Esfuerzo_Normal_Momento_y+Esfuerzo_Normal_Momento_z;
Esfuerzo_Normal_Resultante_Maximo=max(abs(Esfuerzo_Normal_Resultante));
i=find(Esfuerzo_Normal_Resultante==Esfuerzo_Normal_Resultante_Maximo)
if isempty(i)
   i=find(Esfuerzo_Normal_Resultante==-Esfuerzo_Normal_Resultante_Maximo) 
end
   th=Abcisa2(i)
figure(9)
 subplot(2,2,1),plot(Abcisa2,Esfuerzo_Normal_Carga_Axial),title('Esfuerzo Normal por Carga Axial')
 subplot(2,2,2),plot(Abcisa2,Esfuerzo_Normal_Momento_y),title('Esfuerzo Normal por Momento en Y')
 subplot(2,2,3),plot(Abcisa2,Esfuerzo_Normal_Momento_z),title('Esfuerzo Normal por Momento en Z')
 subplot(2,2,4),plot(Abcisa2,Esfuerzo_Normal_Resultante),title('Esfuerzo Normal Resultante')
 figure(10)
factor_escala=d/50;
Graficacion_3d(Esfuerzo_Normal_Carga_Axial_Maximo,Esfuerzo_Normal_Momento_y_Maximo,Esfuerzo_Normal_Momento_z_Maximo,0,-90,180,90,d)
%Gráficas de Esfuerzos Resultantes Cortantes
 Tx=Sum_Torques_yz_ind
 Esfuerzo_Cortante_Torque_Maximo=16*Tx/(pi*d^3)
 Esfuerzo_Cortante_Momento_y_Maximo=16*Esfuerzo_Vxy_ind/(3*pi*d^2)
 Esfuerzo_Cortante_Momento_z_Maximo=16*Esfuerzo_Vxz_ind/(3*pi*d^2)
%  %%Cálculos para cada ángulo
 Esfuerzo_Cortante_Momento_y=Esfuerzo_Cortante_Momento_y_Maximo*(0*Abcisa2+1);
 Esfuerzo_Cortante_Momento_yR=Esfuerzo_Cortante_Momento_y_Maximo*sind(Abcisa2).^2;%R de Radial
 Esfuerzo_Cortante_Momento_z=Esfuerzo_Cortante_Momento_z_Maximo*(0*Abcisa2+1);
 Esfuerzo_Cortante_Momento_zR=Esfuerzo_Cortante_Momento_z_Maximo*cosd(Abcisa2).^2;
 Esfuerzo_Cortante_Torque_R=Esfuerzo_Cortante_Torque_Maximo*(0*Abcisa2+1);
 Suma_Cortantes_N=Esfuerzo_Cortante_Momento_yR.*cosd(Abcisa2)+Esfuerzo_Cortante_Momento_zR.*sind(Abcisa2);
 Suma_Cortantes_N1=Esfuerzo_Cortante_Momento_yR.*cosd(Abcisa2);
 Suma_Cortantes_N2=Esfuerzo_Cortante_Momento_zR.*sind(Abcisa2);
 Suma_Cortantes_T=-Esfuerzo_Cortante_Momento_yR.*sind(Abcisa2)+Esfuerzo_Cortante_Momento_zR.*cosd(Abcisa2)+Esfuerzo_Cortante_Torque_R;
 Suma_Cortantes_T1=-Esfuerzo_Cortante_Momento_yR.*sind(Abcisa2);
 Suma_Cortantes_T2=Esfuerzo_Cortante_Momento_zR.*cosd(Abcisa2);
 Suma_Cortante_Maximo=max(sqrt(Suma_Cortantes_N.^2+Suma_Cortantes_T.^2));
 Suma_Cortante_Maximo_1=max(sqrt(Suma_Cortantes_N1.^2+Suma_Cortantes_T1.^2));
 Suma_Cortante_Maximo_2=max(sqrt(Suma_Cortantes_N2.^2+Suma_Cortantes_T2.^2));
figure(11)
subplot(2,3,1),plot(Abcisa2,Esfuerzo_Cortante_Momento_yR),title('Esfuerzo Cortante por Momento en Y')
     subplot(2,3,2),plot(Abcisa2,Esfuerzo_Cortante_Momento_zR),title('Esfuerzo Cortante por Momento en Z')
     subplot(2,3,3),plot(Abcisa2,Esfuerzo_Cortante_Torque_R),title('Esfuerzo Cortante por Tangencial')
     subplot(2,3,4),plot(Abcisa2,Suma_Cortantes_N),title('Suma de Esfuerzos Cortantes Normales')
     subplot(2,3,5),plot(Abcisa2,Suma_Cortantes_T),title('Suma de Esfuerzos Cortantes Tangenciales')
     subplot(2,3,6),plot(Abcisa2,sqrt(Suma_Cortantes_N.^2+Suma_Cortantes_T.^2)),title('Magnitud Esfuerzos Cortantes Resultantes')
 figure(12)    
 factor_escala=1/50;
factor_escala=d/50;
 for i=1:length(Abcisa2)
     An=Abcisa2(i);%Angulo a medir
     cosAn=1*cosd(An);%d*cosd(An)
     sinAn=1*sind(An);%d*sind(An)
%      subplot(2,2,1),Vector(0,Esfuerzo_Cortante_Momento_x(i)/abs(Esfuerzo_Cortante_Momento_x_Maximo),0,0,sinAn,sinAn,factor_escala);axis equal
%      subplot(2,2,2),Vector(cosAn,cosAn,0,0,0,Esfuerzo_Cortante_Momento_z(i)/abs(Esfuerzo_Cortante_Momento_z_Maximo),factor_escala);axis equal
     subplot(2,2,1),Vector(0,0,cosAn,cosAn+(Suma_Cortantes_N1(i)*cosAn+Suma_Cortantes_T1(i)*cosd(An+90))/Suma_Cortante_Maximo_1...
                           ,sinAn,sinAn+(Suma_Cortantes_N1(i)*sinAn+Suma_Cortantes_T1(i)*sind(An+90))/Suma_Cortante_Maximo_1,factor_escala);axis equal
     subplot(2,2,2),Vector(0,0,cosAn,cosAn+(Suma_Cortantes_N2(i)*cosAn+Suma_Cortantes_T2(i)*cosd(An+90))/Suma_Cortante_Maximo_2...
                           ,sinAn,sinAn+(Suma_Cortantes_N2(i)*sinAn+Suma_Cortantes_T2(i)*sind(An+90))/Suma_Cortante_Maximo_2,factor_escala);axis equal
     subplot(2,2,3),Vector(0,0,cosAn,cosAn-sind(An)*Esfuerzo_Cortante_Torque_R(i)/abs(Esfuerzo_Cortante_Torque_Maximo),sinAn,sinAn+cosd(An)*Esfuerzo_Cortante_Torque_R(i)/abs(Esfuerzo_Cortante_Torque_Maximo),factor_escala);axis equal
     subplot(2,2,4),Vector(0,0,cosAn,cosAn+(Suma_Cortantes_N(i)*cosAn+Suma_Cortantes_T(i)*cosd(An+90))/Suma_Cortante_Maximo...
                           ,sinAn,sinAn+(Suma_Cortantes_N(i)*sinAn+Suma_Cortantes_T(i)*sind(An+90))/Suma_Cortante_Maximo,factor_escala);axis equal
%      pause(0.1);
     hold on
 end
Graficacion_3d2(Suma_Cortante_Maximo_1...
              ,Suma_Cortante_Maximo_2,Esfuerzo_Cortante_Torque_Maximo,Suma_Cortante_Maximo,1)
% %Esfuerzos normales para un Angulo en específico
% %%-------------------------------------------------------------%%
Angulo_theta=th;
% %%-------------------------------------------------------------%%
Esfuerzo_Normal_Carga_Axial_ind=Esfuerzo_Normal_Carga_Axial_Maximo
Esfuerzo_Normal_Momento_y_ind=-Esfuerzo_Normal_Momento_y_Maximo*sind(Angulo_theta)
Esfuerzo_Normal_Momento_z_ind=Esfuerzo_Normal_Momento_z_Maximo*cosd(Angulo_theta)
Esfuerzo_Normal_Resultante_ind=Esfuerzo_Normal_Carga_Axial_ind+Esfuerzo_Normal_Momento_y_ind+Esfuerzo_Normal_Momento_z_ind;
% %Esfuerzos cortantes para un Angulo en específico
% %%-------------------------------------------------------------%%
Esfuerzo_Cortante_Momento_y_ind=Esfuerzo_Cortante_Momento_y_Maximo
Esfuerzo_Cortante_Momento_yR_ind=Esfuerzo_Cortante_Momento_y_Maximo*sind(Angulo_theta)^2%R de Radial
Esfuerzo_Cortante_Momento_z_ind=Esfuerzo_Cortante_Momento_z_Maximo
Esfuerzo_Cortante_Momento_zR_ind=Esfuerzo_Cortante_Momento_z_Maximo*cosd(Angulo_theta)^2
Esfuerzo_Cortante_Torque_R_ind=Esfuerzo_Cortante_Torque_Maximo
Suma_Cortantes_N_ind=Esfuerzo_Cortante_Momento_yR_ind*cosd(Angulo_theta)+Esfuerzo_Cortante_Momento_zR_ind*sind(Angulo_theta)
Suma_Cortantes_T_ind=-Esfuerzo_Cortante_Momento_yR_ind*sind(Angulo_theta)+Esfuerzo_Cortante_Momento_zR_ind*cosd(Angulo_theta)+Esfuerzo_Cortante_Torque_R_ind
Suma_Cortante_Resultante_ind=sqrt(Suma_Cortantes_N_ind^2+Suma_Cortantes_T_ind^2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Circulo_Mohr(Ox,Oy,Oz,Txy,Txz,Tyz,An,P);
figure(13)
Circulo_Mohr(Esfuerzo_Normal_Resultante_ind,0,0,Suma_Cortantes_N_ind,Suma_Cortantes_T_ind,0,Angulo_theta,1);

function[]=Eje_Y(Ra,Rb,Rab,Rba,Filas,Rk,Fk,RkA,RkB,L,L1,L2,L3,L4,L5,Valor,Angulo_theta)
k=Filas;
    %Reacciones en A
% (X'RkB)*(Y'Fk)-(Y'RkB)*(X'Fk)
RAx=sum((RkB(1:k,1)).*Fk(1:k,2)-(RkB(1:k,2)).*Fk(1:k,1))/Rab(2);
% (Z'RkB)*(Y'Fk)-(Y'RkB)*(Z'Fk)
RAz=sum((RkB(1:k,3)).*Fk(1:k,2)-(RkB(1:k,2)).*Fk(1:k,3))/Rab(2);
%Reacciones en B
% (X'RkA)*(Y'Fk)-(Y'RkA)*(X'Fk)
RBx=sum((RkA(1:k,1)).*Fk(1:k,2)-(RkA(1:k,2)).*Fk(1:k,1))/Rba(2);
% (Z'RkA)*(Y'Fk)-(Y'RkA)*(Z'Fk)
RBz=sum((RkA(1:k,3)).*Fk(1:k,2)-(RkA(1:k,2)).*Fk(1:k,3))/Rba(2);
%Reacciones
RAy=0;
RBy=RAy-sum(Fk(1:k,2));
RAr=[RAx RAy RAz]
RBr=[RBx RBy RBz]
%%------------------------------------------------------
if Ra(2)>=Rb(2)
L_Eje=Ra(2)*1.5;
else
L_Eje=Rb(2)*1.5;
end
Y=Abcisa(L_Eje);
% Valor=get(handles.slider1,'Value');
% set(handles.text3,'String',strcat(num2str(Valor),'*L=',strcat(num2str(Valor*L_Eje))))
% set(handles.text5,'String',L_Eje)
%Creación del vector con las longitudes deseadas

Vector_Diametro(length(Y))=0;
for i=1:length(Y)
    if  Y(i)>=L1(1) && Y(i)<L2(1) 
       Vector_Diametro(i)=L1(2);
    elseif L2(1)<Y(i) &&  Y(i)<=L3(1)
       Vector_Diametro(i)=L2(2);
    elseif L3(1)<Y(i) &&  Y(i)<=L4(1)
       Vector_Diametro(i)=L3(2);
    elseif L4(1)<Y(i) &&  Y(i)<=L5(1)
       Vector_Diametro(i)=L4(2);
    elseif L5(1)<Y(i) &&  Y(i)<=L_Eje
       Vector_Diametro(i)=L5(2);
    else
       Vector_Diametro(i)=1; 
    end
end
figure(1)
Grafica_de_Cargas(L,Ra,Rb,RAr,RBr,Rk,Fk,Filas,2);

for k=1:Filas
%%Vectores de Cargas Plano xy y yx
   if k==1
   Sum_Cargas_yx=Fk(k,1)*Heav(Rk(k,2),L_Eje);
   Sum_Cargas_yy=Fk(k,2)*Heav(Rk(k,2),L_Eje);
   Sum_Cargas_yz=Fk(k,3)*Heav(Rk(k,2),L_Eje);
   Sum_Momento_yx=(Fk(k,1)*(Y-Rk(k,2))+Fk(k,2)*Rk(k,1)).*Heav(Rk(k,2),L_Eje);
   Sum_Momento_yz=(Fk(k,3)*(Y-Rk(k,2))+Fk(k,2)*Rk(k,3)).*Heav(Rk(k,2),L_Eje);
   Sum_Pendiente_yx=((1/2)*Fk(k,1)*(Y-Rk(k,2)).^2+Fk(k,2)*Rk(k,1)*(Y-Rk(k,2))).*Heav(Rk(k,2),L_Eje);
   Sum_Pendiente_yz=((1/2)*Fk(k,3)*(Y-Rk(k,2)).^2+Fk(k,2)*Rk(k,3)*(Y-Rk(k,2))).*Heav(Rk(k,2),L_Eje);
   Sum_Deflexion_yx=((1/6)*Fk(k,1)*(Y-Rk(k,2)).^3+(1/2)*Fk(k,2)*Rk(k,1)*(Y-Rk(k,2)).^2).*Heav(Rk(k,2),L_Eje);
   Sum_Deflexion_yz=((1/6)*Fk(k,3)*(Y-Rk(k,2)).^3+(1/2)*Fk(k,2)*Rk(k,3)*(Y-Rk(k,2)).^2).*Heav(Rk(k,2),L_Eje);
   Angulo_Fuerza=atand(Rk(k,3)/Rk(k,1));   
   R_Normal=Rk(k,1)*cosd(Angulo_Fuerza)+Rk(k,3)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,1)*sind(Angulo_Fuerza)+Fk(k,3)*cosd(Angulo_Fuerza);
   Sum_Torques_xz=-(F_Tangencial*R_Normal)*Heav(Rk(k,2),L_Eje);
%    Sum_Torques_xz=(Fk(k,1)*Rk(k,3))*Heav(Rk(k,2),L_Eje);
   else
   Sum_Cargas_yx=Sum_Cargas_yx+Fk(k,1)*Heav(Rk(k,2),L_Eje);
   Sum_Cargas_yy=Sum_Cargas_yy+Fk(k,2)*Heav(Rk(k,2),L_Eje);
   Sum_Cargas_yz=Sum_Cargas_yz+Fk(k,3)*Heav(Rk(k,2),L_Eje);
   Sum_Momento_yx=Sum_Momento_yx+(Fk(k,1)*(Y-Rk(k,2))+Fk(k,2)*Rk(k,1)).*Heav(Rk(k,2),L_Eje);
   Sum_Momento_yz=Sum_Momento_yz+(Fk(k,3)*(Y-Rk(k,2))+Fk(k,2)*Rk(k,3)).*Heav(Rk(k,2),L_Eje);
   Sum_Pendiente_yx=Sum_Pendiente_yx+((1/2)*Fk(k,1)*(Y-Rk(k,2)).^2+Fk(k,2)*Rk(k,1)*(Y-Rk(k,2))).*Heav(Rk(k,2),L_Eje);
   Sum_Pendiente_yz=Sum_Pendiente_yz+((1/2)*Fk(k,3)*(Y-Rk(k,2)).^2+Fk(k,2)*Rk(k,3)*(Y-Rk(k,2))).*Heav(Rk(k,2),L_Eje);
   Sum_Deflexion_yx=Sum_Deflexion_yx+((1/6)*Fk(k,1)*(Y-Rk(k,2)).^3+(1/2)*Fk(k,2)*Rk(k,1)*(Y-Rk(k,2)).^2).*Heav(Rk(k,2),L_Eje);
   Sum_Deflexion_yz=Sum_Deflexion_yz+((1/6)*Fk(k,3)*(Y-Rk(k,2)).^3+(1/2)*Fk(k,2)*Rk(k,3)*(Y-Rk(k,2)).^2).*Heav(Rk(k,2),L_Eje);
   Angulo_Fuerza=atand(Rk(k,3)/Rk(k,1));   
   R_Normal=Rk(k,1)*cosd(Angulo_Fuerza)+Rk(k,3)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,1)*sind(Angulo_Fuerza)+Fk(k,3)*cosd(Angulo_Fuerza);
   Sum_Torques_xz=Sum_Torques_xz-(F_Tangencial*R_Normal)*Heav(Rk(k,2),L_Eje);
%    Sum_Torques_xz=Sum_Torques_xz+(Fk(k,1)*Rk(k,3))*Heav(Rk(k,2),L_Eje);
   end
end
%%Cálculo de Gráficas de Fuerzas Cortantes
 Esfuerzo_Vyx=RAx*Heav(Ra(2),L_Eje)+Sum_Cargas_yx+RBx*Heav(Rb(2),L_Eje);
 Esfuerzo_Vyz=RAz*Heav(Ra(2),L_Eje)+Sum_Cargas_yz+RBz*Heav(Rb(2),L_Eje);
 %%Momentos Flectores
 Momento_Myx=RAx*(Y-Ra(2)).*Heav(Ra(2),L_Eje)+Sum_Momento_yx+RBx*(Y-Rb(2)).*Heav(Rb(2),L_Eje);
 Momento_Myz=RAz*(Y-Ra(2)).*Heav(Ra(2),L_Eje)+Sum_Momento_yz+RBz*(Y-Rb(2)).*Heav(Rb(2),L_Eje);
 Diagrama_Cargas=RAy*Heav(Ra(2),L_Eje)+Sum_Cargas_yy+RBy*Heav(Rb(2),L_Eje);
 Diagrama_Momento=Sum_Torques_xz;
%  %%Curva pendiente
 E=29.7*10^6;
 I=pi*(Vector_Diametro).^4/64;
 K0=1./(E*I);
 Curva_Pendiente_yx=K0.*(RAx*(Y-Ra(2)).^2.*Heav(Ra(2),L_Eje)/2+Sum_Pendiente_yx+RBx*(Y-Rb(2)).^2.*Heav(Rb(2),L_Eje)/2);
 Curva_Pendiente_yz=K0.*(RAz*(Y-Ra(2)).^2.*Heav(Ra(2),L_Eje)/2+Sum_Pendiente_yz+RBz*(Y-Rb(2)).^2.*Heav(Rb(2),L_Eje)/2);
%  %%Curva de Flexión
 Curva_Deflexion_yx=K0.*(RAx*(Y-Ra(2)).^3.*Heav(Ra(2),L_Eje)/6+Sum_Deflexion_yx+RBx*(Y-Rb(2)).^3.*Heav(Rb(2),L_Eje)/6);
 Curva_Deflexion_yz=K0.*(RAz*(Y-Ra(2)).^3.*Heav(Ra(2),L_Eje)/6+Sum_Deflexion_yz+RBz*(Y-Rb(2)).^3.*Heav(Rb(2),L_Eje)/6);
 a=find(Y>=Ra(2),1,'first');
 b=find(Y<Rb(2),1,'last');
 CA=([Y(a) 1;Y(b) 1])\[-Curva_Deflexion_yx(a);-Curva_Deflexion_yx(b)];
 CB=([Y(a) 1;Y(b) 1])\[-Curva_Deflexion_yz(a);-Curva_Deflexion_yz(b)];
 Curva_Pendiente_yx=Curva_Pendiente_yx+CA(1);
 Curva_Pendiente_yz=Curva_Pendiente_yz+CB(1);
 Curva_Deflexion_yx=Curva_Deflexion_yx+CA(1)*Y+CA(2);
 Curva_Deflexion_yz=Curva_Deflexion_yz+CB(1)*Y+CB(2);
 Curva_Pendiente_yx=Curva_Pendiente_yx.*(Heav(Ra(3),L_Eje)-Heav(L_Eje,L_Eje));
 Curva_Pendiente_yz=Curva_Pendiente_yz.*(Heav(Ra(3),L_Eje)-Heav(L_Eje,L_Eje));
 Curva_Deflexion_yx=Curva_Deflexion_yx.*(Heav(Ra(3),L_Eje)-Heav(L_Eje,L_Eje));
 Curva_Deflexion_yz=Curva_Deflexion_yz.*(Heav(Ra(3),L_Eje)-Heav(L_Eje,L_Eje));
 %%Curvas de Esfuerzo_Vyx Cortantes Normales
 Esfuerzos_Normales_Mx=32*Momento_Myx./(pi*Vector_Diametro.^3);
 Esfuerzos_Normales_Mz=32*Momento_Myz./(pi*Vector_Diametro.^3);
 Esfuerzos_Cortantes_Vx=16*Esfuerzo_Vyx./(3*pi*Vector_Diametro.^2);
 Esfuerzos_Cortantes_Vz=16*Esfuerzo_Vyz./(3*pi*Vector_Diametro.^2);
 Matriz_Esfuerzos=[Esfuerzos_Normales_Mx;Esfuerzos_Normales_Mz;Esfuerzos_Cortantes_Vx;Esfuerzos_Cortantes_Vz];
 Dimensiones_Matriz=size(Matriz_Esfuerzos)
 i=find(Matriz_Esfuerzos==max(max(abs(Matriz_Esfuerzos))))
 if isempty(i)
  i=find(Matriz_Esfuerzos==-max(max(abs(Matriz_Esfuerzos))))
 end
 col=ceil(i/Dimensiones_Matriz(1));
 ren=i-(col-1)*Dimensiones_Matriz(1);
 Esfuerzo_Maximo=Matriz_Esfuerzos(ren,col)
 Punto_Max=Y(col)
 figure(2)
 subplot(2,3,1),plot(Y,Esfuerzo_Vyx),title('Esfuerzo Cortante en Plano YX')
 subplot(2,3,2),plot(Y,Esfuerzo_Vyz),title('Esfuerzo Cortante en Plano YZ')
 subplot(2,3,3),plot(Y,Momento_Myx),title('Momento Flector en Plano YX')
 subplot(2,3,4),plot(Y,Momento_Myz),title(strcat('Momento Flector en Plano YZ'))
 subplot(2,3,5),plot(Y,Diagrama_Cargas),title('Diagrama de Cargas Fy')
 subplot(2,3,6),plot(Y,Diagrama_Momento),title('Diagrama de Momento')
 figure(3)
 subplot(2,4,1),plot(Y,Curva_Pendiente_yx),title('Curva Pendiente en Plano YX')
 subplot(2,4,2),plot(Y,Curva_Pendiente_yz),title('Curva Pendiente en Plano YZ')
 subplot(2,4,3),plot(Y,Curva_Deflexion_yx),title('Curva Deflexión en Plano YX')
 subplot(2,4,4),plot(Y,Curva_Deflexion_yz),title('Curva Deflexión en Plano YZ')
 subplot(2,4,5),plot(Y,Esfuerzos_Normales_Mx),title('Esfuerzos Normales por Mx')
 subplot(2,4,6),plot(Y,Esfuerzos_Normales_Mz),title('Esfuerzos Normales por Mz')
 subplot(2,4,7),plot(Y,Esfuerzos_Cortantes_Vx),title('Esfuerzos Cortantes por Vx')
 subplot(2,4,8),plot(Y,Esfuerzos_Cortantes_Vz),title('Esfuerzos Cortantes por Vz')
 %Cálculo Individual
 uisave();
 %%uisave('Y','I','K0','Esfuerzo_Vyz','Momento_Myz','Esfuerzos_Cortantes_Vz','Esfuerzos_Normales_Mz');
 Punto=Valor*L_Eje
for k=1:Filas
%%Vectores de Cargas Plano xy y yx
   if k==1
   Sum_Cargas_yx_ind=Fk(k,1)*Heav2(Rk(k,2),Punto,L_Eje);
   Sum_Cargas_yz_ind=Fk(k,3)*Heav2(Rk(k,2),Punto,L_Eje);
   Sum_Momento_yx_ind=(Fk(k,1)*(Punto-Rk(k,2))+Fk(k,2)*Rk(k,1)).*Heav2(Rk(k,2),Punto,L_Eje);
   Sum_Momento_yz_ind=(Fk(k,3)*(Punto-Rk(k,2))+Fk(k,2)*Rk(k,3)).*Heav2(Rk(k,2),Punto,L_Eje);
   Sum_Cargas_yy_ind=Fk(k,2)*Heav2(Rk(k,2),Punto,L_Eje);
   Angulo_Fuerza=atand(Rk(k,3)/Rk(k,1));   
   R_Normal=Rk(k,1)*cosd(Angulo_Fuerza)+Rk(k,3)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,1)*sind(Angulo_Fuerza)+Fk(k,3)*cosd(Angulo_Fuerza);
   Sum_Torques_xz_ind=-(F_Tangencial*R_Normal)*Heav2(Rk(k,2),Punto,L_Eje);
%    Sum_Torques_xz_ind=(Fk(k,1)*Rk(k,3))*Heav2(Rk(k,2),Punto,L_Eje);
   else
   Sum_Cargas_yx_ind=Sum_Cargas_yx_ind+Fk(k,1)*Heav2(Rk(k,2),Punto,L_Eje)
   Sum_Cargas_yz_ind=Sum_Cargas_yz_ind+Fk(k,3)*Heav2(Rk(k,2),Punto,L_Eje);
   Sum_Momento_yx_ind=Sum_Momento_yx_ind+(Fk(k,1)*(Punto-Rk(k,2))+Fk(k,2)*Rk(k,1)).*Heav2(Rk(k,2),Punto,L_Eje);
   Sum_Momento_yz_ind=Sum_Momento_yz_ind+(Fk(k,3)*(Punto-Rk(k,2))+Fk(k,2)*Rk(k,3)).*Heav2(Rk(k,2),Punto,L_Eje);
   Sum_Cargas_yy_ind=Sum_Cargas_yy_ind+Fk(k,2)*Heav2(Rk(k,2),Punto,L_Eje);
   Angulo_Fuerza=atand(Rk(k,3)/Rk(k,1)); 
   R_Normal=Rk(k,1)*cosd(Angulo_Fuerza)+Rk(k,3)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,1)*sind(Angulo_Fuerza)+Fk(k,3)*cosd(Angulo_Fuerza);
   Sum_Torques_xz_ind=Sum_Torques_xz_ind-(F_Tangencial*R_Normal)*Heav2(Rk(k,2),Punto,L_Eje);
%    Sum_Torques_xz_ind=Sum_Torques_xz_ind+(Fk(k,1)*Rk(k,3))*Heav2(Rk(k,2),Punto,L_Eje);
   end
end
%%Momento Cortante
 Esfuerzo_Vyx_ind=RAx*Heav2(Ra(2),Punto,L_Eje)+Sum_Cargas_yx_ind+RBx*Heav2(Rb(2),Punto,L_Eje)
 Esfuerzo_Vyz_ind=RAz*Heav2(Ra(2),Punto,L_Eje)+Sum_Cargas_yz_ind+RBz*Heav2(Rb(2),Punto,L_Eje)
%%Momentos Flectores
 Momento_Myx_ind=RAx*(Punto-Ra(2)).*Heav2(Ra(2),Punto,L_Eje)+Sum_Momento_yx_ind+RBx*(Punto-Rb(2)).*Heav2(Rb(2),Punto,L_Eje)
 Momento_Myz_ind=RAz*(Punto-Ra(2)).*Heav2(Ra(2),Punto,L_Eje)+Sum_Momento_yz_ind+RBz*(Punto-Rb(2)).*Heav2(Rb(2),Punto,L_Eje)
%Gráficas de Esfuerzos Resultantes Normales
 i=find(Y>=Punto,1,'first');
 d=Vector_Diametro(i)%Diametro del eje.
 Fy=Sum_Cargas_yy_ind;
 Esfuerzo_Normal_Carga_Axial_Maximo=4*Fy/(pi*d^2)
 Esfuerzo_Normal_Momento_x_Maximo=32*Momento_Myx_ind/(pi*d^3)
 Esfuerzo_Normal_Momento_z_Maximo=32*Momento_Myz_ind/(pi*d^3)
%Vectores de Esfuerzos Normales
Abcisa2=Abcisa2r();
Esfuerzo_Normal_Carga_Axial=Esfuerzo_Normal_Carga_Axial_Maximo*(Abcisa2*0+1);
Esfuerzo_Normal_Momento_x=-Esfuerzo_Normal_Momento_x_Maximo*sind(Abcisa2);
Esfuerzo_Normal_Momento_z=Esfuerzo_Normal_Momento_z_Maximo*cosd(Abcisa2);
Esfuerzo_Normal_Resultante=Esfuerzo_Normal_Carga_Axial+Esfuerzo_Normal_Momento_x+Esfuerzo_Normal_Momento_z;
Esfuerzo_Normal_Resultante_Maximo=max(Esfuerzo_Normal_Resultante);
figure(4)
 subplot(2,2,1),plot(Abcisa2,Esfuerzo_Normal_Carga_Axial),title('Esfuerzo Normal por Carga Axial')
 subplot(2,2,2),plot(Abcisa2,Esfuerzo_Normal_Momento_x),title('Esfuerzo Normal por Momento en X')
 subplot(2,2,3),plot(Abcisa2,Esfuerzo_Normal_Momento_z),title('Esfuerzo Normal por Momento en Z')
 subplot(2,2,4),plot(Abcisa2,Esfuerzo_Normal_Resultante),title('Esfuerzo Normal Resultante')
figure(5)
factor_escala=d/50;
Graficacion_3d(Esfuerzo_Normal_Carga_Axial_Maximo,Esfuerzo_Normal_Momento_x_Maximo,Esfuerzo_Normal_Momento_z_Maximo,-90,0,180,90,d)
%  for i=1:length(Abcisa2)
%      An=Abcisa2(i);%Angulo a medir
%      cosAn=d*cosd(An);
%      sinAn=d*sind(An);
%      subplot(2,2,1),Vector(cosAn,cosAn,0,Esfuerzo_Normal_Carga_Axial(i),sinAn,sinAn,factor_escala);
%      subplot(2,2,2),Vector(cosAn,cosAn,0,Esfuerzo_Normal_Momento_x(i),sinAn,sinAn,factor_escala);
%      subplot(2,2,3),Vector(cosAn,cosAn,0,Esfuerzo_Normal_Momento_z(i),sinAn,sinAn,factor_escala);
%      subplot(2,2,4),Vector(cosAn,cosAn,0,Esfuerzo_Normal_Resultante(i),sinAn,sinAn,factor_escala);
% %      pause(0.1);
%      hold on
%  end
%Gráficas de Esfuerzos Resultantes Cortantes
 Ty=Sum_Torques_xz_ind
 Esfuerzo_Cortante_Torque_Maximo=16*Ty/(pi*d^3)
 Esfuerzo_Cortante_Momento_x_Maximo=16*Esfuerzo_Vyx_ind/(3*pi*d^2)
 Esfuerzo_Cortante_Momento_z_Maximo=16*Esfuerzo_Vyz_ind/(3*pi*d^2)
 %%Cálculos para cada ángulo
 Esfuerzo_Cortante_Momento_x=Esfuerzo_Cortante_Momento_x_Maximo*(0*Abcisa2+1);
 Esfuerzo_Cortante_Momento_xR=Esfuerzo_Cortante_Momento_x_Maximo*sind(Abcisa2).^2;%R de Radial
 Esfuerzo_Cortante_Momento_z=Esfuerzo_Cortante_Momento_z_Maximo*(0*Abcisa2+1);
 Esfuerzo_Cortante_Momento_zR=Esfuerzo_Cortante_Momento_z_Maximo*cosd(Abcisa2).^2;
 Esfuerzo_Cortante_Torque_R=Esfuerzo_Cortante_Torque_Maximo*(0*Abcisa2+1);
 Suma_Cortantes_N=Esfuerzo_Cortante_Momento_xR.*cosd(Abcisa2)+Esfuerzo_Cortante_Momento_zR.*sind(Abcisa2);
 Suma_Cortantes_N1=Esfuerzo_Cortante_Momento_xR.*cosd(Abcisa2);
 Suma_Cortantes_N2=Esfuerzo_Cortante_Momento_zR.*sind(Abcisa2);
 Suma_Cortantes_T=-Esfuerzo_Cortante_Momento_xR.*sind(Abcisa2)+Esfuerzo_Cortante_Momento_zR.*cosd(Abcisa2)+Esfuerzo_Cortante_Torque_R;
 Suma_Cortantes_T1=-Esfuerzo_Cortante_Momento_xR.*sind(Abcisa2);
 Suma_Cortantes_T2=Esfuerzo_Cortante_Momento_zR.*cosd(Abcisa2);
 Suma_Cortante_Maximo=max(sqrt(Suma_Cortantes_N.^2+Suma_Cortantes_T.^2));
 Suma_Cortante_Maximo_1=max(sqrt(Suma_Cortantes_N1.^2+Suma_Cortantes_T1.^2));
 Suma_Cortante_Maximo_2=max(sqrt(Suma_Cortantes_N2.^2+Suma_Cortantes_T2.^2));
 figure(6)
     subplot(2,3,1),plot(Abcisa2,Esfuerzo_Cortante_Momento_xR),title('Esfuerzo Cortante por Momento en X')
     subplot(2,3,2),plot(Abcisa2,Esfuerzo_Cortante_Momento_zR),title('Esfuerzo Cortante por Momento en Z')
     subplot(2,3,3),plot(Abcisa2,Esfuerzo_Cortante_Torque_R),title('Esfuerzo Cortante por Tangencial')
     subplot(2,3,4),plot(Abcisa2,Suma_Cortantes_N),title('Suma de Esfuerzos Cortantes Normales')
     subplot(2,3,5),plot(Abcisa2,Suma_Cortantes_T),title('Suma de Esfuerzos Cortantes Tangenciales')
     subplot(2,3,6),plot(Abcisa2,sqrt(Suma_Cortantes_N.^2+Suma_Cortantes_T.^2)),title('Magnitud Esfuerzos Cortantes Resultantes')
 figure(7)    
 factor_escala=1/50;
 for i=1:length(Abcisa2)
     An=Abcisa2(i);%Angulo a medir
     cosAn=1*cosd(An);%d*cosd(An)
     sinAn=1*sind(An);%d*sind(An)
%      subplot(2,2,1),Vector(0,Esfuerzo_Cortante_Momento_x(i)/abs(Esfuerzo_Cortante_Momento_x_Maximo),0,0,sinAn,sinAn,factor_escala);axis equal
%      subplot(2,2,2),Vector(cosAn,cosAn,0,0,0,Esfuerzo_Cortante_Momento_z(i)/abs(Esfuerzo_Cortante_Momento_z_Maximo),factor_escala);axis equal
     subplot(2,2,1),Vector(cosAn,cosAn+(Suma_Cortantes_N1(i)*cosAn+Suma_Cortantes_T1(i)*cosd(An+90))/Suma_Cortante_Maximo_1...
                           ,0,0,sinAn,sinAn+(Suma_Cortantes_N1(i)*sinAn+Suma_Cortantes_T1(i)*sind(An+90))/Suma_Cortante_Maximo_1,factor_escala);axis equal
     subplot(2,2,2),Vector(cosAn,cosAn+(Suma_Cortantes_N2(i)*cosAn+Suma_Cortantes_T2(i)*cosd(An+90))/Suma_Cortante_Maximo_2...
                           ,0,0,sinAn,sinAn+(Suma_Cortantes_N2(i)*sinAn+Suma_Cortantes_T2(i)*sind(An+90))/Suma_Cortante_Maximo_2,factor_escala);axis equal
     subplot(2,2,3),Vector(cosAn,cosAn-sind(An)*Esfuerzo_Cortante_Torque_R(i)/abs(Esfuerzo_Cortante_Torque_Maximo),0,0,sinAn,sinAn+cosd(An)*Esfuerzo_Cortante_Torque_R(i)/abs(Esfuerzo_Cortante_Torque_Maximo),factor_escala);axis equal
     subplot(2,2,4),Vector(cosAn,cosAn+(Suma_Cortantes_N(i)*cosAn+Suma_Cortantes_T(i)*cosd(An+90))/Suma_Cortante_Maximo...
                           ,0,0,sinAn,sinAn+(Suma_Cortantes_N(i)*sinAn+Suma_Cortantes_T(i)*sind(An+90))/Suma_Cortante_Maximo,factor_escala);axis equal
%      pause(0.1);
     hold on
 end
Graficacion_3d2(Suma_Cortante_Maximo_1...
              ,Suma_Cortante_Maximo_2,Esfuerzo_Cortante_Torque_Maximo,Suma_Cortante_Maximo,2)
%Esfuerzos normales para un Angulo en específico
%%-------------------------------------------------------------%%
% Angulo_theta=get(handles.slider2,'Value');
%%-------------------------------------------------------------%%
Esfuerzo_Normal_Carga_Axial_ind=Esfuerzo_Normal_Carga_Axial_Maximo;
Esfuerzo_Normal_Momento_x_ind=-Esfuerzo_Normal_Momento_x_Maximo*sind(Angulo_theta);
Esfuerzo_Normal_Momento_z_ind=Esfuerzo_Normal_Momento_z_Maximo*cosd(Angulo_theta);
Esfuerzo_Normal_Resultante_ind=Esfuerzo_Normal_Carga_Axial_ind+Esfuerzo_Normal_Momento_x_ind+Esfuerzo_Normal_Momento_z_ind;
%Esfuerzos cortantes para un Angulo en específico
%%-------------------------------------------------------------%%
Esfuerzo_Cortante_Momento_x_ind=Esfuerzo_Cortante_Momento_x_Maximo
Esfuerzo_Cortante_Momento_xR_ind=Esfuerzo_Cortante_Momento_x_Maximo*sind(Angulo_theta)^2%R de Radial
Esfuerzo_Cortante_Momento_z_ind=Esfuerzo_Cortante_Momento_z_Maximo
Esfuerzo_Cortante_Momento_zR_ind=Esfuerzo_Cortante_Momento_z_Maximo*cosd(Angulo_theta)^2
Esfuerzo_Cortante_Torque_R_ind=Esfuerzo_Cortante_Torque_Maximo
Suma_Cortantes_N_ind=Esfuerzo_Cortante_Momento_xR_ind*cosd(Angulo_theta)+Esfuerzo_Cortante_Momento_zR_ind*sind(Angulo_theta)
if (isnan(-Esfuerzo_Cortante_Momento_xR_ind*sind(Angulo_theta)+Esfuerzo_Cortante_Momento_zR_ind*cosd(Angulo_theta)+Esfuerzo_Cortante_Torque_R_ind)==1)
    Suma_Cortantes_T_ind=0;
else    
    Suma_Cortantes_T_ind=-Esfuerzo_Cortante_Momento_xR_ind*sind(Angulo_theta)+Esfuerzo_Cortante_Momento_zR_ind*cosd(Angulo_theta)+Esfuerzo_Cortante_Torque_R_ind
end
    Suma_Cortante_Resultante_ind=sqrt(Suma_Cortantes_N_ind^2+Suma_Cortantes_T_ind^2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Circulo_Mohr(Ox,Oy,Oz,Txy,Txz,Tyz,An,P);
figure(8)
Circulo_Mohr(0,Esfuerzo_Normal_Resultante_ind,0,Suma_Cortantes_N_ind,0,Suma_Cortantes_T_ind,Angulo_theta,2);

%%Cálculos Esfuerzo Maximo en el Eje
Punto=Punto_Max

for k=1:Filas
%%Vectores de Cargas Plano xy y yx
   if k==1
   Sum_Cargas_yx_ind=Fk(k,1)*Heav2(Rk(k,2),Punto,L_Eje);
   Sum_Cargas_yz_ind=Fk(k,3)*Heav2(Rk(k,2),Punto,L_Eje);
   Sum_Momento_yx_ind=(Fk(k,1)*(Punto-Rk(k,2))+Fk(k,2)*Rk(k,1)).*Heav2(Rk(k,2),Punto,L_Eje);
   Sum_Momento_yz_ind=(Fk(k,3)*(Punto-Rk(k,2))+Fk(k,2)*Rk(k,3)).*Heav2(Rk(k,2),Punto,L_Eje);
   Sum_Cargas_yy_ind=Fk(k,2)*Heav2(Rk(k,2),Punto,L_Eje);
   Angulo_Fuerza=atand(Rk(k,3)/Rk(k,1)); 
   R_Normal=Rk(k,1)*cosd(Angulo_Fuerza)+Rk(k,3)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,1)*sind(Angulo_Fuerza)+Fk(k,3)*cosd(Angulo_Fuerza);
   Sum_Torques_xz_ind=-(F_Tangencial*R_Normal)*Heav2(Rk(k,2),Punto,L_Eje);
%    Sum_Torques_xz_ind=(Fk(k,1)*Rk(k,3))*Heav2(Rk(k,2),Punto,L_Eje);
   else
   Sum_Cargas_yx_ind=Sum_Cargas_yx_ind+Fk(k,1)*Heav2(Rk(k,2),Punto,L_Eje);
   Sum_Cargas_yz_ind=Sum_Cargas_yz_ind+Fk(k,3)*Heav2(Rk(k,2),Punto,L_Eje);
   Sum_Momento_yx_ind=Sum_Momento_yx_ind+(Fk(k,1)*(Punto-Rk(k,2))+Fk(k,2)*Rk(k,1)).*Heav2(Rk(k,2),Punto,L_Eje);
   Sum_Momento_yz_ind=Sum_Momento_yz_ind+(Fk(k,3)*(Punto-Rk(k,2))+Fk(k,2)*Rk(k,3)).*Heav2(Rk(k,2),Punto,L_Eje);
   Sum_Cargas_yy_ind=Sum_Cargas_yy_ind+Fk(k,2)*Heav2(Rk(k,2),Punto,L_Eje);
   Angulo_Fuerza=atand(Rk(k,3)/Rk(k,1)); 
   R_Normal=Rk(k,1)*cosd(Angulo_Fuerza)+Rk(k,3)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,1)*sind(Angulo_Fuerza)+Fk(k,3)*cosd(Angulo_Fuerza);
   Sum_Torques_xz_ind=Sum_Torques_xz_ind-(F_Tangencial*R_Normal)*Heav2(Rk(k,2),Punto,L_Eje);
%    Sum_Torques_xz_ind=Sum_Torques_xz_ind+(Fk(k,1)*Rk(k,3))*Heav2(Rk(k,2),Punto,L_Eje);
   end
end
%%Momento Cortante
 Esfuerzo_Vyx_ind=RAx*Heav2(Ra(2),Punto,L_Eje)+Sum_Cargas_yx_ind+RBx*Heav2(Rb(2),Punto,L_Eje)
 Esfuerzo_Vyz_ind=RAz*Heav2(Ra(2),Punto,L_Eje)+Sum_Cargas_yz_ind+RBz*Heav2(Rb(2),Punto,L_Eje)
%%Momentos Flectores
 Momento_Myx_ind=RAx*(Punto-Ra(2)).*Heav2(Ra(2),Punto,L_Eje)+Sum_Momento_yx_ind+RBx*(Punto-Rb(2)).*Heav2(Rb(2),Punto,L_Eje)
 Momento_Myz_ind=RAz*(Punto-Ra(2)).*Heav2(Ra(2),Punto,L_Eje)+Sum_Momento_yz_ind+RBz*(Punto-Rb(2)).*Heav2(Rb(2),Punto,L_Eje)
%Gráficas de Esfuerzos Resultantes Normales
 i=find(Y>=Punto,1,'first');
 d=Vector_Diametro(i)%Diametro del eje.
 Fy=Sum_Cargas_yy_ind;
 Esfuerzo_Normal_Carga_Axial_Maximo=4*Fy/(pi*d^2)
 Esfuerzo_Normal_Momento_x_Maximo=32*Momento_Myx_ind/(pi*d^3)
 Esfuerzo_Normal_Momento_z_Maximo=32*Momento_Myz_ind/(pi*d^3)
%Vectores de Esfuerzos Normales
% Abcisa2=Abcisa2r();
Esfuerzo_Normal_Carga_Axial=Esfuerzo_Normal_Carga_Axial_Maximo*(Abcisa2*0+1);
Esfuerzo_Normal_Momento_x=-Esfuerzo_Normal_Momento_x_Maximo*sind(Abcisa2);
Esfuerzo_Normal_Momento_z=Esfuerzo_Normal_Momento_z_Maximo*cosd(Abcisa2);
Esfuerzo_Normal_Resultante=Esfuerzo_Normal_Carga_Axial+Esfuerzo_Normal_Momento_x+Esfuerzo_Normal_Momento_z;
Esfuerzo_Normal_Resultante_Maximo=max(abs(Esfuerzo_Normal_Resultante))
i=find(Esfuerzo_Normal_Resultante==Esfuerzo_Normal_Resultante_Maximo);
if isempty(i)
   i=find(Esfuerzo_Normal_Resultante==-Esfuerzo_Normal_Resultante_Maximo); 
end
   th=Abcisa2(i)
figure(9)
 subplot(2,2,1),plot(Abcisa2,Esfuerzo_Normal_Carga_Axial),title('Esfuerzo Normal por Carga Axial')
 subplot(2,2,2),plot(Abcisa2,Esfuerzo_Normal_Momento_x),title('Esfuerzo Normal por Momento en X')
 subplot(2,2,3),plot(Abcisa2,Esfuerzo_Normal_Momento_z),title('Esfuerzo Normal por Momento en Z')
 subplot(2,2,4),plot(Abcisa2,Esfuerzo_Normal_Resultante),title('Esfuerzo Normal Resultante')
 figure(10)
factor_escala=d/50;
Graficacion_3d(Esfuerzo_Normal_Carga_Axial_Maximo,Esfuerzo_Normal_Momento_x_Maximo,Esfuerzo_Normal_Momento_z_Maximo,-90,0,180,90,d)
 Ty=Sum_Torques_xz_ind
 Esfuerzo_Cortante_Torque_Maximo=16*Ty/(pi*d^3)
 Esfuerzo_Cortante_Momento_x_Maximo=16*Esfuerzo_Vyx_ind/(3*pi*d^2)
 Esfuerzo_Cortante_Momento_z_Maximo=16*Esfuerzo_Vyz_ind/(3*pi*d^2)
 %%Cálculos para cada ángulo
 Esfuerzo_Cortante_Momento_x=Esfuerzo_Cortante_Momento_x_Maximo*(0*Abcisa2+1);
 Esfuerzo_Cortante_Momento_xR=Esfuerzo_Cortante_Momento_x_Maximo*sind(Abcisa2).^2;%R de Radial
 Esfuerzo_Cortante_Momento_z=Esfuerzo_Cortante_Momento_z_Maximo*(0*Abcisa2+1);
 Esfuerzo_Cortante_Momento_zR=Esfuerzo_Cortante_Momento_z_Maximo*cosd(Abcisa2).^2;
 Esfuerzo_Cortante_Torque_R=Esfuerzo_Cortante_Torque_Maximo*(0*Abcisa2+1);
 Suma_Cortantes_N=Esfuerzo_Cortante_Momento_xR.*cosd(Abcisa2)+Esfuerzo_Cortante_Momento_zR.*sind(Abcisa2);
 Suma_Cortantes_N1=Esfuerzo_Cortante_Momento_xR.*cosd(Abcisa2);
 Suma_Cortantes_N2=Esfuerzo_Cortante_Momento_zR.*sind(Abcisa2);
 Suma_Cortantes_T=-Esfuerzo_Cortante_Momento_xR.*sind(Abcisa2)+Esfuerzo_Cortante_Momento_zR.*cosd(Abcisa2)+Esfuerzo_Cortante_Torque_R;
 Suma_Cortantes_T1=-Esfuerzo_Cortante_Momento_xR.*sind(Abcisa2);
 Suma_Cortantes_T2=Esfuerzo_Cortante_Momento_zR.*cosd(Abcisa2);
 Suma_Cortante_Maximo=max(sqrt(Suma_Cortantes_N.^2+Suma_Cortantes_T.^2));
 Suma_Cortante_Maximo_1=max(sqrt(Suma_Cortantes_N1.^2+Suma_Cortantes_T1.^2));
 Suma_Cortante_Maximo_2=max(sqrt(Suma_Cortantes_N2.^2+Suma_Cortantes_T2.^2));
 figure(11)
     subplot(2,3,1),plot(Abcisa2,Esfuerzo_Cortante_Momento_xR),title('Esfuerzo Cortante por Momento en X')
     subplot(2,3,2),plot(Abcisa2,Esfuerzo_Cortante_Momento_zR),title('Esfuerzo Cortante por Momento en Z')
     subplot(2,3,3),plot(Abcisa2,Esfuerzo_Cortante_Torque_R),title('Esfuerzo Cortante por Tangencial')
     subplot(2,3,4),plot(Abcisa2,Suma_Cortantes_N),title('Suma de Esfuerzos Cortantes Normales')
     subplot(2,3,5),plot(Abcisa2,Suma_Cortantes_T),title('Suma de Esfuerzos Cortantes Tangenciales')
     subplot(2,3,6),plot(Abcisa2,sqrt(Suma_Cortantes_N.^2+Suma_Cortantes_T.^2)),title('Magnitud Esfuerzos Cortantes Resultantes')
 figure(12)    
 factor_escala=1/50;
 for i=1:length(Abcisa2)
     An=Abcisa2(i);%Angulo a medir
     cosAn=1*cosd(An);%d*cosd(An)
     sinAn=1*sind(An);%d*sind(An)
%      subplot(2,2,1),Vector(0,Esfuerzo_Cortante_Momento_x(i)/abs(Esfuerzo_Cortante_Momento_x_Maximo),0,0,sinAn,sinAn,factor_escala);axis equal
%      subplot(2,2,2),Vector(cosAn,cosAn,0,0,0,Esfuerzo_Cortante_Momento_z(i)/abs(Esfuerzo_Cortante_Momento_z_Maximo),factor_escala);axis equal
     subplot(2,2,1),Vector(cosAn,cosAn+(Suma_Cortantes_N1(i)*cosAn+Suma_Cortantes_T1(i)*cosd(An+90))/Suma_Cortante_Maximo_1...
                           ,0,0,sinAn,sinAn+(Suma_Cortantes_N1(i)*sinAn+Suma_Cortantes_T1(i)*sind(An+90))/Suma_Cortante_Maximo_1,factor_escala);axis equal
     subplot(2,2,2),Vector(cosAn,cosAn+(Suma_Cortantes_N2(i)*cosAn+Suma_Cortantes_T2(i)*cosd(An+90))/Suma_Cortante_Maximo_2...
                           ,0,0,sinAn,sinAn+(Suma_Cortantes_N2(i)*sinAn+Suma_Cortantes_T2(i)*sind(An+90))/Suma_Cortante_Maximo_2,factor_escala);axis equal
     subplot(2,2,3),Vector(cosAn,cosAn-sind(An)*Esfuerzo_Cortante_Torque_R(i)/abs(Esfuerzo_Cortante_Torque_Maximo),0,0,sinAn,sinAn+cosd(An)*Esfuerzo_Cortante_Torque_R(i)/abs(Esfuerzo_Cortante_Torque_Maximo),factor_escala);axis equal
     subplot(2,2,4),Vector(cosAn,cosAn+(Suma_Cortantes_N(i)*cosAn+Suma_Cortantes_T(i)*cosd(An+90))/Suma_Cortante_Maximo...
                           ,0,0,sinAn,sinAn+(Suma_Cortantes_N(i)*sinAn+Suma_Cortantes_T(i)*sind(An+90))/Suma_Cortante_Maximo,factor_escala);axis equal
%      pause(0.1);
     hold on
 end
Graficacion_3d2(Suma_Cortante_Maximo_1...
              ,Suma_Cortante_Maximo_2,Esfuerzo_Cortante_Torque_Maximo,Suma_Cortante_Maximo,2)
%Esfuerzos normales para un Angulo en específico
%%-------------------------------------------------------------%%
Angulo_theta=th;
%%-------------------------------------------------------------%%
Esfuerzo_Normal_Carga_Axial_ind=Esfuerzo_Normal_Carga_Axial_Maximo;
Esfuerzo_Normal_Momento_x_ind=-Esfuerzo_Normal_Momento_x_Maximo*sind(Angulo_theta);
Esfuerzo_Normal_Momento_z_ind=Esfuerzo_Normal_Momento_z_Maximo*cosd(Angulo_theta);
Esfuerzo_Normal_Resultante_ind=Esfuerzo_Normal_Carga_Axial_ind+Esfuerzo_Normal_Momento_x_ind+Esfuerzo_Normal_Momento_z_ind;
%Esfuerzos cortantes para un Angulo en específico
%%-------------------------------------------------------------%%
Esfuerzo_Cortante_Momento_x_ind=Esfuerzo_Cortante_Momento_x_Maximo
Esfuerzo_Cortante_Momento_xR_ind=Esfuerzo_Cortante_Momento_x_Maximo*sind(Angulo_theta)^2%R de Radial
Esfuerzo_Cortante_Momento_z_ind=Esfuerzo_Cortante_Momento_z_Maximo
Esfuerzo_Cortante_Momento_zR_ind=Esfuerzo_Cortante_Momento_z_Maximo*cosd(Angulo_theta)^2
Esfuerzo_Cortante_Torque_R_ind=Esfuerzo_Cortante_Torque_Maximo
Suma_Cortantes_N_ind=Esfuerzo_Cortante_Momento_xR_ind*cosd(Angulo_theta)+Esfuerzo_Cortante_Momento_zR_ind*sind(Angulo_theta)
Suma_Cortantes_T_ind=-Esfuerzo_Cortante_Momento_xR_ind*sind(Angulo_theta)+Esfuerzo_Cortante_Momento_zR_ind*cosd(Angulo_theta)+Esfuerzo_Cortante_Torque_R_ind
Suma_Cortante_Resultante_ind=sqrt(Suma_Cortantes_N_ind^2+Suma_Cortantes_T_ind^2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Circulo_Mohr(Ox,Oy,Oz,Txy,Txz,Tyz,An,P);
figure(13)
Circulo_Mohr(0,Esfuerzo_Normal_Resultante_ind,0,Suma_Cortantes_N_ind,0,Suma_Cortantes_T_ind,Angulo_theta,2);
    
function[]=Eje_Z(Ra,Rb,Rab,Rba,Filas,Rk,Fk,RkA,RkB,L,L1,L2,L3,L4,L5,Valor,Angulo_theta)
k=Filas;
    %Reacciones en A
% (Y'RkB)*(Z'Fk)-(Z'RkB)*(Y'Fk)
RAy=sum((RkB(1:k,2)).*Fk(1:k,3)-(RkB(1:k,3)).*Fk(1:k,2))/Rab(3);
% (X'RkB)*(Z'Fk)-(Z'RkB)*(X'Fk)
RAx=sum((RkB(1:k,1)).*Fk(1:k,3)-(RkB(1:k,3)).*Fk(1:k,1))/Rab(3);
%Reacciones en B
% (Y'RkA)*(Z'Fk)-(Z'RkA)*(Y'Fk)
RBy=sum((RkA(1:k,2)).*Fk(1:k,3)-(RkA(1:k,3)).*Fk(1:k,2))/Rba(3);
% (X'RkA)*(Z'Fk)-(Z'RkA)*(X'Fk)
RBx=sum((RkA(1:k,1)).*Fk(1:k,3)-(RkA(1:k,3)).*Fk(1:k,1))/Rba(3);
%Reacciones
RAz=0;
RBz=RAz-sum(Fk(1:k,3));
RAr=[RAx RAy RAz]
RBr=[RBx RBy RBz]
%%------------------------------------------------------
if Ra(3)>=Rb(3)
L_Eje=Ra(3);
else
L_Eje=Rb(3);
end
Z=Abcisa(L_Eje);
% Valor=get(handles.slider1,'Value');
% set(handles.text3,'String',strcat(num2str(Valor),'*L=',strcat(num2str(Valor*L_Eje))))
% set(handles.text5,'String',L_Eje)
%Creación del vector con las longitudes deseadas

Vector_Diametro(length(Z))=0;
for i=1:length(Z)
    if  Z(i)>=L1(1) && Z(i)<L2(1) 
       Vector_Diametro(i)=L1(2);
    elseif L2(1)<Z(i) &&  Z(i)<=L3(1)
       Vector_Diametro(i)=L2(2);
    elseif L3(1)<Z(i) &&  Z(i)<=L4(1)
       Vector_Diametro(i)=L3(2);
    elseif L4(1)<Z(i) &&  Z(i)<=L5(1)
       Vector_Diametro(i)=L4(2);
    elseif L5(1)<Z(i) &&  Z(i)<=L_Eje
       Vector_Diametro(i)=L5(2);
    else
       Vector_Diametro(i)=1; 
    end
end
figure(1)
Grafica_de_Cargas(L,Ra,Rb,RAr,RBr,Rk,Fk,Filas,3);
for k=1:Filas
%%Vectores de Cargas Plano xy y yx
   if k==1
   Sum_Cargas_zx=Fk(k,1)*Heav(Rk(k,3),L_Eje);
   Sum_Cargas_zz=Fk(k,3)*Heav(Rk(k,3),L_Eje);
   Sum_Cargas_zy=Fk(k,2)*Heav(Rk(k,3),L_Eje);
   Sum_Momento_zx=(Fk(k,1)*(Z-Rk(k,3))+Fk(k,3)*Rk(k,1)).*Heav(Rk(k,3),L_Eje);
   Sum_Momento_zy=(Fk(k,2)*(Z-Rk(k,3))+Fk(k,3)*Rk(k,2)).*Heav(Rk(k,3),L_Eje);
   Sum_Pendiente_zx=((1/2)*Fk(k,1)*(Z-Rk(k,3)).^2+Fk(k,3)*Rk(k,1)*(Z-Rk(k,3))).*Heav(Rk(k,3),L_Eje);
   Sum_Pendiente_zy=((1/2)*Fk(k,2)*(Z-Rk(k,3)).^2+Fk(k,3)*Rk(k,2)*(Z-Rk(k,3))).*Heav(Rk(k,3),L_Eje);
   Sum_Deflexion_zx=((1/6)*Fk(k,1)*(Z-Rk(k,3)).^3+(1/2)*Fk(k,3)*Rk(k,1)*(Z-Rk(k,3)).^2).*Heav(Rk(k,3),L_Eje);
   Sum_Deflexion_zy=((1/6)*Fk(k,2)*(Z-Rk(k,3)).^3+(1/2)*Fk(k,3)*Rk(k,2)*(Z-Rk(k,3)).^2).*Heav(Rk(k,3),L_Eje);
   Angulo_Fuerza=atand(Rk(k,2)/Rk(k,1));   
   R_Normal=Rk(k,1)*cosd(Angulo_Fuerza)+Rk(k,2)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,1)*sind(Angulo_Fuerza)+Fk(k,2)*cosd(Angulo_Fuerza);
   Sum_Torques_xy=-(F_Tangencial*R_Normal)*Heav(Rk(k,3),L_Eje);
%    Sum_Torques_xy=(Fk(k,1)*Rk(k,2))*Heav(Rk(k,3),L_Eje);
   else
   Sum_Cargas_zx=Sum_Cargas_zx+Fk(k,1)*Heav(Rk(k,3),L_Eje);
   Sum_Cargas_zz=Sum_Cargas_zz+Fk(k,3)*Heav(Rk(k,3),L_Eje);
   Sum_Cargas_zy=Sum_Cargas_zy+Fk(k,2)*Heav(Rk(k,3),L_Eje);
   Sum_Momento_zx=Sum_Momento_zx+(Fk(k,1)*(Z-Rk(k,3))+Fk(k,3)*Rk(k,1)).*Heav(Rk(k,3),L_Eje);
   Sum_Momento_zy=Sum_Momento_zy+(Fk(k,2)*(Z-Rk(k,3))+Fk(k,3)*Rk(k,2)).*Heav(Rk(k,3),L_Eje);
   Sum_Pendiente_zx=Sum_Pendiente_zx+((1/2)*Fk(k,1)*(Z-Rk(k,3)).^2+Fk(k,3)*Rk(k,1)*(Z-Rk(k,3))).*Heav(Rk(k,3),L_Eje);
   Sum_Pendiente_zy=Sum_Pendiente_zy+((1/2)*Fk(k,2)*(Z-Rk(k,3)).^2+Fk(k,3)*Rk(k,2)*(Z-Rk(k,3))).*Heav(Rk(k,3),L_Eje);
   Sum_Deflexion_zx=Sum_Deflexion_zx+((1/6)*Fk(k,1)*(Z-Rk(k,3)).^3+(1/2)*Fk(k,3)*Rk(k,1)*(Z-Rk(k,3)).^2).*Heav(Rk(k,3),L_Eje);
   Sum_Deflexion_zy=Sum_Deflexion_zy+((1/6)*Fk(k,2)*(Z-Rk(k,3)).^3+(1/2)*Fk(k,3)*Rk(k,2)*(Z-Rk(k,3)).^2).*Heav(Rk(k,3),L_Eje);
   Angulo_Fuerza=atand(Rk(k,2)/Rk(k,1));   
   R_Normal=Rk(k,1)*cosd(Angulo_Fuerza)+Rk(k,2)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,1)*sind(Angulo_Fuerza)+Fk(k,2)*cosd(Angulo_Fuerza);
   Sum_Torques_xy=Sum_Torques_xy-(F_Tangencial*R_Normal)*Heav(Rk(k,3),L_Eje);
%    Sum_Torques_xy=Sum_Torques_xy+(Fk(k,1)*Rk(k,2))*Heav(Rk(k,3),L_Eje);
   end
end
%%Cálculo de Gráficas de Fuerzas Cortantes
 Esfuerzo_Vzx=RAx*Heav(Ra(3),L_Eje)+Sum_Cargas_zx+RBx*Heav(Rb(3),L_Eje);
 Esfuerzo_Vzy=RAy*Heav(Ra(3),L_Eje)+Sum_Cargas_zy+RBy*Heav(Rb(3),L_Eje);
 %%Momentos Flectores
 Momento_Mzx=RAx*(Z-Ra(3)).*Heav(Ra(3),L_Eje)+Sum_Momento_zx+RBx*(Z-Rb(3)).*Heav(Rb(3),L_Eje);
 Momento_Mzy=RAy*(Z-Ra(3)).*Heav(Ra(3),L_Eje)+Sum_Momento_zy+RBy*(Z-Rb(3)).*Heav(Rb(3),L_Eje);
 Diagrama_Cargas=RAz*Heav(Ra(3),L_Eje)+Sum_Cargas_zz+RBz*Heav(Rb(3),L_Eje);
 Diagrama_Momento=Sum_Torques_xy;
%  %%Curva pendiente
 E=29.7*10^6;
 I=pi*Vector_Diametro.^4/64;
 K0=1./(E*I);
 Curva_Pendiente_zx=K0.*(RAx*(Z-Ra(3)).^2.*Heav(Ra(3),L_Eje)/2+Sum_Pendiente_zx+RBx*(Z-Rb(3)).^2.*Heav(Rb(3),L_Eje)/2);
 Curva_Pendiente_zy=K0.*(RAy*(Z-Ra(3)).^2.*Heav(Ra(3),L_Eje)/2+Sum_Pendiente_zy+RBy*(Z-Rb(3)).^2.*Heav(Rb(3),L_Eje)/2);
%  %%Curva de Flexión
 Curva_Deflexion_zx=K0.*(RAx*(Z-Ra(3)).^3.*Heav(Ra(3),L_Eje)/6+Sum_Deflexion_zx+RBx*(Z-Rb(3)).^3.*Heav(Rb(3),L_Eje)/6);
 Curva_Deflexion_zy=K0.*(RAy*(Z-Ra(3)).^3.*Heav(Ra(3),L_Eje)/6+Sum_Deflexion_zy+RBy*(Z-Rb(3)).^3.*Heav(Rb(3),L_Eje)/6);
 a=find(Z>=Ra(3),1,'first');
 b=find(Z<Rb(3),1,'last');
 CA=([Z(a) 1;Z(b) 1])\[-Curva_Deflexion_zx(a);-Curva_Deflexion_zx(b)];
 CB=([Z(a) 1;Z(b) 1])\[-Curva_Deflexion_zy(a);-Curva_Deflexion_zy(b)];
 Curva_Pendiente_zx=Curva_Pendiente_zx+CA(1);
 Curva_Pendiente_zy=Curva_Pendiente_zy+CB(1);
 Curva_Deflexion_zx=Curva_Deflexion_zx+CA(1)*Z+CA(2);
 Curva_Deflexion_zy=Curva_Deflexion_zy+CB(1)*Z+CB(2);
 Curva_Pendiente_zx=Curva_Pendiente_zx.*(Heav(Ra(3),L_Eje)-Heav(L_Eje,L_Eje));
 Curva_Pendiente_zy=Curva_Pendiente_zy.*(Heav(Ra(3),L_Eje)-Heav(L_Eje,L_Eje));
 Curva_Deflexion_zx=Curva_Deflexion_zx.*(Heav(Ra(3),L_Eje)-Heav(L_Eje,L_Eje));
 Curva_Deflexion_zy=Curva_Deflexion_zy.*(Heav(Ra(3),L_Eje)-Heav(L_Eje,L_Eje));
 %%Curvas de Esfuerzo_Vyx Cortantes Normales
 Esfuerzos_Normales_Mx=32*Momento_Mzx./(pi*Vector_Diametro.^3);
 Esfuerzos_Normales_My=32*Momento_Mzy./(pi*Vector_Diametro.^3);
 Esfuerzos_Cortantes_Vx=16*Esfuerzo_Vzx./(3*pi*Vector_Diametro.^2);
 Esfuerzos_Cortantes_Vy=16*Esfuerzo_Vzy./(3*pi*Vector_Diametro.^2);
 Matriz_Esfuerzos=[Esfuerzos_Normales_Mx;Esfuerzos_Normales_My;Esfuerzos_Cortantes_Vx;Esfuerzos_Cortantes_Vy];
 Dimensiones_Matriz=size(Matriz_Esfuerzos)
 i=find(Matriz_Esfuerzos==max(max(abs(Matriz_Esfuerzos))))
 if isempty(i)
  i=find(Matriz_Esfuerzos==-max(max(abs(Matriz_Esfuerzos))))
 end
 col=ceil(i/Dimensiones_Matriz(1));
 ren=i-(col-1)*Dimensiones_Matriz(1);
 Esfuerzo_Maximo=Matriz_Esfuerzos(ren,col)
 Punto_Max=Z(col)
 figure(2)
 subplot(2,3,1),plot(Z,Esfuerzo_Vzx),title('Esfuerzo Cortante en Plano ZX')
 subplot(2,3,2),plot(Z,Esfuerzo_Vzy),title('Esfuerzo Cortante en Plano ZY')
 subplot(2,3,3),plot(Z,Momento_Mzx),title('Momento Flector en Plano ZX')
 subplot(2,3,4),plot(Z,Momento_Mzy),title(strcat('Momento Flector en Plano ZY'))
 subplot(2,3,5),plot(Z,Diagrama_Cargas),title('Diagrama de Cargas Fz')
 subplot(2,3,6),plot(Z,Diagrama_Momento),title('Diagrama de Momento')
 figure(3)
 subplot(2,4,1),plot(Z,Curva_Pendiente_zx),title('Curva Pendiente en Plano ZX')
 subplot(2,4,2),plot(Z,Curva_Pendiente_zy),title('Curva Pendiente en Plano ZY')
 subplot(2,4,3),plot(Z,Curva_Deflexion_zx),title('Curva Deflexión en Plano ZX')
 subplot(2,4,4),plot(Z,Curva_Deflexion_zy),title('Curva Deflexión en Plano ZY')
 subplot(2,4,5),plot(Z,Esfuerzos_Normales_Mx),title('Esfuerzos Normales por Mx')
 subplot(2,4,6),plot(Z,Esfuerzos_Normales_My),title('Esfuerzos Normales por My')
 subplot(2,4,7),plot(Z,Esfuerzos_Cortantes_Vx),title('Esfuerzos Cortantes por Vx')
 subplot(2,4,8),plot(Z,Esfuerzos_Cortantes_Vy),title('Esfuerzos Cortantes por Vy')
 %Cálculo Individual
 Punto=Valor*L_Eje
for k=1:Filas
%%Vectores de Cargas Plano xy y yx
   if k==1
   Sum_Cargas_zx_ind=Fk(k,1)*Heav2(Rk(k,3),Punto,L_Eje);
   Sum_Cargas_zy_ind=Fk(k,2)*Heav2(Rk(k,3),Punto,L_Eje);
   Sum_Momento_zx_ind=(Fk(k,1)*(Punto-Rk(k,3))+Fk(k,3)*Rk(k,1)).*Heav2(Rk(k,3),Punto,L_Eje);
   Sum_Momento_zy_ind=(Fk(k,2)*(Punto-Rk(k,3))+Fk(k,3)*Rk(k,2)).*Heav2(Rk(k,3),Punto,L_Eje);
   Sum_Cargas_zz_ind=Fk(k,3)*Heav2(Rk(k,3),Punto,L_Eje);
   Angulo_Fuerza=atand(Rk(k,2)/Rk(k,1));   
   R_Normal=Rk(k,1)*cosd(Angulo_Fuerza)+Rk(k,2)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,1)*sind(Angulo_Fuerza)+Fk(k,2)*cosd(Angulo_Fuerza);
   Sum_Torques_xy_ind=-(F_Tangencial*R_Normal)*Heav2(Rk(k,3),Punto,L_Eje);
%    Sum_Torques_xy_ind=(Fk(k,1)*Rk(k,2))*Heav2(Rk(k,3),Punto,L_Eje);
   else
   Sum_Cargas_zx_ind=Sum_Cargas_zx_ind+Fk(k,1)*Heav2(Rk(k,3),Punto,L_Eje)
   Sum_Cargas_zy_ind=Sum_Cargas_zy_ind+Fk(k,2)*Heav2(Rk(k,3),Punto,L_Eje);
   Sum_Momento_zx_ind=Sum_Momento_zx_ind+(Fk(k,1)*(Punto-Rk(k,3))+Fk(k,3)*Rk(k,1)).*Heav2(Rk(k,3),Punto,L_Eje);
   Sum_Momento_zy_ind=Sum_Momento_zy_ind+(Fk(k,2)*(Punto-Rk(k,3))+Fk(k,3)*Rk(k,2)).*Heav2(Rk(k,3),Punto,L_Eje);
   Sum_Cargas_zz_ind=Sum_Cargas_zz_ind+Fk(k,3)*Heav2(Rk(k,3),Punto,L_Eje);
   Angulo_Fuerza=atand(Rk(k,2)/Rk(k,1));   
   R_Normal=Rk(k,1)*cosd(Angulo_Fuerza)+Rk(k,2)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,1)*sind(Angulo_Fuerza)+Fk(k,2)*cosd(Angulo_Fuerza);
   Sum_Torques_xy_ind=Sum_Torques_xy_ind-(F_Tangencial*R_Normal)*Heav2(Rk(k,3),Punto,L_Eje);
%    Sum_Torques_xy_ind=Sum_Torques_xy_ind+(Fk(k,1)*Rk(k,2))*Heav2(Rk(k,3),Punto,L_Eje);
   end
end
%%Momento Cortante
 Esfuerzo_Vzx_ind=RAx*Heav2(Ra(3),Punto,L_Eje)+Sum_Cargas_zx_ind+RBx*Heav2(Rb(3),Punto,L_Eje)
 Esfuerzo_Vzy_ind=RAy*Heav2(Ra(3),Punto,L_Eje)+Sum_Cargas_zy_ind+RBy*Heav2(Rb(3),Punto,L_Eje)
%%Momentos Flectores
 Momento_Mzx_ind=RAx*(Punto-Ra(3)).*Heav2(Ra(3),Punto,L_Eje)+Sum_Momento_zx_ind+RBx*(Punto-Rb(3)).*Heav2(Rb(3),Punto,L_Eje)
 Momento_Mzy_ind=RAy*(Punto-Ra(3)).*Heav2(Ra(3),Punto,L_Eje)+Sum_Momento_zy_ind+RBy*(Punto-Rb(3)).*Heav2(Rb(3),Punto,L_Eje)
%Gráficas de Esfuerzos Resultantes Normales
 i=find(Z>=Punto,1,'first');
 d=Vector_Diametro(i)%Diametro del eje.
 Fz=Sum_Cargas_zz_ind;
 Esfuerzo_Normal_Carga_Axial_Maximo=4*Fz/(pi*d^2)
 Esfuerzo_Normal_Momento_x_Maximo=32*Momento_Mzx_ind/(pi*d^3)
 Esfuerzo_Normal_Momento_y_Maximo=32*Momento_Mzy_ind/(pi*d^3)
%Vectores de Esfuerzos Normales
Abcisa2=Abcisa2r();
Esfuerzo_Normal_Carga_Axial=Esfuerzo_Normal_Carga_Axial_Maximo*(Abcisa2*0+1);
Esfuerzo_Normal_Momento_x=-Esfuerzo_Normal_Momento_x_Maximo*sind(Abcisa2);
Esfuerzo_Normal_Momento_y=Esfuerzo_Normal_Momento_y_Maximo*cosd(Abcisa2);
Esfuerzo_Normal_Resultante=Esfuerzo_Normal_Carga_Axial+Esfuerzo_Normal_Momento_x+Esfuerzo_Normal_Momento_y;
Esfuerzo_Normal_Resultante_Maximo=max(Esfuerzo_Normal_Resultante);
figure(4)
 subplot(2,2,1),plot(Abcisa2,Esfuerzo_Normal_Carga_Axial),title('Esfuerzo Normal por Carga Axial')
 subplot(2,2,2),plot(Abcisa2,Esfuerzo_Normal_Momento_x),title('Esfuerzo Normal por Momento en X')
 subplot(2,2,3),plot(Abcisa2,Esfuerzo_Normal_Momento_y),title('Esfuerzo Normal por Momento en Y')
 subplot(2,2,4),plot(Abcisa2,Esfuerzo_Normal_Resultante),title('Esfuerzo Normal Resultante')
figure(5)
factor_escala=d/50;
Graficacion_3d(Esfuerzo_Normal_Carga_Axial_Maximo,Esfuerzo_Normal_Momento_x_Maximo,Esfuerzo_Normal_Momento_y_Maximo,0,0,180,90,d)
%Gráficas de Esfuerzos Resultantes Cortantes
 Tz=Sum_Torques_xy_ind
 Esfuerzo_Cortante_Torque_Maximo=16*Tz/(pi*d^3)
 Esfuerzo_Cortante_Momento_x_Maximo=16*Esfuerzo_Vzx_ind/(3*pi*d^2)
 Esfuerzo_Cortante_Momento_y_Maximo=16*Esfuerzo_Vzy_ind/(3*pi*d^2)
 %%Cálculos para cada ángulo
 Esfuerzo_Cortante_Momento_x=Esfuerzo_Cortante_Momento_x_Maximo*(0*Abcisa2+1);
 Esfuerzo_Cortante_Momento_xR=Esfuerzo_Cortante_Momento_x_Maximo*sind(Abcisa2).^2;%R de Radial
 Esfuerzo_Cortante_Momento_y=Esfuerzo_Cortante_Momento_y_Maximo*(0*Abcisa2+1);
 Esfuerzo_Cortante_Momento_yR=Esfuerzo_Cortante_Momento_y_Maximo*cosd(Abcisa2).^2;
 Esfuerzo_Cortante_Torque_R=Esfuerzo_Cortante_Torque_Maximo*(0*Abcisa2+1);
 Suma_Cortantes_N=Esfuerzo_Cortante_Momento_xR.*cosd(Abcisa2)+Esfuerzo_Cortante_Momento_yR.*sind(Abcisa2);
 Suma_Cortantes_N1=Esfuerzo_Cortante_Momento_xR.*cosd(Abcisa2);
 Suma_Cortantes_N2=Esfuerzo_Cortante_Momento_yR.*sind(Abcisa2);
 Suma_Cortantes_T=-Esfuerzo_Cortante_Momento_xR.*sind(Abcisa2)+Esfuerzo_Cortante_Momento_yR.*cosd(Abcisa2)+Esfuerzo_Cortante_Torque_R;
 Suma_Cortantes_T1=-Esfuerzo_Cortante_Momento_xR.*sind(Abcisa2);
 Suma_Cortantes_T2=Esfuerzo_Cortante_Momento_yR.*cosd(Abcisa2);
 Suma_Cortante_Maximo=max(sqrt(Suma_Cortantes_N.^2+Suma_Cortantes_T.^2));
 Suma_Cortante_Maximo_1=max(sqrt(Suma_Cortantes_N1.^2+Suma_Cortantes_T1.^2));
 Suma_Cortante_Maximo_2=max(sqrt(Suma_Cortantes_N2.^2+Suma_Cortantes_T2.^2));
 figure(6)
     subplot(2,3,1),plot(Abcisa2,Esfuerzo_Cortante_Momento_xR),title('Esfuerzo Cortante por Momento en X')
     subplot(2,3,2),plot(Abcisa2,Esfuerzo_Cortante_Momento_yR),title('Esfuerzo Cortante por Momento en Y')
     subplot(2,3,3),plot(Abcisa2,Esfuerzo_Cortante_Torque_R),title('Esfuerzo Cortante por Tangencial')
     subplot(2,3,4),plot(Abcisa2,Suma_Cortantes_N),title('Suma de Esfuerzos Cortantes Normales')
     subplot(2,3,5),plot(Abcisa2,Suma_Cortantes_T),title('Suma de Esfuerzos Cortantes Tangenciales')
     subplot(2,3,6),plot(Abcisa2,sqrt(Suma_Cortantes_N.^2+Suma_Cortantes_T.^2)),title('Magnitud Esfuerzos Cortantes Resultantes')
 figure(7)    
 factor_escala=1/50;
 for i=1:length(Abcisa2)
     An=Abcisa2(i);%Angulo a medir
     cosAn=1*cosd(An);%d*cosd(An)
     sinAn=1*sind(An);%d*sind(An)
%      subplot(2,2,1),Vector(0,Esfuerzo_Cortante_Momento_x(i)/abs(Esfuerzo_Cortante_Momento_x_Maximo),0,0,sinAn,sinAn,factor_escala);axis equal
%      subplot(2,2,2),Vector(cosAn,cosAn,0,0,0,Esfuerzo_Cortante_Momento_z(i)/abs(Esfuerzo_Cortante_Momento_z_Maximo),factor_escala);axis equal
     subplot(2,2,1),Vector(cosAn,cosAn+(Suma_Cortantes_N1(i)*cosAn+Suma_Cortantes_T1(i)*cosd(An+90))/Suma_Cortante_Maximo_1...
                           ,sinAn,sinAn+(Suma_Cortantes_N1(i)*sinAn+Suma_Cortantes_T1(i)*sind(An+90))/Suma_Cortante_Maximo_1,0,0,factor_escala);axis equal
     subplot(2,2,2),Vector(cosAn,cosAn+(Suma_Cortantes_N2(i)*cosAn+Suma_Cortantes_T2(i)*cosd(An+90))/Suma_Cortante_Maximo_2...
                           ,sinAn,sinAn+(Suma_Cortantes_N2(i)*sinAn+Suma_Cortantes_T2(i)*sind(An+90))/Suma_Cortante_Maximo_2,0,0,factor_escala);axis equal
     subplot(2,2,3),Vector(cosAn,cosAn-sind(An)*Esfuerzo_Cortante_Torque_R(i)/abs(Esfuerzo_Cortante_Torque_Maximo),sinAn,sinAn+cosd(An)*Esfuerzo_Cortante_Torque_R(i)/abs(Esfuerzo_Cortante_Torque_Maximo),0,0,factor_escala);axis equal
     subplot(2,2,4),Vector(cosAn,cosAn+(Suma_Cortantes_N(i)*cosAn+Suma_Cortantes_T(i)*cosd(An+90))/Suma_Cortante_Maximo...
                           ,sinAn,sinAn+(Suma_Cortantes_N(i)*sinAn+Suma_Cortantes_T(i)*sind(An+90))/Suma_Cortante_Maximo,0,0,factor_escala);axis equal
%      pause(0.1);
     hold on
 end
Graficacion_3d2(Suma_Cortante_Maximo_1...
              ,Suma_Cortante_Maximo_2,Esfuerzo_Cortante_Torque_Maximo,Suma_Cortante_Maximo,3)
%Esfuerzos normales para un Angulo en específico
%%-------------------------------------------------------------%%
% Angulo_theta=get(handles.slider2,'Value');
%%-------------------------------------------------------------%%
Esfuerzo_Normal_Carga_Axial_ind=Esfuerzo_Normal_Carga_Axial_Maximo;
Esfuerzo_Normal_Momento_x_ind=-Esfuerzo_Normal_Momento_x_Maximo*sind(Angulo_theta);
Esfuerzo_Normal_Momento_y_ind=Esfuerzo_Normal_Momento_y_Maximo*cosd(Angulo_theta);
Esfuerzo_Normal_Resultante_ind=Esfuerzo_Normal_Carga_Axial_ind+Esfuerzo_Normal_Momento_x_ind+Esfuerzo_Normal_Momento_y_ind;
%Esfuerzos cortantes para un Angulo en específico
%%-------------------------------------------------------------%%
Esfuerzo_Cortante_Momento_x_ind=Esfuerzo_Cortante_Momento_x_Maximo
Esfuerzo_Cortante_Momento_xR_ind=Esfuerzo_Cortante_Momento_x_Maximo*sind(Angulo_theta)^2%R de Radial
Esfuerzo_Cortante_Momento_y_ind=Esfuerzo_Cortante_Momento_y_Maximo
Esfuerzo_Cortante_Momento_yR_ind=Esfuerzo_Cortante_Momento_y_Maximo*cosd(Angulo_theta)^2
Esfuerzo_Cortante_Torque_R_ind=Esfuerzo_Cortante_Torque_Maximo
Suma_Cortantes_N_ind=Esfuerzo_Cortante_Momento_xR_ind*cosd(Angulo_theta)+Esfuerzo_Cortante_Momento_yR_ind*sind(Angulo_theta)
Suma_Cortantes_T_ind=-Esfuerzo_Cortante_Momento_xR_ind*sind(Angulo_theta)+Esfuerzo_Cortante_Momento_yR_ind*cosd(Angulo_theta)+Esfuerzo_Cortante_Torque_R_ind
Suma_Cortante_Resultante_ind=sqrt(Suma_Cortantes_N_ind^2+Suma_Cortantes_T_ind^2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Circulo_Mohr(Ox,Oy,Oz,Txy,Txz,Tyz,An,P);
figure(8)
Circulo_Mohr(0,0,Esfuerzo_Normal_Resultante_ind,0,Suma_Cortantes_N_ind,Suma_Cortantes_T_ind,Angulo_theta,2);

%%Cálculos Esfuerzo Maximo en el Eje
Punto=Punto_Max

for k=1:Filas
%%Vectores de Cargas Plano xy y yx
   if k==1
   Sum_Cargas_zx_ind=Fk(k,1)*Heav2(Rk(k,3),Punto,L_Eje);
   Sum_Cargas_zy_ind=Fk(k,2)*Heav2(Rk(k,3),Punto,L_Eje);
   Sum_Momento_zx_ind=(Fk(k,1)*(Punto-Rk(k,3))+Fk(k,3)*Rk(k,1)).*Heav2(Rk(k,3),Punto,L_Eje);
   Sum_Momento_zy_ind=(Fk(k,2)*(Punto-Rk(k,3))+Fk(k,3)*Rk(k,2)).*Heav2(Rk(k,3),Punto,L_Eje);
   Sum_Cargas_zz_ind=Fk(k,3)*Heav2(Rk(k,3),Punto,L_Eje);
   Angulo_Fuerza=atand(Rk(k,2)/Rk(k,1));   
   R_Normal=Rk(k,1)*cosd(Angulo_Fuerza)+Rk(k,2)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,1)*sind(Angulo_Fuerza)+Fk(k,2)*cosd(Angulo_Fuerza);
   Sum_Torques_xy_ind=-(F_Tangencial*R_Normal)*Heav2(Rk(k,3),Punto,L_Eje);
%    Sum_Torques_xy_ind=(Fk(k,1)*Rk(k,2))*Heav2(Rk(k,3),Punto,L_Eje);
   else
   Sum_Cargas_zx_ind=Sum_Cargas_zx_ind+Fk(k,1)*Heav2(Rk(k,3),Punto,L_Eje)
   Sum_Cargas_zy_ind=Sum_Cargas_zy_ind+Fk(k,2)*Heav2(Rk(k,3),Punto,L_Eje);
   Sum_Momento_zx_ind=Sum_Momento_zx_ind+(Fk(k,1)*(Punto-Rk(k,3))+Fk(k,3)*Rk(k,1)).*Heav2(Rk(k,3),Punto,L_Eje);
   Sum_Momento_zy_ind=Sum_Momento_zy_ind+(Fk(k,2)*(Punto-Rk(k,3))+Fk(k,3)*Rk(k,2)).*Heav2(Rk(k,3),Punto,L_Eje);
   Sum_Cargas_zz_ind=Sum_Cargas_zz_ind+Fk(k,3)*Heav2(Rk(k,3),Punto,L_Eje);
   Angulo_Fuerza=atand(Rk(k,2)/Rk(k,1));   
   R_Normal=Rk(k,1)*cosd(Angulo_Fuerza)+Rk(k,2)*sind(Angulo_Fuerza);
   F_Tangencial=-Fk(k,1)*sind(Angulo_Fuerza)+Fk(k,2)*cosd(Angulo_Fuerza);
   Sum_Torques_xy_ind=Sum_Torques_xy_ind-(F_Tangencial*R_Normal)*Heav2(Rk(k,3),Punto,L_Eje);
%    Sum_Torques_xy_ind=Sum_Torques_xy_ind+(Fk(k,1)*Rk(k,2))*Heav2(Rk(k,3),Punto,L_Eje);
   end
end
%%Momento Cortante
 Esfuerzo_Vzx_ind=RAx*Heav2(Ra(3),Punto,L_Eje)+Sum_Cargas_zx_ind+RBx*Heav2(Rb(3),Punto,L_Eje)
 Esfuerzo_Vzy_ind=RAy*Heav2(Ra(3),Punto,L_Eje)+Sum_Cargas_zy_ind+RBy*Heav2(Rb(3),Punto,L_Eje)
%%Momentos Flectores
 Momento_Mzx_ind=RAx*(Punto-Ra(3)).*Heav2(Ra(3),Punto,L_Eje)+Sum_Momento_zx_ind+RBx*(Punto-Rb(3)).*Heav2(Rb(3),Punto,L_Eje)
 Momento_Mzy_ind=RAy*(Punto-Ra(3)).*Heav2(Ra(3),Punto,L_Eje)+Sum_Momento_zy_ind+RBy*(Punto-Rb(3)).*Heav2(Rb(3),Punto,L_Eje)
%Gráficas de Esfuerzos Resultantes Normales
 i=find(Z>=Punto,1,'first');
 d=Vector_Diametro(i)%Diametro del eje.
 Fz=Sum_Cargas_zz_ind;
 Esfuerzo_Normal_Carga_Axial_Maximo=4*Fz/(pi*d^2)
 Esfuerzo_Normal_Momento_x_Maximo=32*Momento_Mzx_ind/(pi*d^3)
 Esfuerzo_Normal_Momento_y_Maximo=32*Momento_Mzy_ind/(pi*d^3)
%Vectores de Esfuerzos Normales
Abcisa2=Abcisa2r();
Esfuerzo_Normal_Carga_Axial=Esfuerzo_Normal_Carga_Axial_Maximo*(Abcisa2*0+1);
Esfuerzo_Normal_Momento_x=-Esfuerzo_Normal_Momento_x_Maximo*sind(Abcisa2);
Esfuerzo_Normal_Momento_y=Esfuerzo_Normal_Momento_y_Maximo*cosd(Abcisa2);
Esfuerzo_Normal_Resultante=Esfuerzo_Normal_Carga_Axial+Esfuerzo_Normal_Momento_x+Esfuerzo_Normal_Momento_y;
Esfuerzo_Normal_Resultante_Maximo=max(abs(Esfuerzo_Normal_Resultante));
i=find(Esfuerzo_Normal_Resultante==Esfuerzo_Normal_Resultante_Maximo);
if isempty(i)
   i=find(Esfuerzo_Normal_Resultante==-Esfuerzo_Normal_Resultante_Maximo); 
end
   th=Abcisa2(i)
figure(9)
 subplot(2,2,1),plot(Abcisa2,Esfuerzo_Normal_Carga_Axial),title('Esfuerzo Normal por Carga Axial')
 subplot(2,2,2),plot(Abcisa2,Esfuerzo_Normal_Momento_x),title('Esfuerzo Normal por Momento en X')
 subplot(2,2,3),plot(Abcisa2,Esfuerzo_Normal_Momento_y),title('Esfuerzo Normal por Momento en Y')
 subplot(2,2,4),plot(Abcisa2,Esfuerzo_Normal_Resultante),title('Esfuerzo Normal Resultante')
 figure(10)
factor_escala=d/50;
Graficacion_3d(Esfuerzo_Normal_Carga_Axial_Maximo,Esfuerzo_Normal_Momento_x_Maximo,Esfuerzo_Normal_Momento_y_Maximo,-90,0,180,90,d)
Tz=Sum_Torques_xy_ind
 Esfuerzo_Cortante_Torque_Maximo=16*Tz/(pi*d^3)
 Esfuerzo_Cortante_Momento_x_Maximo=16*Esfuerzo_Vzx_ind/(3*pi*d^2)
 Esfuerzo_Cortante_Momento_y_Maximo=16*Esfuerzo_Vzy_ind/(3*pi*d^2)
 %%Cálculos para cada ángulo
 Esfuerzo_Cortante_Momento_x=Esfuerzo_Cortante_Momento_x_Maximo*(0*Abcisa2+1);
 Esfuerzo_Cortante_Momento_xR=Esfuerzo_Cortante_Momento_x_Maximo*sind(Abcisa2).^2;%R de Radial
 Esfuerzo_Cortante_Momento_y=Esfuerzo_Cortante_Momento_y_Maximo*(0*Abcisa2+1);
 Esfuerzo_Cortante_Momento_yR=Esfuerzo_Cortante_Momento_y_Maximo*cosd(Abcisa2).^2;
 Esfuerzo_Cortante_Torque_R=Esfuerzo_Cortante_Torque_Maximo*(0*Abcisa2+1);
 Suma_Cortantes_N=Esfuerzo_Cortante_Momento_xR.*cosd(Abcisa2)+Esfuerzo_Cortante_Momento_yR.*sind(Abcisa2);
 Suma_Cortantes_N1=Esfuerzo_Cortante_Momento_xR.*cosd(Abcisa2);
 Suma_Cortantes_N2=Esfuerzo_Cortante_Momento_yR.*sind(Abcisa2);
 Suma_Cortantes_T=-Esfuerzo_Cortante_Momento_xR.*sind(Abcisa2)+Esfuerzo_Cortante_Momento_yR.*cosd(Abcisa2)+Esfuerzo_Cortante_Torque_R;
 Suma_Cortantes_T1=-Esfuerzo_Cortante_Momento_xR.*sind(Abcisa2);
 Suma_Cortantes_T2=Esfuerzo_Cortante_Momento_yR.*cosd(Abcisa2);
 Suma_Cortante_Maximo=max(sqrt(Suma_Cortantes_N.^2+Suma_Cortantes_T.^2));
 Suma_Cortante_Maximo_1=max(sqrt(Suma_Cortantes_N1.^2+Suma_Cortantes_T1.^2));
 Suma_Cortante_Maximo_2=max(sqrt(Suma_Cortantes_N2.^2+Suma_Cortantes_T2.^2));
 figure(11)
     subplot(2,3,1),plot(Abcisa2,Esfuerzo_Cortante_Momento_xR),title('Esfuerzo Cortante por Momento en X')
     subplot(2,3,2),plot(Abcisa2,Esfuerzo_Cortante_Momento_yR),title('Esfuerzo Cortante por Momento en Y')
     subplot(2,3,3),plot(Abcisa2,Esfuerzo_Cortante_Torque_R),title('Esfuerzo Cortante por Tangencial')
     subplot(2,3,4),plot(Abcisa2,Suma_Cortantes_N),title('Suma de Esfuerzos Cortantes Normales')
     subplot(2,3,5),plot(Abcisa2,Suma_Cortantes_T),title('Suma de Esfuerzos Cortantes Tangenciales')
     subplot(2,3,6),plot(Abcisa2,sqrt(Suma_Cortantes_N.^2+Suma_Cortantes_T.^2)),title('Magnitud Esfuerzos Cortantes Resultantes')
 figure(12)    
factor_escala=1/50;
 for i=1:length(Abcisa2)
     An=Abcisa2(i);%Angulo a medir
     cosAn=1*cosd(An);%d*cosd(An)
     sinAn=1*sind(An);%d*sind(An)
%      subplot(2,2,1),Vector(0,Esfuerzo_Cortante_Momento_x(i)/abs(Esfuerzo_Cortante_Momento_x_Maximo),0,0,sinAn,sinAn,factor_escala);axis equal
%      subplot(2,2,2),Vector(cosAn,cosAn,0,0,0,Esfuerzo_Cortante_Momento_z(i)/abs(Esfuerzo_Cortante_Momento_z_Maximo),factor_escala);axis equal
     subplot(2,2,1),Vector(cosAn,cosAn+(Suma_Cortantes_N1(i)*cosAn+Suma_Cortantes_T1(i)*cosd(An+90))/Suma_Cortante_Maximo_1...
                           ,sinAn,sinAn+(Suma_Cortantes_N1(i)*sinAn+Suma_Cortantes_T1(i)*sind(An+90))/Suma_Cortante_Maximo_1,0,0,factor_escala);axis equal
     subplot(2,2,2),Vector(cosAn,cosAn+(Suma_Cortantes_N2(i)*cosAn+Suma_Cortantes_T2(i)*cosd(An+90))/Suma_Cortante_Maximo_2...
                           ,sinAn,sinAn+(Suma_Cortantes_N2(i)*sinAn+Suma_Cortantes_T2(i)*sind(An+90))/Suma_Cortante_Maximo_2,0,0,factor_escala);axis equal
     subplot(2,2,3),Vector(cosAn,cosAn-sind(An)*Esfuerzo_Cortante_Torque_R(i)/abs(Esfuerzo_Cortante_Torque_Maximo),sinAn,sinAn+cosd(An)*Esfuerzo_Cortante_Torque_R(i)/abs(Esfuerzo_Cortante_Torque_Maximo),0,0,factor_escala);axis equal
     subplot(2,2,4),Vector(cosAn,cosAn+(Suma_Cortantes_N(i)*cosAn+Suma_Cortantes_T(i)*cosd(An+90))/Suma_Cortante_Maximo...
                           ,sinAn,sinAn+(Suma_Cortantes_N(i)*sinAn+Suma_Cortantes_T(i)*sind(An+90))/Suma_Cortante_Maximo,0,0,factor_escala);axis equal
%      pause(0.1);
     hold on
 end
Graficacion_3d2(Suma_Cortante_Maximo_1...
              ,Suma_Cortante_Maximo_2,Esfuerzo_Cortante_Torque_Maximo,Suma_Cortante_Maximo,3)% %Esfuerzos normales para un Angulo en específico
%%-------------------------------------------------------------%%
Angulo_theta=th;
%%-------------------------------------------------------------%%
Esfuerzo_Normal_Carga_Axial_ind=Esfuerzo_Normal_Carga_Axial_Maximo;
Esfuerzo_Normal_Momento_x_ind=-Esfuerzo_Normal_Momento_x_Maximo*sind(Angulo_theta);
Esfuerzo_Normal_Momento_y_ind=Esfuerzo_Normal_Momento_y_Maximo*cosd(Angulo_theta);
Esfuerzo_Normal_Resultante_ind=Esfuerzo_Normal_Carga_Axial_ind+Esfuerzo_Normal_Momento_x_ind+Esfuerzo_Normal_Momento_y_ind;
%Esfuerzos cortantes para un Angulo en específico
%%-------------------------------------------------------------%%
Esfuerzo_Cortante_Momento_x_ind=Esfuerzo_Cortante_Momento_x_Maximo
Esfuerzo_Cortante_Momento_xR_ind=Esfuerzo_Cortante_Momento_x_Maximo*sind(Angulo_theta)^2%R de Radial
Esfuerzo_Cortante_Momento_y_ind=Esfuerzo_Cortante_Momento_y_Maximo
Esfuerzo_Cortante_Momento_yR_ind=Esfuerzo_Cortante_Momento_y_Maximo*cosd(Angulo_theta)^2
Esfuerzo_Cortante_Torque_R_ind=Esfuerzo_Cortante_Torque_Maximo
Suma_Cortantes_N_ind=Esfuerzo_Cortante_Momento_xR_ind*cosd(Angulo_theta)+Esfuerzo_Cortante_Momento_yR_ind*sind(Angulo_theta)
Suma_Cortantes_T_ind=-Esfuerzo_Cortante_Momento_xR_ind*sind(Angulo_theta)+Esfuerzo_Cortante_Momento_yR_ind*cosd(Angulo_theta)+Esfuerzo_Cortante_Torque_R_ind
Suma_Cortante_Resultante_ind=sqrt(Suma_Cortantes_N_ind^2+Suma_Cortantes_T_ind^2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Circulo_Mohr(Ox,Oy,Oz,Txy,Txz,Tyz,An,P);
figure(13)
Circulo_Mohr(0,0,Esfuerzo_Normal_Resultante_ind,0,Suma_Cortantes_N_ind,Suma_Cortantes_T_ind,Angulo_theta,3);
    
function [y] = Heav(Uni,Fin)
%Heav Esta función realiza un escalón unitario definido.
%%Uni Punto de la grafica donde comienza el escalón unitario.
%%t es el punto a evaluar.
%%Vector y de salida es el eje y.
global Longitud
t=0:(Fin*1.2)/Longitud:Fin*1.2;
y(length(t))=0;
for i=1:length(t)
   if(t(i)<=Uni || t(i)>=Fin)
      y(i)=0;
   else
      y(i)=1;
   end
end

function [y] = Heav2(Uni,t,Fin)
%Heav Esta función realiza un escalón unitario definido.
%%Fin último punto de la gráfica.
%%Uni Punto de la grafica donde comienza el escalón unitario.
%%t Punto a evaluar.
   if(t<=Uni || t>=Fin)
      y=0;
   else
      y=1;
   end

function [t] = Abcisa(Fin)
%Abcisa Esta función realiza el vector para graficar en abcisas.
%%Fin último punto de la gráfica.
%%Vector t de salida es el eje x.
global Longitud;
t=0:(Fin*1.2)/Longitud:Fin*1.2;

function [t] = Abcisa2r()
%Abcisa Esta función realiza el vector para graficar en abcisas.
%%Vector t de salida es el eje x.
Division=36;
t=0:360/Division:360;

function []=Grafica_de_Cargas(L,Ra,Rb,RAr,RBr,Rk,Fk,Filas,P)
Rk(Filas+1,:)=Ra;
Rk(Filas+2,:)=Rb;
Fk(Filas+1,:)=RAr;
Fk(Filas+2,:)=RBr;

for k=1:Filas+2
    Vector_Uni=5*Fk(k,:)/norm(Fk(k,:));
    Vector(Rk(k,1),Rk(k,1)+Vector_Uni(1),Rk(k,2),Rk(k,2),Rk(k,3),Rk(k,3),0.1)
    Vector(Rk(k,1),Rk(k,1),Rk(k,2),Rk(k,2)+Vector_Uni(2),Rk(k,3),Rk(k,3),0.1)
    Vector(Rk(k,1),Rk(k,1),Rk(k,2),Rk(k,2),Rk(k,3),Rk(k,3)+Vector_Uni(3),0.1)
    Vector(Rk(k,1),Rk(k,1)+Vector_Uni(1),Rk(k,2),Rk(k,2)+Vector_Uni(2),Rk(k,3),Rk(k,3)+Vector_Uni(3),0.1)
    text(Rk(k,1)+Vector_Uni(1),Rk(k,2),Rk(k,3),strcat('Fx=',num2str(Fk(k,1))))
    text(Rk(k,1),Rk(k,2)+Vector_Uni(2),Rk(k,3),strcat('Fy=',num2str(Fk(k,2))))
    text(Rk(k,1),Rk(k,2),Rk(k,3)+Vector_Uni(3),strcat('Fz=',num2str(Fk(k,3))))
end
    
if P==1
    Ciindro_X(L(1,2),L(1,1),L(2,1)-L(1,1),0.2)
    Ciindro_X(L(2,2),L(2,1),L(3,1)-L(2,1),0.2)
    Ciindro_X(L(3,2),L(3,1),L(4,1)-L(3,1),0.2)
    Ciindro_X(L(4,2),L(4,1),L(5,1)-L(4,1),0.2)
    Ciindro_X(L(5,2),L(5,1),Rb(1)-L(5,1),0.2)
elseif P==2
    Ciindro_Y(L(1,2),L(1,1),L(2,1)-L(1,1),0.2)
    Ciindro_Y(L(2,2),L(2,1),L(3,1)-L(2,1),0.2)
    Ciindro_Y(L(3,2),L(3,1),L(4,1)-L(3,1),0.2)
    Ciindro_Y(L(4,2),L(4,1),L(5,1)-L(4,1),0.2)
    Ciindro_Y(L(5,2),L(5,1),Rb(2)-L(5,1),0.2)
else
    Ciindro_Z(L(1,2),L(1,1),L(2,1)-L(1,1),0.2)
    Ciindro_Z(L(2,2),L(2,1),L(3,1)-L(2,1),0.2)
    Ciindro_Z(L(3,2),L(3,1),L(4,1)-L(3,1),0.2)
    Ciindro_Z(L(4,2),L(4,1),L(5,1)-L(4,1),0.2)
    Ciindro_Z(L(5,2),L(5,1),Rb(3)-L(5,1),0.2)
end
function []=Ciindro_X(Diametro,Origen,Longitud,T1)
  Radio=Diametro/2;
  n=15;
  Q=(0:360/n:360)';
  hold on
  surf([0*Q 0*Q]+Origen,[0*Q cosd(Q)]*Radio,[0*Q sind(Q)]*Radio,'FaceAlpha',T1);
  surf([0*Q+1 0*Q+1]*Longitud+Origen,[0*Q cosd(Q)]*Radio,[0*Q sind(Q)]*Radio,'FaceAlpha',T1);
  surf([0*Q 0*Q+1]*Longitud+Origen,[cosd(Q) cosd(Q)]*Radio,[sind(Q) sind(Q)]*Radio,'FaceAlpha',T1); 
  shading interp;axis xy ;view(30,60);axis equal;

function []=Ciindro_Y(Diametro,Origen,Longitud,T1)
  Radio=Diametro/2;
  n=15;
  Q=(0:360/n:360)';
  hold on
  surf([0*Q cosd(Q)]*Radio,[0*Q 0*Q]+Origen,[0*Q sind(Q)]*Radio,'FaceAlpha',T1);
  surf([0*Q cosd(Q)]*Radio,[0*Q+1 0*Q+1]*Longitud+Origen,[0*Q sind(Q)]*Radio,'FaceAlpha',T1);
  surf([cosd(Q) cosd(Q)]*Radio,[0*Q 0*Q+1]*Longitud+Origen,[sind(Q) sind(Q)]*Radio,'FaceAlpha',T1); 
  shading interp;axis xy ;view(30,60);axis equal;
  
 function []=Ciindro_Z(Diametro,Origen,Longitud,T1)
  Radio=Diametro/2;
  n=15;
  Q=(0:360/n:360)';
  hold on
  surf([0*Q cosd(Q)]*Radio,[0*Q sind(Q)]*Radio,[0*Q 0*Q]+Origen,'FaceAlpha',T1);
  surf([0*Q cosd(Q)]*Radio,[0*Q sind(Q)]*Radio,[0*Q+1 0*Q+1]*Longitud+Origen,'FaceAlpha',T1);
  surf([cosd(Q) cosd(Q)]*Radio,[sind(Q) sind(Q)]*Radio,[0*Q 0*Q+1]*Longitud+Origen,'FaceAlpha',T1); 
  shading interp;axis xy ;view(30,60);axis equal;
  
function [] = Graficacion_3d(F1,F2,F3,An_X,An_Y,An_Z1,An_Z2,d)
%Abcisa Esta función realiza el vector para graficar en abcisas.
%%Fin último punto de la gráfica.
%%Vector t de salida es el eje x.
Q=Abcisa2r()';
Abcisa2=Abcisa2r();
% Vector=[sind(An_Y) sind(An_X) cosd(An_X)*cosd(An_Y)];
V=[sind(An_X) -sind(An_Y) cosd(An_X)*cosd(An_Y)];%V=[Yp -Xp 0]/h;
An=acosd(cosd(An_X)*cosd(An_Y));
Origen=[0,0,0];
%Transperencias
T1=0.4;
T2=0.4;
T3=0.4;
T4=0.4;
%         Eje X         Eje Y           Eje Z
subplot(2,2,1),
cla,hold on
Funcion_1=(0*Q+1)*F1;
Funcion_2=(sind(Q+An_Z1))*F2;
Funcion_3=(sind(Q+An_Z2))*F3;
Funcion_4=(0*Q+1)*F1+(sind(Q+An_Z1))*F2+(sind(Q+An_Z2))*F3;
Valor_Maximo_1=max(abs(Funcion_1));
Valor_Maximo_2=max(abs(Funcion_2));
Valor_Maximo_3=max(abs(Funcion_3));
Valor_Maximo_4=max(Funcion_4);
i=find(Funcion_4==Valor_Maximo_4);
Angulo_Max=Q(i)
Valor_Minimo_4=min(Funcion_4);
i=find(Funcion_4==Valor_Minimo_4);
Angulo_Min=Q(i)
Valor_Maximo_4a=max(abs(Funcion_4));
if Valor_Maximo_4a==Valor_Maximo_4
Angulo_Real_Maximo=Angulo_Max
Esfuerzo_Normal_Resultante_Maximo=Valor_Maximo_4;
else
 Angulo_Real_Maximo=Angulo_Min
 Esfuerzo_Normal_Resultante_Maximo=Valor_Minimo_4
end
factor_escala=d/100;
if An_Y~=0
 for i=1:length(Abcisa2)
     Ang=Abcisa2(i);%Angulo a medir
     cosAn=1*cosd(Ang);
     sinAn=1*sind(Ang);
     subplot(2,2,1),Vector(0,Funcion_1(i)/Valor_Maximo_1,cosAn,cosAn,sinAn,sinAn,factor_escala);
     subplot(2,2,2),Vector(0,Funcion_2(i)/Valor_Maximo_2,cosAn,cosAn,sinAn,sinAn,factor_escala);
     subplot(2,2,3),Vector(0,Funcion_3(i)/Valor_Maximo_3,cosAn,cosAn,sinAn,sinAn,factor_escala);
     subplot(2,2,4),Vector(0,Funcion_4(i)/Valor_Maximo_4a,cosAn,cosAn,sinAn,sinAn,factor_escala);
%      pause(0.1);
     hold on
 end
 subplot(2,2,2),title('Esfuerzo Normal por Momento Y');
 subplot(2,2,3),title('Esfuerzo Normal por Momento Z');
 c2=1;
 c3=1;
 An_Z1=An_Z1-90;
 An_Z2=An_Z2-90;
elseif An_X~=0
 for i=1:length(Abcisa2)
     Ang=Abcisa2(i);%Angulo a medir
     cosAn=1*cosd(Ang);
     sinAn=1*sind(Ang);
     subplot(2,2,1),Vector(cosAn,cosAn,0,Funcion_1(i)/Valor_Maximo_1,sinAn,sinAn,factor_escala);
     subplot(2,2,2),Vector(cosAn,cosAn,0,Funcion_2(i)/Valor_Maximo_2,sinAn,sinAn,factor_escala);
     subplot(2,2,3),Vector(cosAn,cosAn,0,Funcion_3(i)/Valor_Maximo_3,sinAn,sinAn,factor_escala);
     subplot(2,2,4),Vector(cosAn,cosAn,0,Funcion_4(i)/Valor_Maximo_4a,sinAn,sinAn,factor_escala);
%      pause(0.1);
     hold on
 end
 subplot(2,2,2),title('Esfuerzo Normal por Momento X');
 subplot(2,2,3),title('Esfuerzo Normal por Momento Z');
 c2=-1;
 c3=1;
else
  for i=1:length(Abcisa2)
     Ang=Abcisa2(i);%Angulo a medir
     cosAn=1*cosd(Ang);
     sinAn=1*sind(Ang);
     subplot(2,2,1),Vector(cosAn,cosAn,sinAn,sinAn,0,Funcion_1(i)/Valor_Maximo_1,factor_escala);
     subplot(2,2,2),Vector(cosAn,cosAn,sinAn,sinAn,0,Funcion_2(i)/Valor_Maximo_2,factor_escala);
     subplot(2,2,3),Vector(cosAn,cosAn,sinAn,sinAn,0,Funcion_3(i)/Valor_Maximo_3,factor_escala);
     subplot(2,2,4),Vector(cosAn,cosAn,sinAn,sinAn,0,Funcion_4(i)/Valor_Maximo_4a,factor_escala);
%      pause(0.1);
     hold on
 end
 subplot(2,2,2),title('Esfuerzo Normal por Momento X');
 subplot(2,2,3),title('Esfuerzo Normal por Momento Y');
 c2=1;
 c3=1;  
end
subplot(2,2,1),title('Esfuerzo Normal Axial'),hold on;
xlabel(strcat('_Escala 1:',num2str(Valor_Maximo_1)));
S1a=surf([0*Q cosd(Q)],[0*Q sind(Q)],[0*Q 0*Q]*F1/Valor_Maximo_1,'FaceAlpha',T1);
S2a=surf([0*Q cosd(Q)],[0*Q sind(Q)],[0*Q+1 0*Q+1]*F1/Valor_Maximo_1,'FaceAlpha',T1);
S3a=surf([cosd(Q) cosd(Q)],[sind(Q) sind(Q)],[0*Q 0*Q+1]*F1/Valor_Maximo_1,'FaceAlpha',T1);
axis xy ;view(30,60);axis equal;
     rotate(S1a,V,An,Origen);
     rotate(S2a,V,An,Origen);
     rotate(S3a,V,An,Origen);
shading interp;axis xy; view(60,30);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,2),hold on;
xlabel(strcat('Escala 1:',num2str(Valor_Maximo_2)));
S1b=surf([0*Q cosd(Q)],[0*Q sind(Q)],[0*Q 0*cosd(Q+An_Z1)]*c2*F2/Valor_Maximo_2,'FaceAlpha',T2);
S2b=surf([0*Q cosd(Q)],[0*Q sind(Q)],[0*Q sind(Q+An_Z1)]*c2*F2/Valor_Maximo_2,'FaceAlpha',T2);
S3b=surf([cosd(Q) cosd(Q)],[sind(Q) sind(Q)],[0*Q sind(Q+An_Z1)]*c2*F2/Valor_Maximo_2,'FaceAlpha',T2);
axis xy ;view(30,60);axis equal;
     rotate(S1b,V,An,Origen);
     rotate(S2b,V,An,Origen);
     rotate(S3b,V,An,Origen);
shading interp;axis xy; view(60,30);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,3),hold on;
xlabel(strcat('Escala 1:',num2str(Valor_Maximo_3)));
S1c=surf([0*Q cosd(Q)],[0*Q sind(Q)],[0*Q 0*cosd(Q+An_Z2)]*c3*F3/Valor_Maximo_3,'FaceAlpha',T3);
S2c=surf([0*Q cosd(Q)],[0*Q sind(Q)],[0*Q sind(Q+An_Z2)]*c3*F3/Valor_Maximo_3,'FaceAlpha',T3);
S3c=surf([cosd(Q) cosd(Q)],[sind(Q) sind(Q)],[0*Q sind(Q+An_Z2)]*c3*F3/Valor_Maximo_3,'FaceAlpha',T3);
axis xy ;view(30,60);axis equal;
     rotate(S1c,V,An,Origen);
     rotate(S2c,V,An,Origen);
     rotate(S3c,V,An,Origen);
shading interp;axis xy; view(60,30);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,4),hold on;
title('Esfuerzo Normal Resultante')
xlabel(strcat('Escala 1:',num2str(Valor_Maximo_4a)));
S1d=surf([0*Q cosd(Q)],[0*Q sind(Q)],([0*Q 0*cosd(Q+An_Z1)]*c2*F2+[0*Q 0*cosd(Q+An_Z2)]*c3*F3)/Valor_Maximo_4a,'FaceAlpha',T4);
S2d=surf([0*Q cosd(Q)],[0*Q sind(Q)],([0*Q+1 0*Q+1]*F1+[0*Q sind(Q+An_Z1)]*c2*F2+[0*Q sind(Q+An_Z2)]*c3*F3)/Valor_Maximo_4a,'FaceAlpha',T4);
S3d=surf([cosd(Q) cosd(Q)],[sind(Q) sind(Q)],([0*Q 0*Q+1]*F1+[0*Q sind(Q+An_Z1)]*c2*F2+[0*Q sind(Q+An_Z2)]*c3*F3)/Valor_Maximo_4a,'FaceAlpha',T4);
axis xy ;view(30,60);axis equal;
     rotate(S1d,V,An,Origen);
     rotate(S2d,V,An,Origen);
     rotate(S3d,V,An,Origen);
shading interp;axis xy; view(60,30);
% plot(Q,Funcion_4)

function [] = Graficacion_3d2(Suma_Cortante_Maximo_1...
              ,Suma_Cortante_Maximo_2,Esfuerzo_Cortante_Torque_Maximo,Suma_Cortante_Maximo,P)
%%%%%%%%
 Q=Abcisa2r()';
 T1=0.5;
 T2=0.5;
 T3=0.5;
 T4=0.5;
 if P==1
 subplot(2,2,1),title('Esfuerzo Cortante por Momento en Y')
 xlabel(strcat('Escala 1:',num2str(Suma_Cortante_Maximo_1)));
 surf([0*Q 0*Q],[0*Q cosd(Q)],[0*Q sind(Q)],'FaceAlpha',T1);
 surf(-[0*Q+1 0*Q+1],[0*Q cosd(Q)],[0*Q sind(Q)],'FaceAlpha',T1);
 surf(-[0*Q 0*Q+1],[cosd(Q) cosd(Q)],[sind(Q) sind(Q)],'FaceAlpha',T1);
 shading interp,axis([-1 1 -1 1 -1 1]);
 subplot(2,2,2),title('Esfuerzo Cortante por Momento en Z')
 xlabel(strcat('Escala 1:',num2str(Suma_Cortante_Maximo_2)));
 surf([0*Q 0*Q],[0*Q cosd(Q)],[0*Q sind(Q)],'FaceAlpha',T2);
 surf(-[0*Q+1 0*Q+1],[0*Q cosd(Q)],[0*Q sind(Q)],'FaceAlpha',T2);
 surf(-[0*Q 0*Q+1],[cosd(Q) cosd(Q)],[sind(Q) sind(Q)],'FaceAlpha',T2);
 shading interp,axis([-1 1 -1 1 -1 1]);
 subplot(2,2,3),title('Esfuerzo Cortante por Tangencial')
 xlabel(strcat('Escala 1:',num2str(abs(Esfuerzo_Cortante_Torque_Maximo))));
 surf([0*Q 0*Q],[0*Q cosd(Q)],[0*Q sind(Q)],'FaceAlpha',T3);
 surf(-[0*Q+1 0*Q+1],[0*Q cosd(Q)],[0*Q sind(Q)],'FaceAlpha',T3);
 surf(-[0*Q 0*Q+1],[cosd(Q) cosd(Q)],[sind(Q) sind(Q)],'FaceAlpha',T3);
 shading interp,axis([-1 1 -1 1 -1 1]);
 subplot(2,2,4),title('Esfuerzo Cortante Resultante')
 xlabel(strcat('Escala 1:',num2str(Suma_Cortante_Maximo)));
 surf([0*Q 0*Q],[0*Q cosd(Q)],[0*Q sind(Q)],'FaceAlpha',T4);
 surf(-[0*Q+1 0*Q+1],[0*Q cosd(Q)],[0*Q sind(Q)],'FaceAlpha',T4);
 surf(-[0*Q 0*Q+1],[cosd(Q) cosd(Q)],[sind(Q) sind(Q)],'FaceAlpha',T4);    
 elseif P==2
 subplot(2,2,1),title('Esfuerzo Cortante por Momento en X')
 xlabel(strcat('Escala 1:',num2str(Suma_Cortante_Maximo_1)));
 surf([0*Q cosd(Q)],[0*Q 0*Q],[0*Q sind(Q)],'FaceAlpha',T1);
 surf([0*Q cosd(Q)],-[0*Q+1 0*Q+1],[0*Q sind(Q)],'FaceAlpha',T1);
 surf([cosd(Q) cosd(Q)],-[0*Q 0*Q+1],[sind(Q) sind(Q)],'FaceAlpha',T1);
 shading interp,axis([-1 1 -1 1 -1 1]);
 subplot(2,2,2),title('Esfuerzo Cortante por Momento en Z')
 xlabel(strcat('Escala 1:',num2str(Suma_Cortante_Maximo_2)));
 surf([0*Q cosd(Q)],[0*Q 0*Q],[0*Q sind(Q)],'FaceAlpha',T2);
 surf([0*Q cosd(Q)],-[0*Q+1 0*Q+1],[0*Q sind(Q)],'FaceAlpha',T2);
 surf([cosd(Q) cosd(Q)],-[0*Q 0*Q+1],[sind(Q) sind(Q)],'FaceAlpha',T2);
 shading interp,axis([-1 1 -1 1 -1 1]);
 subplot(2,2,3),title('Esfuerzo Cortante por Tangencial')
 xlabel(strcat('Escala 1:',num2str(abs(Esfuerzo_Cortante_Torque_Maximo))));
 surf([0*Q cosd(Q)],[0*Q 0*Q],[0*Q sind(Q)],'FaceAlpha',T3);
 surf([0*Q cosd(Q)],-[0*Q+1 0*Q+1],[0*Q sind(Q)],'FaceAlpha',T3);
 surf([cosd(Q) cosd(Q)],-[0*Q 0*Q+1],[sind(Q) sind(Q)],'FaceAlpha',T3);
 shading interp,axis([-1 1 -1 1 -1 1]);
 subplot(2,2,4),title('Esfuerzo Cortante Resultante')
 xlabel(strcat('Escala 1:',num2str(Suma_Cortante_Maximo)));
 surf([0*Q cosd(Q)],[0*Q 0*Q],[0*Q sind(Q)],'FaceAlpha',T4);
 surf([0*Q cosd(Q)],-[0*Q+1 0*Q+1],[0*Q sind(Q)],'FaceAlpha',T4);
 surf([cosd(Q) cosd(Q)],-[0*Q 0*Q+1],[sind(Q) sind(Q)],'FaceAlpha',T4);
 else
 subplot(2,2,1),title('Esfuerzo Cortante por Momento en X')
 xlabel(strcat('Escala 1:',num2str(Suma_Cortante_Maximo_1)));
 surf([0*Q cosd(Q)],[0*Q sind(Q)],[0*Q 0*Q],'FaceAlpha',T1);
 surf([0*Q cosd(Q)],[0*Q sind(Q)],-[0*Q+1 0*Q+1],'FaceAlpha',T1);
 surf([cosd(Q) cosd(Q)],[sind(Q) sind(Q)],-[0*Q 0*Q+1],'FaceAlpha',T1);
 shading interp,axis([-1 1 -1 1 -1 1]);
 subplot(2,2,2),title('Esfuerzo Cortante por Momento en Y')
 xlabel(strcat('Escala 1:',num2str(Suma_Cortante_Maximo_2)));
 surf([0*Q cosd(Q)],[0*Q sind(Q)],[0*Q 0*Q],'FaceAlpha',T2);
 surf([0*Q cosd(Q)],[0*Q sind(Q)],-[0*Q+1 0*Q+1],'FaceAlpha',T2);
 surf([cosd(Q) cosd(Q)],[sind(Q) sind(Q)],-[0*Q 0*Q+1],'FaceAlpha',T2);
 shading interp,axis([-1 1 -1 1 -1 1]);
 subplot(2,2,3),title('Esfuerzo Cortante por Tangencial')
 xlabel(strcat('Escala 1:',num2str(abs(Esfuerzo_Cortante_Torque_Maximo))));
 surf([0*Q cosd(Q)],[0*Q sind(Q)],[0*Q 0*Q],'FaceAlpha',T3);
 surf([0*Q cosd(Q)],[0*Q sind(Q)],-[0*Q+1 0*Q+1],'FaceAlpha',T3);
 surf([cosd(Q) cosd(Q)],[sind(Q) sind(Q)],-[0*Q 0*Q+1],'FaceAlpha',T3);
 shading interp,axis([-1 1 -1 1 -1 1]);
 subplot(2,2,4),title('Esfuerzo Cortante Resultante')
 xlabel(strcat('Escala 1:',num2str(Suma_Cortante_Maximo)));
 surf([0*Q cosd(Q)],[0*Q sind(Q)],[0*Q 0*Q],'FaceAlpha',T4);
 surf([0*Q cosd(Q)],[0*Q sind(Q)],-[0*Q+1 0*Q+1],'FaceAlpha',T4);
 surf([cosd(Q) cosd(Q)],[sind(Q) sind(Q)],-[0*Q 0*Q+1],'FaceAlpha',T4);
 end
 shading interp,axis([-1 1 -1 1 -1 1]);
  
 function [] = Circulo_Mohr(Ox,Oy,Oz,Txy,Txz,Tyz,An,P)
n=16;
Q=(0:360/n:360)';
% P=1;%Plano xy
% P=2;%Plano xz
% P=3;%Plano yz
C0=Ox*Oy*Oz+2*Txy*Tyz*Txz-Ox*Tyz^2-Oy*Txz^2-Oz*Txy^2;
C1=Txy^2+Txz^2+Tyz^2-Ox*Oy-Oy*Oz-Oz*Ox;
C2=Ox+Oy+Oz;
Esfuerzos_Normales=roots([1 -C2 -C1 -C0]);
O1=max(Esfuerzos_Normales);
O3=min(Esfuerzos_Normales);
for i=1:3
    if Esfuerzos_Normales(i)~=O1 && Esfuerzos_Normales(i)~=O3
       O2=Esfuerzos_Normales(i);
    else
       O2=0;
    end
end
x=O3-(O1-O3)*2:(O1-O3)/100:O1+(O1-O3)*2;
y=x.^3-C2*x.^2-C1*x-C0;
T13=abs(O1-O3)/2;
T12=abs(O2-O1)/2;
T23=abs(O3-O2)/2;
Radio_1=T13;%Radio Mayor
Centro_1=(O1+O3)/2;
Radio_2=T12;
Centro_2=(O1+O2)/2;
Radio_3=T23;
Centro_3=(O2+O3)/2;
Sy=54000;
Factor_Seguridad_1=Sy/(O1-O3)
Factor_Seguridad_2=Sy/sqrt(O1^2-O1*O3+O3^2)
Division=360;
th=0:360/Division:360;
hold on
subplot(2,3,1)
plot(x,y),title('Polinomio de esfuerzos')

subplot(2,3,2),title('Grafica de esfuerzos resultantes')

hold on
plot(Centro_1+Radio_1*cosd(th),Radio_1*sind(th))
plot(Centro_2+Radio_2*cosd(th),Radio_2*sind(th));
plot(Centro_3+Radio_3*cosd(th),Radio_3*sind(th));
axis equal
%%%X Y Z
M=0.5*[1 1 1;1 1 -1;1 -1 1;1 -1 -1;...
    -1 1 1;-1 1 -1;-1 -1 1;-1 -1 -1]';
Mx=[M(1,1) M(1,2);M(1,3) M(1,4);M(1,7) M(1,8);M(1,5) M(1,6);M(1,1) M(1,2)];
My=[M(2,1) M(2,2);M(2,3) M(2,4);M(2,7) M(2,8);M(2,5) M(2,6);M(2,1) M(2,2)];
Mz=[M(3,1) M(3,2);M(3,3) M(3,4);M(3,7) M(3,8);M(3,5) M(3,6);M(3,1) M(3,2)];
Trans=0.50;
subplot(2,3,3);hold on
xlabel('Eje X');
ylabel('Eje Y');
zlabel('Eje Z');
title(strcat('Elemento de esfuerzos (Tetha=',num2str(An),'°)'));

S1a=surf(Mx,My,Mz,'FaceAlpha',Trans);
S2a=surf([M(1,1) M(1,3);M(1,5) M(1,7)],[M(2,1) M(2,3);M(2,5) M(2,7)],[M(3,1) M(3,3);M(3,5) M(3,7)],'FaceAlpha',Trans);
S3a=surf([M(1,2) M(1,4);M(1,6) M(1,8)],[M(2,2) M(2,4);M(2,6) M(2,8)],[M(3,2) M(3,4);M(3,6) M(3,8)],'FaceAlpha',Trans);
axis xy ;view(30,60);axis equal;
axis([-1 1 -1 1 -1 1]);
Origen=[0 0 0];
f=0.05;

if P==1%Plano XY
     V=[0 0 1];%Rota alrededor del eje z.
     rotate(S1a,V,An,Origen);
     rotate(S2a,V,An,Origen);
     rotate(S3a,V,An,Origen);
     if Oz>0
      h=0.6;
     else
      h=-0.6;   
     end
     S1b=surf([0*Q cosd(Q)]*f,[0*Q sind(Q)]*f,[0*Q 0*cosd(Q)]+0.5);%Inicio del Vector
     S2b=surf([cosd(Q) cosd(Q)]*f,[sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)+h*2/3]+0.5);
     S3b=surf([2*cosd(Q) cosd(Q)]*f ,[2*sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)]+h*2/3+0.5);
     S4b=surf([2*cosd(Q) 0*cosd(Q)]*f,[2*sind(Q) 0*sind(Q)]*f,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+0.5);
     rotate(S1b,V,An,Origen);
     rotate(S2b,V,An,Origen);
     rotate(S3b,V,An,Origen);
     rotate(S4b,V,An,Origen);
     shading interp;
     h1=-h;
     S1c=surf([0*Q cosd(Q)]*f,[0*Q sind(Q)]*f,[0*Q 0*cosd(Q)]-0.5);%Inicio del Vector
     S2c=surf([cosd(Q) cosd(Q)]*f,[sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)+h1*2/3]-0.5);
     S3c=surf([2*cosd(Q) cosd(Q)]*f,[2*sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)]+h1*2/3-0.5);
     S4c=surf([2*cosd(Q) 0*cosd(Q)]*f,[2*sind(Q) 0*sind(Q)]*f,[0*cosd(Q)+h1*2/3 0*cosd(Q)+h1]-0.5);
     rotate(S1c,V,An,Origen);
     rotate(S2c,V,An,Origen);
     rotate(S3c,V,An,Origen);
     rotate(S4c,V,An,Origen);
     shading interp;
     if Tyz>0
       h=-1;
       ds=0.5;
     else
       h=1;
       ds=-0.5;
     end
     S1d=surf([0*Q sind(Q)]*f,[0*Q cosd(Q)]*f+0.5,[0*Q 0*cosd(Q)]+ds);%Inicio del Vector
     S2d=surf([sind(Q) sind(Q)]*f,[cosd(Q) cosd(Q)]*f+0.5,[0*cosd(Q) 0*cosd(Q)+h*2/3]+ds);
     S3d=surf([2*sind(Q) sind(Q)]*f,[2*cosd(Q) cosd(Q)]*f+0.5,[0*cosd(Q) 0*cosd(Q)]+h*2/3+ds);
     S4d=surf([2*sind(Q) 0*sind(Q)]*f,[2*cosd(Q) 0*cosd(Q)]*f+0.5,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds);
     rotate(S1d,V,An,Origen);
     rotate(S2d,V,An,Origen);
     rotate(S3d,V,An,Origen);
     rotate(S4d,V,An,Origen);
     shading interp;
     S1e=surf([0*Q sind(Q)]*f,[0*Q 0*cosd(Q)]+ds,[0*Q cosd(Q)]*f+0.5);%Inicio del Vector
     S2e=surf([sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)+h*2/3]+ds,[cosd(Q) cosd(Q)]*f+0.5);
     S3e=surf([2*sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)]+h*2/3+ds,[2*cosd(Q) cosd(Q)]*f+0.5);
     S4e=surf([2*sind(Q) 0*sind(Q)]*f,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds,[2*cosd(Q) 0*cosd(Q)]*f+0.5);
     rotate(S1e,V,An,Origen);
     rotate(S2e,V,An,Origen);
     rotate(S3e,V,An,Origen);
     rotate(S4e,V,An,Origen);
     shading interp;
     h=-h;
     ds=-ds;
     S1f=surf([0*Q sind(Q)]*f,[0*Q cosd(Q)]*f-0.5,[0*Q 0*cosd(Q)]+ds);%Inicio del Vector
     S2f=surf([sind(Q) sind(Q)]*f,[cosd(Q) cosd(Q)]*f-0.5,[0*cosd(Q) 0*cosd(Q)+h*2/3]+ds);
     S3f=surf([2*sind(Q) sind(Q)]*f ,[2*cosd(Q) cosd(Q)]*f-0.5,[0*cosd(Q) 0*cosd(Q)]+h*2/3+ds);
     S4f=surf([2*sind(Q) 0*sind(Q)]*f,[2*cosd(Q) 0*cosd(Q)]*f-0.5,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds);
     rotate(S1f,V,An,Origen);
     rotate(S2f,V,An,Origen);
     rotate(S3f,V,An,Origen);
     rotate(S4f,V,An,Origen);
     shading interp;
     S1e=surf([0*Q sind(Q)]*f,[0*Q 0*cosd(Q)]+ds,[0*Q cosd(Q)]*f-0.5);%Inicio del Vector
     S2e=surf([sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)+h*2/3]+ds,[cosd(Q) cosd(Q)]*f-0.5);
     S3e=surf([2*sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)]+h*2/3+ds,[2*cosd(Q) cosd(Q)]*f-0.5);
     S4e=surf([2*sind(Q) 0*sind(Q)]*f,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds,[2*cosd(Q) 0*cosd(Q)]*f-0.5);
     rotate(S1e,V,An,Origen);
     rotate(S2e,V,An,Origen);
     rotate(S3e,V,An,Origen);
     rotate(S4e,V,An,Origen);
     shading interp;
     if Txz<0
       h=-1;
       ds=0.5;
     else
       h=1;
       ds=-0.5;
     end
     S1d=surf([0*Q 0*cosd(Q)]+ds,[0*Q sind(Q)]*f,[0*Q cosd(Q)]*f+0.5);%Inicio del Vector
     S2d=surf([0*cosd(Q) 0*cosd(Q)+h*2/3]+ds,[sind(Q) sind(Q)]*f,[cosd(Q) cosd(Q)]*f+0.5);
     S3d=surf([0*cosd(Q) 0*cosd(Q)]+h*2/3+ds,[2*sind(Q) sind(Q)]*f,[2*cosd(Q) cosd(Q)]*f+0.5);
     S4d=surf([0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds,[2*sind(Q) 0*sind(Q)]*f,[2*cosd(Q) 0*cosd(Q)]*f+0.5);
     rotate(S1d,V,An,Origen);
     rotate(S2d,V,An,Origen);
     rotate(S3d,V,An,Origen);
     rotate(S4d,V,An,Origen);
     shading interp;
     S1e=surf([0*Q cosd(Q)]*f+0.5,[0*Q sind(Q)]*f,[0*Q 0*cosd(Q)]+ds);%Inicio del Vector
     S2e=surf([cosd(Q) cosd(Q)]*f+0.5,[sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)+h*2/3]+ds);
     S3e=surf([2*cosd(Q) cosd(Q)]*f+0.5,[2*sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)]+h*2/3+ds);
     S4e=surf([2*cosd(Q) 0*cosd(Q)]*f+0.5,[2*sind(Q) 0*sind(Q)]*f,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds);
     rotate(S1e,V,An,Origen);
     rotate(S2e,V,An,Origen);
     rotate(S3e,V,An,Origen);
     rotate(S4e,V,An,Origen);
     shading interp;
     h=-h;
     ds=-ds;
     S1f=surf([0*Q 0*cosd(Q)]+ds,[0*Q sind(Q)]*f,[0*Q cosd(Q)]*f-0.5);%Inicio del Vector
     S2f=surf([0*cosd(Q) 0*cosd(Q)+h*2/3]+ds,[sind(Q) sind(Q)]*f,[cosd(Q) cosd(Q)]*f-0.5);
     S3f=surf([0*cosd(Q) 0*cosd(Q)]+h*2/3+ds,[2*sind(Q) sind(Q)]*f,[2*cosd(Q) cosd(Q)]*f-0.5);
     S4f=surf([0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds,[2*sind(Q) 0*sind(Q)]*f,[2*cosd(Q) 0*cosd(Q)]*f-0.5);
     rotate(S1f,V,An,Origen);
     rotate(S2f,V,An,Origen);
     rotate(S3f,V,An,Origen);
     rotate(S4f,V,An,Origen);
     shading interp;
     S1e=surf([0*Q cosd(Q)]*f-0.5,[0*Q sind(Q)]*f,[0*Q 0*cosd(Q)]+ds);%Inicio del Vector
     S2e=surf([cosd(Q) cosd(Q)]*f-0.5,[sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)+h*2/3]+ds);
     S3e=surf([2*cosd(Q) cosd(Q)]*f-0.5,[2*sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)]+h*2/3+ds);
     S4e=surf([2*cosd(Q) 0*cosd(Q)]*f-0.5,[2*sind(Q) 0*sind(Q)]*f,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds);
     rotate(S1e,V,An,Origen);
     rotate(S2e,V,An,Origen);
     rotate(S3e,V,An,Origen);
     rotate(S4e,V,An,Origen);
     shading interp;
     subplot(2,3,6)
title(strcat('Ox=',num2str(Ox),',On=',num2str(Oy),',Ot=',num2str(Oz),char(13),...
       ',Txn=',num2str(Txy),',Txt=',num2str(Txz),',Tnt=',num2str(Tyz) ));
xlabel(strcat('O1=',num2str(O1),',O2=',num2str(O2),',O3=',num2str(O3),char(13),...
       ',T12=',num2str(T12),',T13=',num2str(T13),',T23=',num2str(T23) ));
elseif P==2 %Plano XZ
     V=[0 1 0];%Rota alrededor del eje y.
     rotate(S1a,V,An,Origen);
     rotate(S2a,V,An,Origen);
     rotate(S3a,V,An,Origen);
     if Oy>0
      h=0.6;
     else
      h=-0.6;   
     end
     S1b=surf([0*Q cosd(Q)]*f,[0*Q 0*cosd(Q)]+0.5,[0*Q sind(Q)]*f);%Inicio del Vector
     S2b=surf([cosd(Q) cosd(Q)]*f,[0*cosd(Q) 0*cosd(Q)+h*2/3]+0.5,[sind(Q) sind(Q)]*f);
     S3b=surf([2*cosd(Q) cosd(Q)]*f ,[0*cosd(Q) 0*cosd(Q)]+h*2/3+0.5,[2*sind(Q) sind(Q)]*f);
     S4b=surf([2*cosd(Q) 0*cosd(Q)]*f,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+0.5,[2*sind(Q) 0*sind(Q)]*f);
     rotate(S1b,V,An,Origen);
     rotate(S2b,V,An,Origen);
     rotate(S3b,V,An,Origen);
     rotate(S4b,V,An,Origen);
     shading interp;
     h1=-h;
     S1c=surf([0*Q cosd(Q)]*f,[0*Q 0*cosd(Q)]-0.5,[0*Q sind(Q)]*f);%Inicio del Vector
     S2c=surf([cosd(Q) cosd(Q)]*f,[0*cosd(Q) 0*cosd(Q)+h1*2/3]-0.5,[sind(Q) sind(Q)]*f);
     S3c=surf([2*cosd(Q) cosd(Q)]*f,[0*cosd(Q) 0*cosd(Q)]+h1*2/3-0.5,[2*sind(Q) sind(Q)]*f);
     S4c=surf([2*cosd(Q) 0*cosd(Q)]*f,[0*cosd(Q)+h1*2/3 0*cosd(Q)+h1]-0.5,[2*sind(Q) 0*sind(Q)]*f);
     rotate(S1c,V,An,Origen);
     rotate(S2c,V,An,Origen);
     rotate(S3c,V,An,Origen);
     rotate(S4c,V,An,Origen);
     shading interp;
     if Txy>0
       h=-1;
       ds=0.5;
     else
       h=1;
       ds=-0.5;
     end
     S1d=surf([0*Q 0*cosd(Q)]+ds,[0*Q cosd(Q)]*f+0.5,[0*Q sind(Q)]*f);%Inicio del Vector
     S2d=surf([0*cosd(Q) 0*cosd(Q)+h*2/3]+ds,[cosd(Q) cosd(Q)]*f+0.5,[sind(Q) sind(Q)]*f);
     S3d=surf([0*cosd(Q) 0*cosd(Q)]+h*2/3+ds,[2*cosd(Q) cosd(Q)]*f+0.5,[2*sind(Q) sind(Q)]*f);
     S4d=surf([0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds,[2*cosd(Q) 0*cosd(Q)]*f+0.5,[2*sind(Q) 0*sind(Q)]*f);
     rotate(S1d,V,An,Origen);
     rotate(S2d,V,An,Origen);
     rotate(S3d,V,An,Origen);
     rotate(S4d,V,An,Origen);
     shading interp;
     S1e=surf([0*Q cosd(Q)]*f+0.5,[0*Q 0*cosd(Q)]+ds,[0*Q sind(Q)]*f);%Inicio del Vector
     S2e=surf([cosd(Q) cosd(Q)]*f+0.5,[0*cosd(Q) 0*cosd(Q)+h*2/3]+ds,[sind(Q) sind(Q)]*f);
     S3e=surf([2*cosd(Q) cosd(Q)]*f+0.5,[0*cosd(Q) 0*cosd(Q)]+h*2/3+ds,[2*sind(Q) sind(Q)]*f);
     S4e=surf([2*cosd(Q) 0*cosd(Q)]*f+0.5,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds,[2*sind(Q) 0*sind(Q)]*f);
     rotate(S1e,V,An,Origen);
     rotate(S2e,V,An,Origen);
     rotate(S3e,V,An,Origen);
     rotate(S4e,V,An,Origen);
     shading interp;
     h=-h;
     ds=-ds;
     S1f=surf([0*Q 0*cosd(Q)]+ds,[0*Q cosd(Q)]*f-0.5,[0*Q sind(Q)]*f);%Inicio del Vector
     S2f=surf([0*cosd(Q) 0*cosd(Q)+h*2/3]+ds,[cosd(Q) cosd(Q)]*f-0.5,[sind(Q) sind(Q)]*f);
     S3f=surf([0*cosd(Q) 0*cosd(Q)]+h*2/3+ds,[2*cosd(Q) cosd(Q)]*f-0.5,[2*sind(Q) sind(Q)]*f);
     S4f=surf([0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds,[2*cosd(Q) 0*cosd(Q)]*f-0.5,[2*sind(Q) 0*sind(Q)]*f);
     rotate(S1f,V,An,Origen);
     rotate(S2f,V,An,Origen);
     rotate(S3f,V,An,Origen);
     rotate(S4f,V,An,Origen);
     shading interp;
     S1e=surf([0*Q cosd(Q)]*f-0.5,[0*Q 0*cosd(Q)]+ds,[0*Q sind(Q)]*f);%Inicio del Vector
     S2e=surf([cosd(Q) cosd(Q)]*f-0.5,[0*cosd(Q) 0*cosd(Q)+h*2/3]+ds,[sind(Q) sind(Q)]*f);
     S3e=surf([2*cosd(Q) cosd(Q)]*f-0.5,[0*cosd(Q) 0*cosd(Q)]+h*2/3+ds,[2*sind(Q) sind(Q)]*f);
     S4e=surf([2*cosd(Q) 0*cosd(Q)]*f-0.5,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds,[2*sind(Q) 0*sind(Q)]*f);
     rotate(S1e,V,An,Origen);
     rotate(S2e,V,An,Origen);
     rotate(S3e,V,An,Origen);
     rotate(S4e,V,An,Origen);
     shading interp;
     if Tyz>0
       h=-1;
       ds=0.5;
     else
       h=1;
       ds=-0.5;
     end
     S1d=surf([0*Q sind(Q)]*f,[0*Q cosd(Q)]*f+0.5,[0*Q 0*cosd(Q)]+ds);%Inicio del Vector
     S2d=surf([sind(Q) sind(Q)]*f,[cosd(Q) cosd(Q)]*f+0.5,[0*cosd(Q) 0*cosd(Q)+h*2/3]+ds);
     S3d=surf([2*sind(Q) sind(Q)]*f,[2*cosd(Q) cosd(Q)]*f+0.5,[0*cosd(Q) 0*cosd(Q)]+h*2/3+ds);
     S4d=surf([2*sind(Q) 0*sind(Q)]*f,[2*cosd(Q) 0*cosd(Q)]*f+0.5,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds);
     rotate(S1d,V,An,Origen);
     rotate(S2d,V,An,Origen);
     rotate(S3d,V,An,Origen);
     rotate(S4d,V,An,Origen);
     shading interp;
     S1e=surf([0*Q sind(Q)]*f,[0*Q 0*cosd(Q)]+ds,[0*Q cosd(Q)]*f+0.5);%Inicio del Vector
     S2e=surf([sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)+h*2/3]+ds,[cosd(Q) cosd(Q)]*f+0.5);
     S3e=surf([2*sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)]+h*2/3+ds,[2*cosd(Q) cosd(Q)]*f+0.5);
     S4e=surf([2*sind(Q) 0*sind(Q)]*f,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds,[2*cosd(Q) 0*cosd(Q)]*f+0.5);
     rotate(S1e,V,An,Origen);
     rotate(S2e,V,An,Origen);
     rotate(S3e,V,An,Origen);
     rotate(S4e,V,An,Origen);
     shading interp;
     h=-h;
     ds=-ds;
     S1f=surf([0*Q sind(Q)]*f,[0*Q cosd(Q)]*f-0.5,[0*Q 0*cosd(Q)]+ds);%Inicio del Vector
     S2f=surf([sind(Q) sind(Q)]*f,[cosd(Q) cosd(Q)]*f-0.5,[0*cosd(Q) 0*cosd(Q)+h*2/3]+ds);
     S3f=surf([2*sind(Q) sind(Q)]*f ,[2*cosd(Q) cosd(Q)]*f-0.5,[0*cosd(Q) 0*cosd(Q)]+h*2/3+ds);
     S4f=surf([2*sind(Q) 0*sind(Q)]*f,[2*cosd(Q) 0*cosd(Q)]*f-0.5,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds);
     rotate(S1f,V,An,Origen);
     rotate(S2f,V,An,Origen);
     rotate(S3f,V,An,Origen);
     rotate(S4f,V,An,Origen);
     shading interp;
     S1e=surf([0*Q sind(Q)]*f,[0*Q 0*cosd(Q)]+ds,[0*Q cosd(Q)]*f-0.5);%Inicio del Vector
     S2e=surf([sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)+h*2/3]+ds,[cosd(Q) cosd(Q)]*f-0.5);
     S3e=surf([2*sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)]+h*2/3+ds,[2*cosd(Q) cosd(Q)]*f-0.5);
     S4e=surf([2*sind(Q) 0*sind(Q)]*f,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds,[2*cosd(Q) 0*cosd(Q)]*f-0.5);
     rotate(S1e,V,An,Origen);
     rotate(S2e,V,An,Origen);
     rotate(S3e,V,An,Origen);
     rotate(S4e,V,An,Origen);
     shading interp;
     subplot(2,3,6)
title(strcat('On=',num2str(Ox),',Oy=',num2str(Oy),',Ot=',num2str(Oz),char(13),...
       ',Tyn=',num2str(Txy),',Tnt=',num2str(Txz),',Tyt=',num2str(Tyz) ));
xlabel(strcat('O1=',num2str(O1),',O2=',num2str(O2),',O3=',num2str(O3),char(13),...
       ',T12=',num2str(T12),',T13=',num2str(T13),',T23=',num2str(T23) ));
else %Plano YZ
    V=[1 0 0];%Rota alrededor del eje x.
     rotate(S1a,V,An,Origen);
     rotate(S2a,V,An,Origen);
     rotate(S3a,V,An,Origen);
     if Ox>0
      h=0.6;
     else
      h=-0.6;   
     end
     S1b=surf([0*Q 0*cosd(Q)]+0.5,[0*Q cosd(Q)]*f,[0*Q sind(Q)]*f);%Inicio del Vector
     S2b=surf([0*cosd(Q) 0*cosd(Q)+h*2/3]+0.5,[cosd(Q) cosd(Q)]*f,[sind(Q) sind(Q)]*f);
     S3b=surf([0*cosd(Q) 0*cosd(Q)]+h*2/3+0.5,[2*cosd(Q) cosd(Q)]*f,[2*sind(Q) sind(Q)]*f);
     S4b=surf([0*cosd(Q)+h*2/3 0*cosd(Q)+h]+0.5,[2*cosd(Q) 0*cosd(Q)]*f,[2*sind(Q) 0*sind(Q)]*f);
     rotate(S1b,V,An,Origen);
     rotate(S2b,V,An,Origen);
     rotate(S3b,V,An,Origen);
     rotate(S4b,V,An,Origen);
     shading interp;
     h1=-h;
     S1c=surf([0*Q 0*cosd(Q)]-0.5,[0*Q cosd(Q)]*f,[0*Q sind(Q)]*f);%Inicio del Vector
     S2c=surf([0*cosd(Q) 0*cosd(Q)+h1*2/3]-0.5,[cosd(Q) cosd(Q)]*f,[sind(Q) sind(Q)]*f);
     S3c=surf([0*cosd(Q) 0*cosd(Q)]+h1*2/3-0.5,[2*cosd(Q) cosd(Q)]*f,[2*sind(Q) sind(Q)]*f);
     S4c=surf([0*cosd(Q)+h1*2/3 0*cosd(Q)+h1]-0.5,[2*cosd(Q) 0*cosd(Q)]*f,[2*sind(Q) 0*sind(Q)]*f);
     rotate(S1c,V,An,Origen);
     rotate(S2c,V,An,Origen);
     rotate(S3c,V,An,Origen);
     rotate(S4c,V,An,Origen);
     shading interp;
     if Txz<0
       h=-1;
       ds=0.5;
     else
       h=1;
       ds=-0.5;
     end
     S1d=surf([0*Q 0*cosd(Q)]+ds,[0*Q sind(Q)]*f,[0*Q cosd(Q)]*f+0.5);%Inicio del Vector
     S2d=surf([0*cosd(Q) 0*cosd(Q)+h*2/3]+ds,[sind(Q) sind(Q)]*f,[cosd(Q) cosd(Q)]*f+0.5);
     S3d=surf([0*cosd(Q) 0*cosd(Q)]+h*2/3+ds,[2*sind(Q) sind(Q)]*f,[2*cosd(Q) cosd(Q)]*f+0.5);
     S4d=surf([0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds,[2*sind(Q) 0*sind(Q)]*f,[2*cosd(Q) 0*cosd(Q)]*f+0.5);
     rotate(S1d,V,An,Origen);
     rotate(S2d,V,An,Origen);
     rotate(S3d,V,An,Origen);
     rotate(S4d,V,An,Origen);
     shading interp;
     S1e=surf([0*Q cosd(Q)]*f+0.5,[0*Q sind(Q)]*f,[0*Q 0*cosd(Q)]+ds);%Inicio del Vector
     S2e=surf([cosd(Q) cosd(Q)]*f+0.5,[sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)+h*2/3]+ds);
     S3e=surf([2*cosd(Q) cosd(Q)]*f+0.5,[2*sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)]+h*2/3+ds);
     S4e=surf([2*cosd(Q) 0*cosd(Q)]*f+0.5,[2*sind(Q) 0*sind(Q)]*f,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds);
     rotate(S1e,V,An,Origen);
     rotate(S2e,V,An,Origen);
     rotate(S3e,V,An,Origen);
     rotate(S4e,V,An,Origen);
     shading interp;
     h=-h;
     ds=-ds;
     S1f=surf([0*Q 0*cosd(Q)]+ds,[0*Q sind(Q)]*f,[0*Q cosd(Q)]*f-0.5);%Inicio del Vector
     S2f=surf([0*cosd(Q) 0*cosd(Q)+h*2/3]+ds,[sind(Q) sind(Q)]*f,[cosd(Q) cosd(Q)]*f-0.5);
     S3f=surf([0*cosd(Q) 0*cosd(Q)]+h*2/3+ds,[2*sind(Q) sind(Q)]*f,[2*cosd(Q) cosd(Q)]*f-0.5);
     S4f=surf([0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds,[2*sind(Q) 0*sind(Q)]*f,[2*cosd(Q) 0*cosd(Q)]*f-0.5);
     rotate(S1f,V,An,Origen);
     rotate(S2f,V,An,Origen);
     rotate(S3f,V,An,Origen);
     rotate(S4f,V,An,Origen);
     shading interp;
     S1e=surf([0*Q cosd(Q)]*f-0.5,[0*Q sind(Q)]*f,[0*Q 0*cosd(Q)]+ds);%Inicio del Vector
     S2e=surf([cosd(Q) cosd(Q)]*f-0.5,[sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)+h*2/3]+ds);
     S3e=surf([2*cosd(Q) cosd(Q)]*f-0.5,[2*sind(Q) sind(Q)]*f,[0*cosd(Q) 0*cosd(Q)]+h*2/3+ds);
     S4e=surf([2*cosd(Q) 0*cosd(Q)]*f-0.5,[2*sind(Q) 0*sind(Q)]*f,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds);
     rotate(S1e,V,An,Origen);
     rotate(S2e,V,An,Origen);
     rotate(S3e,V,An,Origen);
     rotate(S4e,V,An,Origen);
     shading interp;
     if Txy>0
       h=-1;
       ds=0.5;
     else
       h=1;
       ds=-0.5;
     end
     S1d=surf([0*Q 0*cosd(Q)]+ds,[0*Q cosd(Q)]*f+0.5,[0*Q sind(Q)]*f);%Inicio del Vector
     S2d=surf([0*cosd(Q) 0*cosd(Q)+h*2/3]+ds,[cosd(Q) cosd(Q)]*f+0.5,[sind(Q) sind(Q)]*f);
     S3d=surf([0*cosd(Q) 0*cosd(Q)]+h*2/3+ds,[2*cosd(Q) cosd(Q)]*f+0.5,[2*sind(Q) sind(Q)]*f);
     S4d=surf([0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds,[2*cosd(Q) 0*cosd(Q)]*f+0.5,[2*sind(Q) 0*sind(Q)]*f);
     rotate(S1d,V,An,Origen);
     rotate(S2d,V,An,Origen);
     rotate(S3d,V,An,Origen);
     rotate(S4d,V,An,Origen);
     shading interp;
     S1e=surf([0*Q cosd(Q)]*f+0.5,[0*Q 0*cosd(Q)]+ds,[0*Q sind(Q)]*f);%Inicio del Vector
     S2e=surf([cosd(Q) cosd(Q)]*f+0.5,[0*cosd(Q) 0*cosd(Q)+h*2/3]+ds,[sind(Q) sind(Q)]*f);
     S3e=surf([2*cosd(Q) cosd(Q)]*f+0.5,[0*cosd(Q) 0*cosd(Q)]+h*2/3+ds,[2*sind(Q) sind(Q)]*f);
     S4e=surf([2*cosd(Q) 0*cosd(Q)]*f+0.5,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds,[2*sind(Q) 0*sind(Q)]*f);
     rotate(S1e,V,An,Origen);
     rotate(S2e,V,An,Origen);
     rotate(S3e,V,An,Origen);
     rotate(S4e,V,An,Origen);
     shading interp;
     h=-h;
     ds=-ds;
     S1f=surf([0*Q 0*cosd(Q)]+ds,[0*Q cosd(Q)]*f-0.5,[0*Q sind(Q)]*f);%Inicio del Vector
     S2f=surf([0*cosd(Q) 0*cosd(Q)+h*2/3]+ds,[cosd(Q) cosd(Q)]*f-0.5,[sind(Q) sind(Q)]*f);
     S3f=surf([0*cosd(Q) 0*cosd(Q)]+h*2/3+ds,[2*cosd(Q) cosd(Q)]*f-0.5,[2*sind(Q) sind(Q)]*f);
     S4f=surf([0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds,[2*cosd(Q) 0*cosd(Q)]*f-0.5,[2*sind(Q) 0*sind(Q)]*f);
     rotate(S1f,V,An,Origen);
     rotate(S2f,V,An,Origen);
     rotate(S3f,V,An,Origen);
     rotate(S4f,V,An,Origen);
     shading interp;
     S1e=surf([0*Q cosd(Q)]*f-0.5,[0*Q 0*cosd(Q)]+ds,[0*Q sind(Q)]*f);%Inicio del Vector
     S2e=surf([cosd(Q) cosd(Q)]*f-0.5,[0*cosd(Q) 0*cosd(Q)+h*2/3]+ds,[sind(Q) sind(Q)]*f);
     S3e=surf([2*cosd(Q) cosd(Q)]*f-0.5,[0*cosd(Q) 0*cosd(Q)]+h*2/3+ds,[2*sind(Q) sind(Q)]*f);
     S4e=surf([2*cosd(Q) 0*cosd(Q)]*f-0.5,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+ds,[2*sind(Q) 0*sind(Q)]*f);
     rotate(S1e,V,An,Origen);
     rotate(S2e,V,An,Origen);
     rotate(S3e,V,An,Origen);
     rotate(S4e,V,An,Origen);
     shading interp;
     subplot(2,3,6)
title(strcat('On=',num2str(Ox),',Ot=',num2str(Oy),',Oz=',num2str(Oz),char(13),...
       ',Tnt=',num2str(Txy),',Tzn=',num2str(Txz),',Tzt=',num2str(Tyz) ));
xlabel(strcat('O1=',num2str(O1),',O2=',num2str(O2),',O3=',num2str(O3),char(13),...
       ',T12=',num2str(T12),',T13=',num2str(T13),',T23=',num2str(T23) ));
end
subplot(2,3,4),title('Teoría de Falla de Esfuerzo cortante máximo');
xlabel(strcat('Factor de Seguridad=',num2str(Factor_Seguridad_1)))
hold on, grid on
plot([0 Sy Sy 0 -Sy -Sy 0],[Sy Sy 0 -Sy -Sy 0 Sy])
plot(O1,O3,'r*'),text(O1,O3,strcat(num2str(O1),',',num2str(O3)));
subplot(2,3,5),title('Teoría de Falla de Energía de Distorsión');
xlabel(strcat('Factor de Seguridad=',num2str(Factor_Seguridad_2)))
hold on, grid on
% 0.866025575061527
% p = calculateEllipse(0, 0, Sy*0.8164968301, Sy*sqrt(2), 45,2000);
% plot(p(:,1), p(:,2))
axis equal
Fx=-1.2*Sy:2500/Sy:1.2*Sy;
Disc=real(sqrt(4*Sy^2*(Fx*0+1)-3*Fx.^2));
Fy1=(1/2)*(Fx-Disc);
Fy2=(1/2)*(Fx+Disc);
plot(Fx,Fy1,'b')
plot(Fx,Fy2,'b')
plot(O1,O3,'r*'),text(O1,O3,strcat(num2str(O1),',',num2str(O3)));
% subplot(2,3,6)
% title(strcat('Ox=',num2str(Ox),',Oy=',num2str(Oy),',Oz=',num2str(Oz),char(13),...
%        ',Txy=',num2str(Txy),',Txz=',num2str(Txz),',Tyz=',num2str(Tyz) ));
% xlabel(strcat('O1=',num2str(O1),',O2=',num2str(O2),',O3=',num2str(O3),char(13),...
%        ',T12=',num2str(T12),',T13=',num2str(T13),',T23=',num2str(T23) ));

 function [X,Y] = calculateEllipse(x, y, a, b, angle, steps)
    %# This functions returns points to draw an ellipse
    %#
    %#  @param x     X coordinate
    %#  @param y     Y coordinate
    %#  @param a     Semimajor axis
    %#  @param b     Semiminor axis
    %#  @param angle Angle of the ellipse (in degrees)
    %#

    narginchk(5, 6);
    if nargin<6, steps = 36; end

    beta = -angle * (pi / 180);
    sinbeta = sin(beta);
    cosbeta = cos(beta);

    alpha = linspace(0, 360, steps)' .* (pi / 180);
    sinalpha = sin(alpha);
    cosalpha = cos(alpha);

    X = x + (a * cosalpha * cosbeta - b * sinalpha * sinbeta);
    Y = y + (a * cosalpha * sinbeta + b * sinalpha * cosbeta);

    if nargout==1, X = [X Y]; end
  
 function [] = Vector(x1,x2,y1,y2,z1,z2,f)
%Abcisa Esta función realiza el vector para graficar en abcisas.
%%Fin último punto de la gráfica.
%%Vector t de salida es el eje x.
n=3;
Q=(0:360/n:360)';
Xp=x2-x1;
Yp=y2-y1;
Zp=z2-z1;
h=sqrt((Xp)^2+(Yp)^2+(Zp)^2);
V=[Yp -Xp 0]/h;
Origen=[x1,y1,z1];
Angulo=acosd(-Zp/h);
axis xy;view(30,60);
% axis equal;
hold on;
 S1=surf([0*Q cosd(Q)]*f+x1,[0*Q sind(Q)]*f+y1,[0*Q+z1 0*cosd(Q)+z1]);%Inicio del Vector
 S2=surf([cosd(Q) cosd(Q)]*f+x1,[sind(Q) sind(Q)]*f+y1,[0*cosd(Q) 0*cosd(Q)+h*2/3]+z1);
 S3=surf([2*cosd(Q) cosd(Q)]*f+x1,[2*sind(Q) sind(Q)]*f+y1,[0*cosd(Q) 0*cosd(Q)]+h*2/3+z1);
 S4=surf([2*cosd(Q) 0*cosd(Q)]*f+x1,[2*sind(Q) 0*sind(Q)]*f+y1,[0*cosd(Q)+h*2/3 0*cosd(Q)+h]+z1);
 if Angulo==0
    rotate(S1,[1 0 0],180,Origen);
    rotate(S2,[1 0 0],180,Origen);
    rotate(S3,[1 0 0],180,Origen);
    rotate(S4,[1 0 0],180,Origen);
 end
 if Angulo~=180 && Angulo~=0
    rotate(S1,V,Angulo,Origen);
    rotate(S2,V,Angulo+180,Origen);
    rotate(S3,V,Angulo+180,Origen);
    rotate(S4,V,Angulo+180,Origen);
 end
 shading interp;
%  axis([-20 20 -20 20 -20 20]);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dl
Valor=get(hObject,'Value');
set(handles.text3,'String',strcat(num2str(Valor),'*L'))
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Valor=round(get(hObject,'Value'));
set(hObject,'Value',Valor);
set(handles.text7,'String',Valor);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
