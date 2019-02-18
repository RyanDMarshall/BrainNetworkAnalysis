%% Creates Node Community BrainNet Files

%% FUNCTION:
% Creates .node and .edge files for use in BrainNet depicting all node
% communities 

%% REQUIRES: 
% 'node' is a n_node x n_node adjacency matrix
% 'commNode' is a n_node x 1 node community affiliation vector
% 'rois' is a n_node x 1 vector containing Regions of interest & their
%       locations in 3D space
% 'f' is the desired file name to write to

function [] = write_brain_node_comm_rm(node, commNode, rois, f)
    ai_write_nodes(f, commNode, rois);
    dlmwrite(strcat(f,'.edge'), node, 'delimiter', '\t', 'precision', '%.8f');