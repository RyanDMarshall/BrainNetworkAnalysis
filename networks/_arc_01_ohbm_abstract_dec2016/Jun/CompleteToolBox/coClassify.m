%% co-classification%%
% Input : a vector of community structure 
% Ouput co-classification matrix

function coClassificationMatrix = coClassify(community)
    num_nodes = size(community);
    coClassificationMatrix = zeros(num_nodes);
    
    
    for i=1:num_nodes
        for j=i:num_nodes
            if(community(i) == community(j))
                coClassificationMatrix(i,j) = 1;
                coClassificationMatrix(j,i) = 1;
            else
                coClassificationMatrix(i,j) = 0;
                coClassificationMatrix(j,i) = 0;
            end
        end
    end
end
