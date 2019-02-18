%% Clean up Z_matrices with Nan's and get rid of the corresponding ROI in ROI names %%
% Clean up 3D matrices %%

function [cleanedUpMatrix] = clean_z_matrix(z_matrices, Bad_ROIs)
    
    % iterate bad ROIs and get rid of that ROI from Z matrix
    num_of_bad_rois = numel(unique(Bad_ROIs));
    subtract_value = 0;
    
    for idx=1:num_of_bad_rois
        
        %insert empty vector
        delete_row_index = Bad_ROIs(idx) - subtract_value;
        
        z_matrices(delete_row_index, :, :) = [];
        z_matrices(:, delete_row_index, :) = [];
        subtract_value = subtract_value + 1;
    end
    
    cleanedUpMatrix = z_matrices;
        