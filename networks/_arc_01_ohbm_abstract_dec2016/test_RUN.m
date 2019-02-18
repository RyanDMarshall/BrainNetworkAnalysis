%% Testing Individual-level modular decomposition %%
RestingState = '/home/data/parl-lab/experiments/crunch/fmri/analysis/spm12/times123/resting_state/YA_OA_times123_264_RS_rawdata.mat'
% WorkingMemory = '/Volumes/Transcend/MICHIGAN 2016 SUMMER/LAB/newData/YA_OA_times12_WM_evt_nonans_rawdata.mat'
% ToolBoxPath = '/Volumes/Transcend/MICHIGAN 2016 SUMMER/LAB/ToolBox';
% NewToolBoxPath = '/Volumes/Transcend/MICHIGAN 2016 SUMMER/LAB/ToolBox/2016_01_16_BCT';
% addpath(ToolBoxPath);

%Add paths to all dependencies. Path to a toolBox%
% addpath(ToolBoxPath);
% addpath([ToolBoxPath '/BCT']);
%Extract matrix and ROI names from anafile%
RS = load(RestingState)
% WM = load(WorkingMemory)

RS_OA1 = RS.OA1;
% RS_OA2 = RS.OA2;
RS_YA1 = RS.YA1;
% RS_YA2 = RS.YA2;
RS_ROI = RS.rois;
% WM_OA1 = WM.OA1;
% WM_OA2 = WM.OA2;
% WM_YA1 = WM.YA1;
% WM_YA2 = WM.YA2;
% WM_ROI = WM.rois;

threshValue = 0.06;

result = nodalAnalysis(RS_YA1, RS_OA1, RS_ROI, threshValue)
