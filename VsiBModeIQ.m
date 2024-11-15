function [Idata,Qdata,param] = VsiBModeIQ(fnameBase, ModeName, iframe)

% Set up file names
fname = [fnameBase '.bmode'];
fnameXml = [fnameBase '.xml'];

% Parse the XML parameter file - DO NOT CHANGE
param = VsiParseXml(fnameXml,ModeName);
BmodeNumFocalZones = param.BmodeNumFocalZones;
BmodeNumSamples = param.BmodeNumSamples; 
BmodeNumLines = param.BmodeNumLines; 

% This is to strip the header data in the files - DO NOT CHANGE
size = 2; % bytes
file_header = 40; % bytes
line_header = 4; % bytes
frame_header = 56; % bytes  
Nlines= BmodeNumFocalZones*BmodeNumLines;

fid = fopen(fname,'r');
% Initialize data
Idata = zeros(BmodeNumSamples, Nlines);
Qdata = zeros(BmodeNumSamples, Nlines);
header = file_header + frame_header*iframe + (size*BmodeNumSamples*Nlines*2 + Nlines*line_header)*(iframe-1);
for i=1:Nlines
    fseek(fid, header + (size*BmodeNumSamples*2 + line_header)*(i-1),-1);
    fseek(fid, line_header, 'cof');
    [Qdata(:,i),count]=fread(fid, BmodeNumSamples, 'int16', size);
    fseek(fid, header + (size*BmodeNumSamples*2 + line_header)*(i-1) + size,-1);
    fseek(fid, line_header, 'cof');
    [Idata(:,i),count]=fread(fid, BmodeNumSamples, 'int16', size);
end
fclose(fid);

