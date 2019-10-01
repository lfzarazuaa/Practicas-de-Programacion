function varargout = Prueba_audio_2(varargin)
% PRUEBA_AUDIO_2 MATLAB code for Prueba_audio_2.fig
%      PRUEBA_AUDIO_2, by itself, creates a new PRUEBA_AUDIO_2 or raises the existing
%      singleton*.
%
%      H = PRUEBA_AUDIO_2 returns the handle to a new PRUEBA_AUDIO_2 or the handle to
%      the existing singleton*.
%
%      PRUEBA_AUDIO_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRUEBA_AUDIO_2.M with the given input arguments.
%
%      PRUEBA_AUDIO_2('Property','Value',...) creates a new PRUEBA_AUDIO_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Prueba_audio_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Prueba_audio_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Prueba_audio_2

% Last Modified by GUIDE v2.5 20-Jan-2015 11:11:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Prueba_audio_2_OpeningFcn, ...
                   'gui_OutputFcn',  @Prueba_audio_2_OutputFcn, ...
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


% --- Executes just before Prueba_audio_2 is made visible.
function Prueba_audio_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Prueba_audio_2 (see VARARGIN)

% Choose default command line output for Prueba_audio_2
handles.output = hObject;
set(handles.slider1,'Value',0);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Prueba_audio_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Prueba_audio_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Btn_Grabar.
function Btn_Grabar_Callback(hObject, eventdata, handles)
  Fs = 11025;
  global d
  d=30;
  set(handles.slider1,'Value',0);
  y  = wavrecord(d*Fs, Fs, 'int16');
  handles.metricdata.y=y;
  guidata(hObject,handles);
  fprintf('Grabación Completada');
        
        


% --- Executes on button press in Btn_Reproducir.
function Btn_Reproducir_Callback(hObject, eventdata, handles)
Fs = 11025;
global d
v=d*320/5;
set(handles.slider1,'Max',v);
wavplay(handles.metricdata.y,Fs,'async');
for i=0:v
    set(handles.slider1,'Value',i);
    pause(0.01);
end
% --- Executes on button press in Btn_Guardar.
function Btn_Guardar_Callback(hObject, eventdata, handles)
Fs=11025;
wavwrite(handles.metricdata.y,Fs,'grabacion.wav');


% --- Executes on button press in Btn_Graficar.
function Btn_Graficar_Callback(hObject, eventdata, handles)
plot(handles.metricdata.y)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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
