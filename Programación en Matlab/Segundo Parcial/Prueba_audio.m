function varargout = Prueba_audio(varargin)
% PRUEBA_AUDIO MATLAB code for Prueba_audio.fig
%      PRUEBA_AUDIO, by itself, creates a new PRUEBA_AUDIO or raises the existing
%      singleton*.
%
%      H = PRUEBA_AUDIO returns the handle to a new PRUEBA_AUDIO or the handle to
%      the existing singleton*.
%
%      PRUEBA_AUDIO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRUEBA_AUDIO.M with the given input arguments.
%
%      PRUEBA_AUDIO('Property','Value',...) creates a new PRUEBA_AUDIO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Prueba_audio_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Prueba_audio_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Prueba_audio

% Last Modified by GUIDE v2.5 20-Jan-2015 11:05:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Prueba_audio_OpeningFcn, ...
                   'gui_OutputFcn',  @Prueba_audio_OutputFcn, ...
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


% --- Executes just before Prueba_audio is made visible.
function Prueba_audio_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Prueba_audio (see VARARGIN)

% Choose default command line output for Prueba_audio
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Prueba_audio wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Prueba_audio_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
  Fs = 11025;
  y  = wavrecord(30*Fs, Fs, 'int16');
  handles.metricdata.y=y;
  guidata(hObject,handles);
        
        


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
Fs = 11025;
wavplay(handles.metricdata.y,Fs);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
Fs=11025;
wavwrite(handles.metricdata.y,Fs,'grabacion.wav');


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
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
