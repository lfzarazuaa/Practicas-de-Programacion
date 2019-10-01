function varargout = Calculadora_Popup(varargin)
% CALCULADORA_POPUP MATLAB code for Calculadora_Popup.fig
%      CALCULADORA_POPUP, by itself, creates a new CALCULADORA_POPUP or raises the existing
%      singleton*.
%
%      H = CALCULADORA_POPUP returns the handle to a new CALCULADORA_POPUP or the handle to
%      the existing singleton*.
%
%      CALCULADORA_POPUP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALCULADORA_POPUP.M with the given input arguments.
%
%      CALCULADORA_POPUP('Property','Value',...) creates a new CALCULADORA_POPUP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Calculadora_Popup_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Calculadora_Popup_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Calculadora_Popup

% Last Modified by GUIDE v2.5 10-Jan-2015 18:30:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Calculadora_Popup_OpeningFcn, ...
                   'gui_OutputFcn',  @Calculadora_Popup_OutputFcn, ...
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


% --- Executes just before Calculadora_Popup is made visible.
function Calculadora_Popup_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Calculadora_Popup (see VARARGIN)

% Choose default command line output for Calculadora_Popup
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Calculadora_Popup wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Calculadora_Popup_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
operacion=get(hObject,'Value');
Dato1=handles.metricdata.Dato1;
Dato2=handles.metricdata.Dato2;
switch(operacion)
    case 1
           set(handles.txt_Resultado,'String',' ');
           set(handles.txt_Operador,'String','Operador');
    case 2
           resultado=Dato1+Dato2;
           set(handles.txt_Resultado,'String',resultado);
           set(handles.txt_Operador,'String','+');
    case 3
           resultado=Dato1-Dato2;
           set(handles.txt_Resultado,'String',resultado);
           set(handles.txt_Operador,'String','-');
    case 4
           resultado=Dato1*Dato2;
           set(handles.txt_Resultado,'String',resultado);
           set(handles.txt_Operador,'String','*');
    case 5
           resultado=Dato1/Dato2;
           set(handles.txt_Resultado,'String',resultado);
           set(handles.txt_Operador,'String','/');
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
