function varargout = Inductrack1(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Inductrack1_OpeningFcn, ...
                   'gui_OutputFcn',  @Inductrack1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Inductrack1 is made visible.
function Inductrack1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Inductrack1 (see VARARGIN)
set(handles.figure1, 'units', 'normalized', 'position', [0.07 0.2 1 1])

% Choose default command line output for Inductrack1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Inductrack1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global plot1menu
global plot2menu
global track;
global x
global y
global Bx
global By
global Fxp1
global Fxp2
global Fyp1
global Fyp2
global vp
global Lhp
global mag
global phase
global mFxp2
global mFyp2
global lamda2
global Lh2
global percentlamda
global M1
global Lh

track = 1;
plot1menu = 4;
plot2menu = 7;

% --- Outputs from this function are returned to the command line.
function varargout = Inductrack1_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function eBr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eBr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eBr_Callback(hObject, eventdata, handles)
% hObject    handle to eBr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eBr as text
%        str2double(get(hObject,'String')) returns contents of eBr as a double


% --- Executes during object creation, after setting all properties.
function ed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ed_Callback(hObject, eventdata, handles)
% hObject    handle to ed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed as text
%        str2double(get(hObject,'String')) returns contents of ed as a double


% --- Executes during object creation, after setting all properties.
function eM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eM_Callback(hObject, eventdata, handles)
% hObject    handle to eM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eM as text
%        str2double(get(hObject,'String')) returns contents of eM as a double


% --- Executes during object creation, after setting all properties.
function elamda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to elamda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function elamda_Callback(hObject, eventdata, handles)
% hObject    handle to elamda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of elamda as text
%        str2double(get(hObject,'String')) returns contents of elamda as a double


% --- Executes during object creation, after setting all properties.
function ew_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ew (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ew_Callback(hObject, eventdata, handles)
% hObject    handle to ew (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ew as text
%        str2double(get(hObject,'String')) returns contents of ew as a double


% --- Executes during object creation, after setting all properties.
function elm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to elm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function elm_Callback(hObject, eventdata, handles)
% hObject    handle to elm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of elm as text
%        str2double(get(hObject,'String')) returns contents of elm as a double


% --- Executes during object creation, after setting all properties.
function etm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function etm_Callback(hObject, eventdata, handles)
% hObject    handle to etm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etm as text
%        str2double(get(hObject,'String')) returns contents of etm as a double


% --- Executes during object creation, after setting all properties.
function eBo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eBo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eBo_Callback(hObject, eventdata, handles)
% hObject    handle to eBo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eBo as text
%        str2double(get(hObject,'String')) returns contents of eBo as a double


% --- Executes during object creation, after setting all properties.
function eA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eA_Callback(hObject, eventdata, handles)
% hObject    handle to eA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eA as text
%        str2double(get(hObject,'String')) returns contents of eA as a double


% --- Executes during object creation, after setting all properties.
function etf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function etf_Callback(hObject, eventdata, handles)
% hObject    handle to etf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etf as text
%        str2double(get(hObject,'String')) returns contents of etf as a double


% --- Executes during object creation, after setting all properties.
function edeltac_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edeltac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edeltac_Callback(hObject, eventdata, handles)
% hObject    handle to edeltac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edeltac as text
%        str2double(get(hObject,'String')) returns contents of edeltac as a double


% --- Executes during object creation, after setting all properties.
function edc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edc_Callback(hObject, eventdata, handles)
% hObject    handle to edc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edc as text
%        str2double(get(hObject,'String')) returns contents of edc as a double


% --- Executes during object creation, after setting all properties.
function er_CreateFcn(hObject, eventdata, handles)
% hObject    handle to er (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function er_Callback(hObject, eventdata, handles)
% hObject    handle to er (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of er as text
%        str2double(get(hObject,'String')) returns contents of er as a double


% --- Executes during object creation, after setting all properties.
function ePc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ePc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ePc_Callback(hObject, eventdata, handles)
% hObject    handle to ePc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ePc as text
%        str2double(get(hObject,'String')) returns contents of ePc as a double


% --- Executes during object creation, after setting all properties.
function eNt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eNt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eNt_Callback(hObject, eventdata, handles)
% hObject    handle to eNt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eNt as text
%        str2double(get(hObject,'String')) returns contents of eNt as a double


% --- Executes during object creation, after setting all properties.
function eNs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eNs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eNs_Callback(hObject, eventdata, handles)
% hObject    handle to eNs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eNs as text
%        str2double(get(hObject,'String')) returns contents of eNs as a double


% --- Executes during object creation, after setting all properties.
function ey1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ey1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function ey1_Callback(hObject, eventdata, handles)
% hObject    handle to ey1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ey1 as text
%        str2double(get(hObject,'String')) returns contents of ey1 as a double


% --- Executes during object creation, after setting all properties.
function eal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eal_Callback(hObject, eventdata, handles)
% hObject    handle to eal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eal as text
%        str2double(get(hObject,'String')) returns contents of eal as a double


% --- Executes during object creation, after setting all properties.
function eh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eh_Callback(hObject, eventdata, handles)
% hObject    handle to eh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eh as text
%        str2double(get(hObject,'String')) returns contents of eh as a double


% --- Executes during object creation, after setting all properties.
function eLd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eLd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eLd_Callback(hObject, eventdata, handles)
% hObject    handle to eLd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eLd as text
%        str2double(get(hObject,'String')) returns contents of eLd as a double


% --- Executes during object creation, after setting all properties.
function eLl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eLl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eLl_Callback(hObject, eventdata, handles)
% hObject    handle to eLl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eLl as text
%        str2double(get(hObject,'String')) returns contents of eLl as a double


% --- Executes during object creation, after setting all properties.
function eL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eL_Callback(hObject, eventdata, handles)
% hObject    handle to eL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eL as text
%        str2double(get(hObject,'String')) returns contents of eL as a double


% --- Executes during object creation, after setting all properties.
function erc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to erc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function erc_Callback(hObject, eventdata, handles)
% hObject    handle to erc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of erc as text
%        str2double(get(hObject,'String')) returns contents of erc as a double


% --- Executes during object creation, after setting all properties.
function eR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eR_Callback(hObject, eventdata, handles)
% hObject    handle to eR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eR as text
%        str2double(get(hObject,'String')) returns contents of eR as a double


% --- Executes during object creation, after setting all properties.
function eL2Dt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eL2Dt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eL2Dt_Callback(hObject, eventdata, handles)
% hObject    handle to eL2Dt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eL2Dt as text
%        str2double(get(hObject,'String')) returns contents of eL2Dt as a double


% --- Executes during object creation, after setting all properties.
function evt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to evt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function evt_Callback(hObject, eventdata, handles)
% hObject    handle to evt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of evt as text
%        str2double(get(hObject,'String')) returns contents of evt as a double


% --- Executes during object creation, after setting all properties.
function eomegat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eomegat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eomegat_Callback(hObject, eventdata, handles)
% hObject    handle to eomegat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eomegat as text
%        str2double(get(hObject,'String')) returns contents of eomegat as a double


% --- Executes during object creation, after setting all properties.
function eLht_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eLht (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eLht_Callback(hObject, eventdata, handles)
% hObject    handle to eLht (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eLht as text
%        str2double(get(hObject,'String')) returns contents of eLht as a double


% --- Executes during object creation, after setting all properties.
function evb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to evb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function evb_Callback(hObject, eventdata, handles)
% hObject    handle to evb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of evb as text
%        str2double(get(hObject,'String')) returns contents of evb as a double


% --- Executes during object creation, after setting all properties.
function eomegab_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eomegab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eomegab_Callback(hObject, eventdata, handles)
% hObject    handle to eomegab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eomegab as text
%        str2double(get(hObject,'String')) returns contents of eomegab as a double


% --- Executes during object creation, after setting all properties.
function eFxb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eFxb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eFxb_Callback(hObject, eventdata, handles)
% hObject    handle to eFxb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eFxb as text
%        str2double(get(hObject,'String')) returns contents of eFxb as a double


% --- Executes during object creation, after setting all properties.
function eKb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eKb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eKb_Callback(hObject, eventdata, handles)
% hObject    handle to eKb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eKb as text
%        str2double(get(hObject,'String')) returns contents of eKb as a double


% --- Executes during object creation, after setting all properties.
function eKt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eKt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eKt_Callback(hObject, eventdata, handles)
% hObject    handle to eKt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eKt as text
%        str2double(get(hObject,'String')) returns contents of eKt as a double


% --- Executes during object creation, after setting all properties.
function eRLpole_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eRLpole (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eRLpole_Callback(hObject, eventdata, handles)
% hObject    handle to eRLpole (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eRLpole as text
%        str2double(get(hObject,'String')) returns contents of eRLpole as a double


% --- Executes during object creation, after setting all properties.
function evu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to evu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function evu_Callback(hObject, eventdata, handles)
% hObject    handle to evu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of evu as text
%        str2double(get(hObject,'String')) returns contents of evu as a double


% --- Executes during object creation, after setting all properties.
function eFyu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eFyu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eFyu_Callback(hObject, eventdata, handles)
% hObject    handle to eFyu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eFyu as text
%        str2double(get(hObject,'String')) returns contents of eFyu as a double


% --- Executes during object creation, after setting all properties.
function eFxu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eFxu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eFxu_Callback(hObject, eventdata, handles)
% hObject    handle to eFxu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eFxu as text
%        str2double(get(hObject,'String')) returns contents of eFxu as a double


% --- Executes during object creation, after setting all properties.
function eLhu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eLhu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eLhu_Callback(hObject, eventdata, handles)
% hObject    handle to eLhu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eLhu as text
%        str2double(get(hObject,'String')) returns contents of eLhu as a double


% --- Executes during object creation, after setting all properties.
function eL2Du_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eL2Du (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eL2Du_Callback(hObject, eventdata, handles)
% hObject    handle to eL2Du (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eL2Du as text
%        str2double(get(hObject,'String')) returns contents of eL2Du as a double


% --- Executes during object creation, after setting all properties.
function eL2Db_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eL2Db (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eL2Db_Callback(hObject, eventdata, handles)
% hObject    handle to eL2Db (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eL2Db as text
%        str2double(get(hObject,'String')) returns contents of eL2Db as a double


% --- Executes during object creation, after setting all properties.
function eomegau_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eomegau (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eomegau_Callback(hObject, eventdata, handles)
% hObject    handle to eomegau (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eomegau as text
%        str2double(get(hObject,'String')) returns contents of eomegau as a double


% --- Executes during object creation, after setting all properties.
function esu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to esu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function esu_Callback(hObject, eventdata, handles)
% hObject    handle to esu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of esu as text
%        str2double(get(hObject,'String')) returns contents of esu as a double


% --- Executes during object creation, after setting all properties.
function etracktype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etracktype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in etracktype.
function etracktype_Callback(hObject, eventdata, handles)
% hObject    handle to etracktype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns etracktype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from etracktype
global track
%Train Defaults:

Br = 1.43;
d = 0.03;
M = 4;
Is = 24;
lamda = 0.2;
w = 0.15;
lm = 0.8;
tm = 75;

val = get(hObject,'Value');
switch val
case 1
    track = 1;
    textdeltac = 'Conductor Bundle Height deltac = ';
    textdc = 'On Center Inductor Spacing dc = ';
    textPc = 'Mean Inductor Perimeter Pc = ';
    textrc = 'Conductor Resitance per Strand rc = ';
    unitrc = 'ohms/meter';
    textNt = 'Number of Turns Nt = ';
    unitNt = 'turns';
    textNs = 'Number of Strands per Turn Ns = ';
    unitNs = 'strands';
    deltac = 0.0125;
    dc = 0.016;
    rc = 1.36;
    Pc = 0.40;
    Nt = 53;
    Ns = 150;
    al = 0.0125;
    h = 0;
    y1 = 0.01;
    vu = 10;
case 2
    track = 2;
    textdeltac = 'Conductor Bundle Height deltac = ';
    textdc = 'On Center Bundle Spacing dc = ';
    textPc = 'Width of Track Pc = ';
    textrc = 'Conductor Resistance per Strand rc = ';
    unitrc = 'ohms/meter';
    textNt = 'Number of Bundles Nt = ';
    unitNt = 'bundles';
    textNs = 'Number of Strands per bundle Ns = ';
    unitNs = 'strands';
    deltac = 0.0125;
    dc = 0.016;
    rc = 1.36;
    Pc = 0.11;
    Nt = 53;
    Ns = 150;
    al = 0.0125;
    h = 0;
    y1 = 0.01;
    vu = 10;
case 3
    track = 3;
    textdeltac = 'Thickness of One Layer deltac = ';
    textdc = 'On Center Strip Spacing dc = ';
    textPc = 'Width of Track Pc = ';
    textrc = 'Electric Resistivity rc = ';
    unitrc = 'micro p-l/m^2';
    textNt = 'Width of Conductive Strip Nt = ';
    unitNt = 'meters';
    textNs = 'Number of Laminated Layers Ns = ';
    unitNs = 'layers';
    
   deltac = 0.0127;
   dc = 0.3079;
   Pc = 0.3048;
   rc = 265;
   Nt = 0.127;
   Ns = 1;
   al = 0.0127;
   h = 0;
   y1 = 0.05;
   vu = 120;
end

% set(handles.etrack,'string',num2str(track));
set(handles.tdeltac,'string',textdeltac);
set(handles.tdc,'string',textdc);
set(handles.tPc,'string',textPc);
set(handles.trc,'string',textrc);
set(handles.urc,'string',unitrc);
set(handles.tNt,'string',textNt);
set(handles.uNt,'string',unitNt);
set(handles.tNs,'string',textNs);
set(handles.uNs,'string',unitNs);
%Send out Default Data:
set(handles.eBr,'string',num2str(Br));
set(handles.ed,'string',num2str(d));
set(handles.eM,'string',num2str(M));
set(handles.eIs,'string',num2str(Is));
set(handles.elamda,'string',num2str(lamda));
set(handles.ew,'string',num2str(w));
set(handles.elm,'string',num2str(lm));
set(handles.etm,'string',num2str(tm));
set(handles.edeltac,'string',num2str(deltac));
set(handles.edc,'string',num2str(dc));
set(handles.erc,'string',num2str(rc));
set(handles.ePc,'string',num2str(Pc));
set(handles.eNt,'string',num2str(Nt));
set(handles.eNs,'string',num2str(Ns));
set(handles.eal,'string',num2str(al));
set(handles.eh,'string',num2str(h));
set(handles.ey1,'string',num2str(y1));
set(handles.evu,'string',num2str(vu));

% --- Executes on button press in ecompute.
function ecompute_Callback(hObject, eventdata, handles)
% hObject    handle to ecompute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global plot1menu
global plot2menu
global track;
global x
global y
global Bx
global By
global Fxp1
global Fxp2
global Fyp1
global Fyp2
global vp
global Lhp
global mag
global phase
global mFxp2
global mFyp2
global lamda2
global Lh2
global percentlamda
global M1
global Lh

%Get the input variables:
%===========================================
Br = str2num(get(handles.eBr,'string'));
d = str2num(get(handles.ed,'string'));
M = str2num(get(handles.eM,'string'));
Is = str2num(get(handles.eIs,'string'));
lamda = str2num(get(handles.elamda,'string'));
w = str2num(get(handles.ew,'string'));
lm = str2num(get(handles.elm,'string'));
tm = str2num(get(handles.etm,'string'));
deltac = str2num(get(handles.edeltac,'string'));
dc = str2num(get(handles.edc,'string'));
% track = str2num(get(handles.etrack,'string'));
rc = str2num(get(handles.erc,'string'));
Pc = str2num(get(handles.ePc,'string'));
Nt = str2num(get(handles.eNt,'string'));
Ns = str2num(get(handles.eNs,'string'));
al = str2num(get(handles.eal,'string'));
h = str2num(get(handles.eh,'string'));
y1 = str2num(get(handles.ey1,'string'));
vu = str2num(get(handles.evu,'string'));
%===========================================

%Constants
%=============================================
uo = 4*pi*10^-7;
%=============================================

%Train Equations:
%===========================================
Bo = Br*(1 - exp(-2*pi*d/lamda))*[(sin(pi/M))/(pi/M)];

x=0;
y=0;
for n = 1:1:121
    
        for o = 1:1:21
            Bx(n,o) = Bo*sin((2*pi/lamda)*x)*exp(-(2*pi/lamda)*(y));
            By(n,o) = Bo*cos((2*pi/lamda)*x)*exp(-(2*pi/lamda)*(y));
            y = y+0.001;
        end
        y = 0;
        x = x+0.001;
end
x=0:0.001:.12;
y=0:0.001:.020;
% figure(1),surf(y,x,Bx),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx');
% figure(2),surf(y,x,By),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('By');
% figure(3),surf(y,x,Bx),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx & By');
% hold on
% surf(y,x,By),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx & By');
% hold off

% Bo = (0.713)*Br;
A = lm*w;
tf = tm*9.81;
%===========================================

%Track Inductance:
Ld = uo*Pc/(4*pi*dc/lamda);

%Determine Track Type for Resistance:
if track == 1
    R = rc*Pc/(Nt*Ns);
    y1 = y1+deltac/2;
    levc = deltac/2;
elseif track == 2
    R = rc*Pc/(Nt*Ns);
    y1 = y1+deltac/2;
    levc = deltac/2;
elseif track == 3
    area = deltac*Nt;
    R = (rc*Pc/(area*Ns)*10^-10);
    y1 = y1+deltac*Ns/2;
    levc = deltac*Ns/2;
end

%Inductive Loading:
if h == 0
    levsl = 1;
    Ll = 0;
else
    Q = (exp(pi*al/lamda)+exp(-pi*al/lamda))/(exp(pi*al/lamda)-exp(-pi*al/lamda));
    Ll = (h/Pc)*(Q-1)*Ld;
%     levs = (w/Pc)*(Ld/(Ll+Ld));
%     levsl = (Ld/(Ll+Ld));
    levsl = 1;
end

L = Ld+Ll;

%Fringe Effects
if Is == 0;
    levsf = 1;
else
    levsf = 1 - 1/(2*Is);
end

%Scale Factor
levs = levsf*levsl;

%R/L Pole:
RLpole = R/L;

%Oscillation Frequency and Velocity
omegaosc = sqrt(4*pi*9.81/lamda);
vosc = omegaosc*lamda/(2*pi);


%Break Point Calculations:
omegab = R/(L*sqrt((((levs*Bo^2*w/(4*pi*L*dc/lamda))*A*exp(-4*pi*y1/lamda))/tf)-1));
vb = (omegab*lamda)/(2*pi);
sb = vb*(100/2.54)*1/(5280*12)*60*60;
Fxb = levs*(Bo^2*w/(4*pi*L*dc/lamda))*((R/(omegab*L))/(1+(R/(omegab*L))^2))*exp(-4*pi*(y1)/lamda)*A;
L2Db = omegab*L/R;

%Transition Calculations (Lift = Drag):
omegat = R/L;
vt = omegat*lamda/(2*pi);
st = vt*(100/2.54)*1/(5280*12)*60*60;
Lht = log((tf/(levs*(Bo^2*w/(4*pi*L*dc/lamda))*(1/(1+(R/(omegat*L))^2))*A)))*(lamda/(-4*pi))-levc;
% Fxyt = levs*(Bo^2*w/(4*pi*L*dc/lamda))*((R/(omegat*L))/(1+(R/(omegat*L))^2))*exp(-4*pi*(Lht+levc)/lamda)*A;
Fxyt = levs*(Bo^2*w/(4*pi*L*dc/lamda))*((R/(omegat*L))/(1+(R/(omegat*L))^2))*exp(-4*pi*(y1)/lamda)*A;
L2Dt = omegat*L/R;

%User Input:
if vu == 0;
    omegau = 0;
    su = 0;
    Fyu = 0;
    Fxu = 0;
    Lhu = 0;
    L2Du = 0;
else
    omegau = 2*pi*vu/lamda;
    su = vu*(100/2.54)*1/(5280*12)*60*60;
    Lhu = log((tf/(levs*(Bo^2*w/(4*pi*L*dc/lamda))*(1/(1+(R/(omegau*L))^2))*A)))*(lamda/(-4*pi))-levc;
    Fyu = levs*(Bo^2*w/(4*pi*L*dc/lamda))*(1/(1+(R/(omegau*L))^2))*exp(-4*pi*(Lhu+levc)/lamda)*A;
    Fxu = levs*(Bo^2*w/(4*pi*L*dc/lamda))*((R/(omegau*L))/(1+(R/(omegau*L))^2))*exp(-4*pi*(Lhu+levc)/lamda)*A;
    Fyuf = levs*(Bo^2*w/(4*pi*L*dc/lamda))*(1/(1+(R/(omegau*L))^2))*exp(-4*pi*(y1)/lamda)*A;
    Fxuf = levs*(Bo^2*w/(4*pi*L*dc/lamda))*((R/(omegau*L))/(1+(R/(omegau*L))^2))*exp(-4*pi*(y1)/lamda)*A;
    
    L2Du = omegau*L/R;
end

%Set output variables:
%===========================================
set(handles.eBo,'string',num2str(Bo));
set(handles.eA,'string',num2str(A));
set(handles.etf,'string',num2str(tf));
set(handles.eLd,'string',num2str(Ld));
set(handles.eLl,'string',num2str(Ll));
set(handles.eL,'string',num2str(L));
set(handles.eR,'string',num2str(R));
set(handles.eRLpole,'string',num2str(RLpole));
set(handles.evb,'string',num2str(vb));
set(handles.esb,'string',num2str(sb));
set(handles.eomegab,'string',num2str(omegab));
set(handles.eFxb,'string',num2str(Fxb));
set(handles.eL2Db,'string',num2str(L2Db));
set(handles.eomegaosc,'string',num2str(omegaosc));
set(handles.evosc,'string',num2str(vosc));
set(handles.evt,'string',num2str(vt));
set(handles.est,'string',num2str(st));
set(handles.eomegat,'string',num2str(omegat));
set(handles.eLht,'string',num2str(Lht));
set(handles.eFxyt,'string',num2str(Fxyt));
set(handles.eL2Dt,'string',num2str(L2Dt));
set(handles.eomegau,'string',num2str(omegau));
set(handles.esu,'string',num2str(su));
set(handles.eFyu,'string',num2str(Fyu));
set(handles.eFxu,'string',num2str(Fxu));
set(handles.eLhu,'string',num2str(Lhu));
set(handles.eL2Du,'string',num2str(L2Du));
set(handles.eFyuf,'string',num2str(Fyuf));
set(handles.eFxuf,'string',num2str(Fxuf));
%===========================================


%Plots *****************************************
%===============================================
vp = [0];
Fyp1 = [0];
Fxp1 = [0];
Fxp2 = [0];
Fyp2 = [0];
mFxp2 = [0];
mFyp2 = [0];
mag = [0];
phase = [0];
Lhp = [0];

vtp = round(vt/2)*30;
vstep = vtp/1000;
vp = vstep:vstep:vtp;

for n=1:1:1000
    omegap = 2*pi*vp(n)/lamda;
    Lhp(n) = log((tf/(levs*(Bo^2*w/(4*pi*L*dc/lamda))*(1/(1+(R/(omegap*L))^2))*A)))*(lamda/(-4*pi))-levc;
    if (y1-levc)>=Lhp(n)
    Fyp1(n) = levs*(Bo^2*w/(4*pi*L*dc/lamda))*(1/(1+(R/(omegap*L))^2))*exp(-4*pi*(y1)/lamda)*A;
    Fyp3(n) = levs*(Bo^2*w/(4*pi*L*dc/lamda))*(atan(omegap*L/R)/(pi/2))*exp(-4*pi*(y1)/lamda)*A;
    Fxp1(n) = levs*(Bo^2*w/(4*pi*L*dc/lamda))*((R/(omegap*L))/(1+(R/(omegap*L))^2))*exp(-4*pi*(y1)/lamda)*A;
    Fxp3(n) = levs*(Bo^2*w/(4*pi*L*dc/lamda))*(1-atan(omegap*L/R)/(pi/2))*exp(-4*pi*(y1)/lamda)*A;
    else
    Fyp1(n) = levs*(Bo^2*w/(4*pi*L*dc/lamda))*(1/(1+(R/(omegap*L))^2))*exp(-4*pi*(Lhp(n)+levc)/lamda)*A;
    Fyp3(n) = levs*(Bo^2*w/(4*pi*L*dc/lamda))*(atan(omegap*L/R)/(pi/2))*exp(-4*pi*(Lhp(n)+levc)/lamda)*A;
    Fxp1(n) = levs*(Bo^2*w/(4*pi*L*dc/lamda))*((R/(omegap*L))/(1+(R/(omegap*L))^2))*exp(-4*pi*(Lhp(n)+levc)/lamda)*A;
    Fxp3(n) = levs*(Bo^2*w/(4*pi*L*dc/lamda))*(1-atan(omegap*L/R)/(pi/2))*exp(-4*pi*(Lhp(n)+levc)/lamda)*A;
    end
    Fyp2(n) = levs*(Bo^2*w/(4*pi*L*dc/lamda))*(1/(1+(R/(omegap*L))^2))*exp(-4*pi*(y1)/lamda)*A;
    Fxp2(n) = levs*(Bo^2*w/(4*pi*L*dc/lamda))*((R/(omegap*L))/(1+(R/(omegap*L))^2))*exp(-4*pi*(y1)/lamda)*A;
    mFyp2(n) = 20*log10(Fyp2(n));
    mFxp2(n) = 20*log10(Fxp2(n));
    mag(n) = 20*log10(Fxp2(n)+Fyp2(n));
    phase(n) = -90*Fyp2(n)/(Fyp2(n)+Fxp2(n));
    
    Fyp4(n) = levs*(Bo^2*w/(4*pi*L*dc/lamda))*(atan(omegap*L/R)/(pi/2))*exp(-4*pi*(y1)/lamda)*A;
    Fxp4(n) = levs*(Bo^2*w/(4*pi*L*dc/lamda))*(1-atan(omegap*L/R)/(pi/2))*exp(-4*pi*(y1)/lamda)*A;
    mFyp4(n) = 20*log10(Fyp4(n));
    mFxp4(n) = 20*log10(Fxp4(n));
    mag4(n) = 20*log10(Fxp4(n)+Fyp4(n));
    phase4(n) = -90*Fyp4(n)/(Fyp4(n)+Fxp4(n));
    
end

% Fyp1 = 2*Fyp1;
% Fyp2 = 2*Fyp2;
% Fxp1 = 2*Fxp1;
% Fxp2 = 2*Fxp2;


% figure(1),plot(vp,Fyp3,vp,Fxp3,vp,Fyp4,vp,Fyp4),legend('Fyp3','Fxp3','Fxp4','Fyp4')
% figure(2),plot(vp,Fyp3)
% figure(3),plot(vp,Fxp3)
% figure(4),plot(vp,Fxp4)
% figure(5),plot(vp,Fyp4)

for q=3:1:20
    M1(q) = q;
    for n=4:1:50
        d1(n) = lamda*n*0.01;
        percentlamda(n) = 0.01*n;
        volume(n) = d1(n).^3;
        mass(n) = 7453.7002*volume(n);
        Bo1(q,n) = Br*(1 - exp(-2*pi*d1(n)./lamda))*[(sin(pi/M1(q)))/(pi/M1(q))];
        Bomass(q,n) = Bo1(q,n)/mass(n);
        Lh(q,n) = log(((tf+mass(n)*M1(q)*9.81)/(levs*(Bo1(q,n).^2*w/(4*pi*L*dc/lamda))*A)))*(lamda/(-4*pi))-levc;
        Fy(q,n) = levs*(Bo1(q,n).^2*w/(4*pi*L*dc/lamda))*exp(-4*pi*(Lh(q,n))/lamda)*A;
        Fymass(q,n) = Fy(q,n)/mass(n);
    end
    n = 0;
end


for z=1:1:500
    lamda2(z) = z*0.005;
    d2(z) = lamda2(z)/5;
    volume2(z) = d2(z).^3;
    mass2(z) = 7453.7002*volume2(z);
    Bo2(z) = Br*(1 - exp(-2*pi*d2(z)./lamda))*[(sin(pi/5))/(pi/5)];
    Lh2(z) = log(((tf+mass2(z)*5*9.81)/(levs*(Bo2(z).^2*w/(4*pi*L*dc/lamda2(z)))*A)))*(lamda2(z)/(-4*pi));
end


% [lamda2',Lh2']

if plot1menu == 1
    axes(handles.eplot1),surf(y,x,Bx),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx');
elseif plot1menu == 2
    axes(handles.eplot1),surf(y,x,By),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('By');
elseif plot1menu == 3
    axes(handles.eplot1),surf(y,x,Bx),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx & By');
    hold on
    axes(handles.eplot1),surf(y,x,By),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx & By');
    hold off
elseif plot1menu == 4
    axes(handles.eplot1),plot(vp,Fxp1,vp,Fyp1,vp,Fxp2,vp,Fyp2,'LineWidth',10),xlabel('Velocity (meters/sec)'),ylabel('Newtons'),title('Drag (b) Docked (r) & Levitation (g) Docked (t) Forces');
elseif plot1menu == 5
    axes(handles.eplot1),plot(vp,Fxp1,vp,Fyp1,vp,Fxp2,vp,Fyp2),xlabel('Velocity (meters/sec)'),ylabel('Newtons'),title('Drag (b) Docked (r) & Levitation (g) Docked (t) Forces');
    hold on
    dragv = [0,0.04905,0.14715,0.2943,0.34335,0.53955,0.63765,0.73575];
    dragf = [0,2.023,2.2542,2.938166667,3.487266667,4.9708,7.855983333,11.85863333];
    axes(handles.eplot1),plot(dragf,dragv,'m+')
    liftv = [2.302367,1.839967,2.316817,2.495033,4.354267,2.841833,2.345717,2.81775,3.241617,2.755133,3.386117,1.772533,1.180083,1.088567,1.0115,3.13565,4.171233,4.609333,5.009333,5.56325,5.076767,5.871517,5.78,5.553617,5.611417,6.367633,6.685533,7.15275,7.345417,7.2828];
    liftf = [0.981,0.4905,1.0791,1.22625,1.962,0.981,1.03005,1.22625,1.4715,1.22625,1.4715,0.8829,0.63765,0.24525,0.4905,1.2753,1.8639,2.20725,2.30535,2.69775,2.5506,2.943,3.5316,2.8449,2.943,3.5316,3.58065,4.2183,4.4145,4.5126];
    axes(handles.eplot1),plot(liftf,liftv,'k+'),legend('Calculated Free Drag Force','Calculated Free Levitaiton Force','Calculated Drag Force','Calculated Levitaiton Force','Measured Levitation Force','Measured Drag Force'),title('Predicted & Measured Forces')
    hold off
elseif plot1menu == 6
    axes(handles.eplot1),plot(vp,Lhp),xlabel('Velocity (meters/sec)'),ylabel('Height (meters)'),title('Levitation Height');
elseif plot1menu == 7
    axes(handles.eplot1),semilogx(vp,mag,vp,phase,vp,mFxp2,vp,mFyp2),xlabel('Velocity (meters/sec)'),ylabel('Magnitude (dB)'),title('Current Phase (g) Total Force (b) Drag Force (r) Lift Force (t)');
elseif plot1menu == 8
    axes(handles.eplot1),semilogx(vp,mag,vp,phase,vp,mFxp2,vp,mFyp2),xlabel('Velocity (meters/sec)'),ylabel('Magnitude (dB)'),title('Velocity Response');
    hold on
    phasev = [0.071557,0.143114,0.214671,0.286229,0.357786,0.429343,0.572457,0.715571,1.431143,2.862285,4.293428,5.72457,7.155713,14.31143,28.62285,42.93428,57.2457,71.55713,107.3357,143.1143,178.8928,214.6714,286.2285,357.7856,429.3428,500.8999,572.457,644.0141,715.5713,1073.357,1431.143,1788.928,2146.714];
    phasep = [0,0,0,0,0,0,0,0,0,-1.2,-2.15,-2.66,-5.963,-8.661,-15.79,-22.18,-29.78,-35.68,-45.02,-52.88,-56.75,-61.69,-65.43,-73.03,-74.21,-73.76,-76.39,-76.41,-76.48,-76.91,-78.08,-76.51,-75.1];
    phasem = [-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.5768,-4.79671,-4.79671,-4.90461,-4.6735,-4.93924,-5.46581,-5.57507,-6.23844,-6.83089,-8.67881,-10.0679,-11.8483,-12.9426,-15.1648,-16.6278,-18.0549,-19.2576,-20.4078,-21.3229,-22.3335,-25.5751,-28.0886,-29.9519,-31.5803];
    axes(handles.eplot1),semilogx(phasev,phasep,'m+',phasev,phasem,'k+'),ylabel('Magnitude (dB) & Phase (degrees)'),legend('Total Force','Calc. Phase','Drag Force','Lift Force','Measured Phase','Measured Track')
    hold off
elseif plot1menu == 9
    axes(handles.eplot1),surf(percentlamda,M1,Lh),title('Optimum Magnet Thickness'),zlabel('Maximum Levitation Height'),ylabel('Number of Magnets M'),xlabel('Magnet Thickness d as %lamda');
elseif plot1menu == 10
    axes(handles.eplot1),plot(lamda2,Lh2),xlabel('Wavelength lamda'),ylabel('Levitation Height y'),title('Maximum Levitation Height for Wavelength');
end


if plot2menu == 1
    axes(handles.eplot2),surf(y,x,Bx),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx');
elseif plot2menu == 2
    axes(handles.eplot2),surf(y,x,By),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('By');
elseif plot2menu == 3
    axes(handles.eplot2),surf(y,x,Bx),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx & By');
    hold on
    axes(handles.eplot2),surf(y,x,By),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx & By');
    hold off
elseif plot2menu == 4
    axes(handles.eplot2),plot(vp,Fxp1,vp,Fyp1,vp,Fxp2,vp,Fyp2),xlabel('Velocity (meters/sec)'),ylabel('Newtons'),title('Drag (b) Docked (r) & Levitation (g) Docked (t) Forces');
elseif plot2menu == 5
    axes(handles.eplot2),plot(vp,Fxp1,vp,Fyp1,vp,Fxp2,vp,Fyp2),xlabel('Velocity (meters/sec)'),ylabel('Newtons'),title('Drag (b) Docked (r) & Levitation (g) Docked (t) Forces');
    hold on
    dragv = [0,0.04905,0.14715,0.2943,0.34335,0.53955,0.63765,0.73575];
    dragf = [0,2.023,2.2542,2.938166667,3.487266667,4.9708,7.855983333,11.85863333];
    axes(handles.eplot2),plot(dragf,dragv,'m+')
    liftv = [2.302367,1.839967,2.316817,2.495033,4.354267,2.841833,2.345717,2.81775,3.241617,2.755133,3.386117,1.772533,1.180083,1.088567,1.0115,3.13565,4.171233,4.609333,5.009333,5.56325,5.076767,5.871517,5.78,5.553617,5.611417,6.367633,6.685533,7.15275,7.345417,7.2828];
    liftf = [0.981,0.4905,1.0791,1.22625,1.962,0.981,1.03005,1.22625,1.4715,1.22625,1.4715,0.8829,0.63765,0.24525,0.4905,1.2753,1.8639,2.20725,2.30535,2.69775,2.5506,2.943,3.5316,2.8449,2.943,3.5316,3.58065,4.2183,4.4145,4.5126];
    axes(handles.eplot2),plot(liftf,liftv,'k+'),legend('Calculated Free Drag Force','Calculated Free Levitaiton Force','Calculated Drag Force','Calculated Levitaiton Force','Measured Levitation Force','Measured Drag Force'),title('Predicted & Measured Forces')
    hold off
elseif plot2menu == 6
    axes(handles.eplot2),plot(vp,Lhp),xlabel('Velocity (meters/sec)'),ylabel('Height (meters)'),title('Levitation Height');
elseif plot2menu == 7
    axes(handles.eplot2),semilogx(vp,mag,vp,phase,vp,mFxp2,vp,mFyp2),xlabel('Velocity (meters/sec)'),ylabel('Magnitude (dB)'),title('Current Phase (g) Total Force (b) Drag Force (r) Lift Force (t)');
elseif plot2menu == 8
    axes(handles.eplot2),semilogx(vp,mag,vp,phase,vp,mFxp2,vp,mFyp2),xlabel('Velocity (meters/sec)'),ylabel('Magnitude (dB)'),title('Velocity Response');
    hold on
    phasev = [0.071557,0.143114,0.214671,0.286229,0.357786,0.429343,0.572457,0.715571,1.431143,2.862285,4.293428,5.72457,7.155713,14.31143,28.62285,42.93428,57.2457,71.55713,107.3357,143.1143,178.8928,214.6714,286.2285,357.7856,429.3428,500.8999,572.457,644.0141,715.5713,1073.357,1431.143,1788.928,2146.714];
    phasep = [0,0,0,0,0,0,0,0,0,-1.2,-2.15,-2.66,-5.963,-8.661,-15.79,-22.18,-29.78,-35.68,-45.02,-52.88,-56.75,-61.69,-65.43,-73.03,-74.21,-73.76,-76.39,-76.41,-76.48,-76.91,-78.08,-76.51,-75.1];
    phasem = [-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.5768,-4.79671,-4.79671,-4.90461,-4.6735,-4.93924,-5.46581,-5.57507,-6.23844,-6.83089,-8.67881,-10.0679,-11.8483,-12.9426,-15.1648,-16.6278,-18.0549,-19.2576,-20.4078,-21.3229,-22.3335,-25.5751,-28.0886,-29.9519,-31.5803];
    axes(handles.eplot2),semilogx(phasev,phasep,'m+',phasev,phasem,'k+'),ylabel('Magnitude (dB) & Phase (degrees)'),legend('Total Force','Calc. Phase','Drag Force','Lift Force','Measured Phase','Measured Track')
    hold off
elseif plot2menu == 9
    axes(handles.eplot2),surf(percentlamda,M1,Lh),title('Optimum Magnet Thickness'),zlabel('Maximum Levitation Height'),ylabel('Number of Magnets M'),xlabel('Magnet Thickness d as %lamda');
elseif plot2menu == 10
    axes(handles.eplot2),plot(lamda2,Lh2),xlabel('Wavelength lamda'),ylabel('Levitation Height y'),title('Maximum Levitation Height for Wavelength');
end


% Iz =
% (lamda*Bo*w/(2*pi*L))*(1/(1+(R/(omegau*L))^2))*sin(omegau*t)+(R/(omegau*L))*cos(omegau*t);

% --- Executes on button press in edefault.
function edefault_Callback(hObject, eventdata, handles)
% hObject    handle to edefault (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% track = str2num(get(handles.etrack,'string'));
global track;
%Train Defaults:
Br = 1.43;
d = 0.0254;
M = 4;
Is = 30;
lamda = 0.20;
w = 0.15;
lm = 1;
tm = 30;


if track==1
    % Track Parameters:
    deltac = 0.0125;
    dc = 0.016;
    rc = 1.36;
    Pc = 0.40;
    Nt = 53;
    Ns = 150;
    al = 0.0125;
    h = 0;
    y1 = 0.01;
    vu = 10;
    
elseif track == 2
    % Track Parameters:
    deltac = 0.0125;
    dc = 0.016;
    rc = 1.36;
    Pc = 0.11;
    Nt = 53;
    Ns = 150;
    al = 0.0125;
    h = 0;
    y1 = 0.01;
    vu = 10;
    
elseif track == 3
    % Track Parameters:
    deltac = 0.0127;
    dc = 0.3079;
    rc = 265;
    Pc = 0.3048;
    Nt = 0.127;
    Ns = 1;
    al = 0.0127;
    h = 0;
    y1 = 0.05;
    vu = 120;
end





%Send out Default Data:
set(handles.eBr,'string',num2str(Br));
set(handles.ed,'string',num2str(d));
set(handles.eM,'string',num2str(M));
set(handles.eIs,'string',num2str(Is));
set(handles.elamda,'string',num2str(lamda));
set(handles.ew,'string',num2str(w));
set(handles.elm,'string',num2str(lm));
set(handles.etm,'string',num2str(tm));
set(handles.edeltac,'string',num2str(deltac));
set(handles.edc,'string',num2str(dc));
set(handles.erc,'string',num2str(rc));
set(handles.ePc,'string',num2str(Pc));
set(handles.eNt,'string',num2str(Nt));
set(handles.eNs,'string',num2str(Ns));
set(handles.eal,'string',num2str(al));
set(handles.eh,'string',num2str(h));
set(handles.ey1,'string',num2str(y1));
set(handles.evu,'string',num2str(vu));





% --- Executes during object creation, after setting all properties.
function eIs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eIs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function eIs_Callback(hObject, eventdata, handles)
% hObject    handle to eIs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eIs as text
%        str2double(get(hObject,'String')) returns contents of eIs as a double


% --- Executes during object creation, after setting all properties.
function eplotmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eplotmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in eplotmenu1.
function eplotmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to eplotmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns eplotmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from eplotmenu1
global plot1menu
global track;
global x
global y
global Bx
global By
global Fxp1
global Fxp2
global Fyp1
global Fyp2
global vp
global Lhp
global mag
global phase
global mFxp2
global mFyp2
global lamda2
global Lh2
global percentlamda
global M1
global Lh


val = get(hObject,'Value');
switch val
case 1
    axes(handles.eplot1),surf(y,x,Bx),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx');
    plot1menu = 1;
case 2
    axes(handles.eplot1),surf(y,x,By),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('By');
    plot1menu = 2;
case 3
    axes(handles.eplot1),surf(y,x,Bx),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx & By');
    hold on
    axes(handles.eplot1),surf(y,x,By),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx & By');
    hold off
    plot1menu = 3;
case 4
    axes(handles.eplot1),plot(vp,Fxp1,vp,Fyp1,vp,Fxp2,vp,Fyp2,'LineWidth',10),xlabel('Velocity (meters/sec)'),ylabel('Newtons'),title('Drag (b) Docked (r) & Levitation (g) Docked (t) Forces');
    plot1menu = 4;
case 5
    axes(handles.eplot1),plot(vp,Fxp1,vp,Fyp1,vp,Fxp2,vp,Fyp2),xlabel('Velocity (meters/sec)'),ylabel('Newtons'),title('Drag (b) Docked (r) & Levitation (g) Docked (t) Forces');
    hold on
    dragv = [0,0.04905,0.14715,0.2943,0.34335,0.53955,0.63765,0.73575];
    dragf = [0,2.023,2.2542,2.938166667,3.487266667,4.9708,7.855983333,11.85863333];
    axes(handles.eplot1),plot(dragf,dragv,'m+')
    liftv = [2.302367,1.839967,2.316817,2.495033,4.354267,2.841833,2.345717,2.81775,3.241617,2.755133,3.386117,1.772533,1.180083,1.088567,1.0115,3.13565,4.171233,4.609333,5.009333,5.56325,5.076767,5.871517,5.78,5.553617,5.611417,6.367633,6.685533,7.15275,7.345417,7.2828];
    liftf = [0.981,0.4905,1.0791,1.22625,1.962,0.981,1.03005,1.22625,1.4715,1.22625,1.4715,0.8829,0.63765,0.24525,0.4905,1.2753,1.8639,2.20725,2.30535,2.69775,2.5506,2.943,3.5316,2.8449,2.943,3.5316,3.58065,4.2183,4.4145,4.5126];
    axes(handles.eplot1),plot(liftf,liftv,'k+'),legend('Calculated Free Drag Force','Calculated Free Levitaiton Force','Calculated Drag Force','Calculated Levitaiton Force','Measured Levitation Force','Measured Drag Force'),title('Predicted & Measured Forces')
    hold off
    plot1menu = 5;
case 6
    axes(handles.eplot1),plot(vp,Lhp),xlabel('Velocity (meters/sec)'),ylabel('Height (meters)'),title('Levitation Height');
    plot1menu = 6;
case 7
    axes(handles.eplot1),semilogx(vp,mag,vp,phase,vp,mFxp2,vp,mFyp2),xlabel('Velocity (meters/sec)'),ylabel('Magnitude (dB)'),title('Current Phase (g) Total Force (b) Drag Force (r) Lift Force (t)');
    plot1menu = 7;
case 8
    axes(handles.eplot1),semilogx(vp,mag,vp,phase,vp,mFxp2,vp,mFyp2),xlabel('Velocity (meters/sec)'),ylabel('Magnitude (dB)'),title('Velocity Response');
    hold on
    phasev = [0.071557,0.143114,0.214671,0.286229,0.357786,0.429343,0.572457,0.715571,1.431143,2.862285,4.293428,5.72457,7.155713,14.31143,28.62285,42.93428,57.2457,71.55713,107.3357,143.1143,178.8928,214.6714,286.2285,357.7856,429.3428,500.8999,572.457,644.0141,715.5713,1073.357,1431.143,1788.928,2146.714];
    phasep = [0,0,0,0,0,0,0,0,0,-1.2,-2.15,-2.66,-5.963,-8.661,-15.79,-22.18,-29.78,-35.68,-45.02,-52.88,-56.75,-61.69,-65.43,-73.03,-74.21,-73.76,-76.39,-76.41,-76.48,-76.91,-78.08,-76.51,-75.1];
    phasem = [-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.5768,-4.79671,-4.79671,-4.90461,-4.6735,-4.93924,-5.46581,-5.57507,-6.23844,-6.83089,-8.67881,-10.0679,-11.8483,-12.9426,-15.1648,-16.6278,-18.0549,-19.2576,-20.4078,-21.3229,-22.3335,-25.5751,-28.0886,-29.9519,-31.5803];
    axes(handles.eplot1),semilogx(phasev,phasep,'m+',phasev,phasem,'k+'),ylabel('Magnitude (dB) & Phase (degrees)'),legend('Total Force','Calc. Phase','Drag Force','Lift Force','Measured Phase','Measured Track')
    hold off
    plot1menu = 8;
case 9
    axes(handles.eplot1),surf(percentlamda,M1,Lh),title('Optimum Magnet Thickness'),zlabel('Maximum Levitation Height'),ylabel('Number of Magnets M'),xlabel('Magnet Thickness d as %lamda');
    plot1menu = 9;
case 10
    axes(handles.eplot1),plot(lamda2,Lh2),xlabel('Wavelength lamda'),ylabel('Levitation Height y'),title('Maximum Levitation Height for Wavelength');
    plot1menu = 10;
end



% --- Executes during object creation, after setting all properties.
function eplotmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eplotmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in eplotmenu2.
function eplotmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to eplotmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns eplotmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from eplotmenu2

global plot2menu
global track;
global x
global y
global Bx
global By
global Fxp1
global Fxp2
global Fyp1
global Fyp2
global vp
global Lhp
global mag
global phase
global mFxp2
global mFyp2
global lamda2
global Lh2
global percentlamda
global M1
global Lh


val = get(hObject,'Value');
switch val
case 1
    axes(handles.eplot2),surf(y,x,Bx),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx');
    plot2menu = 1;
case 2
    axes(handles.eplot2),surf(y,x,By),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('By');
    plot2menu = 2;
case 3
    axes(handles.eplot2),surf(y,x,Bx),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx & By');
    hold on
    axes(handles.eplot2),surf(y,x,By),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx & By');
    hold off
    plot2menu = 3;
case 4
    axes(handles.eplot2),plot(vp,Fxp1,vp,Fyp1,vp,Fxp2,vp,Fyp2,'LineWidth',10),xlabel('Velocity (meters/sec)'),ylabel('Newtons'),title('Drag (b) Docked (r) & Levitation (g) Docked (t) Forces');
    plot2menu = 4;
case 5
    axes(handles.eplot2),plot(vp,Fxp1,vp,Fyp1,vp,Fxp2,vp,Fyp2),xlabel('Velocity (meters/sec)'),ylabel('Newtons'),title('Drag (b) Docked (r) & Levitation (g) Docked (t) Forces');
    hold on
    dragv = [0,0.04905,0.14715,0.2943,0.34335,0.53955,0.63765,0.73575];
    dragf = [0,2.023,2.2542,2.938166667,3.487266667,4.9708,7.855983333,11.85863333];
    axes(handles.eplot2),plot(dragf,dragv,'m+')
    liftv = [2.302367,1.839967,2.316817,2.495033,4.354267,2.841833,2.345717,2.81775,3.241617,2.755133,3.386117,1.772533,1.180083,1.088567,1.0115,3.13565,4.171233,4.609333,5.009333,5.56325,5.076767,5.871517,5.78,5.553617,5.611417,6.367633,6.685533,7.15275,7.345417,7.2828];
    liftf = [0.981,0.4905,1.0791,1.22625,1.962,0.981,1.03005,1.22625,1.4715,1.22625,1.4715,0.8829,0.63765,0.24525,0.4905,1.2753,1.8639,2.20725,2.30535,2.69775,2.5506,2.943,3.5316,2.8449,2.943,3.5316,3.58065,4.2183,4.4145,4.5126];
    axes(handles.eplot2),plot(liftf,liftv,'k+'),legend('Calculated Free Drag Force','Calculated Free Levitaiton Force','Calculated Drag Force','Calculated Levitaiton Force','Measured Levitation Force','Measured Drag Force'),title('Predicted & Measured Forces')
    hold off
    plot2menu = 5;
case 6
    axes(handles.eplot2),plot(vp,Lhp),xlabel('Velocity (meters/sec)'),ylabel('Height (meters)'),title('Levitation Height');
    plot2menu = 6;
case 7
    axes(handles.eplot2),semilogx(vp,mag,vp,phase,vp,mFxp2,vp,mFyp2),xlabel('Velocity (meters/sec)'),ylabel('Magnitude (dB)'),title('Current Phase (g) Total Force (b) Drag Force (r) Lift Force (t)');
    plot2menu = 7;
case 8
    axes(handles.eplot2),semilogx(vp,mag,vp,phase,vp,mFxp2,vp,mFyp2),xlabel('Velocity (meters/sec)'),ylabel('Magnitude (dB)'),title('Velocity Response');
    hold on
    phasev = [0.071557,0.143114,0.214671,0.286229,0.357786,0.429343,0.572457,0.715571,1.431143,2.862285,4.293428,5.72457,7.155713,14.31143,28.62285,42.93428,57.2457,71.55713,107.3357,143.1143,178.8928,214.6714,286.2285,357.7856,429.3428,500.8999,572.457,644.0141,715.5713,1073.357,1431.143,1788.928,2146.714];
    phasep = [0,0,0,0,0,0,0,0,0,-1.2,-2.15,-2.66,-5.963,-8.661,-15.79,-22.18,-29.78,-35.68,-45.02,-52.88,-56.75,-61.69,-65.43,-73.03,-74.21,-73.76,-76.39,-76.41,-76.48,-76.91,-78.08,-76.51,-75.1];
    phasem = [-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.5768,-4.79671,-4.79671,-4.90461,-4.6735,-4.93924,-5.46581,-5.57507,-6.23844,-6.83089,-8.67881,-10.0679,-11.8483,-12.9426,-15.1648,-16.6278,-18.0549,-19.2576,-20.4078,-21.3229,-22.3335,-25.5751,-28.0886,-29.9519,-31.5803];
    axes(handles.eplot2),semilogx(phasev,phasep,'m+',phasev,phasem,'k+'),ylabel('Magnitude (dB) & Phase (degrees)'),legend('Total Force','Calc. Phase','Drag Force','Lift Force','Measured Phase','Measured Track')
    hold off
    plot2menu = 8;
case 9
    axes(handles.eplot2),surf(percentlamda,M1,Lh),title('Optimum Magnet Thickness'),zlabel('Maximum Levitation Height'),ylabel('Number of Magnets M'),xlabel('Magnet Thickness d as %lamda');
    plot1menu = 9;
case 10
    axes(handles.eplot2),plot(lamda2,Lh2),xlabel('Wavelength lamda'),ylabel('Levitation Height y'),title('Maximum Levitation Height for Wavelength');
    plot1menu = 10;
end


% --- Executes during object creation, after setting all properties.
function efigure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to efigure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in efigure1.
function efigure1_Callback(hObject, eventdata, handles)
% hObject    handle to efigure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns efigure1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from efigure1


global track;
global x
global y
global Bx
global By
global Fxp1
global Fxp2
global Fyp1
global Fyp2
global vp
global Lhp
global mag
global phase
global mFxp2
global mFyp2
global lamda2
global Lh2
global percentlamda
global M1
global Lh

val = get(hObject,'Value');
switch val
case 1
    figure,surf(y,x,Bx),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx');
case 2
    figure,surf(y,x,By),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('By');
case 3
    figure,surf(y,x,Bx),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx & By');
    hold on
    surf(y,x,By),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx & By');
    hold off
case 4
    %figure,plot(vp,Fxp1,vp,Fyp1,vp,Fxp2,vp,Fyp2,'LineWidth',3),xlabel('Velocity (meters/sec)'),ylabel('Newtons'),title('Drag (b) Docked (r) & Levitation (g) Docked (t) Forces');
    figure,plot(vp,Fxp2,vp,Fyp2,'LineWidth',3),xlabel('Velocity (meters/sec)'),ylabel('Newtons'),title('Drag (Blue) & Levitation (Orange) Forces');
case 5
    figure,plot(vp,Fxp1,vp,Fyp1,vp,Fxp2,vp,Fyp2),xlabel('Velocity (meters/sec)'),ylabel('Newtons'),title('Drag (b) Docked (r) & Levitation (g) Docked (t) Forces');
    hold on
    dragv = [0,0.04905,0.14715,0.2943,0.34335,0.53955,0.63765,0.73575];
    dragf = [0,2.023,2.2542,2.938166667,3.487266667,4.9708,7.855983333,11.85863333];
    plot(dragf,dragv,'m+')
    liftv = [2.302367,1.839967,2.316817,2.495033,4.354267,2.841833,2.345717,2.81775,3.241617,2.755133,3.386117,1.772533,1.180083,1.088567,1.0115,3.13565,4.171233,4.609333,5.009333,5.56325,5.076767,5.871517,5.78,5.553617,5.611417,6.367633,6.685533,7.15275,7.345417,7.2828];
    liftf = [0.981,0.4905,1.0791,1.22625,1.962,0.981,1.03005,1.22625,1.4715,1.22625,1.4715,0.8829,0.63765,0.24525,0.4905,1.2753,1.8639,2.20725,2.30535,2.69775,2.5506,2.943,3.5316,2.8449,2.943,3.5316,3.58065,4.2183,4.4145,4.5126];
    plot(liftf,liftv,'k+'),legend('Calculated Free Drag Force','Calculated Free Levitaiton Force','Calculated Drag Force','Calculated Levitaiton Force','Measured Levitation Force','Measured Drag Force'),title('Predicted & Measured Forces')
    hold off
case 6
    figure,plot(vp,Lhp,'LineWidth',3),xlabel('Velocity (meters/sec)'),ylabel('Height (meters)'),title('Levitation Height');
case 7
    figure,semilogx(vp,mag,vp,phase,vp,mFxp2,vp,mFyp2),xlabel('Velocity (meters/sec)'),ylabel('Magnitude (dB)'),title('Velocity Response');
case 8
    figure,semilogx(vp,mag,vp,phase,vp,mFxp2,vp,mFyp2),xlabel('Velocity (meters/sec)'),ylabel('Magnitude (dB)'),title('Velocity Response');
    hold on
    phasev = [0.071557,0.143114,0.214671,0.286229,0.357786,0.429343,0.572457,0.715571,1.431143,2.862285,4.293428,5.72457,7.155713,14.31143,28.62285,42.93428,57.2457,71.55713,107.3357,143.1143,178.8928,214.6714,286.2285,357.7856,429.3428,500.8999,572.457,644.0141,715.5713,1073.357,1431.143,1788.928,2146.714];
    phasep = [0,0,0,0,0,0,0,0,0,-1.2,-2.15,-2.66,-5.963,-8.661,-15.79,-22.18,-29.78,-35.68,-45.02,-52.88,-56.75,-61.69,-65.43,-73.03,-74.21,-73.76,-76.39,-76.41,-76.48,-76.91,-78.08,-76.51,-75.1];
    phasem = [-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.6166,-4.5768,-4.79671,-4.79671,-4.90461,-4.6735,-4.93924,-5.46581,-5.57507,-6.23844,-6.83089,-8.67881,-10.0679,-11.8483,-12.9426,-15.1648,-16.6278,-18.0549,-19.2576,-20.4078,-21.3229,-22.3335,-25.5751,-28.0886,-29.9519,-31.5803];
    semilogx(phasev,phasep,'m+',phasev,phasem,'k+'),ylabel('Magnitude (dB) & Phase (degrees)'),legend('Total Force','Calc. Phase','Drag Force','Lift Force','Measured Phase','Measured Track')
    hold off
case 9
    figure,surf(percentlamda,M1,Lh),title('Optimum Magnet Thickness'),zlabel('Maximum Levitation Height'),ylabel('Number of Magnets M'),xlabel('Magnet Thickness d as %lamda');
case 10
    figure,plot(lamda2,Lh2),xlabel('Wavelength lamda'),ylabel('Levitation Height y'),title('Maximum Levitation Height for Wavelength');
case 11
    figure,surf(y,x,Bx),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx');
    figure,surf(y,x,By),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('By');
    figure,surf(y,x,Bx),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx & By');
    surf(y,x,By),xlabel('y'),ylabel('x'),zlabel('Tesla'),title('Bx & By');
    hold off
    figure,plot(vp,Fxp1,vp,Fyp1,vp,Fxp2,vp,Fyp2),xlabel('Velocity (meters/sec)'),ylabel('Newtons'),title('Drag (b) Docked (r) & Levitation (g) Docked (t) Forces');
    figure,plot(vp,Lhp),xlabel('Velocity (meters/sec)'),ylabel('Height (meters)'),title('Levitation Height');
    figure,semilogx(vp,mag,vp,phase,vp,mFxp2,vp,mFyp2),xlabel('Velocity (meters/sec)'),ylabel('Magnitude (dB)'),title('Current Phase (g) Total Force (b) Drag Force (r) Lift Force (t)');
    figure,surf(percentlamda,M1,Lh),title('Optimum Magnet Thickness'),zlabel('Maximum Levitation Height'),ylabel('Number of Magnets M'),xlabel('Magnet Thickness d as %lamda');
    figure,plot(lamda2,Lh2),xlabel('Wavelength lamda'),ylabel('Levitation Height y'),title('Maximum Levitation Height for Wavelength');
end