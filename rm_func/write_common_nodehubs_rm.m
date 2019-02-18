%% Creates Common Node Hub BrainNet File

%% FUNCTION:
% Creates .node file for use in BrainNet depicting node hubs
% which are identified consistently across time

%% REQUIRES: 
% 'f' is the desired file name to write to
% 'rois' is a n_node x 1 vector containing Regions of interest & their
%       locations in 3D space
% 'roles1' is a n_node x 1 vector containing the topological roles of each
%       node in group 1.
% 'roles2' is a n_node x 1 vector containing the topological roles of each
%       node in group 2.

% Note: Argument ordering is different in this than in other write
% functions. May cause confusion. I'll fix this if I have time.

function [] = write_common_nodehubs_rm(f, rois, roles1, roles2)

    hubs1 = zeros(length(roles1),1);
    hubs2 = zeros(length(roles2),1);

    W = [3,4,6,7];
    for i=1:length(W)
        hubs1(find(roles1 == W(i))) = 1;
        hubs2(find(roles2 == W(i))) = 1;
    end
    
    commonHubsIdx = intersect(find(hubs1), find(hubs2));
    commonHubs = zeros(length(rois),1); commonHubs(commonHubsIdx) = 1;
    
    roles1 = roles1.*commonHubs;
    roles2 = roles2.*commonHubs;
    
    % This is why this is a different function from
    % write_common_linkhubs_rm. If a node is role 7 at t1 but role 3 at t2,
    % we don't want it marked as role 7 for both time points, so we need to
    % specify which type of hub we'd like to consider it.
    roles = min(roles1,roles2);
    
    ai_write_nodes(f, roles, rois);