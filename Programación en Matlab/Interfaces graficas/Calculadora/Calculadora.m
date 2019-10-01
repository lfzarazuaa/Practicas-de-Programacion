function varargout = Calculadora(varargin)
%CALCULADORA M-file for Calculadora.fig
%      CALCULADORA, by itself, creates a new CALCULADORA or raises the existing
%      singleton*.
%
%      H = CALCULADORA returns the handle to a new CALCULADORA or the handle to
%      the existing singleton*.
%
%      CALCULADORA('Property','Value',...) creates a new CALCULADORA using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Calculadora_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      CALCULADORA('CALLBACK') and CALCULADORA('CALLBACK',hObject,...) call the
%      local function named CALLBACK in CALCULADORA.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Calculadora

% Last Modified by GUIDE v2.5 15-Oct-2014 10:55:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Calculadora_OpeningFcn, ...
                   'gui_OutputFcn',  @Calculadora_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Calculadora is made visible.
function Calculadora_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Calculadora
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Calculadora wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Calculadora_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn1.
function btn1_Callback(hObject, eventdata, handles)
% hObject    handle to btn1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'1');
set(handles.texto,'String',textString)

% --- Executes on button press in btn2.
function btn2_Callback(hObject, eventdata, handles)
% hObject    handle to btn2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'2');
set(handles.texto,'String',textString)

% --- Executes on button press in btn3.
function btn3_Callback(hObject, eventdata, handles)
% hObject    handle to btn3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'3');
set(handles.texto,'String',textString)

% --- Executes on button press in btn4.
function btn4_Callback(hObject, eventdata, handles)
% hObject    handle to btn4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'4');
set(handles.texto,'String',textString)

% --- Executes on button press in btn5.
function btn5_Callback(hObject, eventdata, handles)
% hObject    handle to btn5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'5');
set(handles.texto,'String',textString)

% --- Executes on button press in btn6.
function btn6_Callback(hObject, eventdata, handles)
% hObject    handle to btn6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'6');
set(handles.texto,'String',textString)

% --- Executes on button press in btn7.
function btn7_Callback(hObject, eventdata, handles)
% hObject    handle to btn7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'7');
set(handles.texto,'String',textString)

% --- Executes on button press in btn8.
function btn8_Callback(hObject, eventdata, handles)
% hObject    handle to btn8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'8');
set(handles.texto,'String',textString)

% --- Executes on button press in btn9.
function btn9_Callback(hObject, eventdata, handles)
% hObject    handle to btn9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'9');
set(handles.texto,'String',textString)

% --- Executes on button press in btnPUNTO.
function btnPUNTO_Callback(hObject, eventdata, handles)
% hObject    handle to btnPUNTO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'.');
set(handles.texto,'String',textString)

% --- Executes on button press in btn0.
function btn0_Callback(hObject, eventdata, handles)
% hObject    handle to btn0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'0');
set(handles.texto,'String',textString)

% --- Executes on button press in btnIgual.
function btnIgual_Callback(hObject, eventdata, handles)
% hObject    handle to btnIgual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=eval(get(handles.texto,'String'));
Resultado =num2str(textString);
set(handles.texto,'String',Resultado)

% --- Executes on button press in btnMas.
function btnMas_Callback(hObject, eventdata, handles)
% hObject    handle to btnMas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'+');
set(handles.texto,'String',textString)

% --- Executes on button press in btnMenos.
function btnMenos_Callback(hObject, eventdata, handles)
% hObject    handle to btnMenos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'-');
set(handles.texto,'String',textString)

% --- Executes on button press in btnPor.
function btnPor_Callback(hObject, eventdata, handles)
% hObject    handle to btnPor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'*');
set(handles.texto,'String',textString)

% --- Executes on button press in btnSobre.
function btnSobre_Callback(hObject, eventdata, handles)
% hObject    handle to btnSobre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'/');
set(handles.texto,'String',textString)

% --- Executes on button press in btnAC.
function btnAC_Callback(hObject, eventdata, handles)
% hObject    handle to btnAC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.texto,'String',' ')
% --- Executes on button press in btnSalir.
function btnSalir_Callback(hObject, eventdata, handles)
% hObject    handle to btnSalir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);


% --- Executes on button press in btnpabre.
function btnpabre_Callback(hObject, eventdata, handles)
% hObject    handle to btnpabre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'(');
set(handles.texto,'String',textString)

% --- Executes on button press in btncierra.
function btncierra_Callback(hObject, eventdata, handles)
% hObject    handle to btncierra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,')');
set(handles.texto,'String',textString)

% --- Executes on button press in btnpotencia.
function btnpotencia_Callback(hObject, eventdata, handles)
% hObject    handle to btnpotencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'^(');
set(handles.texto,'String',textString)

% --- Executes on button press in btninv.
function btninv_Callback(hObject, eventdata, handles)
% hObject    handle to btninv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'^(-1)');
set(handles.texto,'String',textString)

% --- Executes on button press in btnsqrt.
function btnsqrt_Callback(hObject, eventdata, handles)
% hObject    handle to btnsqrt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'^(1/2)');
set(handles.texto,'String',textString)

% --- Executes on button press in btnlog.
function btnlog_Callback(hObject, eventdata, handles)
% hObject    handle to btnlog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
textString=get(handles.texto,'String');
textString=strcat(textString,'log(');
set(handles.texto,'String',textString)