%% Extracting bad ROIs %%
% Given 3D matrix, it iterates through every subject's matrix, and store
% bad ROI's in to an array


function bad_ROIs = extract_bad_rois(Z_matrix)
   
    %store number of ROIs
    num_rois = size(Z_matrix,1);
    
    %Bad ROI's array
    bad_ROIs = [];

    %iterate through each row. If the first entry is nan, then we know that
    %that row is bad ROI 
    % (ROW, COL)
  
    for idx=1:num_rois
       
        if( isnan(Z_matrix(idx,1)) )
            bad_ROIs = [bad_ROIs idx];
        end

    end
    
    
            