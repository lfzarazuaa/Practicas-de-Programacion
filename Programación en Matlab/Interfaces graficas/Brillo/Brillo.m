function varargout = Brillo(varargin)
% BRILLO MATLAB code for Brillo.fig
%      BRILLO, by itself, creates a new BRILLO or raises the existing
%      singleton*.
%
%      H = BRILLO returns the handle to a new BRILLO or the handle to
%      the existing singleton*.
%
%      BRILLO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BRILLO.M with the given input arguments.
%
%      BRILLO('Property','Value',...) creates a new BRILLO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Brillo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Brillo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Brillo

% Last Modified by GUIDE v2.5 24-Nov-2014 19:48:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Brillo_OpeningFcn, ...
                   'gui_OutputFcn',  @Brillo_OutputFcn, ...
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


% --- Executes just before Brillo is made visible.
function Brillo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Brillo (see VARARGIN)

% Choose default command line output for Brillo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Brillo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Brillo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Btn_Conectar.
function Btn_Conectar_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_Conectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Puerto;
clc;
Puerto=serial('COM13');
set(Puerto,'BaudRate',9600);
set(Puerto,'DataBits',8);
set(Puerto,'Parity','none');
set(Puerto,'Stopbits',1);
set(Puerto,'FlowControl','none');
fopen(Puerto);

% --- Executes on button press in Btn_Desconectar.
function Btn_Desconectar_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_Desconectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  global Puerto;
fclose(Puerto);


% --- Executes on slider movement.
function slider_brillo_Callback(hObject, eventdata, handles)
% hObject    handle to slider_brillo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Puerto;
a=get(hObject,'Value');
a=(fix(a));
fprintf(Puerto,'%c',a);
fprintf('%c\n',a);
pause(0.01);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_brillo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_brillo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
