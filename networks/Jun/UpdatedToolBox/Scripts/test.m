addpath('/Volumes/Transcend/MICHIGAN 2016 SUMMER/LAB/NodalLevelAnalysis/Scripts');

condition_3_anapath = '/Volumes/Transcend/MICHIGAN 2016 SUMMER/LAB/YoungOldMatrixData/estim_WM_match_3_Z.mat';
condition_base = '/Volumes/Transcend/MICHIGAN 2016 SUMMER/LAB/YoungOldMatrixData/estim_BL_Z.mat';
toolBoxPath = '/Volumes/Transcend/MICHIGAN 2016 SUMMER/LAB/ToolBox';

result_cond3 = nodalAnalysis(condition_3_anapath, toolBoxPath, .05);
result_base = nodalAnalysis(condition_base,toolBoxPath, .05);

p_vals_cond3 = permTesting(result_cond3);
p_vals_base = permTesting(result_base);


%Extract ROIs that has p-values less than .05
base_rois = []
cond3_rois = []

for idx=1:160   
    if p_vals_cond3(idx) <= .05
        cond3_rois = [cond3_rois idx]
    end
    if p_vals_base(idx) <= .05
        base_rois = [base_rois idx]
    end
end

    

%Maybe do the bar graphs


% x = 1:1:160;
% y = p_vals;
% fig = figure;
% bar(x,y);



