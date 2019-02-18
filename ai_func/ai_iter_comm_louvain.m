
function [M, Q1, idx] = ai_iter_comm_louvain(W, gamma)
% [M, Q1, i] = iter_comm_louvain(W, gamma)
%
% Iterative community finetuning.
%
% W is the input connection matrix.
% Based on example provided in community_louvain.m
%
% Dependencies:
%     community_louvain.m
% Original form community_louvain.m
% % Iterative community finetuning.
% % W is the input connection matrix.
% n  = size(W,1);             % number of nodes
% M  = 1:n;                   % initial community affiliations
% Q0 = -1; Q1 = 0;            % initialize modularity values
% while Q1-Q0>1e-5;           % while modularity increases
%     Q0 = Q1;                % perform community detection
%     [M, Q1] = community_louvain(W, [], M);
% end

n  = size(W, 1);            % number of nodes
M  = 1:n;                   % initial community affiliations
Q0 = -1; Q1 = 0;            % initialize modularity values

idx = 0; % just a counter

while Q1 - Q0 > 1e-5       % while modularity increases
    Q0 = Q1;                % perform community detection
    
    %%%%%%%%%%%%%%%%%%%%%%%%%% WATCH THIS ! %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % [M, Q1] = community_louvain(W, [], M);
    
    % Only positive values
    [M, Q1] = community_louvain(W, gamma, M);
    
    % Negative values, asymmetrical weighting
    % [M, Q1] = community_louvain(W, gamma, M, 'negative_asym');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    idx = idx + 1;
end
