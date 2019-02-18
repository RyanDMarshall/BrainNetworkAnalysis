%% Group-level Modular Decomposition Algorithm %%
% Implementation of Group-level Modular Decomposition Algorithm from Dwyer
% paper and Fornito book 9.11
% Algorithm
% 1. Using the consensus community for each subjects
%       Create co-classification matrix for each subjects
%       Add these up
% 2. Divide the co-classification matrix by number of subjects to get the
% proportion of participants in which nodes i and j were co-classified into
% the same module
% 3. Run Louvain Algorithm on this co-classification matrix to get the
% consensus community for this group
% Input: cell array with all consensus community for all subjects in the
% group
% Output: group representation of the consensus community


function [group_level_consensus_community, coClassificationMatrix] = groupModDecomp(A)
    
    num_subjs = size(A,2);
    num_nodes = size(A{1}, 2);
    coClassificationMatrix = zeros(num_nodes);
    
    for idx=1:num_subjs
        coClassificationMatrix = coClassificationMatrix + coClassify(A{idx});
        
    end
    
    %Divide the matrix by number of subjects to get the proportion
    coClassificationMatrix = coClassificationMatrix / num_subjs;
    
    
    %Run the community detection algorithm on this matrix 
    [group_level_consensus_community, Q] = community_louvain(coClassificationMatrix);
    Q
        
end

        
        
        
        