%% Compare Q value with Null Model's Q value to determine if the original
% Q value is not obtained by chance. 
% Procedure:
% 1. Run BCT's null_model_und_sign.m on original matrix
% 2. Get null model matrix, and run Louvain with this result
% 3. Louvain with spit out Q value, store this Q value in a vector
% 4. Do it n times (default would be 1000)
% 5. Sort this vector in ascending order, and compare null Q's with the
% original Q

function percent = compare_Q(original_mat, num_iterations)
    null_q_values = [];
    [MM original_mat_q] = community_louvain(original_mat, [], [], 'negative_asym');
    original_mat_q
    
    for idx=1:num_iterations
        [new_mat R] = null_model_und_sign(original_mat);
        [M Q] = community_louvain(new_mat, [], [], 'negative_asym');
        null_q_values = [null_q_values Q];
    end
    
    null_q_values
    num_less = sum(null_q_values <= original_mat_q)
    num_greater = sum(null_q_values > original_mat_q)
    percent = num_less/(num_less+num_greater) * 100