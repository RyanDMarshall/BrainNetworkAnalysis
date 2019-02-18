anafile = '/Volumes/Transcend/MICHIGAN 2016 SUMMER/LAB/YoungOldMatrixData/estim_BL_Z.mat';
ToolBoxPath = '/Volumes/Transcend/MICHIGAN 2016 SUMMER/LAB/ToolBox';
addpath(ToolBoxPath);
result = nodalAnalysis(anafile,ToolBoxPath, .05);
