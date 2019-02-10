function varargout = aproxSucesivas(varargin)
% APROXSUCESIVAS MATLAB code for aproxSucesivas.fig
%      APROXSUCESIVAS, by itself, creates a new APROXSUCESIVAS or raises the existing
%      singleton*.
%
%      H = APROXSUCESIVAS returns the handle to a new APROXSUCESIVAS or the handle to
%      the existing singleton*.
%
%      APROXSUCESIVAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APROXSUCESIVAS.M with the given input arguments.
%
%      APROXSUCESIVAS('Property','Value',...) creates a new APROXSUCESIVAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before aproxSucesivas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to aproxSucesivas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help aproxSucesivas

% Last Modified by GUIDE v2.5 11-Jun-2018 20:28:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @aproxSucesivas_OpeningFcn, ...
                   'gui_OutputFcn',  @aproxSucesivas_OutputFcn, ...
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


% --- Executes just before aproxSucesivas is made visible.
function aproxSucesivas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to aproxSucesivas (see VARARGIN)

% Choose default command line output for aproxSucesivas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% set(handles.tblResultados, 'Data', cell(2, 2));
% UIWAIT makes aproxSucesivas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = aproxSucesivas_OutputFcn(hObject, eventdata, handles) 
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

try
    funcion = eval(get(handles.txtFx, 'String'));
catch
    errordlg('Función no válida', 'Error');
end

try
    inicio = eval(get(handles.txtInicio, 'String'));
catch
    errordlg('Inicio de intervalo no válido', 'Error');
end

try
    fin = eval(get(handles.txtFin, 'String'));
catch
    errordlg('Fin de intervalo no válido', 'Error');
end

try
    x0 = eval(get(handles.txtX0, 'String'));
catch
    errordlg('Valor inicial no válido', 'Error');
end

if isfinite(funcion) && isfinite(x0) && isreal(x0)
    set(handles.lblEsperando, 'Visible', 'on');
    pause(0.1);
    [xn, xn_1, error, numIter] = metodoAproxSucesivas(funcion, fin, inicio, x0);
    
    set(handles.txtResultado, 'String', num2str(xn(end)));
    set(handles.txtNumIteraciones, 'String', num2str(numIter(end)));
    set(handles.tblResultados, 'Data', [xn, error]);
    plot(handles.grafica, xn, xn_1);
else
    errordlg(['Error' newline 'No se permiten introducir NaN, infinito o números complejos'], 'Error');
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



function txtInicio_Callback(hObject, eventdata, handles)
% hObject    handle to txtInicio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtInicio as text
%        str2double(get(hObject,'String')) returns contents of txtInicio as a double


% --- Executes during object creation, after setting all properties.
function txtInicio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtInicio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtError_Callback(hObject, eventdata, handles)
% hObject    handle to txtError (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtError as text
%        str2double(get(hObject,'String')) returns contents of txtError as a double


% --- Executes during object creation, after setting all properties.
function txtError_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtError (see GCBO)
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



function txtFin_Callback(hObject, eventdata, handles)
% hObject    handle to txtFin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtFin as text
%        str2double(get(hObject,'String')) returns contents of txtFin as a double


% --- Executes during object creation, after setting all properties.
function txtFin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtFin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
