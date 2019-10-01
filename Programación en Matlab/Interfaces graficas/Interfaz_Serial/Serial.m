function varargout = Serial(varargin)
% SERIAL MATLAB code for Serial.fig
%      SERIAL, by itself, creates a new SERIAL or raises the existing
%      singleton*.
%
%      H = SERIAL returns the handle to a new SERIAL or the handle to
%      the existing singleton*.
%
%      SERIAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SERIAL.M with the given input arguments.
%
%      SERIAL('Property','Value',...) creates a new SERIAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Serial_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Serial_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Serial

% Last Modified by GUIDE v2.5 21-Nov-2014 14:17:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Serial_OpeningFcn, ...
                   'gui_OutputFcn',  @Serial_OutputFcn, ...
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


% --- Executes just before Serial is made visible.
function Serial_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Serial (see VARARGIN)

% Choose default command line output for Serial
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Serial wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Serial_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in BtnConectar.
function BtnConectar_Callback(hObject, eventdata, handles)
% hObject    handle to BtnConectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Puerto;
clc;
Puerto=serial('COM4');
set(Puerto,'BaudRate',9600);
set(Puerto,'DataBits',8);
set(Puerto,'Parity','none');
set(Puerto,'Stopbits',1);
set(Puerto,'FlowControl','none');
fopen(Puerto);
% --- Executes on button press in BtnDesconectar.
function BtnDesconectar_Callback(hObject, eventdata, handles)
% hObject    handle to BtnDesconectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Puerto;
fclose(Puerto);
% --- Executes on button press in BtnEncender.
function BtnEncender_Callback(hObject, eventdata, handles)
% hObject    handle to BtnEncender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function texto_Callback(hObject, eventdata, handles)
% hObject    handle to texto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of texto as text
%        str2double(get(hObject,'String')) returns contents of texto as a double


% --- Executes during object creation, after setting all properties.
function texto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to texto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Btn_Enviar.
function Btn_Enviar_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_Enviar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Puerto
clear Text text1 text2 text3 text3 ;
Text=char(get(handles.texto,'String'));
fprintf(Puerto,'%c',48);
pause(0.0001);
longitud=length(Text);
if (longitud>20 && longitud<41)
   for i=1:20
       text1(i)=Text(i);
   end
   for i=1:longitud-20
       text2(i)=Text(i+20);
   end
   fprintf(Puerto,'%s\r',text1);
   pause(0.0001);
   fprintf(Puerto,'%s\r',text2);
elseif (longitud>40 && longitud<61)
   for i=1:20
       text1(i)=Text(i);
       text2(i)=Text(i+20);
   end
   for i=1:longitud-40
       text3(i)=Text(i+40);
   end
   fprintf(Puerto,'%s\r',text1);
   pause(0.0001);
   fprintf(Puerto,'%s\r',text2);
   pause(0.0001);
   fprintf(Puerto,'%s\r',text3);
elseif (longitud>60 && longitud<81)
   for i=1:20
       text1(i)=Text(i);
       text2(i)=Text(i+20);
       text3(i)=Text(i+40);
   end
   for i=1:longitud-60
       text4(i)=Text(i+60);
   end
   fprintf(Puerto,'%s\r',text1);
   pause(0.0001);
   fprintf(Puerto,'%s\r',text2);
   pause(0.0001);
   fprintf(Puerto,'%s\r',text3);
   pause(0.0001);
   fprintf(Puerto,'%s\r',text4);
else
fprintf(Puerto,'%s\r',Text);
end

% --- Executes on button press in Btn_LED.
function Btn_LED_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_LED (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Puerto
v=get(hObject,'Value');
 if v==0
 fprintf(Puerto,'%s','E');
 set(handles.Btn_LED,'String','Apagar');
 else
 fprintf(Puerto,'%s','A');
 set(handles.Btn_LED,'String','Encender');
 end
% Hint: get(hObject,'Value') returns toggle state of Btn_LED
