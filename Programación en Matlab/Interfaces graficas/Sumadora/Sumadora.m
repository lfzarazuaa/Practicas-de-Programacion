function varargout = Sumadora(varargin)
% SUMADORA MATLAB code for Sumadora.fig
%      SUMADORA, by itself, creates a new SUMADORA or raises the existing
%      singleton*.
%
%      H = SUMADORA returns the handle to a new SUMADORA or the handle to
%      the existing singleton*.
%
%      SUMADORA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUMADORA.M with the given input arguments.
%
%      SUMADORA('Property','Value',...) creates a new SUMADORA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Sumadora_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Sumadora_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Sumadora

% Last Modified by GUIDE v2.5 14-Oct-2014 22:26:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sumadora_OpeningFcn, ...
                   'gui_OutputFcn',  @Sumadora_OutputFcn, ...
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


% --- Executes just before Sumadora is made visible.
function Sumadora_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Sumadora (see VARARGIN)

% Choose default command line output for Sumadora
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Sumadora wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Sumadora_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function sum2_Callback(hObject, eventdata, handles)
% hObject    handle to sum2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sum1=str2double(get(handles.sum1,'String')); 
sum2=str2double(get(hObject,'String')); 
if isnan(sum1) 
 errordlg('El valor debe ser numérico','ERROR') 
 set(handles.uno,'String',0); 
 sum1=0; 
elseif isnan(sum2) 
 errordlg('El valor debe ser numérico','ERROR') 
 set(handles.dos,'String',0); 
 sum2=0; 
end
suma=sum1+sum2; 
set(handles.resultado,'String',suma); 
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of sum2 as text
%        str2double(get(hObject,'String')) returns contents of sum2 as a double


% --- Executes during object creation, after setting all properties.
function sum2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sum2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sum1_Callback(hObject, eventdata, handles)
% hObject    handle to sum1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sum1=str2double(get(hObject,'String')); 
sum2=str2double(get(handles.sum2,'String')); 
if isnan(sum1) 
 errordlg('El valor debe ser numérico','ERROR') 
 set(handles.uno,'String',0); 
 sum1=0; 
elseif isnan(sum2) 
 errordlg('El valor debe ser numérico','ERROR') 
 set(handles.dos,'String',0); 
 sum2=0; 
end
suma=sum1+sum2; 
set(handles.resultado,'String',suma); 
guidata(hObject, handles);
a=77
% Hints: get(hObject,'String') returns contents of sum1 as text
%        str2double(get(hObject,'String')) returns contents of sum1 as a double


% --- Executes during object creation, after setting all properties.
function sum1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sum1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
