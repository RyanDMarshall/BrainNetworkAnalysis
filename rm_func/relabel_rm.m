%% Relabels Partitions for Consistency Checking

%% FUNCTION:
% Permutes community labels to ensure partition labels correspond to the
% same community identities

%% REQUIRES: 
% 'P1' is a n_node x 1 or n_edge x 1 community affiliation vector defining
%       the reference partition
% 'P1' is a n_node x 1 or n_edge x 1 community affiliation vector defining
%       the partition whose labels are to be permuted

function P2_new = relabel_rm(P1, P2)
    for i=1:size(P1,2)
        P2_new(:,i) = pair_labeling(P1(:,i), P2(:,i));
    end