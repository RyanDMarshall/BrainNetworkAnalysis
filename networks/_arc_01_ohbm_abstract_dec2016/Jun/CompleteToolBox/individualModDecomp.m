%% Individual-level modular decomposition %%
% Implementation of Individual-level modular decomposition described in 
% Dwyer paper and Fornito book figure 9.11
% Algorithm:
% 1. For each Individual run community detection algorithm n times
%   For each community detection iteration:
%       - Create Confusion matrix(Co-classification matrix) 1 or 0
%       - Sum up with previous confusion matrix
% 2. Divide the Confusion matrix by n to get the fraction
% 3. Run the community detection algorithm on confusion matrix
% Input: Z_thresholded matrix, n(iteration counts)
% Output: Vectorized community structure




function indv_modular_decomposition = individualModDecomp(Z_mat, n)
    
    num_nodes = size(Z_mat,2);
    % Initialize co-classification matrix with 0
    coClassificationMatrix = zeros(num_nodes);
    
    for idx=1:n
        
        % Run Louvain Algorithm
        community_structure = community_louvain(Z_mat, [], [], 'negative_asym');
        % Add the current co-classification matrix with the previous result
        coClassificationMatrix = coClassificationMatrix + coClassify(community_structure);
        
    end
    
    % Divide the co-classification by n to get the fractions
    coClassificationMatrix = coClassificationMatrix ./ n;
    
    % Run community detection algorithm to get modular decomposition
    indv_modular_decomposition = community_louvain(coClassificationMatrix);
                 
end
            
        
        
        
        
        
        
        
        
        
        
        
        