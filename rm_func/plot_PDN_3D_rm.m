%% Plots All Nodes of an Adjacency Matrix in PDN space

%% FUNCTION:
% Plots All Nodes of an Adjacency Matrix in 3D PDN space (Participation
% Coefficient x Within-Module Degree Z-score x Link Number)

%% REQUIRES:
% 'P' is a n_node x 1 vector containing participation coefficients for each
%       node.
% 'D' is a n_node x 1 vector containing within-module degree z-score for
%       each node.
% 'N' is a n_node x 1 vector containing link number for each node.
% 'group' is a string containing the group of interest (e.g. 'YA1') for
%       labelling.

function [] = plot_PDN_3D_rm(P, D, N, group)

    colors = distinguishable_colors(max(N));

    % Change based on threshold for "hub"
    link_hub_thr = 3;
    for i=link_hub_thr:size(colors,1)
        colors(i,:) = colors(link_hub_thr,:);
    end
    
    % Creates plot with correct colors, axes, labels, etc.
    figure; hold on; box on; grid on
    view([-45,20]); title(['Scatter Plot Depicting P, D, and N for ', group]);
    xlabel('Participation'); xtickformat('%.2f');
    ylabel('Degree Z-score'); ytickformat('%.2f');
    zlim([1 6]);
    zlabel('Number of Link Communities'); zticks(0:6)
    for i=1:max(N)
        idx = find(N == i);
        plot3(P(idx), D(idx), N(idx), '.', 'Color', colors(i,:));
    end

    hold off;