%% Creates Common Link Hub BrainNet File

%% FUNCTION:
% Creates .node file for use in BrainNet depicting link hubs
% which are identified consistently across time

%% REQUIRES: 
% 'f' is the desired file name to write to
% 'rois' is a n_node x 1 vector containing Regions of interest & their
%       locations in 3D space
% 'hubs1' is a n_node x 1 binary vector whose elements are 1 for identified
%       hubs in group 1 and 0 otherwise.
% 'hubs2' is a n_node x 1 binary vector whose elements are 1 for identified
%       hubs in group 2 and 0 otherwise.

% Note: This file can technically be used to show any combination of nodes
% as long as they are defined binarily

function [] = write_common_linkhubs_rm(f, rois, hubs1, hubs2)

    commonHubs = intersect(find(hubs1), find(hubs2));
    
    hub_colors = zeros(length(rois),1);
    hub_colors(commonHubs) = 1;
    
    ai_write_nodes(f, hub_colors, rois);