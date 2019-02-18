%% Identifies Node Community Hubs

%% FUNCTION:
% Determines which nodes are of the correct roles needed to be considered
% node hubs.

%% REQUIRES: 
% 'R' is a n_node x 1 vector containing the topological role of each node, 
%       as defined by participation coefficient & within-module degree z-score 
% 'roles' is a vector containing the node roles considered to be hubs, e.g.
%       roles = [3, 4, 6, 7];

function hubs = identify_PDhubs_rm(R, roles)
    
    idx = [];
    for i=roles
        % Finds all nodes whose role is one of the desired roles
        idx = sort(vertcat(idx, find(R == i)));
    end
    
    % Defines a new binary vector with 1s on the indices corresponding to
    % node hubs.
    hubs = zeros(length(R),1);
    hubs(idx) = 1;