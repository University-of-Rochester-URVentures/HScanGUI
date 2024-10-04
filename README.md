Steps to utilize HScanGUI:

1. Retrieve IQ data and rconstruct RF data from IQ using "IQ2RF_script.m" (do not modify the 'VsiBmodeIQ/VsiBmodeReconstructRF/VsiParseXml/VsiReorderChannels' functions)
2. Output of the reconstructed RF data:'eh_P_8_BTKI_scan_6_US.m'
3. Start HScanGUI
4. Load "eh_P_8_BTKI_scan_6_US.m" file
5. Segment region of interest (ROI)
6. GUI will generate the H-scan map when the last ROI point selected joins the first ROI point
7. Retrieve H-scan map inside newly created folder (same name as the sample RF file)
