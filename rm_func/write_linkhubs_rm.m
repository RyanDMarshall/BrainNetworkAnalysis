%% Creates Link Hub BrainNet File

%% FUNCTION:
% Creates .node file for use in BrainNet depicting link hubs

%% REQUIRES: 
% 'f' is the desired file name to write to
% 'node' is a n_node x n_node adjacency matrix
% 'commLink' is a n_edge x 1 link community affiliation vector
% 'rois' is a n_node x 1 vector containing Regions of interest & their
%       locations in 3D space
% 'thr' is a threshold (either intergral or percentile) to define the
%       point at which a node's Link Number is high enough to be considered
%       a link hub.

% Given a node graph 'node', link community partition 'commLink', rois,
% and filename f, writes a NODE file depicting link hubs for use in
% BrainNet.

% Note: Argument ordering is different in this than in other write
% functions. May cause confusion. I'll fix this if I have time.

function [] = write_linkhubs_rm(f, node, commLink, rois, thr)

    [M, ~, ~] = nodePart_rm(ConstructEdgeMatrix_rm(node, commLink));
    hubs = identify_linkhubs_rm(M, thr);

    M = M.*hubs;
    
    ai_write_nodes(f, M, rois);
