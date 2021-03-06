function varargout = newtonRaphsonModificado(varargin)
% NEWTONRAPHSONMODIFICADO MATLAB code for newtonRaphsonModificado.fig
%      NEWTONRAPHSONMODIFICADO, by itself, creates a new NEWTONRAPHSONMODIFICADO or raises the existing
%      singleton*.
%
%      H = NEWTONRAPHSONMODIFICADO returns the handle to a new NEWTONRAPHSONMODIFICADO or the handle to
%      the existing singleton*.
%
%      NEWTONRAPHSONMODIFICADO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWTONRAPHSONMODIFICADO.M with the given input arguments.
%
%      NEWTONRAPHSONMODIFICADO('Property','Value',...) creates a new NEWTONRAPHSONMODIFICADO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before newtonRaphsonModificado_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to newtonRaphsonModificado_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help newtonRaphsonModificado

% Last Modified by GUIDE v2.5 05-May-2018 01:39:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @newtonRaphsonModificado_OpeningFcn, ...
                   'gui_OutputFcn',  @newtonRaphsonModificado_OutputFcn, ...
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


% --- Executes just before newtonRaphsonModificado is made visible.
function newtonRaphsonModificado_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to newtonRaphsonModificado (see VARARGIN)

% Choose default command line output for newtonRaphsonModificado
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% set(handles.tblResultados, 'Data', cell(2, 2));
% UIWAIT makes newtonRaphsonModificado wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = newtonRaphsonModificado_OutputFcn(hObject, eventdata, handles) 
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
    errordlg('Funci�n no v�lida', 'Error');
end

try
    x0 = eval(get(handles.txtX0, 'String'));
catch
    errordlg('Valor inicial no v�lido', 'Error');
end

try
    porcError = eval(get(handles.txtError, 'String'));
catch
    errordlg('Porcentaje de error no v�lido', 'Error');
end

if isfinite(funcion) && isfinite(x0) && isreal(x0) && isfinite(porcError) && isreal(porcError)
    set(handles.lblEsperando, 'Visible', 'on');
    pause(0.1);
    [xn, xn_1, error, numIter] = metodoNRModificado(funcion, x0, porcError);
    
    set(handles.txtResultado, 'String', num2str(xn(end)));
    set(handles.txtNumIteraciones, 'String', num2str(numIter(end)));
    set(handles.tblResultados, 'Data', [xn, error]);
    plot(handles.grafica, xn, xn_1);
else
    errordlg(['Error' newline 'No se permiten introducir NaN, infinito o n�meros complejos'], 'Error');
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



function txtX0_Callback(hObject, eventdata, handles)
% hObject    handle to txtX0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtX0 as text
%        str2double(get(hObject,'String')) returns contents of txtX0 as a double


% --- Executes during object creation, after setting all properties.
function txtX0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtX0 (see GCBO)
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
