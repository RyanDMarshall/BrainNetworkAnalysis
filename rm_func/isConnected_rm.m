%% Determines if an Adjacency Matrix is Node-Connected

%% FUNCTION:
% Determines if an Adjacency Matrix is Node-Connected.

%% REQUIRES: 
% 'A' is a n_node x n_node adjacency matrix

function tf = isConnected_rm(A)
    % Conncomp assigns each node to a bin that describes which subgraph it
    % is in, where each subgraph is disconnected. If there is only 1 bin, 
    % then the graph must be node-connected.
    comps = conncomp(graph(A));
    tf = all(comps==1);