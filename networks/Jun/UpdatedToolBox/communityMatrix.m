%% communityMatrix.m %%
% Given a community matrix from modularity_und.m or louvain.m, this
% functions ouputs a 2D matrix with row = number of nodes, and columns =
% number of nodes, and where (i, j) = 1 means node i and j are in the same
% community, and vice versa.
% Usage:
% community = communityMatrix(A);

function community = communityMatrix(inputMatrix)
    %Get the number of nodes from input matrix%
    numNodes = size(inputMatrix,1);
    % Preallocate memory for spped %
    community = zeros(numNodes);
    %% if two nodes are in the same community then 1, otherwise 0 %%
    for i=1:numNodes
        for j=i:numNodes
            if inputMatrix(i) == inputMatrix(j)
                community(i,j) = 1;
                community(j,i) = 1;
            else
                community(i,j) = 0;
                community(j,i) = 0;
            end
        end
    end
    
    