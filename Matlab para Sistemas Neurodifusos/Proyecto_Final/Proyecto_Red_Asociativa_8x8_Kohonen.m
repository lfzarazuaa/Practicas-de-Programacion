function varargout = Proyecto_Red_Asociativa_8x8_Kohonen(varargin)
% PROYECTO_RED_ASOCIATIVA_8X8_KOHONEN MATLAB code for Proyecto_Red_Asociativa_8x8_Kohonen.fig
%      PROYECTO_RED_ASOCIATIVA_8X8_KOHONEN, by itself, creates a new PROYECTO_RED_ASOCIATIVA_8X8_KOHONEN or raises the existing
%      singleton*.
%
%      H = PROYECTO_RED_ASOCIATIVA_8X8_KOHONEN returns the handle to a new PROYECTO_RED_ASOCIATIVA_8X8_KOHONEN or the handle to
%      the existing singleton*.
%
%      PROYECTO_RED_ASOCIATIVA_8X8_KOHONEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROYECTO_RED_ASOCIATIVA_8X8_KOHONEN.M with the given input arguments.
%
%      PROYECTO_RED_ASOCIATIVA_8X8_KOHONEN('Property','Value',...) creates a new PROYECTO_RED_ASOCIATIVA_8X8_KOHONEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Proyecto_Red_Asociativa_8x8_Kohonen_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Proyecto_Red_Asociativa_8x8_Kohonen_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Proyecto_Red_Asociativa_8x8_Kohonen

% Last Modified by GUIDE v2.5 07-Dec-2017 17:05:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Proyecto_Red_Asociativa_8x8_Kohonen_OpeningFcn, ...
                   'gui_OutputFcn',  @Proyecto_Red_Asociativa_8x8_Kohonen_OutputFcn, ...
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


% --- Executes just before Proyecto_Red_Asociativa_8x8_Kohonen is made visible.
function Proyecto_Red_Asociativa_8x8_Kohonen_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Proyecto_Red_Asociativa_8x8_Kohonen (see VARARGIN)

% Choose default command line output for Proyecto_Red_Asociativa_8x8_Kohonen
handles.output = hObject;
global colorA colorB
global puerto conexion
colorB=[255,255,255]/255;
colorA=[0 0 0]/255;
Resetear(handles);
%Valores=Obtener_Valores(handles)
Inicializar_Neurona();
a=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
axes(handles.axes1),imshow(Create_Image(a));
axes(handles.axes2),imshow(Create_Image(a));
conexion=false;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Proyecto_Red_Asociativa_8x8_Kohonen wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Proyecto_Red_Asociativa_8x8_Kohonen_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global puerto conexion
if conexion
      fclose(puerto); 
      delete(puerto);
end
% Get default command line output from handles structure
varargout{1} = handles.output;
function [M] = Obtener_Valores(handles)
 M(64)=0;
 M(1)=Obtener_Valor(handles.togglebutton1);
 M(2)=Obtener_Valor(handles.togglebutton2);
 M(3)=Obtener_Valor(handles.togglebutton3);
 M(4)=Obtener_Valor(handles.togglebutton4);
 M(5)=Obtener_Valor(handles.togglebutton5);
 M(6)=Obtener_Valor(handles.togglebutton6);
 M(7)=Obtener_Valor(handles.togglebutton7);
 M(8)=Obtener_Valor(handles.togglebutton8);
 M(9)=Obtener_Valor(handles.togglebutton9);
 M(10)=Obtener_Valor(handles.togglebutton10);
 M(11)=Obtener_Valor(handles.togglebutton11);
 M(12)=Obtener_Valor(handles.togglebutton12);
 M(13)=Obtener_Valor(handles.togglebutton13);
 M(14)=Obtener_Valor(handles.togglebutton14);
 M(15)=Obtener_Valor(handles.togglebutton15);
 M(16)=Obtener_Valor(handles.togglebutton16);
 M(17)=Obtener_Valor(handles.togglebutton17);
 M(18)=Obtener_Valor(handles.togglebutton18);
 M(19)=Obtener_Valor(handles.togglebutton19);
 M(20)=Obtener_Valor(handles.togglebutton20);
 M(21)=Obtener_Valor(handles.togglebutton21);
 M(22)=Obtener_Valor(handles.togglebutton22);
 M(23)=Obtener_Valor(handles.togglebutton23);
 M(24)=Obtener_Valor(handles.togglebutton24);
 M(25)=Obtener_Valor(handles.togglebutton25);
 M(26)=Obtener_Valor(handles.togglebutton26);
 M(27)=Obtener_Valor(handles.togglebutton27);
 M(28)=Obtener_Valor(handles.togglebutton28);
 M(29)=Obtener_Valor(handles.togglebutton29);
 M(30)=Obtener_Valor(handles.togglebutton30);
 M(31)=Obtener_Valor(handles.togglebutton31);
 M(32)=Obtener_Valor(handles.togglebutton32);
 M(33)=Obtener_Valor(handles.togglebutton33);
 M(34)=Obtener_Valor(handles.togglebutton34);
 M(35)=Obtener_Valor(handles.togglebutton35);
 M(36)=Obtener_Valor(handles.togglebutton36);
 M(37)=Obtener_Valor(handles.togglebutton37);
 M(38)=Obtener_Valor(handles.togglebutton38);
 M(39)=Obtener_Valor(handles.togglebutton39);
 M(40)=Obtener_Valor(handles.togglebutton40);
 M(41)=Obtener_Valor(handles.togglebutton41);
 M(42)=Obtener_Valor(handles.togglebutton42);
 M(43)=Obtener_Valor(handles.togglebutton43);
 M(44)=Obtener_Valor(handles.togglebutton44);
 M(45)=Obtener_Valor(handles.togglebutton45);
 M(46)=Obtener_Valor(handles.togglebutton46);
 M(47)=Obtener_Valor(handles.togglebutton47);
 M(48)=Obtener_Valor(handles.togglebutton48);
 M(49)=Obtener_Valor(handles.togglebutton49);
 M(50)=Obtener_Valor(handles.togglebutton50);
 M(51)=Obtener_Valor(handles.togglebutton51);
 M(52)=Obtener_Valor(handles.togglebutton52);
 M(53)=Obtener_Valor(handles.togglebutton53);
 M(54)=Obtener_Valor(handles.togglebutton54);
 M(55)=Obtener_Valor(handles.togglebutton55);
 M(56)=Obtener_Valor(handles.togglebutton56);
 M(57)=Obtener_Valor(handles.togglebutton57);
 M(58)=Obtener_Valor(handles.togglebutton58);
 M(59)=Obtener_Valor(handles.togglebutton59);
 M(60)=Obtener_Valor(handles.togglebutton60);
 M(61)=Obtener_Valor(handles.togglebutton61);
 M(62)=Obtener_Valor(handles.togglebutton62);
 M(63)=Obtener_Valor(handles.togglebutton63);
 M(64)=Obtener_Valor(handles.togglebutton64);

function Cambiar_Valor(Objeto)
global colorA colorB
if(get(Objeto,'Value')==1)
set(Objeto,'BackgroundColor',colorA);
else
set(Objeto,'BackgroundColor',colorB);    
end

function Resetear(handles)
global colorB
set(handles.togglebutton1,'BackgroundColor',colorB);
set(handles.togglebutton2,'BackgroundColor',colorB);
set(handles.togglebutton3,'BackgroundColor',colorB);
set(handles.togglebutton4,'BackgroundColor',colorB);
set(handles.togglebutton5,'BackgroundColor',colorB);
set(handles.togglebutton6,'BackgroundColor',colorB);
set(handles.togglebutton7,'BackgroundColor',colorB);
set(handles.togglebutton8,'BackgroundColor',colorB);
set(handles.togglebutton9,'BackgroundColor',colorB);
set(handles.togglebutton10,'BackgroundColor',colorB);
set(handles.togglebutton11,'BackgroundColor',colorB);
set(handles.togglebutton12,'BackgroundColor',colorB);
set(handles.togglebutton13,'BackgroundColor',colorB);
set(handles.togglebutton14,'BackgroundColor',colorB);
set(handles.togglebutton15,'BackgroundColor',colorB);
set(handles.togglebutton16,'BackgroundColor',colorB);
set(handles.togglebutton17,'BackgroundColor',colorB);
set(handles.togglebutton18,'BackgroundColor',colorB);
set(handles.togglebutton19,'BackgroundColor',colorB);
set(handles.togglebutton20,'BackgroundColor',colorB);
set(handles.togglebutton21,'BackgroundColor',colorB);
set(handles.togglebutton22,'BackgroundColor',colorB);
set(handles.togglebutton23,'BackgroundColor',colorB);
set(handles.togglebutton24,'BackgroundColor',colorB);
set(handles.togglebutton25,'BackgroundColor',colorB);
set(handles.togglebutton26,'BackgroundColor',colorB);
set(handles.togglebutton27,'BackgroundColor',colorB);
set(handles.togglebutton28,'BackgroundColor',colorB);
set(handles.togglebutton29,'BackgroundColor',colorB);
set(handles.togglebutton30,'BackgroundColor',colorB);
set(handles.togglebutton31,'BackgroundColor',colorB);
set(handles.togglebutton32,'BackgroundColor',colorB);
set(handles.togglebutton33,'BackgroundColor',colorB);
set(handles.togglebutton34,'BackgroundColor',colorB);
set(handles.togglebutton35,'BackgroundColor',colorB);
set(handles.togglebutton36,'BackgroundColor',colorB);
set(handles.togglebutton37,'BackgroundColor',colorB);
set(handles.togglebutton38,'BackgroundColor',colorB);
set(handles.togglebutton39,'BackgroundColor',colorB);
set(handles.togglebutton40,'BackgroundColor',colorB);
set(handles.togglebutton41,'BackgroundColor',colorB);
set(handles.togglebutton42,'BackgroundColor',colorB);
set(handles.togglebutton43,'BackgroundColor',colorB);
set(handles.togglebutton44,'BackgroundColor',colorB);
set(handles.togglebutton45,'BackgroundColor',colorB);
set(handles.togglebutton46,'BackgroundColor',colorB);
set(handles.togglebutton47,'BackgroundColor',colorB);
set(handles.togglebutton48,'BackgroundColor',colorB);
set(handles.togglebutton49,'BackgroundColor',colorB);
set(handles.togglebutton50,'BackgroundColor',colorB);
set(handles.togglebutton51,'BackgroundColor',colorB);
set(handles.togglebutton52,'BackgroundColor',colorB);
set(handles.togglebutton53,'BackgroundColor',colorB);
set(handles.togglebutton54,'BackgroundColor',colorB);
set(handles.togglebutton55,'BackgroundColor',colorB);
set(handles.togglebutton56,'BackgroundColor',colorB);
set(handles.togglebutton57,'BackgroundColor',colorB);
set(handles.togglebutton58,'BackgroundColor',colorB);
set(handles.togglebutton59,'BackgroundColor',colorB);
set(handles.togglebutton60,'BackgroundColor',colorB);
set(handles.togglebutton61,'BackgroundColor',colorB);
set(handles.togglebutton62,'BackgroundColor',colorB);
set(handles.togglebutton63,'BackgroundColor',colorB);
set(handles.togglebutton64,'BackgroundColor',colorB);
set(handles.togglebutton1,'Value',0);
set(handles.togglebutton2,'Value',0);
set(handles.togglebutton3,'Value',0);
set(handles.togglebutton4,'Value',0);
set(handles.togglebutton5,'Value',0);
set(handles.togglebutton6,'Value',0);
set(handles.togglebutton7,'Value',0);
set(handles.togglebutton8,'Value',0);
set(handles.togglebutton9,'Value',0);
set(handles.togglebutton10,'Value',0);
set(handles.togglebutton11,'Value',0);
set(handles.togglebutton12,'Value',0);
set(handles.togglebutton13,'Value',0);
set(handles.togglebutton14,'Value',0);
set(handles.togglebutton15,'Value',0);
set(handles.togglebutton16,'Value',0);
set(handles.togglebutton17,'Value',0);
set(handles.togglebutton18,'Value',0);
set(handles.togglebutton19,'Value',0);
set(handles.togglebutton20,'Value',0);
set(handles.togglebutton21,'Value',0);
set(handles.togglebutton22,'Value',0);
set(handles.togglebutton23,'Value',0);
set(handles.togglebutton24,'Value',0);
set(handles.togglebutton25,'Value',0);
set(handles.togglebutton26,'Value',0);
set(handles.togglebutton27,'Value',0);
set(handles.togglebutton28,'Value',0);
set(handles.togglebutton29,'Value',0);
set(handles.togglebutton30,'Value',0);
set(handles.togglebutton31,'Value',0);
set(handles.togglebutton32,'Value',0);
set(handles.togglebutton33,'Value',0);
set(handles.togglebutton34,'Value',0);
set(handles.togglebutton35,'Value',0);
set(handles.togglebutton36,'Value',0);
set(handles.togglebutton37,'Value',0);
set(handles.togglebutton38,'Value',0);
set(handles.togglebutton39,'Value',0);
set(handles.togglebutton40,'Value',0);
set(handles.togglebutton41,'Value',0);
set(handles.togglebutton42,'Value',0);
set(handles.togglebutton43,'Value',0);
set(handles.togglebutton44,'Value',0);
set(handles.togglebutton45,'Value',0);
set(handles.togglebutton46,'Value',0);
set(handles.togglebutton47,'Value',0);
set(handles.togglebutton48,'Value',0);
set(handles.togglebutton49,'Value',0);
set(handles.togglebutton50,'Value',0);
set(handles.togglebutton51,'Value',0);
set(handles.togglebutton52,'Value',0);
set(handles.togglebutton53,'Value',0);
set(handles.togglebutton54,'Value',0);
set(handles.togglebutton55,'Value',0);
set(handles.togglebutton56,'Value',0);
set(handles.togglebutton57,'Value',0);
set(handles.togglebutton58,'Value',0);
set(handles.togglebutton59,'Value',0);
set(handles.togglebutton60,'Value',0);
set(handles.togglebutton61,'Value',0);
set(handles.togglebutton62,'Value',0);
set(handles.togglebutton63,'Value',0);
set(handles.togglebutton64,'Value',0);

function Inicializar_Neurona()
global W P P1a P2a P3a P4a P5a P6a P7a P8a P9a
P1a=[0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0];
P2a=[0,0,0,1,1,0,0,0,0,0,1,1,1,1,0,0,0,1,1,1,1,1,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0];
P3a=[0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0];
P4a=[0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,1,1,1,1,1,1,0,0,0,1,1,1,1,0,0,0,0,0,1,1,0,0,0];
P5a=[0,0,0,0,1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,1,1,1,1,1,0,0,1,1,1,1,0,1,0,1,1,1,1,1,0,0,1,1,1,1,1,0,0,0,1,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0];
P6a=[1,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,1,0,1,1,1,1,0,0,0,0,1,1,1,1,1,0,0,0,0,1,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,0,1,1,1];
P7a=[0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,1,0,0,0,1,1,1,1,1,0,0,1,1,1,1,1,0,1,0,1,1,1,1,0,0,1,1,1,1,1,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0];
P8a=[1,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,1,0,0,0,0,1,1,1,1,1,0,0,0,0,1,1,1,1,0,1,0,0,0,1,1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,1];
P9a=[0,1,1,1,1,1,1,0,1,0,0,0,0,0,1,1,1,0,0,0,1,1,0,1,1,0,0,1,1,1,0,1,1,0,1,1,1,0,0,1,1,0,1,1,0,0,0,1,1,1,0,0,0,0,0,1,0,1,1,1,1,1,1,0];
%%%%
P1b=[0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0];
P2b=[0,0,0,1,1,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0];
P3b=[0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0];
P4b=[0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,0,1,1,0,0,0];
P5b=[0,0,0,0,1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,1,0,0,0,1,1,1,0,1,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0];
P6b=[1,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1];
P7b=[0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,1,0,1,1,1,0,0,0,1,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0];
P8b=[1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,0,1,0,0,0,0,1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,1];
P9b=[0,1,1,1,1,1,1,0,1,0,0,0,0,0,1,1,1,0,0,0,0,1,0,1,1,0,0,0,1,1,0,1,1,0,0,1,1,0,0,1,1,0,1,1,0,0,0,1,1,1,0,0,0,0,0,1,0,1,1,1,1,1,1,0];
%%%%
P1c=[0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0];
P2c=[0,0,0,1,1,0,0,0,0,0,1,1,1,1,0,0,0,1,1,1,1,1,1,0,0,0,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0];
P3c=[0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0];
P4c=[0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,1,0,0,0,1,1,1,1,1,1,0,0,0,1,1,1,1,0,0,0,0,0,1,1,0,0,0];
P5c=[0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,1,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0];
P6c=[1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,0,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1];
P7c=[0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0,1,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0];
P8c=[1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1];
P9c=[0,1,1,1,1,1,1,0,1,0,0,0,0,0,0,1,1,0,0,0,1,1,0,1,1,0,0,1,1,0,0,1,1,0,1,1,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,0,1,1,1,1,1,1,0];
%%%%
P1d=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
P2d=[0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0];
P3d=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
P4d=[0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0];
P5d=[0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,1,0,0,0,0,1,0,0,1,0,0,1,1,0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0];
P6d=[1,1,1,1,0,0,0,0,1,1,0,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1];
P7d=[0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,1,1,0,0,1,0,0,1,0,0,0,0,1,0,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0];
P8d=[1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,0,1,1,0,0,0,0,1,1,1,1];
P9d=[1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,1,0,1,1,0,0,0,1,0,0,1,1,0,0,1,0,0,0,1,1,0,1,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1];
P=[P1a' P1b' P1c' P1d',...
   P2a' P2b' P2c' P2d',...
   P3a' P3b' P3c' P3d',...
   P4a' P4b' P4c' P4d',...
   P5a' P5b' P5c' P5d',...
   P6a' P6b' P6c' P6d',...
   P7a' P7b' P7c' P7d',...
   P8a' P8b' P8c' P8d',...
   P9a' P9b' P9c' P9d'];
[NE,NP]=size(P);
NF=9;
alpha=0.2;
n=0.1;
w1=P1a+rand(1,NE)*n;
w2=P2a+rand(1,NE)*n;
w3=P3a+rand(1,NE)*n;
w4=P4a+rand(1,NE)*n;
w5=P5d+rand(1,NE)*n;
w6=P6b+rand(1,NE)*n;
w7=P7a+rand(1,NE)*n;
w8=P8a+rand(1,NE)*n;
w9=P9a+rand(1,NE)*n;
edist(NF)=0;
W=[w1;w2;w3;w4;w5;w6;w7;w8;w9];
for epochs=1:800
  for n=1:NP
    for i=1:NF
      edist(i)=Norma(W(i,:),P(:,n));%%sqrt((W(i,1)-P(1,n))^2+(W(i,2)-P(2,n))^2);
    end
    Winner=compet((-edist)');
    for z=1:NF
      W(z,:)=W(z,:)+alpha*Winner(z)*(P(:,n)'-W(z,:));
    end
  end
end
W(5,:)=P5b*0.95;
W(6,:)=P6a;
R(NP)=0;
for j=1:NP
  po=P(:,j)';
  a=compet(W*po');
  r=0;
  for i=1:length(a)
     r=r+a(i)*i; 
  end
  R(j)=r
end

function [ R ] = Norma(A,B)
%Norma Calcula la norma entre A y B
%   Detailed explanation goes here
l=length(A);
R=0;
for i=1:l
    R=R+(A(i)-B(i))^2;
end
R=sqrt(R);



function [ R ] = Create_Image(V)
%Create_Image Crear imagen de 5X6 en base al vector
%%Ingresar vector V para crear imagen
C=cell(8,8);
Cuadro_Negro(5,5)=false;
Cuadro_Blanco=~Cuadro_Negro;
 for j=1:8
 for i=1:8
    if V((j-1)*8+i)==1
       C(j,i)={Cuadro_Negro};
    else
       C(j,i)={Cuadro_Blanco};
    end
 end
 end
 R=cell2mat(C);

function Invertir_Color(Objeto)
global colorA colorB
if get(Objeto,'Value')==0
   set(Objeto,'Value',1);
   set(Objeto,'BackgroundColor',colorA);
else
   set(Objeto,'Value',0);
   set(Objeto,'BackgroundColor',colorB);
end

function [valor] = Obtener_Valor(Objeto)
valor=get(Objeto,'Value');

function togglebutton1_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);
function togglebutton2_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton3_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton4_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton5_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton6_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton7_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton8_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton9_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton10_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton11_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton12_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton13_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton14_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton15_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton16_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton17_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton18_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton19_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton20_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton21_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton22_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton23_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton24_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton25_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton26_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton27_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton28_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton29_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton30_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton31_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton32_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton33_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton34_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton35_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton36_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton37_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton38_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton39_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton40_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton41_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton42_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton43_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton44_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton45_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton46_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton47_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton48_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton49_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton50_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton51_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton52_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton53_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton54_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton55_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton56_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton57_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton58_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton59_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton60_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton61_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton62_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton63_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);

function togglebutton64_Callback(hObject, eventdata, handles)
Cambiar_Valor(hObject);
% % --- Executes on button press in togglebutton1.
% function togglebutton1_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton1 (see GCBO)
% Cambiar_Valor(hObject)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton1
% 
% 
% % --- Executes on button press in togglebutton2.
% function togglebutton2_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton2 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton2
% 
% 
% % --- Executes on button press in togglebutton3.
% function togglebutton3_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton3 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton3
% 
% 
% % --- Executes on button press in togglebutton4.
% function togglebutton4_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton4 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton4
% 
% 
% % --- Executes on button press in togglebutton5.
% function togglebutton5_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton5 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton5
% 
% 
% % --- Executes on button press in togglebutton6.
% function togglebutton6_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton6 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton6
% 
% 
% % --- Executes on button press in togglebutton7.
% function togglebutton7_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton7 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton7
% 
% 
% % --- Executes on button press in togglebutton8.
% function togglebutton8_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton8 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton8
% 
% 
% % --- Executes on button press in togglebutton9.
% function togglebutton9_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton9 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton9
% 
% 
% % --- Executes on button press in togglebutton10.
% function togglebutton10_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton10 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton10
% 
% 
% % --- Executes on button press in togglebutton11.
% function togglebutton11_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton11 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton11
% 
% 
% % --- Executes on button press in togglebutton12.
% function togglebutton12_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton12 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton12
% 
% 
% % --- Executes on button press in togglebutton13.
% function togglebutton13_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton13 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton13
% 
% 
% % --- Executes on button press in togglebutton14.
% function togglebutton14_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton14 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton14
% 
% 
% % --- Executes on button press in togglebutton15.
% function togglebutton15_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton15 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton15
% 
% 
% % --- Executes on button press in togglebutton16.
% function togglebutton16_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton16 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton16
% 
% 
% % --- Executes on button press in togglebutton17.
% function togglebutton17_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton17 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton17
% 
% 
% % --- Executes on button press in togglebutton18.
% function togglebutton18_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton18 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton18
% 
% 
% % --- Executes on button press in togglebutton19.
% function togglebutton19_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton19 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton19
% 
% 
% % --- Executes on button press in togglebutton20.
% function togglebutton20_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton20 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton20
% 
% 
% % --- Executes on button press in togglebutton21.
% function togglebutton21_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton21 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton21
% 
% 
% % --- Executes on button press in togglebutton22.
% function togglebutton22_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton22 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton22
% 
% 
% % --- Executes on button press in togglebutton23.
% function togglebutton23_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton23 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton23
% 
% 
% % --- Executes on button press in togglebutton24.
% function togglebutton24_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton24 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton24
% 
% 
% % --- Executes on button press in togglebutton25.
% function togglebutton25_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton25 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton25
% 
% 
% % --- Executes on button press in togglebutton26.
% function togglebutton26_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton26 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton26
% 
% 
% % --- Executes on button press in togglebutton27.
% function togglebutton27_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton27 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton27
% 
% 
% % --- Executes on button press in togglebutton28.
% function togglebutton28_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton28 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton28
% 
% 
% % --- Executes on button press in togglebutton29.
% function togglebutton29_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton29 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton29
% 
% 
% % --- Executes on button press in togglebutton30.
% function togglebutton30_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton30 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton30
% 
% 
% % --- Executes on button press in togglebutton31.
% function togglebutton31_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton31 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton31
% 
% 
% % --- Executes on button press in togglebutton32.
% function togglebutton32_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton32 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton32
% 
% 
% % --- Executes on button press in togglebutton33.
% function togglebutton33_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton33 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton33
% 
% 
% % --- Executes on button press in togglebutton34.
% function togglebutton34_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton34 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton34
% 
% 
% % --- Executes on button press in togglebutton35.
% function togglebutton35_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton35 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton35
% 
% 
% % --- Executes on button press in togglebutton36.
% function togglebutton36_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton36 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton36
% 
% 
% % --- Executes on button press in togglebutton37.
% function togglebutton37_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton37 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton37
% 
% 
% % --- Executes on button press in togglebutton38.
% function togglebutton38_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton38 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton38
% 
% 
% % --- Executes on button press in togglebutton39.
% function togglebutton39_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton39 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton39
% 
% 
% % --- Executes on button press in togglebutton40.
% function togglebutton40_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton40 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton40
% 
% 
% % --- Executes on button press in togglebutton41.
% function togglebutton41_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton41 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton41
% 
% 
% % --- Executes on button press in togglebutton42.
% function togglebutton42_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton42 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton42
% 
% 
% % --- Executes on button press in togglebutton43.
% function togglebutton43_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton43 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton43
% 
% 
% % --- Executes on button press in togglebutton44.
% function togglebutton44_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton44 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton44
% 
% 
% % --- Executes on button press in togglebutton45.
% function togglebutton45_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton45 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton45
% 
% 
% % --- Executes on button press in togglebutton46.
% function togglebutton46_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton46 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton46
% 
% 
% % --- Executes on button press in togglebutton47.
% function togglebutton47_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton47 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton47
% 
% 
% % --- Executes on button press in togglebutton48.
% function togglebutton48_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton48 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton48
% 
% 
% % --- Executes on button press in togglebutton49.
% function togglebutton49_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton49 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton49
% 
% 
% % --- Executes on button press in togglebutton50.
% function togglebutton50_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton50 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton50
% 
% 
% % --- Executes on button press in togglebutton51.
% function togglebutton51_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton51 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton51
% 
% 
% % --- Executes on button press in togglebutton52.
% function togglebutton52_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton52 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton52
% 
% 
% % --- Executes on button press in togglebutton53.
% function togglebutton53_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton53 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton53
% 
% 
% % --- Executes on button press in togglebutton54.
% function togglebutton54_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton54 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton54
% 
% 
% % --- Executes on button press in togglebutton55.
% function togglebutton55_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton55 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton55
% 
% 
% % --- Executes on button press in togglebutton56.
% function togglebutton56_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton56 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton56
% 
% 
% % --- Executes on button press in togglebutton57.
% function togglebutton57_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton57 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton57
% 
% 
% % --- Executes on button press in togglebutton58.
% function togglebutton58_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton58 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton58
% 
% 
% % --- Executes on button press in togglebutton59.
% function togglebutton59_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton59 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton59
% 
% 
% % --- Executes on button press in togglebutton60.
% function togglebutton60_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton60 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton60
% 
% 
% % --- Executes on button press in togglebutton61.
% function togglebutton61_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton61 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton61
% 
% 
% % --- Executes on button press in togglebutton62.
% function togglebutton62_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton62 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton62
% 
% 
% % --- Executes on button press in togglebutton63.
% function togglebutton63_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton63 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton63
% 
% 
% % --- Executes on button press in togglebutton64.
% function togglebutton64_Callback(hObject, eventdata, handles)
% % hObject    handle to togglebutton64 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of togglebutton64


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
Resetear(handles);
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
Invertir_Color(handles.togglebutton1);
Invertir_Color(handles.togglebutton2);
Invertir_Color(handles.togglebutton3);
Invertir_Color(handles.togglebutton4);
Invertir_Color(handles.togglebutton5);
Invertir_Color(handles.togglebutton6);
Invertir_Color(handles.togglebutton7);
Invertir_Color(handles.togglebutton8);
Invertir_Color(handles.togglebutton9);
Invertir_Color(handles.togglebutton10);
Invertir_Color(handles.togglebutton11);
Invertir_Color(handles.togglebutton12);
Invertir_Color(handles.togglebutton13);
Invertir_Color(handles.togglebutton14);
Invertir_Color(handles.togglebutton15);
Invertir_Color(handles.togglebutton16);
Invertir_Color(handles.togglebutton17);
Invertir_Color(handles.togglebutton18);
Invertir_Color(handles.togglebutton19);
Invertir_Color(handles.togglebutton20);
Invertir_Color(handles.togglebutton21);
Invertir_Color(handles.togglebutton22);
Invertir_Color(handles.togglebutton23);
Invertir_Color(handles.togglebutton24);
Invertir_Color(handles.togglebutton25);
Invertir_Color(handles.togglebutton26);
Invertir_Color(handles.togglebutton27);
Invertir_Color(handles.togglebutton28);
Invertir_Color(handles.togglebutton29);
Invertir_Color(handles.togglebutton30);
Invertir_Color(handles.togglebutton31);
Invertir_Color(handles.togglebutton32);
Invertir_Color(handles.togglebutton33);
Invertir_Color(handles.togglebutton34);
Invertir_Color(handles.togglebutton35);
Invertir_Color(handles.togglebutton36);
Invertir_Color(handles.togglebutton37);
Invertir_Color(handles.togglebutton38);
Invertir_Color(handles.togglebutton39);
Invertir_Color(handles.togglebutton40);
Invertir_Color(handles.togglebutton41);
Invertir_Color(handles.togglebutton42);
Invertir_Color(handles.togglebutton43);
Invertir_Color(handles.togglebutton44);
Invertir_Color(handles.togglebutton45);
Invertir_Color(handles.togglebutton46);
Invertir_Color(handles.togglebutton47);
Invertir_Color(handles.togglebutton48);
Invertir_Color(handles.togglebutton49);
Invertir_Color(handles.togglebutton50);
Invertir_Color(handles.togglebutton51);
Invertir_Color(handles.togglebutton52);
Invertir_Color(handles.togglebutton53);
Invertir_Color(handles.togglebutton54);
Invertir_Color(handles.togglebutton55);
Invertir_Color(handles.togglebutton56);
Invertir_Color(handles.togglebutton57);
Invertir_Color(handles.togglebutton58);
Invertir_Color(handles.togglebutton59);
Invertir_Color(handles.togglebutton60);
Invertir_Color(handles.togglebutton61);
Invertir_Color(handles.togglebutton62);
Invertir_Color(handles.togglebutton63);
Invertir_Color(handles.togglebutton64);
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
global W P1a P2a P3a P4a P5a P6a P7a P8a P9a conexion puerto
po=Obtener_Valores(handles);
a=compet(W*po');
axes(handles.axes1),imshow(Create_Image(po));
axes(handles.axes2)
r=0;
for i=1:length(a)
    r=r+a(i)*i; 
end
% axes(handles.axes2),imshow(Create_Image(a));
switch r
    case 1
         imshow(Create_Image(P1a));
         title('East');
         if conexion
           fprintf(puerto,'0r'); 
         end
    case 2
        imshow(Create_Image(P2a));
        title('North');
        if conexion
          fprintf(puerto,'2r'); 
        end
    case 3
        imshow(Create_Image(P3a));
        title('West');
        if conexion
           fprintf(puerto,'4r'); 
        end
    case 4
        imshow(Create_Image(P4a));
        title('South');
        if conexion
           fprintf(puerto,'6r'); 
        end
    case 5
        imshow(Create_Image(P5a));
        title('Northweast');
        if conexion
           fprintf(puerto,'1r'); 
        end
    case 6
        imshow(Create_Image(P6a));
        title('Noroeste');
        if conexion
           fprintf(puerto,'3r'); 
        end
    case 7
        imshow(Create_Image(P7a));
        title('Southwest');
        if conexion
           fprintf(puerto,'5r'); 
        end
    case 8
        imshow(Create_Image(P8a));
        title('Southweast');
        if conexion
           fprintf(puerto,'7r'); 
        end
    case 9
        imshow(Create_Image(P9a));
        title('Stop');
        if conexion
           fprintf(puerto,'8r'); 
        end
    otherwise
        imshow(Create_Image(P9a));
        title('Unknown');
        if conexion
           fprintf(puerto,'8r'); 
        end    
end
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
global puerto conexion
delete(instrfind({'Bluetooth'},{'HC-06'}));
puerto=Bluetooth('HC-06',1);
% delete(instrfind({'port'},{'COM5'}));
% puerto=serial('COM5');
% puerto.BaudRate=9600;
try 
   fopen(puerto);%abre el puerto a utilizar
   disp('Conexion correcta')
   conexion=true;
%    fprintf(puerto,'Hola');
%    fclose(puerto);
catch
   delete(puerto);
   disp('Conexion Erronea')
   conexion=false;
end

% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
global puerto conexion
if conexion
      fprintf(puerto,'8r'); 
end
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
