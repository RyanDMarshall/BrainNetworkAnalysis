%% Determines the Link Number of Each Node in an Adjacency Matrix

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

function [N, W, D] = nodePart_rm(C)

    nComm = max(max(C));
    D = zeros(size(C,1), nComm);
    N = zeros(size(C,1), 1);
    
    % Iterates through each node pair (not-repeating), and counts the
    % number of times node i is linked to an edge with community "curr".
    % Note D is then an n_edge x m_link_comms matrix. 
    for i=1:size(C,1)
        for j=i+1:size(C,2)
            curr = C(i,j);
            if (curr ~= 0)
            	D(i,curr) = D(i,curr) + 1;
            end
        end
    end
    
    % W is a binarized D. We lose the information on how often each node is
    % connected to a given link community, but retain the identifies of the
    % communities each node participates in.
    W = D~=0;
    
    % N is less information than W - we do not care which communtities each
    % node participates in, just the number of unique communities.
    for i=1:length(N)
        N(i) = sum(W(i,:));
    end