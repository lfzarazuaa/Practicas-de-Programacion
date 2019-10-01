function varargout = Concentrador(varargin)
% CONCENTRADOR MATLAB code for Concentrador.fig
%      CONCENTRADOR, by itself, creates a new CONCENTRADOR or raises the existing
%      singleton*.
%
%      H = CONCENTRADOR returns the handle to a new CONCENTRADOR or the handle to
%      the existing singleton*.
%
%      CONCENTRADOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONCENTRADOR.M with the given input arguments.
%
%      CONCENTRADOR('Property','Value',...) creates a new CONCENTRADOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Concentrador_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Concentrador_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Concentrador

% Last Modified by GUIDE v2.5 20-Oct-2016 14:50:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Concentrador_OpeningFcn, ...
                   'gui_OutputFcn',  @Concentrador_OutputFcn, ...
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


% --- Executes just before Concentrador is made visible.
function Concentrador_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Concentrador (see VARARGIN)

% Choose default command line output for Concentrador
handles.output = hObject;
global Opcion1 Opcion2 rdgui Ddgui
   rd1=0;
   rd2=0.3;
   Kt1=1;
   rdgui
   Ddgui
   set(handles.text3,'String',rdgui);
   set(handles.text4,'String',Ddgui);
   guidata(hObject, handles);
if Opcion1==2 && Opcion2==1
   Imagen=imread('Eje_Redondo_Axial_Filete.png');
   imshow(Imagen);
   Kt2=2.6;
elseif Opcion1==2 && Opcion2==2
   Imagen=imread('Eje_Redondo_Torsion_Filete.png');
   imshow(Imagen);
   Kt2=3;
elseif Opcion1==2 && Opcion2==3
   Imagen=imread('Eje_Redondo_Flexion_Filete.png');
   imshow(Imagen);
   Kt2=3;
elseif Opcion1==3 && Opcion2==1
   Imagen=imread('Eje_Redondo_Axial_Ranurado.png');
   imshow(Imagen);
   Kt2=3;
elseif Opcion1==3 && Opcion2==2
   Imagen=imread('Eje_Redondo_Torsion_Ranurado.png');
   imshow(Imagen);
   Kt2=2.6;
elseif Opcion1==3 && Opcion2==3
   Imagen=imread('Eje_Redondo_Flexion_Ranurado.png');
   imshow(Imagen);
   Kt2=3;
end
[x1,y1,b1]=ginput(1);
[x2,y2,b2]=ginput(1);
[x3,y3,b3]=ginput(1);
if(x2>=x1)
rd=(rd2-rd1)/(x2-x1)*(x3-x1)+rd1
else
rd=(rd2-rd1)/(x1-y2)*(x3-x2)+rd1 
end
if(y1>=y2)
Kt=(Kt2-Kt1)/(y2-y1)*(y3-y1)+Kt1
else
Kt=(Kt2-Kt1)/(y1-y2)*(y3-y2)+Kt1 
end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Concentrador wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Concentrador_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
