%% Identifies Link Community Hubs

%% FUNCTION:
% Determines which nodes are of sufficiently high Link Number to be
% considered Link Hubs.

%% REQUIRES: 
% 'N' is a n_node x 1 vector containing the Link Number of each node
% 'thr' is the desired threshold for determining if a node is a link hub. 
%       If thr < 1, it is interpreted as a percentile. Otherwise, it is
%       interpreted as a numerical threshold corresponding the minimal number
%       of link communities a node must participate in to be considered a
%       hub.

function hubs = identify_linkhubs_rm(N, thr)

    if thr < 1
        % Redefines thr to be the numerical value corresponding to the
        % percentile threshold desired
        N_sorted = sort(N);
        thr = N_sorted(ceil(length(N_sorted)*(1-thr)));
    end
    
    % Finds all nodes with link number above the desired threshold and
    % creates a new binary vector with 1s on the indices corresponding to
    % link hubs.
    idx = (N >= thr);
    
    hubs = zeros(length(N),1);
    hubs(idx) = 1;