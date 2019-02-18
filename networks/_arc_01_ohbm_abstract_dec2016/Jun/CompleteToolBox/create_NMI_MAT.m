%% Create NMI Matrix and visualize it %%
% takes in a vector of YA communities, and OA communities
% Also takes in a boolean variable visualize

function NMI_MAT = create_NMI_MAT(YA_communities, OA_communities, visualize)
    num_YA = size(YA_communities, 2);
    num_OA = size(OA_communities, 2);
    
    %comebin the two communities for for loop operation
    communities = [YA_communities OA_communities];
    %Create empty matrix
    mat_size = num_YA + num_OA;
    NMI_MAT(1:mat_size, 1:mat_size) = 0; 
    
    %Fill in the matrix
    for row_idx=1:mat_size
        for col_idx=1:mat_size
            [VIn MIn] = partition_distance(communities{row_idx}, communities{col_idx});
            NMI_MAT(row_idx, col_idx) = MIn;
        end
    end
    
    %If visualize is true, create the graph
    if (visualize)
        start = 0
        imagesc(NMI_MAT);
        %Draw Line between YA, OA
        line([start, start+num_YA+num_OA], [start+num_YA, start+num_YA],...
            'LineWidth',4,...
            'Color','white');
        line([start+num_YA, start+num_YA], [start, start+num_YA+num_OA],...
            'LineWidth',4,...
            'Color','white');
        colormap('jet')
    end
    