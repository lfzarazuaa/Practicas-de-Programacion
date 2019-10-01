function varargout = Operaciones_2(varargin)
% OPERACIONES_2 MATLAB code for Operaciones_2.fig
%      OPERACIONES_2, by itself, creates a new OPERACIONES_2 or raises the existing
%      singleton*.
%
%      H = OPERACIONES_2 returns the handle to a new OPERACIONES_2 or the handle to
%      the existing singleton*.
%
%      OPERACIONES_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPERACIONES_2.M with the given input arguments.
%
%      OPERACIONES_2('Property','Value',...) creates a new OPERACIONES_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Operaciones_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Operaciones_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Operaciones_2

% Last Modified by GUIDE v2.5 07-Jan-2015 15:29:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Operaciones_2_OpeningFcn, ...
                   'gui_OutputFcn',  @Operaciones_2_OutputFcn, ...
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


% --- Executes just before Operaciones_2 is made visible.
function Operaciones_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Operaciones_2 (see VARARGIN)

% Choose default command line output for Operaciones_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Operaciones_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Operaciones_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Btn_Suma.
function Btn_Suma_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_Suma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
suma=handles.metricdata.Dato1+handles.metricdata.Dato2;
set(handles.txt_operador, 'String', '+');
set(handles.txt_Resultado, 'String', suma);


% --- Executes on button press in Btn_Resta.
function Btn_Resta_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_Resta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
resta=handles.metricdata.Dato1-handles.metricdata.Dato2;
set(handles.txt_operador, 'String', '-');
set(handles.txt_Resultado, 'String', resta);

% --- Executes on button press in Btn_Mult.
function Btn_Mult_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_Mult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Mult=handles.metricdata.Dato1*handles.metricdata.Dato2;
set(handles.txt_operador, 'String', '*');
set(handles.txt_Resultado, 'String', Mult);

% --- Executes on button press in Btn_Div.
function Btn_Div_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_Div (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Div=handles.metricdata.Dato1/handles.metricdata.Dato2;
set(handles.txt_operador, 'String', '/');
set(handles.txt_Resultado, 'String', Div);


function txt_Dato1_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Dato1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Dato1 = str2double(get(hObject, 'String'));
if isnan(Dato1)
    set(hObject, 'String', 0);
    errordlg('¡Por favor escribir un número!','Error');
end
% Save the new density value
handles.metricdata.Dato1 = Dato1;
guidata(hObject,handles)% Actualizar los registros.
% Hints: get(hObject,'String') returns contents of txt_Dato1 as text
%        str2double(get(hObject,'String')) returns contents of txt_Dato1 as a double


% --- Executes during object creation, after setting all properties.
function txt_Dato1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Dato1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_Resultado_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Resultado as text
%        str2double(get(hObject,'String')) returns contents of txt_Resultado as a double


% --- Executes during object creation, after setting all properties.
function txt_Resultado_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_Dato2_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Dato2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Dato2 = str2double(get(hObject, 'String'));
if isnan(Dato2)
    set(hObject, 'String', 0);
    errordlg('¡Por favor escribir un número!','Error');
end

% Save the new density value
handles.metricdata.Dato2 = Dato2;
guidata(hObject,handles)% Actualizar los registros.
% Hints: get(hObject,'String') returns contents of txt_Dato2 as text
%        str2double(get(hObject,'String')) returns contents of txt_Dato2 as a double


% --- Executes during object creation, after setting all properties.
function txt_Dato2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Dato2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
