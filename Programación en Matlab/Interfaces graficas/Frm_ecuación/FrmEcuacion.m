function varargout = FrmEcuacion(varargin)
% FRMECUACION MATLAB code for FrmEcuacion.fig
%      FRMECUACION, by itself, creates a new FRMECUACION or raises the existing
%      singleton*.
%
%      H = FRMECUACION returns the handle to a new FRMECUACION or the handle to
%      the existing singleton*.
%
%      FRMECUACION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FRMECUACION.M with the given input arguments.
%
%      FRMECUACION('Property','Value',...) creates a new FRMECUACION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FrmEcuacion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FrmEcuacion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FrmEcuacion

% Last Modified by GUIDE v2.5 11-Oct-2014 16:19:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FrmEcuacion_OpeningFcn, ...
                   'gui_OutputFcn',  @FrmEcuacion_OutputFcn, ...
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


% --- Executes just before FrmEcuacion is made visible.
function FrmEcuacion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FrmEcuacion (see VARARGIN)

% Choose default command line output for FrmEcuacion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
axes(handles.grafica) 
background = imread('Captura.jpg');  
imshow(background);
% UIWAIT makes FrmEcuacion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FrmEcuacion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Limpiar.
function Limpiar_Callback(hObject, eventdata, handles)
% hObject    handle to Limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.lblx1,'String', 'x1 = ')
set(handles.lblx2,'String', 'x2 = ')
set(handles.valor_a,'String', ' ')
set(handles.valor_b,'String', ' ')
set(handles.valor_c,'String', ' ')
axes(handles.grafica) 
background = imread('Captura.jpg');
imshow(background);
clear all

% --- Executes on button press in Calcular.
function Calcular_Callback(hObject, eventdata, handles)
% hObject    handle to Calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a b c;
R=roots([a b c]);

%Exportar variables al workspace(axes).
assignin('base','a',a)
assignin('base','b',b)
assignin('base','c',c)
assignin('base','R',R)
%Graficar en el axes.
if a~=0
   if real(R(2))>=real(R(1))
      x=real(R(1))-5:(10+real(R(2))-real(R(1)))/250:real(R(2))+5;
   else
      x=real(R(2))-5:(10+real(R(1))-real(R(2)))/250:real(R(1))+5;
   end
   set(handles.lblx1,'String', ['x1 = ' num2str(R(1))])
   set(handles.lblx2,'String', ['x2 = ' num2str(R(2))])
else
   set(handles.lblx1,'String', ['x1 = ' num2str(R)])
   set(handles.lblx2,'String', ['x2 = ' num2str(R)])
   x=-20:0.1:20;    
end
   y=a.*x.^2+b.*x+c;
   handles.g= plot(handles.grafica,x,y);
   set(handles.grafica,'xgrid', 'on','ygrid', 'on')
   
   
function valor_a_Callback(hObject, eventdata, handles)
% hObject    handle to valor_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
a=str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of valor_a as text
%        str2double(get(hObject,'String')) returns contents of valor_a as a double


% --- Executes during object creation, after setting all properties.
function valor_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valor_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function valor_c_Callback(hObject, eventdata, handles)
% hObject    handle to valor_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c;
c=str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of valor_c as text
%        str2double(get(hObject,'String')) returns contents of valor_c as a double


% --- Executes during object creation, after setting all properties.
function valor_c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valor_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function valor_b_Callback(hObject, eventdata, handles)
% hObject    handle to valor_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global b;
b=str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of valor_b as text
%        str2double(get(hObject,'String')) returns contents of valor_b as a double


% --- Executes during object creation, after setting all properties.
function valor_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valor_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function grafica_CreateFcn(hObject, eventdata, handles)
% hObject    handle to grafica (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate grafica
