%% Generates Basic Brain Graph with Link Communities in 3D space

%% FUNCTION:
% Creates simple 3D Brain to depict link community structure. 

%% REQUIRES: 
% 'A' is a n_node x n_node adjacency matrix
% 'E' is a n_edge x 1 link community affiliation vector
% 'rois' is a n_node x 1 vector containing Regions of interest & their
%       locations in 3D space

% Note: I suggest using BrainNet Viewer instead.

function [] = graphEdgeComm_rm(A, E, rois)
    rois_pos = zeros(234,3);
    for i = 1:length(rois)
        str = strsplit(rois{i},'_');
        rois_pos(i,1) = str2double(str(2));
        rois_pos(i,2) = str2double(str(3)); 
        rois_pos(i,3) = str2double(str(4)); 
    end

    G = graph(A);
    
    figure(1)
    hold on;
    plot(G, 'XData', rois_pos(:,1), 'YData', rois_pos(:,2), ...
            'ZData', rois_pos(:,3), 'EdgeCData', E, ...
            'EdgeColor', 'flat');
