function varargout = Pingu_Graph(varargin)
% PINGU_GRAPH MATLAB code for Pingu_Graph.fig
%      PINGU_GRAPH, by itself, creates a new PINGU_GRAPH or raises the existing
%      singleton*.
%
%      H = PINGU_GRAPH returns the handle to a new PINGU_GRAPH or the handle to
%      the existing singleton*.
%
%      PINGU_GRAPH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PINGU_GRAPH.M with the given input arguments.
%
%      PINGU_GRAPH('Property','Value',...) creates a new PINGU_GRAPH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Pingu_Graph_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Pingu_Graph_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Pingu_Graph

% Last Modified by GUIDE v2.5 04-May-2016 23:12:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Pingu_Graph_OpeningFcn, ...
                   'gui_OutputFcn',  @Pingu_Graph_OutputFcn, ...
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


% --- Executes just before Pingu_Graph is made visible.
function Pingu_Graph_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Pingu_Graph (see VARARGIN)

% Choose default command line output for Pingu_Graph

handles.output = hObject;
clc
global i
i=0;
set(handles.BTN_Graficar,'Enable','off');
%global J
%J = imread('Arduino.png');
%imshow(J);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Pingu_Graph wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Pingu_Graph_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in BTN_Graficar.
function BTN_Graficar_Callback(hObject, eventdata, handles)
% hObject    handle to BTN_Graficar (see GCBO)
global puerto
clc;
voltaje=0; %Declara variable en la cual se van a guardar los valores
contador=2;
%configura la ventana donde se va a mostrar la grafica
axes(handles.axes1);
muestras=500;
voltaje(muestras)=5;
muestreo=(0:1:muestras-1);
%Ciclo para ir realizando la gráfica paso a paso.
axes(handles.axes1);
while contador<=muestras
    ylim([0 5]);
    xlim([0 muestras]);
    valorADC=fscanf(puerto,'%d');
    voltaje(contador)=valorADC*5/255-2.5;
    plot(muestreo,voltaje);
    contador=contador+1;
    pause(0.0001);
end
lm=length(muestreo);
for i=1:lm-1
 Iy(i)=sum(voltaje(1:i+1))/muestras;
end
for i=1:lm-1
Dy(i)=(voltaje(i+1)-voltaje(i));
end
 Iy(lm)=Iy(lm-1);
 Dy(lm)=Dy(lm-1);
 hold on
 plot(muestreo,Iy,'r');
 plot(muestreo,Dy,'g');
 hold off
%cierra y borra el puerto utilizado, borra todas las variables utilizadas
set(handles.BTN_Graficar,'Enable','off');
set(handles.TConectar,'Enable','on');
fprintf('Finalizado');
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in TConectar.
function TConectar_Callback(hObject, eventdata, handles)
% hObject    handle to TConectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i puerto;
set(hObject,'Enable','off')
if (i==0)
 i=1;
 delete(instrfind({'port'},{'COM4'})); 
 puerto=serial('COM4');
 puerto.BaudRate=9600;
 puerto.Timeout=10;
  get(puerto,'Timeout');
 get(puerto,'Terminator');
 %Borra datos que se encuentren previos y vuelve a declarar el puerto y la
 %velocidad de transmisión
 fopen(puerto);%abre el puerto a utilizar
 set(hObject,'String','Desconectar')
 set(handles.BTN_Graficar,'Enable','on')
else
 i=0;
 fclose(puerto);
 delete(puerto);
 set(hObject,'String','Conectar')
end
% Hint: get(hObject,'Value') returns toggle state of TConectar
