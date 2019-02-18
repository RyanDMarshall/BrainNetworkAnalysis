%% Creates Group-Averaged Graph From Subject-Level Graphs

%% FUNCTION:
% Creates Group-Averaged Graph From Subject-Level Graphs

%% REQUIRES: 
% 'A' is a n_node x n_node x n_sub adjacency matrix

function ave = group_average_rm(A)
    ave = zeros(size(A,1),size(A,2));
    for i=1:size(A,3)
        ave = ave + A(:,:,i);
    end
    ave = ave ./ size(A,3);