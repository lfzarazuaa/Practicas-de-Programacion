function varargout = Calculo(varargin)
% CALCULO MATLAB code for Calculo.fig
%      CALCULO, by itself, creates a new CALCULO or raises the existing
%      singleton*.
%
%      H = CALCULO returns the handle to a new CALCULO or the handle to
%      the existing singleton*.
%
%      CALCULO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALCULO.M with the given input arguments.
%
%      CALCULO('Property','Value',...) creates a new CALCULO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Calculo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Calculo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Calculo

% Last Modified by GUIDE v2.5 16-Oct-2014 14:32:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Calculo_OpeningFcn, ...
                   'gui_OutputFcn',  @Calculo_OutputFcn, ...
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


% --- Executes just before Calculo is made visible.
function Calculo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Calculo (see VARARGIN)

% Choose default command line output for Calculo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
axes(handles.derivada) 
background = imread('Derivada.jpg');  
imshow(background);
axes(handles.funcion) 
background = imread('Funcion.jpg');  
imshow(background);
axes(handles.integral) 
background = imread('Integral.jpg');  
imshow(background);
% UIWAIT makes Calculo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Calculo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txt_funcion_Callback(hObject, eventdata, handles)
% hObject    handle to txt_funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_funcion as text
%        str2double(get(hObject,'String')) returns contents of txt_funcion as a double


% --- Executes during object creation, after setting all properties.
function txt_funcion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_Calcular.
function btn_Calcular_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms x
funcion=get(handles.txt_funcion,'String');
derivada=char(diff(eval(get(handles.txt_funcion,'String'))));
integral=char(int(eval(get(handles.txt_funcion,'String'))));
set(handles.txt_Derivada, 'String', derivada);
set(handles.txt_Integral, 'String', integral);
f1=strrep(funcion, '^', '.^');
f2=strrep(f1, '*', '.*');
f3=strrep(f2, '/', './');
d1=strrep(derivada, '^', '.^');
d2=strrep(d1, '*', '.*');
d3=strrep(d2, '/', './');
i1=strrep(integral, '^', '.^');
i2=strrep(i1, '*', '.*');
i3=strrep(i2, '/', './');
x= -7.5:0.1:7.5;
y1= eval(f3);
y2= eval(d3);
y3= eval(i3);

handles.g= plot(handles.funcion,x,y1);
set(handles.funcion,'xgrid', 'on','ygrid', 'on')
handles.g= plot(handles.derivada,x,y2);
set(handles.derivada,'xgrid', 'on','ygrid', 'on')
handles.g= plot(handles.integral,x,y3);
set(handles.integral,'xgrid', 'on','ygrid', 'on')
%clear x

% --- Executes on button press in btn_Limpiar.
function btn_Limpiar_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject, handles);
axes(handles.derivada) 
background = imread('Derivada.jpg');  
imshow(background);
axes(handles.funcion) 
background = imread('Funcion.jpg');  
imshow(background);
axes(handles.integral) 
background = imread('Integral.jpg');  
imshow(background);
set(handles.txt_Derivada,'String', ' ');
set(handles.txt_Integral,'String', ' ');
set(handles.txt_funcion,'String', ' ');
clear all;
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
