function varargout = Trigonometricas(varargin)
% TRIGONOMETRICAS MATLAB code for Trigonometricas.fig
%      TRIGONOMETRICAS, by itself, creates a new TRIGONOMETRICAS or raises the existing
%      singleton*.
%
%      H = TRIGONOMETRICAS returns the handle to a new TRIGONOMETRICAS or the handle to
%      the existing singleton*.
%
%      TRIGONOMETRICAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRIGONOMETRICAS.M with the given input arguments.
%
%      TRIGONOMETRICAS('Property','Value',...) creates a new TRIGONOMETRICAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Trigonometricas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Trigonometricas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Trigonometricas

% Last Modified by GUIDE v2.5 23-Oct-2015 19:54:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Trigonometricas_OpeningFcn, ...
                   'gui_OutputFcn',  @Trigonometricas_OutputFcn, ...
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


% --- Executes just before Trigonometricas is made visible.
function Trigonometricas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Trigonometricas (see VARARGIN)

% Choose default command line output for Trigonometricas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global valor t y1 y2 y3 to tf
valor=500;
set(handles.slider1,'Value',500);
to=-5*pi;
tf=5*pi;
dt=(tf-to)/999;
t=to:dt:tf;
y1=sin(t);
y2=cos(t);
y3=y1+y2;
plot(t(1:valor),y1(1:valor),'r','linewidth',3);
xlim([to tf]);
ylim([-1.5 1.5]);
% UIWAIT makes Trigonometricas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Trigonometricas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global valor t y1 y2 y3 to tf
valor=get(hObject,'Value');
opcion=get(handles.popupmenu1,'Value');
    t1=t(1:valor);
if opcion==1
    y=y1(1:valor);
elseif opcion==2
    y=y2(1:valor);
elseif opcion==3
    y=y3(1:valor);
end
    plot(t1,y,'r','linewidth',3);
    xlim([to tf]);
    ylim([-1.5 1.5]);
    if valor<=3
        cla()
    end
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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global valor t y1 y2 y3 to tf
opcion=get(handles.popupmenu1,'Value');
    t1=t(1:valor);
if opcion==1
    y=y1(1:valor);
elseif opcion==2
    y=y2(1:valor);
elseif opcion==3
    y=y3(1:valor);
end
    plot(t1,y,'r','linewidth',3);
    xlim([to tf]);
    ylim([-1.5 1.5]);
    if valor<=3
        cla()
    end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
