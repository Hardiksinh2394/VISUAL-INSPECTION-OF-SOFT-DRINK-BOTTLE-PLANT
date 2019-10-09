function varargout = Soft_Drink_Bottling_Plant(varargin)
% Soft_Drink_Bottling_Plant MATLAB code for Soft_Drink_Bottling_Plant.fig
%      Soft_Drink_Bottling_Plant, by itself, creates a new Soft_Drink_Bottling_Plant or raises the existing
%      singleton*.
%
%      H = Soft_Drink_Bottling_Plant returns the handle to a new Soft_Drink_Bottling_Plant or the handle to
%      the existing singleton*.
%
%      Soft_Drink_Bottling_Plant('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Soft_Drink_Bottling_Plant.M with the given input arguments.
%
%      Soft_Drink_Bottling_Plant('Property','Value',...) creates a new Soft_Drink_Bottling_Plant or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Soft_Drink_Bottling_Plant_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Soft_Drink_Bottling_Plant_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Soft_Drink_Bottling_Plant

% Last Modified by GUIDE v2.5 12-Jan-2019 15:12:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Soft_Drink_Bottling_Plant_OpeningFcn, ...
                   'gui_OutputFcn',  @Soft_Drink_Bottling_Plant_OutputFcn, ...
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


% --- Executes just before Soft_Drink_Bottling_Plant is made visible.
function Soft_Drink_Bottling_Plant_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Soft_Drink_Bottling_Plant (see VARARGIN)

% Choose default command line output for Soft_Drink_Bottling_Plant
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Soft_Drink_Bottling_Plant wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Soft_Drink_Bottling_Plant_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%  fileName = uigetfile('*.jpg');
%        myImage = imread(fileName);
%        imshow(myImage,'Parent',handles.axes1);
       
       


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fileName = uigetfile('*.jpg');
myImage = imread(fileName);
imshow(myImage,'Parent',handles.axes1);

        % if the Bottle is missing
        bottleMiss = Bottle_Missing(myImage);

        if bottleMiss
        % adding 'bottle missing' to the output
        output_fault_test = sprintf('oppsss...! Bottle is Missing ');
        uiwait(helpdlg(output_fault_test,'FAULT DETECTED'));
        
        else
       % output = myImage;
        
        % if bottle cap is missing
        bottleCapMiss = Bottle_Cap_Missing(myImage);
        
        if bottleCapMiss
            % adding 'bottle cap missing' to the output
             output_fault_test = sprintf('oppsss....! Bottle cap missing');
             uiwait(helpdlg(output_fault_test,'FAULT DETECTED'));
        end
        
        % if bottle is underfilled
        bottleUnderfilled = Bottle_Underfilled(myImage)
       
        
        if bottleUnderfilled
            % adding 'bottle underfilled' to the output
            output_fault_test = sprintf('oppsss....! Bottle Underfilled');
            uiwait(helpdlg(output_fault_test,'FAULT DETECTED'));
       
        end
        
        % if label is missing
         labelMiss = Label_Missing(myImage);
        
        if labelMiss
            % adding 'label missing' to the output
           output_fault_test = sprintf('oppsss....! Label is missing');
           uiwait(helpdlg(output_fault_test,'FAULT DETECTED'));
   
        else
            
            % if label is not printed
            labelNotPrint = Label_Not_Printed(myImage);
            
            if labelNotPrint
                % adding 'label not printed' to the output
                output_fault_test = sprintf('oppsss....! Label is not printed ');
                uiwait(helpdlg(output_fault_test,'FAULT DETECTED'));
            else        
                
                % if label is not straight
                labelnotStraight = Label_Not_Straight(myImage);
                
                 
                 
                if labelnotStraight
                  % adding 'label not straight' to the output
                   output_fault_test = sprintf('oppsss....! Label is not straight');
                   uiwait(helpdlg(output_fault_test,'FAULT DETECTED'));
                     
                end
                
                % if bottle is deformed
                 bottledeformed = Bottle_Deformed(myImage); 
               

            end
        end
      
            % if bottle is overfilled
            bottleOverfilled = Bottle_Overfilled(myImage);

        
        % bottle is not deformed if any of these faults exists
        if bottleUnderfilled || labelMiss || labelNotPrint || labelnotStraight
            bottledeformed = 0;
        end

             
             if bottleOverfilled  
             %adding 'bottle overfilled' to the output
             output_fault_test = sprintf('oppsss....! Bottle is overfilled');
             uiwait(helpdlg(output_fault_test,'FAULT DETECTED'));
             bottledeformed = 0;  
             end
             
             if bottleOverfilled && labelnotStraight 
                bottledeformed = 1;
              
              if bottledeformed 
                  %adding 'bottle deformed' to the output
                output_fault_test = sprintf('oppsss....! Bottle is deformed');
                uiwait(helpdlg(output_fault_test,'FAULT DETECTED'));
                %bottleOverfilled = 0;
              end
             
             end
             
            
             
        end
            
% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
