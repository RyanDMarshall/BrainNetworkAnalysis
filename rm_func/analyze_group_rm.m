%% Implements Community Detection & Measure (P,D,N) Calculation

%% FUNCTION:
% Calculates node (commN) and link (commL) community partitions, as well as
% the participation coefficients (P), within module degree z-score (D), and
% link numbers (N) of every node in each graph.

%% REQUIRES: 
% 'group' is a n_node x n_node x 1 group averaged adjacency matrix or
%       n_node x n_node x m_sub matrix of subject-level adjacency matrices
% 'gamma' is the resolution parameter used in Louvain
% 'tau' is the agreement threshold used in consensus clustering
% 'nrep' is the desired number of repetitions for consensus clustering

function [P, D, N, commN, commL] = analyze_group_rm(group, gamma, tau, nrep)

    % We define link community partitions to be a cell so that we can store
    % vectors of different sizes.
    commL = cell(1,size(group,3));
    
    % Note that this works for both the subject and the group-level graphs: for
    % group level, size(group,3) = 1. 
    for i=1:size(group,3)
        [P(:,i), D(:,i), N(:,i), commN(:,i), commL{i}] = ...
            analyze_subject_rm(group(:,:,i), gamma, tau, nrep);
    end