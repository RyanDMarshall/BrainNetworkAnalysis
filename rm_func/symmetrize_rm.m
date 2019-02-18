%% Makes an Adjacency Matrix Symmetric

%% FUNCTION:
% Makes an adjacency matrix symmetric.

%% REQUIRES: 
% 'A' is a n_node x n_node adjacency matrix.

% Note: Simpler way is just:
%   A = (A + A')/2;

function S = symmetrize_rm(A)

    D = diag(A);
    U = triu(A);
    L = U.';

    S = L+D+U;