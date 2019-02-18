%% Construct bad ROIs array by checking every subject's z matrix %%


function complete_bad_rois = construct_bad_rois(z_matrices, num_subjs)
    
    %iterate thorugh every subjects and construct complete rois
    complete_bad_rois = [];
    
    %iterate 
    for idx=1:num_subjs
        complete_bad_rois = [ complete_bad_rois extract_bad_rois(z_matrices(:,:,idx)) ];
    end
    
    %get rid of duplicates
    complete_bad_rois = unique(complete_bad_rois);
        