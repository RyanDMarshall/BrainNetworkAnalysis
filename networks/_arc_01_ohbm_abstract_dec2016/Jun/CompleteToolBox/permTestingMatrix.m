%% This function takes in a cell array result from nodal analysis function
% It creates two matrices -> one with Within and the other with Between





function result = permTestingMatrix(cellarray)
       
    num_of_nodes = size(cellarray,2)
    within_matrix = [];
    between_matrix = [];
    %create a matrix
    for idx=1:num_of_nodes
            within_vector = [cellarray{idx}{1} cellarray{idx}{2}];
            between_vector = cellarray{idx}{3};
            
            within_matrix = [within_matrix ; within_vector];
            between_matrix = [between_matrix ; between_vector];
    end
    
    p_val = mattest(within_matrix, between_matrix, 'PERMUTE', true);
    result = 0;
            
   