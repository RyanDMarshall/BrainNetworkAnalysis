%% Visualizing Community Matrix by sorting %%
% Takes in modular decomposition community structure,
% sort Z Matrix based on this composition
% Input : W (community structure - sorted), Z (co-classification matrix)
% Output: sorted_Zmat

function sorted_Zmat = sortZbyDecomposition(W, Z)
    %Get the total numbero of nodes
    num_nodes = size(Z,1);
    sorted_Zmat = zeros(num_nodes);
    [B, I] = sort(W, 'ascend');
    
    for idx=1:num_nodes
        for i=1:num_nodes
            sorted_Zmat(idx,i) = Z(W(idx), W(i));
        end
    end
    
    
    
        
        
        
    
    
    
    
    
    
        
        
        
        
        
        
        
        
        
        
        
        