function [M, Q1, i] = iter_comm_louvain(W, gamma)
% Iterative community finetuning.
% W is the input connection matrix.
% Based on example provided in community_louvain.m

n  = size(W, 1);            % number of nodes
M  = 1:n;                   % initial community affiliations
Q0 = -1; Q1 = 0;            % initialize modularity values

i = 0; % just a counter

while Q1 - Q0 > 1e-5;       % while modularity increases
    Q0 = Q1;                % perform community detection
    
    % [M, Q1] = community_louvain(W, [], M);
    
    [M, Q1] = community_louvain(W, gamma, M);
    
    % disp('Current params: gamma = 1; negative_asym');
    % [M, Q1] = community_louvain(W, 1, M, 'negative_asym');
    
    i = i + 1;
end