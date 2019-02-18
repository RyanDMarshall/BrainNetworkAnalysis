%% Matrix drawing function %%
% Function takes in sorted matrix, and vector of communities %
% It draws a heat map blue -> red, and draws borders %

function draw_matrix(sorted_matrix, communities)
    num_communities = max(communities);
    start = 1;
    
    % imagesc(sorted_matrix, [min(min(sorted_matrix)),1.1]);
    % imagesc(sorted_matrix,[0 0.5]);
    imagesc(sorted_matrix);
    
    for idx=1:num_communities
        count = sum(communities==idx);
        line([start, start+count-1], [start+count-1, start+count-1],...
            'LineWidth',4,...
            'Color','white');
        line([start, start+count-1], [start, start],...
            'LineWidth',4,...
            'Color','white');
        line([start+count-1, start+count-1],[start, start+count-1],...
            'LineWidth',4,...
            'Color','white');
        line([start, start],[start, start+count-1],...
            'LineWidth',4,...
            'Color','white');
        
        start = start + count;
                
    end
    
    net_colormap = [0,0,0; 0,1,0; 1,1,0; 0,1,1; 1,0,1; .5,.5,.5; 1,0,0; 0,0,1];
    
    % colormap('jet');
    % colormap('autumn')
    colormap(net_colormap);
    
    colorbar;
        
        
        
        
