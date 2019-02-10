function varargout = trapezoidal(varargin)
% TRAPEZOIDAL MATLAB code for trapezoidal.fig
%      TRAPEZOIDAL, by itself, creates a new TRAPEZOIDAL or raises the existing
%      singleton*.
%
%      H = TRAPEZOIDAL returns the handle to a new TRAPEZOIDAL or the handle to
%      the existing singleton*.
%
%      TRAPEZOIDAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRAPEZOIDAL.M with the given input arguments.
%
%      TRAPEZOIDAL('Property','Value',...) creates a new TRAPEZOIDAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before trapezoidal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to trapezoidal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help trapezoidal

% Last Modified by GUIDE v2.5 12-Jun-2018 20:55:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @trapezoidal_OpeningFcn, ...
                   'gui_OutputFcn',  @trapezoidal_OutputFcn, ...
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


% --- Executes just before trapezoidal is made visible.
function trapezoidal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to trapezoidal (see VARARGIN)

% Choose default command line output for trapezoidal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% set(handles.tblResultados, 'Data', cell(2, 2));
% UIWAIT makes trapezoidal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = trapezoidal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnIteracion.
function btnIteracion_Callback(hObject, eventdata, handles)
% hObject    handle to btnIteracion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms x;

cla;
try
    funcion = eval(get(handles.txtFx, 'String'));
catch
    errordlg('Función no válida', 'Error');
end

try
    a = eval(get(handles.txtA, 'String'));
catch
    errordlg('Valor de inicio de intervalo no válido', 'Error');
end

try
    b = eval(get(handles.txtB, 'String'));
catch
    errordlg('Valor de final de intervalo no válido', 'Error');
end

try
    numTrapecios = eval(get(handles.txtNumAprox, 'String'));
catch
    errordlg('Número de aproximaciones no válido', 'Error');
end

set(handles.lblEsperando, 'Visible', 'on');
pause(0.1);
[aprox, coordX, coordY] = metodoTrapezoidal(funcion, a, b, numTrapecios);

set(handles.txtResultado, 'String', num2str(aprox));

fplot(handles.grafica, funcion);
grid on;
hold on;

for i = 1 : size(coordX, 1)    
    fill([coordX(i, 1) coordX(i, 2) coordX(i, 3) coordX(i, 4)], [coordY(i, 1) coordY(i, 2) coordY(i, 3) coordY(i, 4)], [0.8 0.8 0.8])
    hold on;
end

set(handles.lblEsperando, 'Visible', 'off');

function txtFx_Callback(hObject, eventdata, handles)
% hObject    handle to txtFx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtFx as text
%        str2double(get(hObject,'String')) returns contents of txtFx as a double


% --- Executes during object creation, after setting all properties.
function txtFx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtFx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtA_Callback(hObject, eventdata, handles)
% hObject    handle to txtA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtA as text
%        str2double(get(hObject,'String')) returns contents of txtA as a double


% --- Executes during object creation, after setting all properties.
function txtA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtNumAprox_Callback(hObject, eventdata, handles)
% hObject    handle to txtNumAprox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtNumAprox as text
%        str2double(get(hObject,'String')) returns contents of txtNumAprox as a double


% --- Executes during object creation, after setting all properties.
function txtNumAprox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtNumAprox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtResultado_Callback(hObject, eventdata, handles)
% hObject    handle to txtResultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtResultado as text
%        str2double(get(hObject,'String')) returns contents of txtResultado as a double


% --- Executes during object creation, after setting all properties.
function txtResultado_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtResultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtNumIteraciones_Callback(hObject, eventdata, handles)
% hObject    handle to txtNumIteraciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtNumIteraciones as text
%        str2double(get(hObject,'String')) returns contents of txtNumIteraciones as a double


% --- Executes during object creation, after setting all properties.
function txtNumIteraciones_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtNumIteraciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function tblResultados_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tblResultados (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject, 'Data', cell(2, 2));



function txtB_Callback(hObject, eventdata, handles)
% hObject    handle to txtB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtB as text
%        str2double(get(hObject,'String')) returns contents of txtB as a double


% --- Executes during object creation, after setting all properties.
function txtB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
