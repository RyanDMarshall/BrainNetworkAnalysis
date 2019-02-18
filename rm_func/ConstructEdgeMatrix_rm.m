%% Constructs Adjacency Matric Where Edge Weights Are Given By Link Community

%% FUNCTION:
% Returns EdgeComm, an n_node x n_node matrix whose edge weights are given 
% by the link community affiliation of the corresponding edge

%% REQUIRES: 
% 'A' is a n_node x n_node adjacency matrix
% 'C' is a n_edge x 1 link community affiliation vector

% Note: This is a bit confusing; there may be a better way of doing this.

function EdgeComm = ConstructEdgeMatrix_rm(A, C)
    
    % Calcuates n_node x m_edge incidence matrix of A 
    I = abs(full(incidence(graph(A))));
    EdgeComm = double(A);
    
    % Iterates through each edge
    for i=1:length(C)
        row = -1;
        col = -1;
        % Iterates through the all nodes connected to the corresponding
        % edge in the incidence matrix to find the endpoints of the edge
        for j=1:size(I,1)
            if (I(j,i) == 1)
                if (row == -1)
                    row = j;
                elseif (col == -1)
                    col = j;
                    break;
                end
            end
        end
        % Sets the edge weight equal to the corresponding link community
        EdgeComm(row,col) = C(i);
        EdgeComm(col,row) = C(i);
    end
    
