%% Matrix drawing function %%
% Function takes in sorted matrix, and vector of communities %
% It draws a heat map blue -> red, and draws borders %

function draw_matrix(sorted_matrix, communities)
    num_communities = max(communities)
    start = 0
    imagesc(sorted_matrix);
    for idx=1:num_communities
        count = sum(communities==idx);
        line([start, start+count], [start+count, start+count],...
            'LineWidth',4,...
            'Color','white');
        line([start, start+count], [start, start],...
            'LineWidth',4,...
            'Color','white');
        line([start+count, start+count],[start, start+count],...
            'LineWidth',4,...
            'Color','white');
        line([start, start],[start, start+count],...
            'LineWidth',4,...
            'Color','white');
        
        start = start + count;
    end
    colormap('jet')
        
        
        
        