%% Binarizes Matrices at Specified Threshold

%% FUNCTION:
% Binarizes Matrices at Specified Threshold. For each edge, if the weight
% is above thrmin, the edge weight is set to 1. Otherwise, it is set to 0.

%% REQUIRES: 
% 'A' is a n_node x n_node x 1 group averaged adjacency matrix or
%       n_node x n_node x m_sub matrix of subject-level adjacency matrices
% 'thrmin' is the desired threshold of binarization

function binA = binarize_rm(A, thrmin)

    for isub=1:size(A,3)
        binA(:,:,isub) = (threshold_proportional(A(:,:,isub), thrmin)) > 0;
    end