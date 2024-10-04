function [US, LatD, AxD, PARAM] = VSIBmodeReconstructRF(fnameBase, iframe)
    %%%%% Opening header file and extract relevant parameters and IQ data %%%%%

[Idata, Qdata, param] = VsiBModeIQ(fnameBase, '.bmode', iframe);

BmodeNumSamples = param.BmodeNumSamples;
BmodeNumFocalZones = param.BmodeNumFocalZones;
BmodeNumLines = param.BmodeNumLines; 
BmodeDepthOffset = param.BmodeDepthOffset; 
BmodeDepth = param.BmodeDepth; 
BmodeWidth = param.BmodeWidth; 
BmodeQuad2x = param.BmodeQuad2x;
BmodeRxFrequency = param.BmodeRxFrequency; %Hz
BmodeTxFrequency = param.BmodeTxFrequency; %Hz

% Setup the Rx frequency
fs= BmodeRxFrequency;
f_rf = fs; % reconstruct to the original Rx freq in the param file
if strcmp(BmodeQuad2x,'true') 
    fs = fs*2; % actual Rx freq is double because of Quad 2x
    IntFac = 8;
else
    IntFac = 16;
end
fs_int = fs*IntFac;

%%%%%%%%%%%%%%%%%%%% Reconstruct RF data from IQ data %%%%%%%%%%%%%%%%%%%%%

t = [0:1/fs_int:((BmodeNumSamples*IntFac)-1)/fs_int];
CompExp = exp(sqrt(-1)*(2*pi*f_rf*t'));

for i=1:BmodeNumLines
    % Interpolate IQ data
    IdataInt = interp(Idata(:,i), IntFac);
    QdataInt = interp(Qdata(:,i), IntFac);

    % Reconstruct RF data
    RF(:,i) = real(complex(IdataInt, QdataInt).*CompExp);
end

% Not sure why the data is saved as negative of real data
if strcmp(BmodeQuad2x,'true')
    RF = -RF;  
end
RfData =  RF;
US = RfData;

% Distance calculations
AxD = linspace(BmodeDepthOffset, BmodeDepth, length(t)); 
LatD = linspace(0, BmodeWidth, BmodeNumLines);

PARAM.Fs = fs_int;
PARAM.F0 = BmodeRxFrequency;
PARAM.start_depth_mm = BmodeDepthOffset;
PARAM.end_depth_mm = BmodeDepth;
% PARAM.speedofsound = ct;
PARAM.BmodeWidth_mm = param.BmodeWidth;
end

