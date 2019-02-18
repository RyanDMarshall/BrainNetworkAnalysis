%% Creates Node Hub BrainNet File

%% FUNCTION:
% Creates .node file for use in BrainNet depicting node hubs

%% REQUIRES: 
% 'f' is the desired file name to write to
% 'node' is a n_node x n_node adjacency matrix
% 'commNode' is a n_node x 1 node community affiliation vector
% 'rois' is a n_node x 1 vector containing Regions of interest & their
%       locations in 3D space
% 'zMin' is the threshold desired for the cutoff between node roles
%       {1,2,3,4} and {5,6,7}.
% 'W' depicts which node roles are defiend to be hubs, e.g. W = [3,4,6,7].

% Note: Argument ordering is different in this than in other write
% functions. May cause confusion. I'll fix this if I have time.

function [] = write_PDhubs_rm(f, node, commNode, rois, zMin, W)

    R = identify_roles_rm(node, commNode, 1.5);
    hubs = zeros(length(R),1);
    for i=1:length(W)
        hubs(find(R == W(i))) = 1;
    end
    R = R.*hubs;
    ai_write_nodes(f, R, rois);
