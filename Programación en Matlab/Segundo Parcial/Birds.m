function varargout = Birds(varargin)
% BIRDS MATLAB code for Birds.fig
%      BIRDS, by itself, creates a new BIRDS or raises the existing
%      singleton*.
%
%      H = BIRDS returns the handle to a new BIRDS or the handle to
%      the existing singleton*.
%
%      BIRDS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BIRDS.M with the given input arguments.
%
%      BIRDS('Property','Value',...) creates a new BIRDS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Birds_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Birds_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Birds

% Last Modified by GUIDE v2.5 17-Jan-2015 19:53:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Birds_OpeningFcn, ...
                   'gui_OutputFcn',  @Birds_OutputFcn, ...
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


% --- Executes just before Birds is made visible.
function Birds_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Birds (see VARARGIN)

% Choose default command line output for Birds
handles.output = hObject;
handles.metricdata.Angulo = 45;
handles.metricdata.Velocidad = 1;
guidata(hObject,handles)% Actualizar los registros.
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Birds wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Birds_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txt_velocidad_Callback(hObject, eventdata, handles)
% hObject    handle to txt_velocidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Velocidad = str2double(get(hObject, 'String'));
if isnan(Velocidad)
    set(hObject, 'String', 1);
    errordlg('¡Por favor escribir un número!','Error');
    Velocidad=1;
elseif Velocidad<=0
    set(hObject, 'String', 1);
    errordlg('¡Por favor escribir un número positivo!','Error');
    Velocidad=1;
end
handles.metricdata.Velocidad = Velocidad;
guidata(hObject,handles)% Actualizar los registros.
hold off
% Hints: get(hObject,'String') returns contents of txt_velocidad as text
%        str2double(get(hObject,'String')) returns contents of txt_velocidad as a double


% --- Executes during object creation, after setting all properties.
function txt_velocidad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_velocidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Btn_Generar.
function Btn_Generar_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_Generar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.txt_Resultado,'String',' ');
hold off
handles.g= plot(handles.axes1,0,0);
b=handles.metricdata.Angulo;
vo=handles.metricdata.Velocidad;
p= [-9.81/2 vo*sin(b*pi/180) 0];
r=roots(p);
t1=r(2);
xf=vo*cos(b*pi/180)*t1
ymax=(vo*sin(b*pi/180))^2/(2*9.81)
t=[0:t1/499:t1];
r=((xf+ymax)/2)/20
e=1;
x=0;
y=0;
hold on
x1=rand(1)*xf;
y1=rand(1)*ymax;
%x1=xf/2;
%y1=ymax;
handles.g= plot(handles.axes1,x1,y1,'r*');
cadena=[num2str(round(x1*1000)/1000),',',num2str(round(y1*1000)/1000)];
set(handles.txt_punto,'String',cadena);
handles.g= plot(handles.axes1,x,y,'-');
handles.g= plot(handles.axes1,xf*1.5,ymax*1.5,'-');
axis('equal')
for(i=1:500)
x=vo*cos(b*pi/180)*t(i);
y=vo*sin(b*pi/180).*t(i)-9.81*(t(i).^2/2);
handles.g= plot(handles.axes1,x,y,'-');
drawnow
set(handles.axes1,'xgrid', 'on','ygrid', 'on')
if e==1
   xmin=x-r;
   xmax=x+r;
   ymax=y+r;
   ymin=y-r;
   if (xmin<=x1 && x1<=xmax && ymin<=y1 && y1<=ymax )
      e=0;
      set(handles.txt_Resultado,'String','Ha acertado');
      x1=x1
      y1=y1
      xmin=x-r
      xmax=x+r
      ymax=y+r
      ymin=y-r
   end
end
pause(0.01);
end

if e==1
    set(handles.txt_Resultado,'String','No ha acertado');
end
function txt_angulo_Callback(hObject, eventdata, handles)
% hObject    handle to txt_angulo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Angulo = str2double(get(hObject, 'String'));
if isnan(Angulo)
    set(hObject, 'String', 45);
    errordlg('¡Por favor escribir un número!','Error');
    Angulo=45;
elseif Angulo<=0 || Angulo>90
    set(hObject, 'String', 45);
    errordlg('¡Por favor escribir un número mayor 0 y menor a 90!','Error');
    Angulo=45;
end
handles.metricdata.Angulo = Angulo;
guidata(hObject,handles)% Actualizar los registros.
hold off
% Hints: get(hObject,'String') returns contents of txt_angulo as text
%        str2double(get(hObject,'String')) returns contents of txt_angulo as a double


% --- Executes during object creation, after setting all properties.
function txt_angulo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_angulo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
