function varargout = RGB(varargin)
% RGB MATLAB code for RGB.fig
%      RGB, by itself, creates a new RGB or raises the existing
%      singleton*.
%
%      H = RGB returns the handle to a new RGB or the handle to
%      the existing singleton*.
%
%      RGB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RGB.M with the given input arguments.
%
%      RGB('Property','Value',...) creates a new RGB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RGB_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RGB_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RGB

% Last Modified by GUIDE v2.5 07-Jan-2015 23:28:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RGB_OpeningFcn, ...
                   'gui_OutputFcn',  @RGB_OutputFcn, ...
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


% --- Executes just before RGB is made visible.
function RGB_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RGB (see VARARGIN)

% Choose default command line output for RGB
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RGB wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RGB_OutputFcn(hObject, eventdata, handles) 
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
global Puerto r g b;
clc;
Puerto=serial('COM4');
set(Puerto,'BaudRate',9600);
set(Puerto,'DataBits',8);
set(Puerto,'Parity','none');
set(Puerto,'Stopbits',1);
set(Puerto,'FlowControl','none');
fopen(Puerto);
fprintf('Conectado');
r=0;
g=0;
b=0;
% --- Executes on button press in Btn_Desconectar.
function Btn_Desconectar_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_Desconectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Puerto;
fclose(Puerto);
fprintf('Desconectado');
% --- Executes on slider movement.
function S_R_Callback(hObject, eventdata, handles)
% hObject    handle to S_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Puerto r g b;
r=get(hObject,'Value');
r=(fix(r));
set(handles.txt_Red,'String',r);
fprintf(Puerto,'%d,',r);
fprintf(Puerto,'%d,',g);
fprintf(Puerto,'%d\n',b);
fprintf('%d\n',r);
pause(0.01);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function S_R_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function txt_Red_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Red as text
%        str2double(get(hObject,'String')) returns contents of txt_Red as a double


% --- Executes during object creation, after setting all properties.
function txt_Red_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function S_G_Callback(hObject, eventdata, handles)
% hObject    handle to S_G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Puerto r g b;
g=get(hObject,'Value');
g=(fix(g));
set(handles.txt_Green,'String',g);
fprintf(Puerto,'%d,',r);
fprintf(Puerto,'%d,',g);
fprintf(Puerto,'%d\n',b);
fprintf('%d\n',g);
pause(0.01);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function S_G_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S_G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function txt_Green_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Green as text
%        str2double(get(hObject,'String')) returns contents of txt_Green as a double


% --- Executes during object creation, after setting all properties.
function txt_Green_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function S_B_Callback(hObject, eventdata, handles)
% hObject    handle to S_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Puerto r g b;
b=get(hObject,'Value');
b=(fix(b));
set(handles.txt_Blue,'String',b);
fprintf(Puerto,'%d,',r);
fprintf(Puerto,'%d,',g);
fprintf(Puerto,'%d\n',b);
fprintf('%d\n',b);
pause(0.01);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function S_B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function txt_Blue_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Blue as text
%        str2double(get(hObject,'String')) returns contents of txt_Blue as a double


% --- Executes during object creation, after setting all properties.
function txt_Blue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
