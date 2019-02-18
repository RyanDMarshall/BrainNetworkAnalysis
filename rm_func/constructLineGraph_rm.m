%% Constructs Line Graph of an Adjacency Matrix

%% FUNCTION:
% Returns L, the line graph of A. L is the graph edfined when every edge in
% A is turned into a node, and an edge between two line graph nodes is
% placed if the corresponding edges are connected by some node in the
% original graph.

%% REQUIRES: 
% 'A' is a n_node x n_node adjacency matrix

function L = constructLineGraph_rm(A)
    I = abs(full(incidence(graph(A))));
    L = (I.')*I - 2*eye(size(I,2));
end