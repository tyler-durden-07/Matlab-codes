function varargout = Temperature(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Temperature_OpeningFcn, ...
                   'gui_OutputFcn',  @Temperature_OutputFcn, ...
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

function Temperature_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = Temperature_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;
clear all;
global a;
a = arduino;

function start_Callback(hObject, eventdata, handles)

x = 0;
go = true;
global a;
while go
                  
value = readVoltage(a,'A1');
temp = (value*100);
disp(temp);
x = [x temp];
plot(handles.axes1,x);
grid on;
xlabel('Time(seconds)')
ylabel('Temperature(°C)');
title('Real-Time Temperature Graph');
drawnow
set(handles.edit1,'String',num2str(temp));
pause(1);
end

function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
