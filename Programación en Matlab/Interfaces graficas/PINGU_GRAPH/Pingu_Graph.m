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
global J
J = imread('Arduino.png');
imshow(J);
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
clc;
voltaje=0; %Declara variable en la cual se van a guardar los valores

%Borra datos que se encuentren previos y vuelve a declarar el puerto y la
%velocidad de transmisión
delete(instrfind({'port'},{'COM4'})); 
puerto=serial('COM4');
puerto.BaudRate=9600;

fopen(puerto);%abre el puerto a utilizar
contador=1;

%configura la ventana donde se va a mostrar la grafica
figure('Name','Grafica voltaje')
title('GRAFICA VOLTAJE ADC-SERIAL');
xlabel('Numero de Muestras');
ylabel('Voltaje (V)');
grid off;
hold on;
muestras=700;
voltaje(muestras)=0;
%Ciclo para ir realizando la grafica paso a paso
while contador<=muestras
    ylim([0 5.1]);
    xlim([0 muestras]);
    valorADC=str2double(fscanf(puerto,'%c')');
    voltaje(contador)=valorADC*5/255;
    plot(voltaje);
    drawnow
    contador=contador+1;
end
%cierra y borra el puerto utilizado, borra todas las variables utilizadas
fclose(puerto);
delete(puerto);
fprintf('Finalizado');
clear all;
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in TConectar.
function TConectar_Callback(hObject, eventdata, handles)
% hObject    handle to TConectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TConectar
