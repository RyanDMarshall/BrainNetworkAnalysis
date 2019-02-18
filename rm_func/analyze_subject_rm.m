%% Subject-Level Community Detection & Measure (P,D,N) Calculation

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

function [P, D, N, commN, commL] = analyze_subject_rm(node, gamma, tau, nrep)

    %% Community detection on node graph
    try parpool(4); catch, end;
    parfor i=1:nrep
        nodeDecomp(:,i) = ai_iter_comm_louvain(node, gamma);
    end

    nodeAgr = agreement(nodeDecomp)/nrep;

    commNode = ai_consensus_und_gamma(nodeAgr, tau, nrep, gamma);
    
    clear nodeAgr nodeDecomp
    
    %% Construct line graph
    line = constructLineGraph_rm(node);
    
    %% Community detection on line graph
    parfor i=1:nrep
        lineDecomp(:,i) = ai_iter_comm_louvain(line, gamma);
    end

    lineAgr = agreement(lineDecomp)/nrep;
    commLink = ai_consensus_und_gamma(lineAgr,tau,nrep,gamma);
    
    clear lineAgr lineDecomp 
    
    %% Calculate Measures
    % Uses BCT library & rm_func to calculate participation coefficient (P),
    % within-module degree z-score (D) and link Number (N) for all nodes.
    
    P = participation_coef(node, commNode);
    D = module_degree_zscore(node, commNode);
    N = nodePart_rm(ConstructEdgeMatrix_rm(node, commLink));
    commN = commNode;
    commL = commLink;
    
