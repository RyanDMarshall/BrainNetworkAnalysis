%%Mask and ROI overlap Script%%
%%Compare Mask with ROI Voxel, and if overlapping area is less than
%%Threshold, mark that ROI as exclude

%% function compare_overlap(mask, roi_voxel)

    %% For testing purposes, set the path inside the function %%
    mask_path = '/home/junhouse/matlab/Mask_Roi_Overlap/Mask/art_mask.img';
    roi_voxel_foler_path = '/home/junhouse/matlab/Mask_Roi_Ovesrlap/ROIS/';
    roi_voxel_test_path = '/home/junhouse/matlab/Mask_Roi_Overlap/ROIS/rCON_-3_2_53_roi.nii';
    
    %% Using SPM function, read the volumes as 3D Matrix %%
    ROI_VOXEL = spm_vol(roi_voxel_test_path);
    ROI_VOXEL_VOL = spm_read_vols(ROI_VOXEL);

    MASK = spm_vol(mask_path);
    MASK_VOL = spm_read_vols(MASK);
    
    %% Getting size of two Volumnes, make sure dimenstions match %%
    VOXL_size = size(ROI_VOXEL_VOL);
    MASK_size = size(MASK_VOL);
    disp('Voxel size is: ');
    disp(VOXL_size);
    disp('Mask size is: ');
    disp(MASK_size);
    
    %% Get height of 3D matrix %%
    Z_size = MASK_size(3);
    
    %% Number of ones in VOXEL, and RESULT OVERLAPPING MATRIX %%
    num_ones_in_voxel = 0;
    num_ones_in_result_matrix = 0;

    %% Loop through every matrix %%
    for i=1:Z_size
        %% get number of non-zero (1's) in VOXEL %%
        num_ones_in_voxel = num_ones_in_voxel + nnz(ROI_VOXEL_VOL(:,:,i));
        %% Multiply Voxel and MASK
        result = MASK_VOL(:,:,i).*ROI_VOXEL_VOL(:,:,i);
        %% Update result %%
        num_ones_in_result_matrix = num_ones_in_result_matrix + nnz(result);
    end
    
    %% Calculate fraction %%
    fraction = num_ones_in_voxel / num_ones_in_result_matrix;
    
    disp('Overlapping fraction is: ');
    disp(fraction);

    
    