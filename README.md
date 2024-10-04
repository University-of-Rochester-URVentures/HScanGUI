Steps to utilize HScanGUI:

1. Retrieve IQ data 
2. Reconstruct RF data from IQ using "IQ2RF_script.m" (do not modify the 'VsiBmodeIQ/VsiBmodeReconstructRF/VsiParseXml/VsiReorderChannels' functions)
3. Sample file name = 'eh_P_8_BTKI_scan_6_US.iq'
4. Start HScanGUI
5. Load "eh_P_8_BTKI_scan_6_US.m" file
6. Segment region of interest (ROI)
7. GUI will generate the H-scan map when the last ROI point selected joins the first ROI point
8. Retrieve H-scan map inside newly created folder (same name as the sample RF file)
