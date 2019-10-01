function varargout = Practica_2(varargin)
% PRACTICA_2 MATLAB code for Practica_2.fig
%      PRACTICA_2, by itself, creates a new PRACTICA_2 or raises the existing
%      singleton*.
%
%      H = PRACTICA_2 returns the handle to a new PRACTICA_2 or the handle to
%      the existing singleton*.
%
%      PRACTICA_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRACTICA_2.M with the given input arguments.
%
%      PRACTICA_2('Property','Value',...) creates a new PRACTICA_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Practica_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Practica_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Practica_2

% Last Modified by GUIDE v2.5 19-Oct-2016 23:40:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Practica_2_OpeningFcn, ...
                   'gui_OutputFcn',  @Practica_2_OutputFcn, ...
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


% --- Executes just before Practica_2 is made visible.
function Practica_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Practica_2 (see VARARGIN)

% Choose default command line output for Practica_2
handles.output = hObject;
Tabla_A1=[0 0 0;0 0 0;0.4 -0.3 -0.2;-300 -200 150;-85 0 -170;-300 -200 150;...
    -85 0 -170;-6.9264 -13.8528 -0.1019;-0.2037 0.1019 0];
Tabla_Datos=Tabla_A1;
handles.metricdata.Filas=1;
global Longitud dl
Longitud=5000;
dl=8.5;
set(handles.uitable1,'data',Tabla_Datos);
set(handles.slider1, 'Max', 360);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Practica_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Practica_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
Filas=str2double(get(handles.edit1,'String'));%Obtener Filas
 if Filas>handles.metricdata.Filas
  %Agregar nuevas filas con un for.
  for i=handles.metricdata.Filas:1:Filas-1%For para generar las Filas faltantes.
  tablap=get(handles.uitable1,'Data');%Obtener los datos de la tabla.
  Ntablap=get(handles.uitable1,'RowName');
  n=size(tablap);
  f=n(1)-6;
  g=f+3;
  Tabla_text_Posicion=cellstr(strcat('Posición_',num2str(i+1)));
  Tabla_text_Fuerza=cellstr(strcat('Fuerza_',num2str(i+1)));
  Tabla_text_Momento=cellstr(strcat('Momento_',num2str(i+1)));
  Ntablap(g+3:g+6,:)=Ntablap(f+3:f+6,:);%Copiar texto de filas anteriores para las ultimas columnas.
  Ntablap(g:g+2,:)=[Tabla_text_Posicion Tabla_text_Fuerza Tabla_text_Momento];%Copiar texto de filas anteriores .
  tablap(g+3:g+6,:)=tablap(f+3:f+6,:);%Copiar texto de filas anteriores para las ultimas columnas.
  tablap(g:g+2,:)=tablap(f:f+2,:);%Copiar texto de filas anteriores.
  set(handles.uitable1,'RowName',Ntablap);%Actualizar Tabla.
  set(handles.uitable1,'data',tablap);%Actualizar Tabla.
  end
 elseif Filas<handles.metricdata.Filas
  %Quitar filas necesarias con un for.
  Diferencia=handles.metricdata.Filas-Filas;
  for i=Filas:1:handles.metricdata.Filas-1%For quitar las Filas faltantes.
  tablap=get(handles.uitable1,'Data');%Obtener los datos de la tabla.
  Ntablap=get(handles.uitable1,'RowName');
  n=size(tablap);
  f=n(1);
  g=f-7;
  set(handles.uitable1,'RowName',[Ntablap(1:g,:);Ntablap(f-3:f,:)])
  set(handles.uitable1,'data',[tablap(1:g,:);tablap(f-3:f,:)]);%Actualizar Tabla.
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
Filas=handles.metricdata.Filas;
tablap=get(handles.uitable1,'Data');
Origen=tablap(1,:);
P_Analisis=tablap(2,:);
R1=P_Analisis-Origen;
Rk(Filas,:)=[0 0 0];
Fk(Filas,:)=[0 0 0];
Momento(Filas,:)=[0 0 0];
for k=1:Filas
   Rk(k,:)=tablap(3*k,:)-R1%Vectores R posición.
   Fk(k,:)=tablap(1+3*k,:)%Fuerzas F.
   Momento(k,:)=cross(Rk(k,:),Fk(k,:))
   tablap(2+3*k,:)=Momento(k,:);
end
if Filas==1
Fuerza_Total=Fk;
Momento_Total=Momento;
else
Fuerza_Total=sum(Fk);
Momento_Total=sum(Momento);
end
tablap(3+3*Filas,:)=sum(Fk);
tablap(4+3*Filas,:)=sum(Momento);
set(handles.uitable1,'Data',tablap)
X=get(handles.radiobutton1,'Value');
Y=get(handles.radiobutton2,'Value');
Angulo_theta=str2double(get(handles.text4,'String'));
D=str2double(get(handles.edit2,'String'));
kc=str2double(get(handles.edit3,'String'));
Sy=str2double(get(handles.edit4,'String'))*1000000;
Division=str2double(get(handles.edit5,'String'));
if X==1
   disp('Eje X');
elseif Y==1
   disp('Eje Y');
   tablap2=Eje_Y(Fuerza_Total(1),Fuerza_Total(2),Fuerza_Total(3),Momento_Total(1),Momento_Total(2),Momento_Total(3),kc,D,Sy,Division,Angulo_theta);
   set(handles.uitable2,'Data',tablap2)
   Nombre_Columna(round(360/Division))=round(360/Division);
   for i=0:round(360/Division)
   Nombre_Columna(i+1)=i;   
   end
   set(handles.uitable2,'ColumnName',Nombre_Columna);
else
   disp('Eje Z'); 
end
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function[Matriz_Resultante]=Eje_Y(Esfuerzo_Vyx_ind,Fy,Esfuerzo_Vyz_ind,Momento_Myx_ind,Ty,Momento_Myz_ind,kc,d,Sy,Division,Angulo_theta)
%  kc=1;%Constante de Esfuerzo
%  d=0.05;%Diámetro del cilindro.
 Esfuerzo_Normal_Carga_Axial_Maximo=4*kc*Fy/(pi*d^2);
 Esfuerzo_Normal_Momento_yx_Maximo=32*kc*Momento_Myx_ind/(pi*d^3);
 Esfuerzo_Normal_Momento_yz_Maximo=32*kc*Momento_Myz_ind/(pi*d^3);
%Vectores de Esfuerzos Normales
Abcisa2=0:Division:360;
Esfuerzo_Normal_Carga_Axial=Esfuerzo_Normal_Carga_Axial_Maximo*(Abcisa2*0+1);
Esfuerzo_Normal_Momento_yx=-Esfuerzo_Normal_Momento_yx_Maximo*sind(Abcisa2);
Esfuerzo_Normal_Momento_yz=Esfuerzo_Normal_Momento_yz_Maximo*cosd(Abcisa2);
Esfuerzo_Normal_Resultante=Esfuerzo_Normal_Carga_Axial+Esfuerzo_Normal_Momento_yx+Esfuerzo_Normal_Momento_yz;
figure(1)
 subplot(2,2,1),plot(Abcisa2,Esfuerzo_Normal_Carga_Axial),title('Esfuerzo Normal por Carga Axial')
 subplot(2,2,2),plot(Abcisa2,Esfuerzo_Normal_Momento_yx),title('Esfuerzo Normal por Momento en X')
 subplot(2,2,3),plot(Abcisa2,Esfuerzo_Normal_Momento_yz),title('Esfuerzo Normal por Momento en Z')
 subplot(2,2,4),plot(Abcisa2,Esfuerzo_Normal_Resultante),title('Esfuerzo Normal Resultante')
figure(2)
Graficacion_3d(Esfuerzo_Normal_Carga_Axial_Maximo,Esfuerzo_Normal_Momento_yx_Maximo,Esfuerzo_Normal_Momento_yz_Maximo,-90,0,180,90)
%%Esfuerzos Cortantes
 Esfuerzo_Cortante_Torque_Maximo=16*kc*Ty/(pi*d^3);
 Esfuerzo_Cortante_Momento_yx_Maximo=16*kc*Esfuerzo_Vyx_ind/(3*pi*d^2);
 Esfuerzo_Cortante_Momento_yz_Maximo=16*kc*Esfuerzo_Vyz_ind/(3*pi*d^2);
 %%Cálculos para cada ángulo
 Esfuerzo_Cortante_Momento_yxR=Esfuerzo_Cortante_Momento_yx_Maximo*sind(Abcisa2).^2;%R de Radial
 Esfuerzo_Cortante_Momento_yzR=Esfuerzo_Cortante_Momento_yz_Maximo*cosd(Abcisa2).^2;
 Esfuerzo_Cortante_Torque_R=Esfuerzo_Cortante_Torque_Maximo*(0*Abcisa2+1);
 Suma_Cortantes_N=Esfuerzo_Cortante_Momento_yxR.*cosd(Abcisa2)+Esfuerzo_Cortante_Momento_yzR.*sind(Abcisa2);
 Suma_Cortantes_N1=Esfuerzo_Cortante_Momento_yxR.*cosd(Abcisa2);
 Suma_Cortantes_N2=Esfuerzo_Cortante_Momento_yzR.*sind(Abcisa2);
 Suma_Cortantes_T=-Esfuerzo_Cortante_Momento_yxR.*sind(Abcisa2)+Esfuerzo_Cortante_Momento_yzR.*cosd(Abcisa2)+Esfuerzo_Cortante_Torque_R;
 Suma_Cortantes_T1=-Esfuerzo_Cortante_Momento_yxR.*sind(Abcisa2);
 Suma_Cortantes_T2=Esfuerzo_Cortante_Momento_yzR.*cosd(Abcisa2);
 Suma_Cortantes_Total=sqrt(Suma_Cortantes_N.^2+Suma_Cortantes_T.^2);
 Suma_Cortante_Maximo=max(sqrt(Suma_Cortantes_N.^2+Suma_Cortantes_T.^2));
 Suma_Cortante_Maximo_1=max(sqrt(Suma_Cortantes_N1.^2+Suma_Cortantes_T1.^2));
 Suma_Cortante_Maximo_2=max(sqrt(Suma_Cortantes_N2.^2+Suma_Cortantes_T2.^2));
 figure(3)
     subplot(2,3,1),plot(Abcisa2,Esfuerzo_Cortante_Momento_yxR),title('Esfuerzo Cortante por Momento en X')
     subplot(2,3,2),plot(Abcisa2,Esfuerzo_Cortante_Momento_yzR),title('Esfuerzo Cortante por Momento en Z')
     subplot(2,3,3),plot(Abcisa2,Esfuerzo_Cortante_Torque_R),title('Esfuerzo Cortante por Tangencial')
     subplot(2,3,4),plot(Abcisa2,Suma_Cortantes_N),title('Suma de Esfuerzos Cortantes Normales')
     subplot(2,3,5),plot(Abcisa2,Suma_Cortantes_T),title('Suma de Esfuerzos Cortantes Tangenciales')
     subplot(2,3,6),plot(Abcisa2,sqrt(Suma_Cortantes_N.^2+Suma_Cortantes_T.^2)),title('Magnitud Esfuerzos Cortantes Resultantes')
figure(4)    
Graficacion_3d2(Suma_Cortante_Maximo_1...
              ,Suma_Cortante_Maximo_2,Esfuerzo_Cortante_Momento_yx_Maximo,Esfuerzo_Cortante_Momento_yz_Maximo,Esfuerzo_Cortante_Torque_Maximo,Suma_Cortante_Maximo,2)
%Esfuerzos normales para un Ángulo en específico
%%-------------------------------------------------------------%%
Esfuerzo_Normal_Carga_Axial_ind=Esfuerzo_Normal_Carga_Axial_Maximo;
Esfuerzo_Normal_Momento_yx_ind=-Esfuerzo_Normal_Momento_yx_Maximo*sind(Angulo_theta);
Esfuerzo_Normal_Momento_yz_ind=Esfuerzo_Normal_Momento_yz_Maximo*cosd(Angulo_theta);
Esfuerzo_Normal_Resultante_ind=Esfuerzo_Normal_Carga_Axial_ind+Esfuerzo_Normal_Momento_yx_ind+Esfuerzo_Normal_Momento_yz_ind;
%Esfuerzos cortantes para un Ángulo en específico
%%-------------------------------------------------------------%%
Esfuerzo_Cortante_Momento_yxR_ind=Esfuerzo_Cortante_Momento_yx_Maximo*sind(Angulo_theta)^2;%R de Radial
Esfuerzo_Cortante_Momento_yzR_ind=Esfuerzo_Cortante_Momento_yz_Maximo*cosd(Angulo_theta)^2;
Esfuerzo_Cortante_Torque_R_ind=Esfuerzo_Cortante_Torque_Maximo;
Suma_Cortantes_N_ind=Esfuerzo_Cortante_Momento_yxR_ind*cosd(Angulo_theta)+Esfuerzo_Cortante_Momento_yzR_ind*sind(Angulo_theta);
Suma_Cortantes_T_ind=-Esfuerzo_Cortante_Momento_yxR_ind*sind(Angulo_theta)+Esfuerzo_Cortante_Momento_yzR_ind*cosd(Angulo_theta)+Esfuerzo_Cortante_Torque_R_ind;
Suma_Cortante_Resultante_ind=sqrt(Suma_Cortantes_N_ind^2+Suma_Cortantes_T_ind^2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Circulo_Mohr(Ox,Oy,Oz,Txy,Txz,Tyz,An,P);
figure(8)
Circulo_Mohr(0,Esfuerzo_Normal_Resultante_ind,0,Suma_Cortantes_N_ind,0,Suma_Cortantes_T_ind,Angulo_theta,Sy,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Valor_Maximo_4=max(Esfuerzo_Normal_Resultante);
i=find(Esfuerzo_Normal_Resultante==Valor_Maximo_4);
Angulo_Max=Abcisa2(i);
Valor_Minimo_4=min(Esfuerzo_Normal_Resultante);
i=find(Esfuerzo_Normal_Resultante==Valor_Minimo_4);
Angulo_Min=Abcisa2(i);
Valor_Maximo_4a=max(abs(Esfuerzo_Normal_Resultante));
if Valor_Maximo_4a==Valor_Maximo_4
Angulo_Real_Maximo=Angulo_Max;
Esfuerzo_Normal_Resultante_Maximo=Valor_Maximo_4;
else
 Angulo_Real_Maximo=Angulo_Min;
 Esfuerzo_Normal_Resultante_Maximo=Valor_Minimo_4;
end
figure(9)
Circulo_Mohr(0,Esfuerzo_Normal_Resultante_Maximo,0,Suma_Cortantes_N(i),0,Suma_Cortantes_T(i),Angulo_Real_Maximo,Sy,2);

Theta=Abcisa2*(10^6);
Sigma1=Esfuerzo_Normal_Momento_yx;
Sigma2=Esfuerzo_Normal_Momento_yz;
Sigma3=Esfuerzo_Normal_Carga_Axial;
Sigma_Total=Esfuerzo_Normal_Resultante;
Tau1=Esfuerzo_Cortante_Momento_yxR;
Tau1_N=Suma_Cortantes_N1;
Tau1_T=Suma_Cortantes_T1;
Tau2=Esfuerzo_Cortante_Momento_yzR;
Tau2_N=Suma_Cortantes_N2;
Tau2_T=Suma_Cortantes_T2;
Tau3=Esfuerzo_Cortante_Torque_R;
TauR_N=Suma_Cortantes_N;
TauR_T=Suma_Cortantes_T;
TauR=Suma_Cortantes_Total;
Matriz_Resultante=[Theta;Sigma1;Sigma2;Sigma3;Sigma_Total;Tau1;Tau2;Tau3;...
                   Tau1_N;Tau1_T;Tau2_N;Tau2_T;TauR_N;TauR_T;TauR]/(10^6);
function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Valor=round(get(hObject,'Value'));
set(hObject,'Value',Valor);
set(handles.text4,'String',Valor);
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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


function [] = Graficacion_3d(F1,F2,F3,An_X,An_Y,An_Z1,An_Z2)
Q=(0:10:360)';
Abcisa2=Q';
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
Angulo_Max=Q(i);
Valor_Minimo_4=min(Funcion_4);
i=find(Funcion_4==Valor_Minimo_4);
Angulo_Min=Q(i);
Valor_Maximo_4a=max(abs(Funcion_4));
if Valor_Maximo_4a==Valor_Maximo_4
Angulo_Real_Maximo=Angulo_Max;
Esfuerzo_Normal_Resultante_Maximo=Valor_Maximo_4;
else
 Angulo_Real_Maximo=Angulo_Min;
 Esfuerzo_Normal_Resultante_Maximo=Valor_Minimo_4;
end
factor_escala=1/20;
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

function [] = Graficacion_3d2(Suma_Cortante_Maximo_1...
              ,Suma_Cortante_Maximo_2,Esfuerzo_Cortante_Momento_1_Maximo,Esfuerzo_Cortante_Momento_2_Maximo,Esfuerzo_Cortante_Torque_Maximo,Suma_Cortante_Maximo,P)
%%%%%%%%
 Q=(0:10:360)';
 T1=0.5;
 T2=0.5;
 T3=0.5;
 T4=0.5;
 factor_escala=1/30;
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
 Esfuerzo_Cortante_Momento_yx_Maximo=Esfuerzo_Cortante_Momento_1_Maximo;
 Esfuerzo_Cortante_Momento_yz_Maximo=Esfuerzo_Cortante_Momento_2_Maximo;
 %%Cálculos para cada ángulo
 Esfuerzo_Cortante_Momento_yxR=Esfuerzo_Cortante_Momento_yx_Maximo*sind(Q).^2;%R de Radial
 Esfuerzo_Cortante_Momento_yzR=Esfuerzo_Cortante_Momento_yz_Maximo*cosd(Q).^2;
 Esfuerzo_Cortante_Torque_R=Esfuerzo_Cortante_Torque_Maximo*(0*Q+1);
 Suma_Cortantes_N=Esfuerzo_Cortante_Momento_yxR.*cosd(Q)+Esfuerzo_Cortante_Momento_yzR.*sind(Q);
 Suma_Cortantes_N1=Esfuerzo_Cortante_Momento_yxR.*cosd(Q);
 Suma_Cortantes_N2=Esfuerzo_Cortante_Momento_yzR.*sind(Q);
 Suma_Cortantes_T=-Esfuerzo_Cortante_Momento_yxR.*sind(Q)+Esfuerzo_Cortante_Momento_yzR.*cosd(Q)+Esfuerzo_Cortante_Torque_R;
 Suma_Cortantes_T1=-Esfuerzo_Cortante_Momento_yxR.*sind(Q);
 Suma_Cortantes_T2=Esfuerzo_Cortante_Momento_yzR.*cosd(Q);
 Suma_Cortante_Maximo=max(sqrt(Suma_Cortantes_N.^2+Suma_Cortantes_T.^2));
 Suma_Cortante_Maximo_1=max(sqrt(Suma_Cortantes_N1.^2+Suma_Cortantes_T1.^2));
 Suma_Cortante_Maximo_2=max(sqrt(Suma_Cortantes_N2.^2+Suma_Cortantes_T2.^2));
 
 for i=1:length(Q)
     An=Q(i);%Angulo a medir
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
     hold on
 end
 %%%%%%%%%%
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
  
 function [] = Circulo_Mohr(Ox,Oy,Oz,Txy,Txz,Tyz,An,Sy,P)
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
% Sy=54000;
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
Fx=-1.2*Sy:Sy/2500:1.2*Sy;
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



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
