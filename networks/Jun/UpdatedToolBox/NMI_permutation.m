%% Create NMI matrix and run permutation test %%
% Receive 3D matrix of Young Adults, and Old Adults %
% Run cost_threshold, and run Louvain on it %
% Create NMI matrix, and run mattest %
% Return the P value %

function p_val = NMI_permutation(YA_MAT, OA_MAT, Thresh_value)
    num_of_YA = size(YA_MAT, 3);
    num_of_OA = size(OA_MAT, 3);
    
    YA_MAT_Louvain = cell(1,num_of_YA);
    OA_MAT_Louvain = cell(1,num_of_OA);
    
    %Threshold the values and run the louvain algorithm
    for idx=1:num_of_YA
        T_MAT = cost_thresh(YA_MAT(:,:,idx), Thresh_value);
        YA_MAT_Louvain{1,idx} = community_louvain(T_MAT, [], []);
    end
    
    for idx=1:num_of_OA
        T_MAT = cost_thresh(OA_MAT(:,:,idx), Thresh_value);
        OA_MAT_Louvain{1,idx} = community_louvain(T_MAT, [], []);
    end
    
    %Using BCT particion_distance.m -> create NMI matrix
    YA_NMI = [];
    OA_NMI = [];
    YAOA_NMI = [];
    
    %Creating YA MIn
    for idx=1:num_of_YA
        for comp=idx+1:num_of_YA
            [VIn, MIn] = partition_distance(YA_MAT_Louvain{1,idx},YA_MAT_Louvain{1,comp});
            YA_NMI = [YA_NMI MIn];
        end
    end
    
    %Creating OA MIn
    for idx=1:num_of_OA
        for comp=idx+1:num_of_OA
            [VIn, MIn] = partition_distance(OA_MAT_Louvain{1,idx},OA_MAT_Louvain{1,comp});
            OA_NMI = [OA_NMI MIn];
        end 
    end
    
    %Creating YAOA MIn
    for idx=1:num_of_YA
        for idx_old=1:num_of_OA
            [VIn, MIn] = partition_distance(YA_MAT_Louvain{1,idx},OA_MAT_Louvain{1,idx_old});
            YAOA_NMI = [YAOA_NMI MIn];
        end
    end
    
    %Run Permutation testing on between vs. within
    within = [YA_NMI OA_NMI];
    between = YAOA_NMI;
    
    [H,P,CI] = ttest2(within, between)
    
 
    p_val = mattest(within, between, 'PERMUTE', true);
    
    
    

            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            