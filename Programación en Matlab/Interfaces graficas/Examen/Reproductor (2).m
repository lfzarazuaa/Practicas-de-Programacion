function varargout = Reproductor(varargin)
% REPRODUCTOR MATLAB code for Reproductor.fig
%      REPRODUCTOR, by itself, creates a new REPRODUCTOR or raises the existing
%      singleton*.
%
%      H = REPRODUCTOR returns the handle to a new REPRODUCTOR or the handle to
%      the existing singleton*.
%
%      REPRODUCTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REPRODUCTOR.M with the given input arguments.
%
%      REPRODUCTOR('Property','Value',...) creates a new REPRODUCTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Reproductor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Reproductor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Reproductor

% Last Modified by GUIDE v2.5 27-Jan-2015 21:08:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Reproductor_OpeningFcn, ...
                   'gui_OutputFcn',  @Reproductor_OutputFcn, ...
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


% --- Executes just before Reproductor is made visible.
function Reproductor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Reproductor (see VARARGIN)

% Choose default command line output for Reproductor
handles.output = hObject;
clc
global i p a b;
clear p
a=1;
b=1;
i=0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Reproductor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Reproductor_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in Lista_1.
function Lista_1_Callback(hObject, eventdata, handles)
% hObject    handle to Lista_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a i Canciones m
a=get(hObject,'Value')
if i>1
Cancion=Canciones(:,:,a);
Nombre=char(Cancion(1))
Ruta=char(Cancion(2))
    A=[Ruta,Nombre];
    [Y, FS]=audioread(A);
    Tiempo=size(Y,1)/FS;
    m = audioplayer(Y, FS);
    fprintf('Datos Actualizados');
end
% Hints: contents = cellstr(get(hObject,'String')) returns Lista_1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Lista_1


% --- Executes during object creation, after setting all properties.
function Lista_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lista_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BTN_Reproducir.
function BTN_Reproducir_Callback(hObject, eventdata, handles)
% hObject    handle to BTN_Reproducir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p i m b a;
if (b~=a)
    %fprintf('Cancion Cambiada');
    p=m;
    b=a;
end
if(i==0)
    errordlg('¡Ingrese una cancion por lo menos!','Error');
else
    resume(p);
end

% --- Executes on button press in BTN_Detener.
function BTN_Detener_Callback(hObject, eventdata, handles)
% hObject    handle to BTN_Detener (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  p i;
if(i==0)
   errordlg('¡Ingrese una cancion por lo menos!','Error'); 
else
    stop(p)
end
% --- Executes on button press in BTN_Pausa.
function BTN_Pausa_Callback(hObject, eventdata, handles)
% hObject    handle to BTN_Pausa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p i;
if(i==0)
   errordlg('¡Ingrese una cancion por lo menos!','Error');
else
   pause(p) 
end
% --- Executes on button press in BTN_Siguiente.
function BTN_Siguiente_Callback(hObject, eventdata, handles)
% hObject    handle to BTN_Siguiente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global b p Canciones
Maximo=size(cellstr(get(handles.Lista_1,'String')));
max=Maximo(1);
if (b==max)
    b=1;
else
    b=b+1;
end
    Cancion=Canciones(:,:,b);
    Nombre=char(Cancion(1))
    Ruta=char(Cancion(2))
    A=[Ruta,Nombre];
    [Y, FS]=audioread(A);
    Tiempo=size(Y,1)/FS;
    p = audioplayer(Y, FS);
    resume(p)
% --- Executes on button press in BTN_Anterior.
function BTN_Anterior_Callback(hObject, eventdata, handles)
% hObject    handle to BTN_Anterior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in BTN_Cerrar.
function BTN_Cerrar_Callback(hObject, eventdata, handles)
% hObject    handle to BTN_Cerrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in BTN_Visualizar.
function BTN_Visualizar_Callback(hObject, eventdata, handles)
% hObject    handle to BTN_Visualizar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in BTN_Agregar.
function BTN_Agregar_Callback(hObject, eventdata, handles)
% hObject    handle to BTN_Agregar (see GCBO)
global p i Canciones;
[filename, pathname, filterindex] = uigetfile('*.mp3', 'Pick a MATLAB code file');
i=i+1;
Nombre=filename;
Ruta=pathname;
Canciones(:,:,i)={Nombre Ruta};
Texto=strrep(Nombre, '.mp3', ' ');
if(i==1)
  set(handles.Lista_1,'String',Texto); 
else
  cadena=[cellstr(get(handles.Lista_1,'String'))',cellstr(Texto)]';
  set(handles.Lista_1,'String',cadena);
end

if (i==1)
    A=[Ruta,Nombre];
    [Y, FS]=audioread(A);
    Tiempo=size(Y,1)/FS;
    p = audioplayer(Y, FS);
end

% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
