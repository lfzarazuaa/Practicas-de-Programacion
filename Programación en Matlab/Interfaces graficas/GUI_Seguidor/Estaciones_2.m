function varargout = Estaciones_2(varargin)
% ESTACIONES_2 MATLAB code for Estaciones_2.fig
%      ESTACIONES_2, by itself, creates a new ESTACIONES_2 or raises the existing
%      singleton*.
%
%      H = ESTACIONES_2 returns the handle to a new ESTACIONES_2 or the handle to
%      the existing singleton*.
%
%      ESTACIONES_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ESTACIONES_2.M with the given input arguments.
%
%      ESTACIONES_2('Property','Value',...) creates a new ESTACIONES_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Estaciones_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Estaciones_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Estaciones_2

% Last Modified by GUIDE v2.5 26-Feb-2015 21:05:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Estaciones_2_OpeningFcn, ...
                   'gui_OutputFcn',  @Estaciones_2_OutputFcn, ...
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


% --- Executes just before Estaciones_2 is made visible.
function Estaciones_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Estaciones_2 (see VARARGIN)

% Choose default command line output for Estaciones_2
handles.output = hObject;
global Linea Carro rep  Tabla p
set(handles.BTN_Monitorear,'Enable','off')
Carro = imread('Seguilineas.jpg');
Linea = imread('Linea.jpg');
axes(handles.axes1);
imshow(Linea);
axes(handles.axes2);
imshow(Linea);
axes(handles.axes3);
imshow(Linea);
axes(handles.axes4);
imshow(Linea);
rep=[0 0 0 0 0 0];
Tabla=handles.Tabla;
Repeticiones={0 0 0 0};
Estado={'Inactivo' 'Inactivo' 'Inactivo' 'Inactivo'};
Celdas=[Repeticiones' Estado'];
set(Tabla,'data',Celdas);


A='star wars cantina.mp3';
    [Y, FS]=audioread(A);
    Tiempo=size(Y,1)/FS;
    p = audioplayer(Y, FS);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Estaciones_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Estaciones_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
set(handles.Chbox_Sonido,'Value',0)
stop(p);
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in TConectar.
function TConectar_Callback(hObject, eventdata, handles)
% hObject    handle to TConectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Linea puerto contador Tabla rep
if(get(hObject,'Value')==1)
contador=1;
puerto=serial('COM4');
puerto.BaudRate=9600;
fopen(puerto);%abre el puerto a utilizar
set(hObject,'String','Desconectar');
rep=[0 0 0 0 0 0];
Repeticiones={0 0 0 0};
Estado={'Inactivo' 'Inactivo' 'Inactivo' 'Inactivo'};
Celdas=[Repeticiones' Estado'];
set(Tabla,'data',Celdas);
     axes(handles.axes1);
     imshow(Linea);
     axes(handles.axes2);
     imshow(Linea);
     axes(handles.axes3);
     imshow(Linea);
     axes(handles.axes4);
     imshow(Linea);
     set(handles.BTN_Monitorear,'Enable','on')
else
fclose(puerto);
%J = imread('Arduino.png');
%imshow(J);
     axes(handles.axes1);
     imshow(Linea);
     axes(handles.axes2);
     imshow(Linea);
     axes(handles.axes3);
     imshow(Linea);
     axes(handles.axes4);
     imshow(Linea);
set(hObject,'String','Conectar');
set(handles.BTN_Monitorear,'Enable','off')
end
% Hint: get(hObject,'Value') returns toggle state of TConectar


% --- Executes on button press in Chbox_Sonido.
function Chbox_Sonido_Callback(hObject, eventdata, handles)
% hObject    handle to Chbox_Sonido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
if(get(hObject,'Value')==1)
resume(p);
else
stop(p);
end
% Hint: get(hObject,'Value') returns toggle state of Chbox_Sonido

% --- Executes on button press in BTN_Seleccionar.
function BTN_Seleccionar_Callback(hObject, eventdata, handles)
% hObject    handle to BTN_Seleccionar (see GCBO)
global p
[filename, pathname, filterindex] = uigetfile('*.mp3', 'Escoja una canción.');
Nombre=char(filename);
Ruta=char(pathname);
if(get(handles.Chbox_Sonido,'Value')==1)
  n=1;
  set(handles.Chbox_Sonido,'Value',0);
else
  n=0;
end
pause(0.5)
    A=[Ruta,Nombre];
    [Y, FS]=audioread(A);
    p = audioplayer(Y, FS);
    pause(0.5)
    if(n==1)
    set(handles.Chbox_Sonido,'Value',1);
    resume(p);
    end
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in BTN_Monitorear.
function BTN_Monitorear_Callback(hObject, eventdata, handles)
% hObject    handle to BTN_Monitorear (see GCBO)
global puerto contador Linea Carro rep Tabla
set(hObject,'Enable','off')
estacion=0;
Repeticiones={0 0 0 0};
Estado={'Inactivo' 'Inactivo' 'Inactivo' 'Inactivo'};
while(get(handles.TConectar,'Value')==1)
    dant=estacion;
    fprintf(puerto,'r');
    estacion=fscanf(puerto,'%d');
    dato=estacion;
    if(dato~=dant && (dato>=1||dato<=4)  && (dant>=0||dant<=4))
       rep(dato)=rep(dato)+1;
       Repeticiones(dato)=num2cell(rep(dato));
       if(dato==1)
       Estado={'Activo' 'Inactivo' 'Inactivo' 'Inactivo'};
       elseif(dato==2)
       Estado={'Inactivo' 'Activo' 'Inactivo' 'Inactivo'};      
       elseif(dato==3)
       Estado={'Inactivo' 'Inactivo' 'Activo' 'Inactivo'};    
       elseif(dato==4)
       Estado={'Inactivo' 'Inactivo' 'Inactivo' 'Activo'};   
       end
       Celdas=[Repeticiones' Estado'];
       set(Tabla,'data',Celdas);
    end
    %Si dato es distinto a dato anterior entonces incremntar contador
    %valuado en dato.
     
    if(estacion==1)
     axes(handles.axes2);
     imshow(Linea);
     axes(handles.axes3);
     imshow(Linea);
     axes(handles.axes4);
     imshow(Linea);
     axes(handles.axes1);
     imshow(Carro);
    elseif(estacion==2)
     axes(handles.axes1);
     imshow(Linea);
     axes(handles.axes2);
     imshow(Carro);
     axes(handles.axes3);
     imshow(Linea);
     axes(handles.axes4);
     imshow(Linea);   
    elseif(estacion==3)
     axes(handles.axes1);
     imshow(Linea);
     axes(handles.axes2);
     imshow(Linea);
     axes(handles.axes3);
     imshow(Carro);
     axes(handles.axes4);
     imshow(Linea);   
    elseif(estacion==4)
     axes(handles.axes1);
     imshow(Linea);
     axes(handles.axes2);
     imshow(Linea);
     axes(handles.axes3);
     imshow(Linea);
     axes(handles.axes4);
     imshow(Carro);   
    elseif(estacion==0)
     axes(handles.axes1);
     imshow(Linea);
     axes(handles.axes2);
     imshow(Linea);
     axes(handles.axes3);
     imshow(Linea);
     axes(handles.axes4);
     imshow(Linea);   
    elseif(estacion==5)
     axes(handles.axes1);
     imshow(Linea);
     axes(handles.axes2);
     imshow(Linea);
     axes(handles.axes3);
     imshow(Linea);
     axes(handles.axes4);
     imshow(Linea);    
    end
    contador=contador+1;
    pause(0.05);
    
 end


% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
