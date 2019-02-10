function varargout = rungeKutta(varargin)
% RUNGEKUTTA MATLAB code for rungeKutta.fig
%      RUNGEKUTTA, by itself, creates a new RUNGEKUTTA or raises the existing
%      singleton*.
%
%      H = RUNGEKUTTA returns the handle to a new RUNGEKUTTA or the handle to
%      the existing singleton*.
%
%      RUNGEKUTTA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RUNGEKUTTA.M with the given input arguments.
%
%      RUNGEKUTTA('Property','Value',...) creates a new RUNGEKUTTA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rungeKutta_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rungeKutta_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rungeKutta

% Last Modified by GUIDE v2.5 02-Jun-2018 19:27:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rungeKutta_OpeningFcn, ...
                   'gui_OutputFcn',  @rungeKutta_OutputFcn, ...
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


% --- Executes just before rungeKutta is made visible.
function rungeKutta_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rungeKutta (see VARARGIN)

% Choose default command line output for rungeKutta
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% set(handles.tblResultados, 'Data', cell(2, 2));
% UIWAIT makes rungeKutta wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rungeKutta_OutputFcn(hObject, eventdata, handles) 
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
syms x y;

try
    ecuDiff = eval(get(handles.txtFxy, 'String'));
catch
    errordlg('Ecuación diferencial no válida', 'Error');
end

try
    y0 = eval(get(handles.txtY0, 'String'));
catch
    errordlg('Valor inicial no válido', 'Error');
end

try
    inicioInter = eval(get(handles.txtInicio, 'String'));
catch
    errordlg('Inicio de intervalo no válido', 'Error');
end

try
    finInter = eval(get(handles.txtFin, 'String'));
catch
    errordlg('Final de intervalo no válido', 'Error');
end

try
    numIter = eval(get(handles.txtNumIteraciones, 'String'));
catch
    errordlg('Número de interaciones no válido', 'Error');
end

if isfinite(ecuDiff) && isfinite(y0) && isreal(y0)
    set(handles.lblEsperando, 'Visible', 'on');
    pause(0.1);
    switch get(handles.cmbOrden, 'Value')
        case 1
            [ys, xs] = metodoRungeKutta(ecuDiff, inicioInter, finInter, y0, numIter, '2');
        case 2
            [ys, xs] = metodoRungeKutta(ecuDiff, inicioInter, finInter, y0, numIter, '4');
    end
    set(handles.txtResultado, 'String', num2str(ys(end)));
    set(handles.tblResultados, 'Data', [ys xs]);
    plot(handles.grafica, xs, ys);
else
    errordlg(['Error' newline 'No se permiten introducir NaN, infinito o números complejos'], 'Error');
end
set(handles.lblEsperando, 'Visible', 'off');

function txtFxy_Callback(hObject, eventdata, handles)
% hObject    handle to txtFxy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtFxy as text
%        str2double(get(hObject,'String')) returns contents of txtFxy as a double


% --- Executes during object creation, after setting all properties.
function txtFxy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtFxy (see GCBO)
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

% --- Executes during object creation, after setting all properties.
function lb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in cmbOrden.
function cmbOrden_Callback(hObject, eventdata, handles)
% hObject    handle to cmbOrden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cmbOrden contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cmbOrden


% --- Executes during object creation, after setting all properties.
function cmbOrden_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmbOrden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
