%% Testing Individual-level modular decomposition %%
anafile_cond4 = '/Volumes/Transcend/MICHIGAN 2016 SUMMER/LAB/YoungOldMatrixData/estim_WM_match_4_Z.mat';
anafile_cond3 = '/Volumes/Transcend/MICHIGAN 2016 SUMMER/LAB/YoungOldMatrixData/estim_WM_match_3_Z.mat';
anafile_base = '/Volumes/Transcend/MICHIGAN 2016 SUMMER/LAB/YoungOldMatrixData/estim_BL_Z.mat';
ToolBoxPath = '/Volumes/Transcend/MICHIGAN 2016 SUMMER/LAB/ToolBox';
NewToolBoxPath = '/Volumes/Transcend/MICHIGAN 2016 SUMMER/LAB/ToolBox/2016_01_16_BCT';
addpath(ToolBoxPath);

%Add paths to all dependencies. Path to a toolBox%
addpath(ToolBoxPath);
addpath([ToolBoxPath '/BCT']);
%Extract matrix and ROI names from anafile%
[A ROIs] = BASCO_get_matrix_func(anafile_base);
[A_3 ROIs_3] = BASCO_get_matrix_func(anafile_cond3);
[A_4 ROIs_4] = BASCO_get_matrix_func(anafile_cond4);

%Extract Bad ROIs
numSubjects = size(A,3);
bad_ROIs = construct_bad_rois(A, numSubjects);
bad_ROIs_3 = construct_bad_rois(A_3, numSubjects);
bad_ROIs_4 = construct_bad_rois(A_4, numSubjects);

%Clean up the matrices
cleanedUp_BASE = clean_z_matrix(A, bad_ROIs);
cleanedUP_3 = clean_z_matrix(A_3, bad_ROIs_3);
cleanedUP_4 = clean_z_matrix(A_4, bad_ROIs_4);

%Separate YA and OA
AA_BASE = cleanedUp_BASE(:,:,[1:20]);
AA_COND3 = cleanedUP_3(:,:,[1:20]);
AA_COND4 = cleanedUP_4(:,:,[1:20]);

OA_BASE = cleanedUp_BASE(:,:,[21:39]);
OA_COND3 = cleanedUP_3(:,:,[21:39]);
OA_COND4 = cleanedUP_4(:,:,[21:39]);

%Run indvidual Mod Decomp on All Subjects
individualDecompositionsBASE_AA = cell(1,20);
individualDecompositionsCOND3_AA = cell(1,20);
individualDecompositionsCOND4_AA = cell(1,20);

individualDecompositionsBASE_OA = cell(1,19);
individualDecompositionsCOND3_OA = cell(1,19);
individualDecompositionsCOND4_OA = cell(1,19);

%Mutual Information Permutation Testing




%Process YA
for idx=1:20
    individualDecompositionsBASE_AA{idx} = individualModDecomp(AA_BASE(:,:,idx), 3);
    individualDecompositionsCOND3_AA{idx} = individualModDecomp(AA_COND3(:,:,idx), 3);
    individualDecompositionsCOND4_AA{idx} = individualModDecomp(AA_COND4(:,:,idx), 3);
end

%Process OA
for idx=1:19
    individualDecompositionsBASE_OA{idx} = individualModDecomp(OA_BASE(:,:,idx), 3);
    individualDecompositionsCOND3_OA{idx} = individualModDecomp(OA_COND3(:,:,idx), 3);
    individualDecompositionsCOND4_OA{idx} = individualModDecomp(OA_COND4(:,:,idx), 3);
end

%Run group Mod Decomp on All subject results

[group_base_AA, comatrix_base_AA] = groupModDecomp(individualDecompositionsBASE_AA);
[group_cond3_AA, comatrix_cond3_AA] = groupModDecomp(individualDecompositionsCOND3_AA);
[group_cond4_AA, comatrix_cond4_AA] = groupModDecomp(individualDecompositionsCOND4_AA);

[group_base_OA, comatrix_base_OA] = groupModDecomp(individualDecompositionsBASE_OA);
[group_cond3_OA, comatrix_cond3_OA] = groupModDecomp(individualDecompositionsCOND3_OA);
[group_cond4_OA, comatrix_cond4_OA] = groupModDecomp(individualDecompositionsCOND4_OA);

%SORT FUNCTION
sorted_coClassification_base_AA = sortZbyDecomposition(group_base_AA, comatrix_base_AA);  
sorted_coClassification_cond3_AA = sortZbyDecomposition(group_cond3_AA, comatrix_cond3_AA);
sorted_coClassification_cond4_AA = sortZbyDecomposition(group_cond4_AA, comatrix_cond4_AA);

sorted_coClassification_base_OA = sortZbyDecomposition(group_base_OA, comatrix_base_OA);
sorted_coClassification_cond3_OA = sortZbyDecomposition(group_cond3_OA, comatrix_cond3_OA);
sorted_coClassification_cond4_OA = sortZbyDecomposition(group_cond4_OA, comatrix_cond4_OA);


%Save as CSV FILE to
csvwrite('base_YA.csv', comatrix_base_AA);
csvwrite('base_OA.csv', comatrix_base_OA);
csvwrite('cond3_YA.csv', comatrix_cond3_AA);
csvwrite('cond3_OA.csv', comatrix_cond3_OA);
csvwrite('cond4_YA.csv', comatrix_cond4_AA);
csvwrite('cond4_OA.csv', comatrix_cond4_OA);

csvwrite('base_YA_communities.csv', group_base_AA);
csvwrite('base_OA_communities.csv', group_base_OA);
csvwrite('cond3_YA_communities.csv', group_cond3_AA);
csvwrite('cond3_OA_communities.csv', group_cond3_OA);
csvwrite('cond4_YA_communities.csv', group_cond4_AA);
csvwrite('cond4_OA_communities.csv', group_cond4_OA);
















