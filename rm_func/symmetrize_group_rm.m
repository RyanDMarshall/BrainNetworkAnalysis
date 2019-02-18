%% Makes a Group of Adjacency Matrices Symmetric

%% FUNCTION:
% Iterates through all adjacency matrices in a group to ensure each is
% symmetric.

%% REQUIRES: 
% 'A' is a n_node x n_node x m_sub matrix of m_sub adjacency matrices.

function S = symmetrize_group_rm(A)

    for i=1:size(A,3)
        S(:,:,i) = symmetrize_rm(A(:,:,i));
    end