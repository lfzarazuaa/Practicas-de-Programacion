function varargout = Contraste(varargin)
% CONTRASTE MATLAB code for Contraste.fig
%      CONTRASTE, by itself, creates a new CONTRASTE or raises the existing
%      singleton*.
%
%      H = CONTRASTE returns the handle to a new CONTRASTE or the handle to
%      the existing singleton*.
%
%      CONTRASTE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTRASTE.M with the given input arguments.
%
%      CONTRASTE('Property','Value',...) creates a new CONTRASTE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Contraste_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Contraste_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Contraste

% Last Modified by GUIDE v2.5 20-Jan-2015 10:33:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Contraste_OpeningFcn, ...
                   'gui_OutputFcn',  @Contraste_OutputFcn, ...
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


% --- Executes just before Contraste is made visible.
function Contraste_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Contraste (see VARARGIN)

% Choose default command line output for Contraste
handles.output = hObject;
global J
J = imread('Londres.jpeg');
imshow(J);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Contraste wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Contraste_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global J
a=0.02*get(hObject,'Value');
b=rgb2gray(J);
c=double(b);
d=a*c;
imshow(d);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
