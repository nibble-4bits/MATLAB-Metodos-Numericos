function varargout = minimosCuadrados(varargin)
% MINIMOSCUADRADOS MATLAB code for minimosCuadrados.fig
%      MINIMOSCUADRADOS, by itself, creates a new MINIMOSCUADRADOS or raises the existing
%      singleton*.
%
%      H = MINIMOSCUADRADOS returns the handle to a new MINIMOSCUADRADOS or the handle to
%      the existing singleton*.
%
%      MINIMOSCUADRADOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINIMOSCUADRADOS.M with the given input arguments.
%
%      MINIMOSCUADRADOS('Property','Value',...) creates a new MINIMOSCUADRADOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before minimosCuadrados_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to minimosCuadrados_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help minimosCuadrados

% Last Modified by GUIDE v2.5 11-Jun-2018 19:40:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @minimosCuadrados_OpeningFcn, ...
                   'gui_OutputFcn',  @minimosCuadrados_OutputFcn, ...
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


% --- Executes just before minimosCuadrados is made visible.
function minimosCuadrados_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to minimosCuadrados (see VARARGIN)

% Choose default command line output for minimosCuadrados
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% set(handles.tblResultados, 'Data', cell(2, 2));
% UIWAIT makes minimosCuadrados wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = minimosCuadrados_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnPoli.
function btnPoli_Callback(hObject, eventdata, handles)
% hObject    handle to btnPoli (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms x;

cla;
try
    arrX = eval(get(handles.txtX, 'String'));
catch
    errordlg('Arreglo de coordenadas X no válido', 'Error');
end

try
    arrY = eval(get(handles.txtY, 'String'));
catch
    errordlg('Arreglo de coordenadas Y no válido', 'Error');
end

set(handles.lblEsperando, 'Visible', 'on');
pause(0.1);

arrDatos = cat(1, arrX, arrY);
switch get(handles.cmbTipo, 'Value')
    case 1
        polinomio = metodoMinCuadrados(arrDatos);
    case 2
        polinomio = metodoMinCuadradosCuadratico(arrDatos);
end

set(handles.txtResultado, 'String', char(polinomio));
plot(handles.grafica, arrX, arrY, '*k');
hold on;
fplot(handles.grafica, polinomio);

set(handles.lblEsperando, 'Visible', 'off');

function txtX_Callback(hObject, eventdata, handles)
% hObject    handle to txtX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtX as text
%        str2double(get(hObject,'String')) returns contents of txtX as a double


% --- Executes during object creation, after setting all properties.
function txtX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtX (see GCBO)
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

function txtY_Callback(hObject, eventdata, handles)
% hObject    handle to txtY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtY as text
%        str2double(get(hObject,'String')) returns contents of txtY as a double


% --- Executes during object creation, after setting all properties.
function txtY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtY (see GCBO)
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


% --- Executes on selection change in cmbTipo.
function cmbTipo_Callback(hObject, eventdata, handles)
% hObject    handle to cmbTipo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cmbTipo contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cmbTipo


% --- Executes during object creation, after setting all properties.
function cmbTipo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmbTipo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
