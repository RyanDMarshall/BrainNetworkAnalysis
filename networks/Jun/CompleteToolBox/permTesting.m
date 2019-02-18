%% This function takes in the result from nodalAnalysis function
% which has number of nodes cell array. Each cell array has YA vector,
% OA vector, and YAOA vector. YAOA vector represents Between group, while
% YA + OA will represents within group correlation coefficients. 
% Procedures:
% Need to combine YA and OA vectors to create a result vector that will
% represent within relationship. Then call mattest to do permutation
% testing


function result = permTesting(cell_array)

    % result array will store P values for each node
    result = [];
    num_of_nodes = size(cell_array,2);
    
    for idx=1:num_of_nodes
        within = [cell_array{idx}{1} cell_array{idx}{2}];
        between = cell_array{idx}{3};
        p_value = mattest_ALEX(within, between, 'PERMUTE', true);
        result = [result p_value];
    end
    
    
    