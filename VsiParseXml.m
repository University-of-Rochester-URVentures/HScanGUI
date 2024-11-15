function [ReturnParam] = ParseXml_allModes(filename, ModeName)

try
   xDoc = xmlread(filename);
catch
   error('Failed to read XML file %s.',filename);
end

AllParameters = xDoc.getElementsByTagName('parameter');

switch ModeName
    case '.bmode'
        RxFreqModeName = 'B-Mode';
 for k = 0:AllParameters.getLength-1
    node = AllParameters.item(k);
    switch char(node.getAttribute('name'));        
    case 'B-Mode/Samples';
        javaNsamples = node.getAttribute('value');
        BmodeNumSamples = str2num(char(javaNsamples));       
    case 'B-Mode/Lines';
        javaNlines = node.getAttribute('value');
        BmodeNumLines = str2num(char(javaNlines));        
    case 'B-Mode/Depth-Offset';
        javaDepthOffset = node.getAttribute('value');
        BmodeDepthOffset = str2num(char(javaDepthOffset));        
    case 'B-Mode/Depth';
        javaDepth = node.getAttribute('value');
        BmodeDepth = str2num(char(javaDepth));       
    case 'B-Mode/Width';
        javaWidth = node.getAttribute('value');
        BmodeWidth = str2num(char(javaWidth));       
    case 'B-Mode/RX-Frequency'
        javaRxFrequency = node.getAttribute('value');
        BmodeRxFrequency = str2num(char(javaRxFrequency));       
    case 'B-Mode/TX-Frequency'
        javaTxFrequency = node.getAttribute('value');
        BmodeTxFrequency = str2num(char(javaTxFrequency));       
    case 'Power-Mode/RX-Frequency'
        javaRxFrequency = node.getAttribute('value');
        BmodeRxFrequency = str2num(char(javaRxFrequency));        
    case 'B-Mode/Quad-2X';
        javaQuad2x = node.getAttribute('value');
        BmodeQuad2x = char(javaQuad2x);       
    case 'B-Mode/Focal-Zones-Count';
        javaNumFocalZones = node.getAttribute('value');
        BmodeNumFocalZones = str2num(char(javaNumFocalZones));  
    end
 end
ReturnParam = struct('BmodeNumSamples', BmodeNumSamples, 'BmodeNumLines', BmodeNumLines, 'BmodeDepthOffset', BmodeDepthOffset,...
    'BmodeDepth', BmodeDepth,'BmodeWidth', BmodeWidth, 'BmodeRxFrequency', BmodeRxFrequency, 'BmodeTxFrequency', BmodeTxFrequency,...
    'BmodeQuad2x', BmodeQuad2x, 'BmodeNumFocalZones', BmodeNumFocalZones);

    case '.color'
            RxFreqModeName = 'Color-Mode';  Quad2x = 'null'; FocalZones = 1;

for k = 0:AllParameters.getLength-1
    node = AllParameters.item(k); 
    switch char(node.getAttribute('name'));       
    case 'Color-Mode/Samples';
        javaNsamples = node.getAttribute('value');
        ColorNumSamples = str2num(char(javaNsamples));
    case 'Color-Mode/Lines';
        javaNlines = node.getAttribute('value');
        ColorNumLines = str2num(char(javaNlines));     
    case 'Color-Mode/Depth-Offset';
        javaDepthOffset = node.getAttribute('value');
        ColorDepthOffset = str2num(char(javaDepthOffset));       
    case 'Color-Mode/TX-Frequency'
        javaTxFrequency = node.getAttribute('value');
        ColorTxFrequency = str2num(char(javaTxFrequency));        
    case 'Color-Mode/RX-Frequency'
        javaRxFrequency = node.getAttribute('value');
        ColorRxFrequency = str2num(char(javaRxFrequency));        
    case 'Color-Mode/Ensemble-n';
        javaEnsemble_n = node.getAttribute('value');
        ColorNumEnsemble = str2num(char(javaEnsemble_n));      
    case 'Color-Mode/Ensemble-Extra';
        javaEnsembleExtra = node.getAttribute('value');
        ColorEnsembleExtra = str2num(char(javaEnsembleExtra));        
    case 'Color-Mode/Lines-Extra-Blank';
        javaLinesExtra = node.getAttribute('value');
        ColorLinesExtra = str2num(char(javaLinesExtra));   
    case 'Color-Mode/Steering-Angle';
        javaSteeringAngle = node.getAttribute('value');
        ColorSteeringAngle = str2num(char(javaSteeringAngle));   
    case 'B-Mode/Samples';
        javaNsamples = node.getAttribute('value');
        BmodeNumSamples = str2num(char(javaNsamples));       
    case 'B-Mode/Lines';
        javaNlines = node.getAttribute('value');
        BmodeNumLines = str2num(char(javaNlines));        
    case 'B-Mode/Depth-Offset';
        javaDepthOffset = node.getAttribute('value');
        BmodeDepthOffset = str2num(char(javaDepthOffset));        
    case 'B-Mode/Depth';
        javaDepth = node.getAttribute('value');
        BmodeDepth = str2num(char(javaDepth));       
    case 'B-Mode/Width';
        javaWidth = node.getAttribute('value');
        BmodeWidth = str2num(char(javaWidth));       
    end
    
end
ReturnParam = struct('ColorNumSamples', ColorNumSamples, 'ColorNumLines', ColorNumLines, 'ColorDepthOffset', ColorDepthOffset, ...
    'ColorRxFrequency', ColorRxFrequency, 'ColorNumEnsemble', ColorNumEnsemble, 'ColorTxFrequency', ColorTxFrequency, ...
    'ColorEnsembleExtra', ColorEnsembleExtra, 'ColorLinesExtra',ColorLinesExtra, 'ColorSteeringAngle',ColorSteeringAngle,...
    'BmodeNumSamples', BmodeNumSamples, 'BmodeNumLines', BmodeNumLines,'BmodeDepthOffset', BmodeDepthOffset,...
    'BmodeDepth', BmodeDepth,'BmodeWidth', BmodeWidth);

 case '.pw'
            RxFreqModeName = 'Pw-Mode';  Quad2x = 'null'; FocalZones = 1; Nlines=1;

for k = 0:AllParameters.getLength-1
    node = AllParameters.item(k); 
    switch char(node.getAttribute('name'));       
    
    case {'Pw-Mode/Samples', 'Pw-Tissue-Mode/Samples'}
        javaNsamples = node.getAttribute('value');
        PwNsamples = str2num(char(javaNsamples));
    
    case {'Pw-Mode/TX-Frequency', 'Pw-Tissue-Mode/TX-Frequency'}
        javaTxFrequency = node.getAttribute('value');
        PwTxFrequency = str2num(char(javaTxFrequency));        
    
    case {'Pw-Mode/RX-Frequency', 'Pw-Tissue-Mode/RX-Frequency'}
        javaRxFrequency = node.getAttribute('value');
        PwRxFrequency = str2num(char(javaRxFrequency));        
    
    case {'Pw-Mode/Steering-Angle', 'Pw-Tissue-Mode/Steering-Angle'}
        javaSteeringAngle = node.getAttribute('value');
        PwSteeringAngle = str2num(char(javaSteeringAngle));   
    
    case {'Pw-Mode/TX-PRF', 'Pw-Tissue-Mode/TX-PRF'}
        javaTxPrf = node.getAttribute('value');
        PwTxPrf = str2num(char(javaTxPrf));   
    
    case {'Pw-Mode/Spectral-Size', 'Pw-Tissue-Mode/Spectral-Size'}
        javaSpectralSize = node.getAttribute('value');
        PwSpectralSize = str2num(char(javaSpectralSize));   
    
    case {'Pw-Mode/Spectral-Spacing', 'Pw-Tissue-Mode/Spectral-Spacing'}
        javaSpectralSpacing = node.getAttribute('value');
        PwSpectralSpacing = str2num(char(javaSpectralSpacing));   
    
    case {'Pw-Mode/Display-Gain', 'Pw-Tissue-Mode/Display-Gain'}
        javaDisplayGain = node.getAttribute('value');
        PwDisplayGain = str2num(char(javaDisplayGain));   
    
    case {'Pw-Mode/Display-Range', 'Pw-Tissue-Mode/Display-Range'}
        javaDisplayRange = node.getAttribute('value');
        PwDisplayRange = str2num(char(javaDisplayRange));   
   
    case {'Pw-Mode/Y-Offset', 'Pw-Tissue-Mode/Y-Offset'}
        javaYOffset = node.getAttribute('value');
        PwYOffset = str2num(char(javaYOffset)); 
  
    case {'Pw-Mode/V-Offset', 'Pw-Tissue-Mode/V-Offset'}
        javaVOffset = node.getAttribute('value');
        PwVOffset = str2num(char(javaVOffset));   
    end
        
end

ReturnParam = struct('PwNsamples', PwNsamples, 'PwRxFrequency', PwRxFrequency, ...
    'PwTxPrf',PwTxPrf, 'PwSpectralSize',PwSpectralSize,...
    'PwSpectralSpacing',PwSpectralSpacing,'PwDisplayGain',PwDisplayGain,'PwDisplayRange'...
    ,PwDisplayRange,'PwYOffset',PwYOffset,'PwVOffset',PwVOffset);

case '.pamode'

for k = 0:AllParameters.getLength-1
    node = AllParameters.item(k); 
    switch char(node.getAttribute('name'));       
    case 'Pa-Mode/Samples';
        javaNsamples = node.getAttribute('value');
        PaNumSamples = str2num(char(javaNsamples));
    case 'Pa-Mode/Lines';
        javaNlines = node.getAttribute('value');
        PaNumLines = str2num(char(javaNlines));     
    case 'Pa-Mode/Depth-Offset';
        javaDepthOffset = node.getAttribute('value');
        PaDepthOffset = str2num(char(javaDepthOffset));
    case 'Pa-Mode/Depth';
        javaDepth = node.getAttribute('value');
        PaDepth = str2num(char(javaDepth));       
    case 'Pa-Mode/Width';
        javaWidth = node.getAttribute('value');
        PaWidth = str2num(char(javaWidth));          
    case 'B-Mode/Samples';
        javaNsamples = node.getAttribute('value');
        BmodeNumSamples = str2num(char(javaNsamples));       
    case 'B-Mode/Lines';
        javaNlines = node.getAttribute('value');
        BmodeNumLines = str2num(char(javaNlines));        
    case 'B-Mode/Depth-Offset';
        javaDepthOffset = node.getAttribute('value');
        BmodeDepthOffset = str2num(char(javaDepthOffset));        
    case 'B-Mode/Depth';
        javaDepth = node.getAttribute('value');
        BmodeDepth = str2num(char(javaDepth));       
    case 'B-Mode/Width';
        javaWidth = node.getAttribute('value');
        BmodeWidth = str2num(char(javaWidth));
    case 'B-Mode/RX-Frequency'
        javaRxFrequency = node.getAttribute('value');
        BmodeRxFrequency = str2num(char(javaRxFrequency)); 
    end
    
end
ReturnParam = struct('PaNumSamples', PaNumSamples, 'PaNumLines', PaNumLines, 'PaDepthOffset', PaDepthOffset, ...
    'PaDepth', PaDepth, 'PaWidth', PaWidth, 'BmodeNumSamples', BmodeNumSamples, 'BmodeNumLines', BmodeNumLines, ...
    'BmodeDepthOffset', BmodeDepthOffset, 'BmodeDepth', BmodeDepth,'BmodeWidth', BmodeWidth, 'BmodeRxFrequency', BmodeRxFrequency);

end




