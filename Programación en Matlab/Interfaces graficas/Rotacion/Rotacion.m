function varargout = Rotacion(varargin)
% ROTACION MATLAB code for Rotacion.fig
%      ROTACION, by itself, creates a new ROTACION or raises the existing
%      singleton*.
%
%      H = ROTACION returns the handle to a new ROTACION or the handle to
%      the existing singleton*.
%
%      ROTACION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROTACION.M with the given input arguments.
%
%      ROTACION('Property','Value',...) creates a new ROTACION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Rotacion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Rotacion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Rotacion

% Last Modified by GUIDE v2.5 25-Oct-2014 11:28:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Rotacion_OpeningFcn, ...
                   'gui_OutputFcn',  @Rotacion_OutputFcn, ...
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


% --- Executes just before Rotacion is made visible.
function Rotacion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Rotacion (see VARARGIN)

% Choose default command line output for Rotacion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
axes(handles.Grafica) 
background = imread('Funcion.jpg');  
imshow(background);
% UIWAIT makes Rotacion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Rotacion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Funcion_Callback(hObject, eventdata, handles)
% hObject    handle to Funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Funcion as text
%        str2double(get(hObject,'String')) returns contents of Funcion as a double


% --- Executes during object creation, after setting all properties.
function Funcion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Xmin_Callback(hObject, eventdata, handles)
% hObject    handle to Xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Xmin as text
%        str2double(get(hObject,'String')) returns contents of Xmin as a double


% --- Executes during object creation, after setting all properties.
function Xmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Xmax_Callback(hObject, eventdata, handles)
% hObject    handle to Xmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Xmax as text
%        str2double(get(hObject,'String')) returns contents of Xmax as a double


% --- Executes during object creation, after setting all properties.
function Xmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Xmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ymin_Callback(hObject, eventdata, handles)
% hObject    handle to Ymin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ymin as text
%        str2double(get(hObject,'String')) returns contents of Ymin as a double


% --- Executes during object creation, after setting all properties.
function Ymin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ymin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ymax_Callback(hObject, eventdata, handles)
% hObject    handle to Ymax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ymax as text
%        str2double(get(hObject,'String')) returns contents of Ymax as a double


% --- Executes during object creation, after setting all properties.
function Ymax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ymax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
a=get(hObject,'Value');
a=fix(a);
set(handles.txt_Angulo, 'String', a);
syms x y;
funcion=get(handles.Funcion,'String');
xmin=str2double(get(handles.Xmin,'String'));
xmax=str2double(get(handles.Xmax,'String'));
ymin=str2double(get(handles.Ymin,'String'));
ymax=str2double(get(handles.Ymax,'String'));
t=a
f1=strrep(funcion, 'x', '(a*cosd(t)+b*sind(t))');
f2=strrep(f1, 'y', '(-x*sind(t)+y*cosd(t))');
f3=strrep(f2, 'a', 'x');
f4=eval(strrep(f3, 'b', 'y'))
handles.g=ezplot(handles.Grafica, char(f4),[xmin xmax ymin ymax]);%,[xmin xmax ymin ymax]);
set(handles.g,'Color', 'black');
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



function txt_Angulo_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Angulo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Angulo as text
%        str2double(get(hObject,'String')) returns contents of txt_Angulo as a double


% --- Executes during object creation, after setting all properties.
function txt_Angulo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Angulo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Btn_Calcular.
function Btn_Calcular_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_Calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
syms x y;
funcion=get(handles.Funcion,'String');
xmin=str2double(get(handles.Xmin,'String'));
xmax=str2double(get(handles.Xmax,'String'));
ymin=str2double(get(handles.Ymin,'String'));
ymax=str2double(get(handles.Ymax,'String'));
t=a
f1=strrep(funcion, 'x', '(a*cosd(t)-b*sind(t))');
f2=strrep(f1, 'y', '(x*sind(t)+y*cosd(t))');
f3=strrep(f2, 'a', 'x');
f4=eval(strrep(f3, 'b', 'y'))
handles.g=ezplot(handles.Grafica, char(f4),[xmin xmax]);%,[xmin xmax ymin ymax]);
set(handles.g,'Color', 'black');
%set(handles.Grafica,'xgrid', 'on','ygrid', 'on')
%set(handles.Funcion,'String',f4);
%h = ezplot('f2', [-1 -0.75 -5 5]);
%set(h,'Color', 'black');
% --- Executes on button press in Btn_Limpiar.
function Btn_Limpiar_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_Limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.Grafica) 
background = imread('Funcion.jpg');  
imshow(background);
set(handles.Funcion,'String', ' ');
set(handles.Xmin,'String', ' ');
set(handles.Xmax,'String', ' ');
set(handles.Ymin,'String', ' ');
set(handles.Ymax,'String', ' ');
set(handles.txt_Angulo,'String', ' ');

% --- Executes on button press in Btn_Salir.
function Btn_Salir_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_Salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
