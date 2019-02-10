function varargout = menu(varargin)
% MENU MATLAB code for menu.fig
%      MENU, by itself, creates a new MENU or raises the existing
%      singleton*.
%
%      H = MENU returns the handle to a new MENU or the handle to
%      the existing singleton*.
%
%      MENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENU.M with the given input arguments.
%
%      MENU('Property','Value',...) creates a new MENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before menu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to menu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help menu

% Last Modified by GUIDE v2.5 12-Jun-2018 20:11:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @menu_OpeningFcn, ...
                   'gui_OutputFcn',  @menu_OutputFcn, ...
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


% --- Executes just before menu is made visible.
function menu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to menu (see VARARGIN)

addpath(genpath('Funciones')); % NOS ASEGURAMOS DE AÑADIR LA RUTA DONDE SE ENCUENTRAN LOS MÉTODOS NUMÉRICOS
addpath(genpath('GUI')); % NOS ASEGURAMOS DE AÑADIR LA RUTA DONDE SE ENCUENTRAN LAS INTERFACES GRÁFICAS

% Choose default command line output for menu
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes menu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = menu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnConversiones.
function btnConversiones_Callback(hObject, eventdata, handles)
% hObject    handle to btnConversiones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
conversiones();

% --- Executes on button press in btnPuntoFijo.
function btnPuntoFijo_Callback(hObject, eventdata, handles)
% hObject    handle to btnPuntoFijo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
puntoFijo();

% --- Executes on button press in btnNewton.
function btnNewton_Callback(hObject, eventdata, handles)
% hObject    handle to btnNewton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
newtonRaphson();

% --- Executes on button press in btnSecante.
function btnSecante_Callback(hObject, eventdata, handles)
% hObject    handle to btnSecante (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
secante();

% --- Executes on button press in btnNRModificado.
function btnNRModificado_Callback(hObject, eventdata, handles)
% hObject    handle to btnNRModificado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
newtonRaphsonModificado();

% --- Executes on button press in btnAproxSucesiv.
function btnAproxSucesiv_Callback(hObject, eventdata, handles)
% hObject    handle to btnAproxSucesiv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
aproxSucesivas();

% --- Executes on button press in btnInterpSimple.
function btnInterpSimple_Callback(hObject, eventdata, handles)
% hObject    handle to btnInterpSimple (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
interpSimple();

% --- Executes on button press in btnInterpLagrange.
function btnInterpLagrange_Callback(hObject, eventdata, handles)
% hObject    handle to btnInterpLagrange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lagrange();

% --- Executes on button press in btnMinCuadrados.
function btnMinCuadrados_Callback(hObject, eventdata, handles)
% hObject    handle to btnMinCuadrados (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
minimosCuadrados();

% --- Executes on button press in btnRungeKutta.
function btnRungeKutta_Callback(hObject, eventdata, handles)
% hObject    handle to btnRungeKutta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rungeKutta();

% --- Executes on button press in btnTrapezoidal.
function btnTrapezoidal_Callback(hObject, eventdata, handles)
% hObject    handle to btnTrapezoidal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
trapezoidal();