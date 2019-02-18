%% Creates Link Community BrainNet Files

%% FUNCTION:
% Creates .node, .edge, and .edgecolor files for use in BrainNet depicting
% all link communities 

%% REQUIRES: 
% 'node' is a n_node x n_node adjacency matrix
% 'commLink' is a n_edge x 1 link community affiliation vector
% 'rois' is a n_node x 1 vector containing Regions of interest & their
%       locations in 3D space
% 'f' is the desired file name to write to

% Made minor change - this version is untested but should be at least close
% to correct

function [] = write_brain_link_comm_rm(node, commLink, rois, f)

    edgeMat = ConstructEdgeMatrix_rm(node, commLink);
    [M, ~, ~] = nodePart_rm(edgeMat);

    ai_write_nodes(f, M, rois);
    
    dlmwrite(strcat(f,'.edge'), node, 'delimiter', '\t', 'precision','%.8f');
    dlmwrite(strcat(f,'_edgecolor.txt'), edgeMat, 'delimiter', '\t', 'precision','%.8f');
