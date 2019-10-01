function varargout = Grafica(varargin)
% GRAFICA MATLAB code for Grafica.fig
%      GRAFICA, by itself, creates a new GRAFICA or raises the existing
%      singleton*.
%
%      H = GRAFICA returns the handle to a new GRAFICA or the handle to
%      the existing singleton*.
%
%      GRAFICA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAFICA.M with the given input arguments.
%
%      GRAFICA('Property','Value',...) creates a new GRAFICA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Grafica_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Grafica_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Grafica

% Last Modified by GUIDE v2.5 28-Nov-2014 17:43:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Grafica_OpeningFcn, ...
                   'gui_OutputFcn',  @Grafica_OutputFcn, ...
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


% --- Executes just before Grafica is made visible.
function Grafica_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Grafica (see VARARGIN)
global Puerto;
% Choose default command line output for Grafica
handles.output = hObject;
guidata(hObject, handles);
axes(handles.Grafica) 
background = imread('Inicio.jpg');  
imshow(background);
axes(handles.ILed1) 
background = imread('Apagado.jpg');  
imshow(background);
axes(handles.ILed2) 
background = imread('Apagado.jpg');  
imshow(background);
L1=0;
L2=0;
contador=1;
muestras=1000;
def=0;
set(handles.btn_conectar,'Value',1);

while contador<=muestras
a=get(handles.btn_conectar,'Value')
 if (a==1)
    disp(contador);
    %Verificar si esta conectado
    if (def==0)
     clc;
     delete(instrfind({'port'},{'COM4'}));
     Puerto=serial('COM4');
     set(Puerto,'BaudRate',9600);
     set(Puerto,'DataBits',8);
     set(Puerto,'Parity','none');
     set(Puerto,'Stopbits',1);
     set(Puerto,'FlowControl','none');
     fopen(Puerto);
     set(handles.btn_conectar,'String','Desconectar');
     def=1;
    end
    b=get(handles.Led_1,'Value');
    if (L1~=b)
        %%Verificar que L1 este indicando el valor seleccionado
        if L1==1                      
           axes(handles.ILed1) 
           background = imread('Apagado.jpg');  
           imshow(background);
           disp('L1 Apagado');
        else
           axes(handles.ILed1) 
           background = imread('Encendido.jpg');  
           imshow(background);
           disp('L1 Encendido');
        end
       L1=b;
    end
    c=get(handles.Led_2,'Value');
    if(L2~=c)
        %%Verificar que L2 este indicando el valor seleccionado
        if L2==1                      
           axes(handles.ILed2) 
           background = imread('Apagado.jpg');  
           imshow(background);
           disp('L2 Apagado');
        else
           axes(handles.ILed2) 
           background = imread('Encendido.jpg');  
           imshow(background);
           disp('L2 Encendido');
        end
       L2=c;
    end
    disp('Conectado');
    valorADC=fscanf(Puerto,'%d')';
    voltaje(contador)=valorADC*5/1024;
    plot(handles.Grafica,voltaje);
    drawnow
    contador=contador+1;
    pause(0.01)
 else
     if def==1
        fclose(Puerto);
        def=0;
        axes(handles.Grafica) 
        background = imread('Inicio.jpg');  
        imshow(background);
        axes(handles.ILed1) 
        background = imread('Apagado.jpg');  
        imshow(background);
        axes(handles.ILed2) 
        background = imread('Apagado.jpg');  
        imshow(background);
        L1=0;
        L2=0;
        contador=1;
        muestras=1000;
        set(handles.btn_conectar,'String','Conectar');
        disp('Desconectado');
     end
     pause(0.01)
 end
end
 % Update handles structure
guidata(hObject, handles);

% UIWAIT makes Grafica wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Grafica_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in btn_desconectar.
function Led_2_Callback(hObject, eventdata, handles)
% hObject    handle to Led_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of Led_2

function Led_1_Callback(hObject, eventdata, handles)
% hObject    handle to Led_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hint: get(hObject,'Value') returns toggle state of Led_1


% --- Executes on button press in btn_salir.
function btn_salir_Callback(hObject, eventdata, handles)
% hObject    handle to btn_salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
if a==1
   close(gcbf); 
end
% Hint: get(hObject,'Value') returns toggle state of btn_salir


% --- Executes on button press in btn_conectar.
function btn_conectar_Callback(hObject, eventdata, handles)
% hObject    handle to btn_conectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btn_conectar
