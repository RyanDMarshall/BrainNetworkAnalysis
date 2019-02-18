%% Creates BrainNet NODE for link community 

%% FUNCTION:
% Determines the number (N), which communities (W), and density 
% (D) of edge communities that each node participates in. 

%% REQUIRES: 
% 'C' is a n_node x n_node Edge Graph - an adjacency matrix whose edge
%       weights are given by the link community the edge was assigned to.

% Note: This is a terrible name for this function. Might be worth renaming
% & checking all scripts to make sure the old name isn't used.
% Also, W & D are not yet used. This might change with the new defintion of
% "Link Number".


% Given a node graph 'node', link community partition 'commLink', rois, 
% filename f, and percentile threshold thr, writes a NODE file for use in
% BrainNet, showing only the nodes connected to the highest thr % of link
% communities.

function [] = write_brain_link_comm_pct_rm(node, commLink, rois, f, thr)
    
    [M, ~, ~] = nodePart_rm(ConstructEdgeMatrix_rm(node, commLink));
    M_sorted = sort(M);
    num_thr = M_sorted(ceil(length(M_sorted)*thr));
    
    write_brain_link_comm_rm(node, commLink, rois, f, num_thr);