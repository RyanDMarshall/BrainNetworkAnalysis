%% Sort ROIs by modules %%
% sort community structure by modules so all ROI's that belong to module 1
% appears the first then second module etc etc.


function sorted_community_vector = sort_community_vector(community_structure)
    
    %Create an array of sorted community structure
    numOfNodes = size(community_structure,1);
    sorted_community_vector = [];
    
    %for idx=1:numOfCommunities
    numOfCommunities = numel(unique(community_structure));
    
    for idx=1:numOfCommunities
        A(idx) = cell(1);
    end
    
    %Store where NODES belong
    for idx=1:numOfNodes
        community = community_structure(idx);
        A{community} = [A{community}; idx];
    end
    
    %Combile the results to get one matrix
    sorted_community_vector = [];
    for idx=1:numOfCommunities
        sorted_community_vector = [ sorted_community_vector; A{idx} ];
    end
    
    
        
        
        
        
        
        
        
        
        
        
    