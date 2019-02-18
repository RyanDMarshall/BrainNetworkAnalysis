%% Preparing matrix given vectors so it will run with permutation testing matlab function %%
% input : 1 x 160 cell where each cell represents a node, and contains 3
% vectors with Correlation Coefficients of YA, OA, and YA vs OA
% output : matrix with 160 columns of WITHIN, and 160 columns of BETWEEN
function prep_matrix = prepare_matrix(cell_vectors)
    
    %variables 
    num_of_nodes = size(cell_vectors, 2);
    Within_matrix = [];
    Between_matrix = [];
    prep_matrix = [];
    %for every node 
    for idx=1:num_of_nodes
        %Step1: concatenate YA and OA to get -> WITHIN Vector
        concat_YA_OA = horzcat( cell_vectors{idx}{1}, cell_vectors{idx}{2} );
        
        %Step2: transpose matrix 
        Within_matrix = vertcat( Within_matrix, concat_YA_OA' );
        Between_matrix = vertcat( Between_matrix, cell_vectors{idx}{3} );
    end
    
    prep_matrix = vertcat( Within_matrix, Between_matrix);
    
    
    
    
    