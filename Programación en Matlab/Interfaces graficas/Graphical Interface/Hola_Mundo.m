function varargout = Hola_Mundo(varargin)
% HOLA_MUNDO MATLAB code for Hola_Mundo.fig
%      HOLA_MUNDO, by itself, creates a new HOLA_MUNDO or raises the existing
%      singleton*.
%
%      H = HOLA_MUNDO returns the handle to a new HOLA_MUNDO or the handle to
%      the existing singleton*.
%
%      HOLA_MUNDO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOLA_MUNDO.M with the given input arguments.
%
%      HOLA_MUNDO('Property','Value',...) creates a new HOLA_MUNDO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Hola_Mundo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Hola_Mundo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Hola_Mundo

% Last Modified by GUIDE v2.5 13-Oct-2014 11:35:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Hola_Mundo_OpeningFcn, ...
                   'gui_OutputFcn',  @Hola_Mundo_OutputFcn, ...
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


% --- Executes just before Hola_Mundo is made visible.
function Hola_Mundo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Hola_Mundo (see VARARGIN)

% Choose default command line output for Hola_Mundo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Hola_Mundo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Hola_Mundo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Salir.
function Salir_Callback(hObject, eventdata, handles)
% hObject    handle to Salir (see GCBO)
close(gcbf);
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
