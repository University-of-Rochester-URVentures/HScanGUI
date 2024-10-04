clear all
clc
close all

% Open US data
US_fname = char('eh_P_8_BTKI_scan_6_US.iq');
[US, LatD, AxD, param] = VSIBmodeReconstructRF(US_fname, 1);
RFdata = US;

% Save RF data in the format compatible with GUI
name_save = char('eh_P_8_BTKI_scan_6_US');
save( [name_save '.mat'] ,'RFdata', 'param');

