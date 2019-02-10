function varargout = conversiones(varargin)
% CONVERSIONES MATLAB code for conversiones.fig
%      CONVERSIONES, by itself, creates a new CONVERSIONES or raises the existing
%      singleton*.
%
%      H = CONVERSIONES returns the handle to a new CONVERSIONES or the handle to
%      the existing singleton*.
%
%      CONVERSIONES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONVERSIONES.M with the given input arguments.
%
%      CONVERSIONES('Property','Value',...) creates a new CONVERSIONES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before conversiones_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to conversiones_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help conversiones

% Last Modified by GUIDE v2.5 03-May-2018 22:44:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @conversiones_OpeningFcn, ...
                   'gui_OutputFcn',  @conversiones_OutputFcn, ...
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


% --- Executes just before conversiones is made visible.
function conversiones_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to conversiones (see VARARGIN)

% Choose default command line output for conversiones
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes conversiones wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = conversiones_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in cmbSeleccion.
function cmbSeleccion_Callback(hObject, eventdata, handles)
% hObject    handle to cmbSeleccion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

switch get(hObject, 'Value')
    case 1
        set(handles.lbl1, 'String', 'Binario');
        set(handles.lbl2, 'String', 'Octal');
        set(handles.lbl3, 'String', 'Hexadecimal');
    case 2
        set(handles.lbl1, 'String', 'Octal');
        set(handles.lbl2, 'String', 'Decimal');
        set(handles.lbl3, 'String', 'Hexadecimal');
    case 3
        set(handles.lbl1, 'String', 'Binario');
        set(handles.lbl2, 'String', 'Decimal');
        set(handles.lbl3, 'String', 'Hexadecimal');
    case 4
        set(handles.lbl1, 'String', 'Binario');
        set(handles.lbl2, 'String', 'Octal');
        set(handles.lbl3, 'String', 'Decimal');
end


% --- Executes during object creation, after setting all properties.
function cmbSeleccion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmbSeleccion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtNumero_Callback(hObject, eventdata, handles)
% hObject    handle to txtNumero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtNumero as text
%        str2double(get(hObject,'String')) returns contents of txtNumero as a double


% --- Executes during object creation, after setting all properties.
function txtNumero_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtNumero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnConvertir.
function btnConvertir_Callback(hObject, eventdata, handles)
% hObject    handle to btnConvertir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
numero = upper(get(handles.txtNumero, 'String'));

switch get(handles.cmbSeleccion, 'Value')
    case 1
        set(handles.txt1, 'String', convertirABase(convertirADec(numero, 10), 2));
        set(handles.txt2, 'String', convertirABase(convertirADec(numero, 10), 8));
        set(handles.txt3, 'String', convertirABase(convertirADec(numero, 10), 16));
    case 2
        set(handles.txt1, 'String', convertirABase(convertirADec(numero, 2), 8));
        set(handles.txt2, 'String', convertirABase(convertirADec(numero, 2), 10));
        set(handles.txt3, 'String', convertirABase(convertirADec(numero, 2), 16));
    case 3
        set(handles.txt1, 'String', convertirABase(convertirADec(numero, 8), 2));
        set(handles.txt2, 'String', convertirABase(convertirADec(numero, 8), 10));
        set(handles.txt3, 'String', convertirABase(convertirADec(numero, 8), 16));
    case 4
        set(handles.txt1, 'String', convertirABase(convertirADec(numero, 16), 2));
        set(handles.txt2, 'String', convertirABase(convertirADec(numero, 16), 8));
        set(handles.txt3, 'String', convertirABase(convertirADec(numero, 16), 10));
end

function txt1_Callback(hObject, eventdata, handles)
% hObject    handle to txt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt1 as text
%        str2double(get(hObject,'String')) returns contents of txt1 as a double


% --- Executes during object creation, after setting all properties.
function txt1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt2_Callback(hObject, eventdata, handles)
% hObject    handle to txt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt2 as text
%        str2double(get(hObject,'String')) returns contents of txt2 as a double


% --- Executes during object creation, after setting all properties.
function txt2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt3_Callback(hObject, eventdata, handles)
% hObject    handle to txt3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt3 as text
%        str2double(get(hObject,'String')) returns contents of txt3 as a double


% --- Executes during object creation, after setting all properties.
function txt3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
