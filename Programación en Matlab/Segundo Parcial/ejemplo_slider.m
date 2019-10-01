function varargout = ejemplo_slider(varargin)
% EJEMPLO_SLIDER MATLAB code for ejemplo_slider.fig
%      EJEMPLO_SLIDER, by itself, creates a new EJEMPLO_SLIDER or raises the existing
%      singleton*.
%
%      H = EJEMPLO_SLIDER returns the handle to a new EJEMPLO_SLIDER or the handle to
%      the existing singleton*.
%
%      EJEMPLO_SLIDER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EJEMPLO_SLIDER.M with the given input arguments.
%
%      EJEMPLO_SLIDER('Property','Value',...) creates a new EJEMPLO_SLIDER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ejemplo_slider_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ejemplo_slider_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ejemplo_slider

% Last Modified by GUIDE v2.5 14-Jan-2015 15:28:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ejemplo_slider_OpeningFcn, ...
                   'gui_OutputFcn',  @ejemplo_slider_OutputFcn, ...
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


% --- Executes just before ejemplo_slider is made visible.
function ejemplo_slider_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ejemplo_slider (see VARARGIN)

% Choose default command line output for ejemplo_slider
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ejemplo_slider wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ejemplo_slider_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function nivel_Callback(hObject, eventdata, handles)
v=get(handles.nivel,'value');
set(handles.valor,'String',fix(v));

if v>5
    set(handles.alarma,'Value',1);
    set(handles.alarma,'String','ALARMA');
else
    set(handles.alarma,'Value',0);
    set(handles.alarma,'String','NORMAL');
end    

% --- Executes during object creation, after setting all properties.
function nivel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nivel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in alarma.
function alarma_Callback(hObject, eventdata, handles)
% hObject    handle to alarma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of alarma
