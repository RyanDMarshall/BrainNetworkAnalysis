%% Relabels Partitions for Consistency Checking

%% FUNCTION:
% Permutes community labels to ensure partition labels correspond to the
% same community identities

%% REQUIRES: 
% 'P1' is a n_node x 1 or n_edge x 1 community affiliation vector defining
%       the reference partition
% 'P1' is a n_node x 1 or n_edge x 1 community affiliation vector defining
%       the partition whose labels are to be permuted

% Note: This works with cells, and so is only to be used with subject-level
% link community partitions, which have vectors of varying sizes.

function P2_new = relabel_cell_rm(P1, P2)
    for i=1:size(P1,2)
        P2_new{i} = pair_labeling(P1{i}, P2{i});
    end